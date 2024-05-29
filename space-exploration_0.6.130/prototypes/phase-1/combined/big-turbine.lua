local data_util = require("data_util")
--[[
3 entities:
- furnace is the placed entity, short but wide, takes steam, outputs water out front and 500C steam out the sides, outputs decompressing-steam to storage-tank
- storage-tank passes decompressing-steam and is a buffer
- generator takes decompressing-steam to output power

fluid box connections don't need to line up just find the right entity.

furnace just has a 1 frame idle animation (for the ghost item)
generator has the actual animation (so it scales speed to power output)
For some reason the generator animation always plays above the furnace's graphics, which is great because that's what we want.

There are 2 versions of the generator: NW and SE.
That's because generators can only have horizontal_animation and vertical_animation, but the big turbine is a 4-directional entity.
]]--
local selectable = false

local fan = {
  filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/fan.png",
  frame_count = 4,
  line_length = 4,
  width = 656/4/2,
  height = 116/2,
  run_mode = "backward",
  hr_version = {
    filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/fan.png",
    frame_count = 4,
    line_length = 4,
    width = 656/4,
    height = 116,
    run_mode = "backward",
    scale = 0.5,
  },
}
local fan_shifts = {
  north = util.by_pixel(0, -56),
  south = util.by_pixel(0, -69),
  east = util.by_pixel(-11, -64),
  west = util.by_pixel(12, -64)
}
local fan_north = table.deepcopy(fan)
data_util.shift_recursive(fan_north, fan_shifts["north"])
local fan_south = table.deepcopy(fan)
data_util.shift_recursive(fan_south, fan_shifts["south"])
local fan_east = table.deepcopy(fan)
data_util.shift_recursive(fan_east, fan_shifts["east"])
local fan_west = table.deepcopy(fan)
data_util.shift_recursive(fan_west, fan_shifts["west"])

local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
}
local length = 10
local width = 7

local generator_base = {
  type = "generator",
  icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png",
  icon_size = 64,
  alert_icon_shift = { 0, 0.375 },
  burns_fluid = false,
  scale_fluid_usage = true,
  max_power_output = "1GW",
  fluid_usage_per_tick = 25,
  selectable_in_game = selectable,
  selection_priority = 52,
  --collision_box = {  { -1.25, -1.6 }, { 1.25, 1.6 } }, -- short and wide thin
  collision_box = {  { -(width/2-0.25), -(length/2-0.9) }, { (width/2-0.25), (length/2-0.9) } },
  --selection_box = { { -1.5, -2.5 }, { 1.5, 2.5 } },
  selection_box =  {  { -width/2, -(length/2-0.5) }, { width/2, (length/2-0.5) } },
  se_allow_in_space = true,
  collision_mask = {"not-colliding-with-itself"},
  order = "zzz",
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  effectivity = 1,
  energy_source = { type = "electric", usage_priority = "secondary-output" },
  fast_replaceable_group = "steam-engine",
  flags = { "placeable-neutral", "player-creation", "placeable-off-grid", "hide-alt-info"},
  fluid_box = {
    base_area = 20,
    base_level = -1,
    filter =  data_util.mod_prefix .. "decompressing-steam",
    --filter =  "steam",
    height = 2,
    minimum_temperature = 5000,
    pipe_connections = {
      {
        position = { 0, (length/2-0.75) },
        type = "input-output"
      },
      {
        position = { 0, -(length/2-0.75) },
        type = "input-output"
      },
    },
    production_type = "input-output"
  },
  max_health = 300,
  maximum_temperature = 5000,
  min_perceived_performance = 0.25,
  performance_to_sound_speedup = 0.5,
  resistances = {
    {
      percent = 70,
      type = "fire"
    }
  },
  smoke = {
    {
      name = "turbine-smoke",
      frequency = 0.3125,
      slow_down_factor = 1,
      starting_frame_deviation = 60,
      starting_vertical_speed = 0.08,
    }
  },
  vehicle_impact_sound = {
    filename = "__base__/sound/car-metal-impact.ogg",
    volume = 0.65
  },
  working_sound = table.deepcopy(data.raw.generator["steam-turbine"].working_sound)
}

local generator_NW = table.deepcopy(generator_base)
generator_NW.name = data_util.mod_prefix .. "big-turbine-generator-NW"
generator_NW.vertical_animation = fan_north
generator_NW.horizontal_animation = fan_west
generator_NW.smoke[1].north_position = fan_shifts["north"]
generator_NW.smoke[1].east_position = fan_shifts["west"]

local generator_SE = table.deepcopy(generator_base)
generator_SE.name = data_util.mod_prefix .. "big-turbine-generator-SE"
generator_SE.vertical_animation = fan_south
generator_SE.horizontal_animation = fan_east
generator_SE.smoke[1].north_position = fan_shifts["south"] -- Entities with 2 directions only use north_position and east_position.
generator_SE.smoke[1].east_position = fan_shifts["east"]

data:extend({
  {
    type = "recipe",
    name = data_util.mod_prefix .. "big-turbine-internal",
    icons = {
      { icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png", scale = 0.5, icon_size = 64 },
      { icon = data.raw.fluid["steam"].icon, scale = 0.375, icon_size = 64 },
    },
    order = "a",
    subgroup = "spaceship-process",
    energy_required = 4/60, -- try to get craft time in line with generator fluid consumption
    category = "big-turbine",
    ingredients =
    {
      {type="fluid", name="steam", amount=100, minimum_temperature = 4999},
    },
    results = {
      {type="fluid", name="water", amount=78},
      {type="fluid", name="steam", amount=21, temperature = 500},
      {type="fluid", name=data_util.mod_prefix .. "decompressing-steam", amount=98, temperature = 5000},
    },
    hide_from_player_crafting = true,
    enabled = true,
    allow_as_intermediate = false,
    always_show_made_in = true,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "big-turbine",
      icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png",
      icon_size = 64,
      order = "d[fluid-burner-generator]-a",
      subgroup = "energy",
      stack_size = 50,
      place_result = data_util.mod_prefix .. "big-turbine",
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "big-turbine",
      result = data_util.mod_prefix .. "big-turbine",
      enabled = false,
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "lattice-pressure-vessel", 10 },
        { data_util.mod_prefix .. "nanomaterial", 10 },
        { data_util.mod_prefix .. "heavy-assembly", 10 },
        { data_util.mod_prefix .. "space-pipe", 50 },
        { data_util.mod_prefix .. "heat-shielding", 50 },
        { data_util.mod_prefix .. "holmium-solenoid", 20 },
        { data_util.mod_prefix .. "superconductive-cable", 20 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "technology",
      name = data_util.mod_prefix .. "big-turbine",
      effects = {
       {
         type = "unlock-recipe",
         recipe = data_util.mod_prefix .. "big-turbine",
       },
      },
      icon = "__space-exploration-graphics__/graphics/technology/big-turbine.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "big-heat-exchanger",
        data_util.mod_prefix .. "heavy-assembly",
        data_util.mod_prefix .. "condenser-turbine",
        data_util.mod_prefix .. "superconductive-cable",
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "rocket-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
         { data_util.mod_prefix .. "biological-science-pack-4", 1 },
         { data_util.mod_prefix .. "material-science-pack-4", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       }
      },
  },
  {
    type = "storage-tank",
    name = data_util.mod_prefix .. "big-turbine-tank",
    icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation", "not-deconstructable", "not-blueprintable", "hide-alt-info"},
    max_health = 500,
    order = "zz",
    collision_box = {{-1.5, -0.25},{1.5, 0.25}},
    selection_box = {{-1.5, -0.25},{1.5, 0.25}},
    se_allow_in_space = true,
    collision_mask = {"not-colliding-with-itself"},
    selectable_in_game = selectable,
    selection_priority = 53,
    fluid_box =
    {
      filter =  data_util.mod_prefix .. "decompressing-steam",
      base_area = 10, -- gets multiplied by 100 by engine
      base_level = 0, -- pull fluid in
      pipe_connections =
      {
        { position = {0, -1} }, -- connects to generator
        { position = {1, -1} }, -- connects to furnace
        { position = {-1, -1} }, -- connects to furnace
      },
    },
    window_bounding_box = {{-0.0, 0.0}, {0.0, 1.0}},
    pictures = {
      picture = blank_image,
      window_background = blank_image,
      fluid_background = blank_image,
      flow_sprite = blank_image,
      gas_flow = blank_image,
    },
    flow_length_in_ticks = 360,
    circuit_wire_max_distance = 0
  },
  {
    type = "furnace",
    name = data_util.mod_prefix .. "big-turbine",
    icon = "__space-exploration-graphics__/graphics/icons/big-turbine.png",
    icon_size = 64,
    --collision_box = {  { -1.3, -2.15 }, { 1.3, 2.15 } },
    collision_box = {  { -(width/2-0.2), -(length/2-0.35) }, { (width/2-0.2), (length/2-0.35) } },
    --selection_box = { { -1.5, -2.5 }, { 1.5, 2.5 } },
    selection_box =  {  { -width/2, -length/2 }, { width/2, length/2 } },
    selection_priority = 50,
    se_allow_in_space = true,
    fluid_boxes =
    {
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 40,
        base_level = -1,
        filter = "steam",
        pipe_connections = {
          { type="input", position = {0, -(length/2+0.5)} }
        },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        filter = "water",
        pipe_connections = {
          { type="output", position = {(width/2+0.5), 1.5} },
          { type="output", position = {(width/2+0.5), -1.5} },
          { type="output", position = {-(width/2+0.5), 1.5} },
          { type="output", position = {-(width/2+0.5), -1.5} },
        },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 20,
        base_level = 1,
        filter = "steam",
        pipe_connections = {
          { type="output", position = {0, (length/2+0.5)} },
        },
        secondary_draw_orders = { north = -1 }
      },
      {
        filter =  data_util.mod_prefix .. "decompressing-steam",
        --filter = "steam",
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        base_area = 20,
        base_level = 1,
        hide_connection_info = true,
        pipe_connections = {
          { type="output", position = {1, length/2 - 0.25} },
          { type="output", position = {-1, length/2 - 0.25} },
        },
        secondary_draw_orders = { north = -1 }
      },
    },
    minable = {
      mining_time = 0.3,
      result = data_util.mod_prefix .. "big-turbine",
    },
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    show_recipe_icon = false,
    show_recipe_icon_on_map = false,
    max_health = 800,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    drawing_box = {{-2, -5}, {2, 5}},
    resistances = {
      { type = "poison", percent = 100 },
      { type = "fire", percent = 80 },
      { type = "explosion", percent = 50 }
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    always_draw_idle_animation = true,
    source_inventory_size = 0,
    result_inventory_size = 0,
    animation = nil,
    idle_animation = {
      east = {
        layers = {
          {
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/east.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 640/2,
            height = 480/2,
            shift = {0,-0.25},
            hr_version = {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/east.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 640,
              height = 480,
              shift = {0,-0.25},
              scale = 0.5,
            },
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/east_shadow.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 832/2,
            height = 384/2,
            shift = {1.5,0.5},
            hr_version = {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/east_shadow.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 832,
              height = 384,
              shift = {1.5,0.5},
              scale = 0.5,
            },
          },
        }
      },
      west = {
        layers = {
          {
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/west.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 640/2,
            height = 480/2,
            shift = {0,-0.25},
            hr_version = {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/west.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 640,
              height = 480,
              shift = {0,-0.25},
              scale = 0.5,
            },
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/west_shadow.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 832/2,
            height = 384/2,
            shift = {1.5,0.5},
            hr_version = {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/west_shadow.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 832,
              height = 384,
              shift = {1.5,0.5},
              scale = 0.5,
            },
          },
        }
      },
      north = {
        layers = {
          {
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/north.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 448/2,
            height = 672/2,
            shift = {0,-0.25},
            hr_version = {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/north.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 448,
              height = 672,
              shift = {0,-0.25},
              scale = 0.5,
            },
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/north_shadow.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 640/2,
            height = 576/2,
            shift = {1.5,0.5},
            hr_version = {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/north_shadow.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 640,
              height = 576,
              shift = {1.5,0.5},
              scale = 0.5,
            },
          },
        }
      },
      south = {
        layers = {
          {
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/south.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 448/2,
            height = 672/2,
            shift = {0,-0.25},
            hr_version = {
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/south.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 448,
              height = 672,
              shift = {0,-0.25},
              scale = 0.5,
            },
          },
          {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/sr/south_shadow.png",
            frame_count = 1,
            line_length = 1,
            repeat_count = 4,
            width = 640/2,
            height = 576/2,
            shift = {1.5,0.5},
            hr_version = {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-3__/graphics/entity/big-turbine/hr/south_shadow.png",
              frame_count = 1,
              line_length = 1,
              repeat_count = 4,
              width = 640,
              height = 576,
              shift = {1.5,0.5},
              scale = 0.5,
            },
          },
        }
      },
    },
    crafting_categories = {"big-turbine"},
    crafting_speed = 1,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "0.1W",
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {},
    bottleneck_ignore = true -- Bottleneck lite
  },
  generator_NW,
  generator_SE,
})
