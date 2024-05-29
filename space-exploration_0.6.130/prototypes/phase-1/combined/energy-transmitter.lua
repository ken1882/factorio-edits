local data_util = require("data_util")
--[[
Trunk 10x10, chamber connections in middle of each edge.
Branch 8x4, chamber connections in middle of each edge. Can have leaves connecting anywhere along the long sides.
Leaf 3x5, Has 1 connection in the middle 1 of the narrow sides. Must connect anywhere along the long side of a chamber.

emitter = Maser transmitter -- storage tank?
chamber = Maser chamber -- storage tank?
Leaf = Maser injector -- assembling machine

emitter = Maser transmitter -- assembling (anything that can be opened, maybe roboport?)
chamber = Maser chamber -- storage tank?
Leaf = Maser injector -- assembling machine, reactor

178, 160, 76
]]

local blank = {
  direction_count = 8,
  frame_count = 1,
  filename = "__space-exploration-graphics__/graphics/blank.png",
  width = 1,
  height = 1,
  priority = "low"
}
local emitter_layers = {
  {
    filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/energy-transmitter.png",
    priority = "high",
    width = 640/2,
    height = 736/2,
    frame_count = 1,
    line_length = 1,
    shift = util.by_pixel(0, -24),
    animation_speed = 1,
    scale = 1,
    hr_version = {
      filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/energy-transmitter.png",
      priority = "high",
      width = 640,
      height = 736,
      frame_count = 1,
      line_length = 1,
      shift = util.by_pixel(0, -24),
      animation_speed = 1,
      scale = 0.5,
    }
  },
  {
    draw_as_shadow = true,
    filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/energy-transmitter-shadow.png",
    priority = "high",
    width = 354,
    height = 238,
    frame_count = 1,
    line_length = 1,
    repeat_count = 1,
    shift = util.by_pixel(32, 28),
    scale = 10/9,
    hr_version = {
      draw_as_shadow = true,
      filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/energy-transmitter-shadow.png",
      priority = "high",
      width = 709,
      height = 477,
      frame_count = 1,
      line_length = 1,
      repeat_count = 1,
      shift = util.by_pixel(32, 28),
      scale = 0.5*10/9,
    }
  },
}
data:extend({
  {
      type = "technology",
      name = data_util.mod_prefix .. "energy-beaming",
      effects = {
       {  type = "unlock-recipe",  recipe = data_util.mod_prefix .. "energy-transmitter-emitter" },
       {  type = "unlock-recipe",  recipe = data_util.mod_prefix .. "energy-transmitter-chamber" },
       {  type = "unlock-recipe",  recipe = data_util.mod_prefix .. "energy-transmitter-injector" },
       {  type = "unlock-recipe",  recipe = data_util.mod_prefix .. "energy-receiver" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/energy-transmitter.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "superconductive-cable",
        data_util.mod_prefix .. "aeroframe-bulkhead",
      },
      unit = {
       count = 500,
       time = 30,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "production-science-pack", 1 },
         { data_util.mod_prefix .. "rocket-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
         { data_util.mod_prefix .. "material-science-pack-3", 1 },
         { data_util.mod_prefix .. "energy-science-pack-3", 1 },
       }
      },
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-receiver",
      result = data_util.mod_prefix .. "energy-receiver",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 1000 },
        { "copper-plate", 1000 },
        {  data_util.mod_prefix .. "heat-shielding", 100 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 100 },
        { data_util.mod_prefix .. "superconductive-cable", 20 },
        { data_util.mod_prefix .. "heavy-girder", 100 },
        { "processing-unit", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-transmitter-emitter",
      result = data_util.mod_prefix .. "energy-transmitter-emitter",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 1000 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 100 },
        { data_util.mod_prefix .. "superconductive-cable", 200 },
        { data_util.mod_prefix .. "heavy-girder", 200 },
        { "processing-unit", 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-transmitter-chamber",
      result = data_util.mod_prefix .. "energy-transmitter-chamber",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 100 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 50 },
        { data_util.mod_prefix .. "superconductive-cable", 50 },
        { data_util.mod_prefix .. "heavy-girder", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-transmitter-injector",
      result = data_util.mod_prefix .. "energy-transmitter-injector",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 100 },
        { data_util.mod_prefix .. "aeroframe-bulkhead", 100 },
        { data_util.mod_prefix .. "superconductive-cable", 100 },
        { data_util.mod_prefix .. "heavy-girder", 100 },
        { "processing-unit", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "energy-receiver",
      icon = "__space-exploration-graphics__/graphics/icons/energy-receiver.png",
      icon_size = 64,
      order = "b-a",
      subgroup = "beaming",
      stack_size = 1,
      place_result = data_util.mod_prefix .. "energy-receiver",
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "energy-transmitter-emitter",
      icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter.png",
      icon_size = 64,
      order = "a-a",
      subgroup = "beaming",
      stack_size = 1,
      place_result = data_util.mod_prefix .. "energy-transmitter-emitter",
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "energy-transmitter-chamber",
      icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter-chamber.png",
      icon_size = 64,
      order = "a-b",
      subgroup = "beaming",
      stack_size = 10,
      place_result = data_util.mod_prefix .. "energy-transmitter-chamber",
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "energy-transmitter-injector",
      icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter-injector.png",
      icon_size = 64,
      order = "a-c",
      subgroup = "beaming",
      stack_size = 50,
      place_result = data_util.mod_prefix .. "energy-transmitter-injector",
  },
  { --
    type = "recipe",
    name = data_util.mod_prefix .. "energy-transmitter-emitter-fixed",
    icon = "__space-exploration-graphics__/graphics/blank.png",
    icon_size = 32,
    order = "a-d",
    subgroup = "beaming",
    energy_required = 1,
    category = "fixed-recipe",
    ingredients = {},
    results = {},
    flags = {"hidden"},
    hidden = true,
    enabled = true,
    always_show_made_in = true,
  },
  { --
    type = "recipe",
    name = data_util.mod_prefix .. "energy-transmitter-injector-fixed",
    icon = "__space-exploration-graphics__/graphics/blank.png",
    icon_size = 32,
    order = "a-d",
    subgroup = "beaming",
    energy_required = 1,
    category = "fixed-recipe",
    ingredients = {},
    results = {},
    flags = {"hidden"},
    hidden = true,
    enabled = true,
    always_show_made_in = true,
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "energy-transmitter-targeter",
    icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter-targeter.png",
    icon_mipmaps = 1,
    icon_size = 64,
    subgroup = "beaming",
    order = "a-d",
    stack_size = 1,
    hidden = true,
    flags = {"hidden", "only-in-cursor"},
  },
  {
    type = "assembling-machine", -- "boiler",
    name = data_util.mod_prefix .. "energy-transmitter-emitter", -- emitter
    icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter.png",
    icon_size = 64,
    minable = {mining_time = 0.5, result = data_util.mod_prefix .. "energy-transmitter-emitter"},
    order = "a-a",
    allow_copy_paste = true,
    fluid_boxes =
    {
      {
        base_area = 1,
        base_level = 0,
        height = 1,
        pipe_connections = {
          { type = "input", position = { -5.5, 0 }, },
          { type = "input", position = { 5.5, 0 }, },
          { type = "input", position = { 0, -5.5}, },
          { type = "input", position = { 0, 5.5 }, },
        },
        production_type = "input"
      },
    },
    animation = -- structure =
    {
      north = {layers = emitter_layers},
      south = {layers = emitter_layers},
      east = {layers = emitter_layers},
      west = {layers = emitter_layers},
    },
    collision_box = data_util.auto_box(10, 10, 0.2),
    selection_box = data_util.auto_box(10, 10),
    drawing_box = data_util.auto_box(10, 10, 0, {0, 0}, 1),
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    se_allow_in_space = true,
    corpse = "medium-remnants",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "10GJ",
    },
    energy_usage = "1GW",
    flags = {
      "placeable-player",
      "player-creation",
    },
    max_health = 5000,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    crafting_speed = 1,
    crafting_categories = {"fixed-recipe"},
    fixed_recipe = data_util.mod_prefix .. "energy-transmitter-emitter-fixed",
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    --fire = blank,
    --fire_glow = blank,
    --burning_cooldown = 20,
    --target_temperature = 1000000,
    --mode = "heat-water-inside",
    --energy_consumption = "100MW",
    --energy_usage = "100MW",
    --light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}}
  },
  {
    type = "boiler",
    name = data_util.mod_prefix .. "energy-transmitter-chamber",
    icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter-chamber.png",
    icon_size = 64,
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "energy-transmitter-chamber"},
    order = "a-b",
    allow_copy_paste = true,
    collision_box = data_util.auto_box(4, 8, 0.05),
    selection_box = data_util.auto_box(4, 8),
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    se_allow_in_space = true,
    fluid_box = {
      base_area = 1,
      base_level = 0,
      height = 1,
      pipe_connections = {
        { type = "input-output", position = { -1.96, 0 }, },
        { type = "input-output", position = { 1.96, 0 }, },
      },
      production_type = "input-output"
    },
    output_fluid_box = {
      base_area = 1,
      base_level = 0,
      height = 1,
      pipe_connections = {
        { type = "input-output", position = { 0, -3.96}, },
        { type = "input-output", position = { 0, 3.96 }, },
      },
      production_type = "output"
    },
    fire = blank,
    fire_glow = blank,
    burning_cooldown = 20,
    target_temperature = 1000000,
    mode = "heat-water-inside",
    structure =
    {
      east = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h.png",
            priority = "high",
            width = 512,
            height = 256,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-glow.png",
            priority = "high",
            width = 512,
            height = 256,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-shadow.png",
            priority = "high",
            width = 578,
            height = 250,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(17, 1),
          }),
        },
      },
      west = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h.png",
            priority = "high",
            width = 512,
            height = 256,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-glow.png",
            priority = "high",
            width = 512,
            height = 256,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-shadow.png",
            priority = "high",
            width = 578,
            height = 250,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(17, 1),
          }),
        },
      },
      north = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v.png",
            priority = "high",
            width = 256,
            height = 576,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -0.5},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-glow.png",
            priority = "high",
            width = 256,
            height = 576,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -0.5},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-shadow.png",
            priority = "high",
            width = 260,
            height = 562,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(2, -8),
          }),
        },
      },
      south = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v.png",
            priority = "high",
            width = 256,
            height = 576,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -0.5},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-glow.png",
            priority = "high",
            width = 256,
            height = 576,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -0.5},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-shadow.png",
            priority = "high",
            width = 260,
            height = 562,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(2, -8),
          }),
        },
      },
    },
    corpse = "medium-remnants",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "1GJ",
    },
    energy_consumption = "100MW",
    energy_usage = "100MW",
    flags = {
      "placeable-player",
      "player-creation",
    },
    max_health = 5000,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
    crafting_speed = 1,
    crafting_categories = {"fixed-recipe"},
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    --light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}}
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "energy-transmitter-chamber-addon-left",
    flags = {"placeable-off-grid"},
    collision_mask = {},
    collision_box = {{-0.1,-0.1},{0.1,0.1}},
    picture = {
      layers = {
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-west.png",
          priority = "high",
          width = 128,
          height = 224,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          shift = {0, -0.25},
          scale = 0.5
        }),
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-west-glow.png",
          priority = "high",
          width = 128,
          height = 224,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          shift = {0, -0.25},
          scale = 0.5
        }),
        data_util.auto_sr_hr({
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-west-shadow.png",
          priority = "high",
          width = 20,
          height = 84,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          scale = 0.5,
          shift = util.by_pixel(32, 0),
        }),
      }
    }
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "energy-transmitter-chamber-addon-top",
    flags = {"placeable-off-grid"},
    collision_mask = {},
    collision_box = {{-0.1,-0.1},{0.1,0.1}},
    picture = {
      layers = {
        data_util.auto_sr_hr({
         filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-north.png",
         priority = "high",
         width = 192,
         height = 160,
         frame_count = 1,
         line_length = 1,
         animation_speed = 1,
         shift = {0, -2.25},
         scale = 0.5
       }),
       data_util.auto_sr_hr({
         filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-north-glow.png",
         priority = "high",
         width = 192,
         height = 160,
         frame_count = 1,
         line_length = 1,
         animation_speed = 1,
         shift = {0, -2.25},
         scale = 0.5
       }),
       data_util.auto_sr_hr({
         draw_as_shadow = true,
         filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-north-shadow.png",
         priority = "high",
         width = 116,
         height = 74,
         frame_count = 1,
         line_length = 1,
         animation_speed = 1,
         scale = 0.5,
         shift = util.by_pixel(32, 0),
       }),
      }
    }
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "energy-transmitter-chamber-addon-right",
    flags = {"placeable-off-grid"},
    collision_mask = {},
    collision_box = {{-0.1,-0.1},{0.1,0.1}},
    picture = {
      layers = {
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-east.png",
          priority = "high",
          width = 128,
          height = 224,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          shift = {0, -0.25},
          scale = 0.5
        }),
        data_util.auto_sr_hr({
           filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-east-glow.png",
           priority = "high",
           width = 128,
           height = 224,
           frame_count = 1,
           line_length = 1,
           animation_speed = 1,
           shift = {0, -0.25},
           scale = 0.5
        }),
        data_util.auto_sr_hr({
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-v-east-shadow.png",
          priority = "high",
          width = 90,
          height = 84,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          scale = 0.5,
          shift = util.by_pixel(32, 0),
        }),
      }
    }
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "energy-transmitter-chamber-addon-bottom",
    flags = {"placeable-off-grid"},
    collision_mask = {},
    collision_box = {{-0.1,-0.1},{0.1,0.1}},
    picture = {
      layers = {
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-south.png",
          priority = "high",
          width = 192,
          height = 192,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          shift = {0, -0.5},
          scale = 0.5
        }),
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-south-glow.png",
          priority = "high",
          width = 192,
          height = 192,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          shift = {0, -0.5},
          scale = 0.5
        }),
        data_util.auto_sr_hr({
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/chamber-h-south-shadow.png",
          priority = "high",
          width = 114,
          height = 22,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1,
          scale = 0.5,
          shift = util.by_pixel(32, 32),
        }),
      }
    }
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "energy-transmitter-injector",
    icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter-injector.png",
    icon_size = 64,
    minable = {mining_time = 0.1, result = data_util.mod_prefix .. "energy-transmitter-injector"},
    fixed_recipe = data_util.mod_prefix .. "energy-transmitter-injector-fixed",
    order = "a-c",
    allow_copy_paste = true,
    collision_box = data_util.auto_box(3, 5, 0.2),
    selection_box = data_util.auto_box(3, 5),
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    se_allow_in_space = true,
    fluid_boxes = {
      {
        base_area = 1,
        base_level = 0,
        height = 1,
        pipe_connections = {
          {
            position = { 0, -3 },
            type = "output"
          },
        },
        production_type = "output"
      },
    },
    animation =
    {
      east = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-east.png",
            priority = "high",
            width = 352,
            height = 224,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {-0.25, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-east-glow.png",
            priority = "high",
            width = 352,
            height = 224,
            frame_count = 1,
            line_length = 1,
            shift = {-0.25, -0.25},
            animation_speed = 1,
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-east-shadow.png",
            priority = "high",
            width = 394,
            height = 186,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(22, -3),
          }),
        },
      },
      west = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-west.png",
            priority = "high",
            width = 352,
            height = 224,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0.25, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-west-glow.png",
            priority = "high",
            width = 352,
            height = 224,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0.25, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-west-shadow.png",
            priority = "high",
            width = 414,
            height = 184,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(24, -4),
          }),
        },
      },
      north = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-north.png",
            priority = "high",
            width = 192,
            height = 352,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -0.2},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-north-glow.png",
            priority = "high",
            width = 192,
            height = 352,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-north-shadow.png",
            priority = "high",
            width = 250,
            height = 348,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(14, -6),
          }),
        },
      },
      south = {
        layers =
        {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-south.png",
            priority = "high",
            width = 192,
            height = 384,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-south-glow.png",
            priority = "high",
            width = 192,
            height = 384,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-south-shadow.png",
            priority = "high",
            width = 250,
            height = 356,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(15, 1),
          }),
        },
      },
    },
    corpse = "medium-remnants",
    energy_source = {
      type = "void",
      buffer_capacity = "10GJ",
      usage_priority = "secondary-input",
      input_flow_limit = "1GW",
    },
    energy_usage = "1MW",
    flags = {
      "placeable-player",
      "player-creation",
    },
    max_health = 5000,
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
    crafting_speed = 1,
    crafting_categories = {"fixed-recipe"},
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    --light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}}
  },
  {
    type = "reactor",
    name = data_util.mod_prefix .. "energy-transmitter-injector-reactor",
    icon = "__space-exploration-graphics__/graphics/icons/energy-transmitter-injector.png",
    icon_size = 64,
    fixed_recipe = data_util.mod_prefix .. "energy-transmitter-injector-fixed",
    order = "a-c-b",
    allow_copy_paste = true,
    collision_box = data_util.auto_box(3, 3, 0.2),
    selection_box = data_util.auto_box(3, 3),
    collision_mask = {},
    se_allow_in_space = true,
    heat_buffer =
    {
      max_temperature = 100000,
      specific_heat = "1GJ",
      max_transfer = "100GW",
      connections =
      {
      },
      heat_picture = blank,
      heat_glow = blank,
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "secondary-input",
      input_flow_limit = "1GW",
    },
    neighbour_bonus = 0,
    energy_usage = "1MW",
    consumption = "1GW",
    working_light_picture = blank,
    animation = blank,
    corpse = "medium-remnants",
    flags = {
      "placeable-player",
      "player-creation",
    },
    max_health = 5000,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
    crafting_speed = 1,
    crafting_categories = {"fixed-recipe"},
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    --light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}}
  },

  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "energy-transmitter-injector-addon",
    flags = {"placeable-off-grid"},
    collision_mask = {},
    collision_box = {{-0.1,-0.1},{0.1,0.1}},
    render_layer = "higher-object-under",
    pictures = {
      {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-north-addon.png",
            priority = "high",
            width = 64,
            height = 192,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -1},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-north-addon-glow.png",
            priority = "high",
            width = 64,
            height = 192,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, -1},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-north-addon-shadow.png",
            priority = "high",
            width = 128,
            height = 138,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(32, 0),
          }),
        }
      },
      {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-east-addon.png",
            priority = "high",
            width = 96,
            height = 96,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0.75, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-east-addon-glow.png",
            priority = "high",
            width = 96,
            height = 96,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0.75, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-east-addon-shadow.png",
            priority = "high",
            width = 24,
            height = 54,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(32, 0),
          }),
        }
      },
      {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-south-addon.png",
            priority = "high",
            width = 64,
            height = 128,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, 0.5},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-south-addon-glow.png",
            priority = "high",
            width = 64,
            height = 128,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {0, 0.5},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-south-addon-shadow.png",
            priority = "high",
            width = 96,
            height = 148,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(32, 0),
          }),
        }
      },
      {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-west-addon.png",
            priority = "high",
            width = 96,
            height = 96,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {-0.75, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-west-addon-glow.png",
            priority = "high",
            width = 96,
            height = 96,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            shift = {-0.75, -0.25},
            scale = 0.5
          }),
          data_util.auto_sr_hr({
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/injector-west-addon-shadow.png",
            priority = "high",
            width = 80,
            height = 68,
            frame_count = 1,
            line_length = 1,
            animation_speed = 1,
            scale = 0.5,
            shift = util.by_pixel(32, 0),
          }),
        }
      },
    }
  },
  {
    type = "reactor",
    name = data_util.mod_prefix .. "energy-receiver",
    icon = "__space-exploration-graphics__/graphics/icons/energy-receiver.png",
    icon_size = 64,
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "energy-receiver"},
    flags = {"placeable-neutral", "player-creation"},
    max_health = 1000,
    corpse = "medium-remnants",
    consumption = "1W",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "void",
    },
    collision_box = data_util.auto_box(13, 13, 0.2),
    selection_box = data_util.auto_box(13, 13),
    --the collision box of a reactor is increased by this on the sides where it connects to another reactor:
    --neighbour_collision_increase = 0.25,
    lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 156,
      height = 156,
      shift = util.by_pixel(-2, -4),
      tint = pipe_tint,
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
        width = 320,
        height = 316,
        scale = 0.5,
        shift = util.by_pixel(-1, -5),
        tint = pipe_tint,
      }
    },
    heat_lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
      width = 156,
      height = 156,
      shift = util.by_pixel(-3, -4),
      tint = glow_tint,
      blend_mode = "additive",
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes-heated.png",
        width = 320,
        height = 316,
        scale = 0.5,
        shift = util.by_pixel(-0.5, -4.5),
        tint = glow_tint,
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver.png",
          priority = "high",
          width = 832/2,
          height = 896/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16),
          animation_speed = 1,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver.png",
            priority = "high",
            width = 832,
            height = 896,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -16),
            animation_speed = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver-mask.png",
          priority = "high",
          width = 832/2,
          height = 896/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16),
          animation_speed = 1,
          tint = {r=178, g=160, b=76},
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver-mask.png",
            priority = "high",
            width = 832,
            height = 896,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -16),
            animation_speed = 1,
            tint = {r=178, g=160, b=76},
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver-shadow.png",
          priority = "high",
          width = 1214/2,
          height = 820/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 1,
          shift = util.by_pixel(32*3+8, 4),
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver-shadow.png",
            priority = "high",
            width = 1214,
            height = 820,
            frame_count = 1,
            line_length = 1,
            repeat_count = 1,
            shift = util.by_pixel(32*3+8, 4),
            scale = 0.5,
          }
        },
      },
    },

    working_light_picture = blank,


    light = {intensity = 1, size = 18, shift = {0.0, 0.0}, color = {r = 1, g = 0.6, b = 0.1}},

    heat_buffer =
    {
      max_temperature = 10000,
      specific_heat = "500MJ",
      max_transfer = "1000GJ",
      connections =
      {
        {
          position = {5, 6},
          direction = defines.direction.south
        },
        {
          position = {6, 5},
          direction = defines.direction.east
        },
        {
          position = {5, -6},
          direction = defines.direction.north
        },
        {
          position = {6, -5},
          direction = defines.direction.east
        },
        {
          position = {-5, 6},
          direction = defines.direction.south
        },
        {
          position = {-6, 5},
          direction = defines.direction.west
        },
        {
          position = {-5, -6},
          direction = defines.direction.north
        },
        {
          position = {-6, -5},
          direction = defines.direction.west
        },
        {
          position = {0, -6},
          direction = defines.direction.north
        },
        {
          position = {6, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 6},
          direction = defines.direction.south
        },
        {
          position = {-6, 0},
          direction = defines.direction.west
        },
      },

      heat_picture =
      {
        filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver-glow.png",
        priority = "high",
        width = 832/2,
        height = 896/2,
        frame_count = 1,
        line_length = 1,
        shift = util.by_pixel(0, -16),
        animation_speed = 1,
        blend_mode = "additive",
        hr_version = {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver-glow.png",
          priority = "high",
          width = 832,
          height = 896,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16),
          animation_speed = 1,
          blend_mode = "additive",
          scale = 0.5,
        }
      },
      heat_glow =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heat-glow.png",
        priority = "extra-high",
        width = 188,
        height = 190,
        shift = util.by_pixel(-2, -4),
        tint = glow_tint,
      }
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        tint = pipe_tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5,
          tint = pipe_tint,
        }
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        tint = pipe_tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5,
          tint = pipe_tint,
        }
      }
    },

    connection_patches =
    {
      north =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-north.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, -72.5),
        tint = pipe_tint,
      },
      east =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-east.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(72.5, 0)
      },
      south =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-south.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, 72.5)
      },
      west =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-west.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(-72.5, 0)
      }
    },

    heat_connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        tint = glow_tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5,
          tint = glow_tint,
        }
      }
    },

    heat_connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        tint = glow_tint,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5,
          tint = glow_tint,
        }
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
              repeat_count = 100,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              starting_frame = 3,
              starting_frame_deviation = 5,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.5
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = 400, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 35,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5
              }
            }
          }
        }
      }
    }
  },

  {
    type = "projectile",
    name = data_util.mod_prefix .. "energy-transmitter-beam",
    direction_only = false,
    flags = { "not-on-map", "placeable-off-grid" },
    acceleration = 0,
    collision_mask = {"not-colliding-with-itself"},
    light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}},
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    animation = {
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/energy-transmitter-light.png",
          priority = "high",
          width = 576/2,
          height = 640/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -1 * 32 -9 ),
          animation_speed = 1,
          apply_runtime_tint = true, --"additive-soft"
          scale = 1*10/9,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/energy-transmitter-light.png",
            priority = "high",
            width = 576,
            height = 640,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -1 * 32 -9 ),
            animation_speed = 1,
            scale = 0.5*10/9,
            apply_runtime_tint = true, --"additive-soft"
          }
        },
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/energy-transmitter-skybeam.png",
          priority = "high",
          width = 316/2,
          height = 2392/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -21 * 32 -11),
          animation_speed = 1,
          apply_runtime_tint = true,
          blend_mode = "additive-soft",
          scale = 10/9,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/energy-transmitter-skybeam.png",
            priority = "high",
            width = 316,
            height = 2392,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -21 * 32 -11),
            animation_speed = 1,
            scale = 10/9/2,
            apply_runtime_tint = true,
            blend_mode = "additive-soft",
          }
        },
      }
    },
  },

  {
    type = "projectile",
    name = data_util.mod_prefix .. "energy-receiver-beam",
    direction_only = false,
    flags = { "not-on-map", "placeable-off-grid" },
    acceleration = 0,
    rotatable = false,
    collision_mask = {"not-colliding-with-itself"},
    light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}},
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    animation = {
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver-beam.png",
          priority = "high",
          width = 512/2,
          height = 1088/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -3 * 32 -17),
          animation_speed = 1,
          apply_runtime_tint = true,
          blend_mode = "additive",
          scale = 1,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver-beam.png",
            priority = "high",
            width = 512,
            height = 1088,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -3 * 32 -17),
            animation_speed = 1,
            scale = 0.5,
            apply_runtime_tint = true,
            blend_mode = "additive",
          }
        },
      }
    },
  },

  {
    type = "projectile",
    name = data_util.mod_prefix .. "energy-glaive-beam",
    direction_only = false,
    flags = { "not-on-map", "placeable-off-grid" },
    acceleration = 0,
    rotatable = false,
    collision_mask = {"not-colliding-with-itself"},
    light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}},
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    animation = blank
  },
  {
    type = "sprite",
    name = data_util.mod_prefix .. "energy-glaive-beam-sprite",
    filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/glaive-beam.png",
    priority = "high",
    width = 454/2,
    height = 1172/2,
    frame_count = 1,
    line_length = 1,
    shift = util.by_pixel(0, -12 * 32 -11),
    animation_speed = 1,
    apply_runtime_tint = true,
    blend_mode = "additive",
    scale = 2,
    hr_version = {
      filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/glaive-beam.png",
      priority = "high",
      width = 454,
      height = 1172,
      frame_count = 1,
      line_length = 1,
      shift = util.by_pixel(0, -12 * 32 -11),
      animation_speed = 1,
      scale = 1,
      apply_runtime_tint = true,
      blend_mode = "additive",
    }
  },

  {
    type = "explosion",
    name = data_util.mod_prefix .. "energy-glaive-path-fx",
    animations = blank,

    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            check_buildability = true,
            entity_name = "small-scorchmark",
            type = "create-entity"
          },
        },
      },
    },
    flags = { "not-on-map", "placeable-off-grid" },
  },

  {
    type = "explosion",
    name = data_util.mod_prefix .. "energy-glaive-damage-aoe",
    localised_name = {"entity-name." .. data_util.mod_prefix .. "energy-beam"},
    animations = blank,

    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 2,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 10, type = "laser" }},
                   { type = "damage", damage = { amount = 10, type = "explosion" }},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 4,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 10, type = "laser" }},
                   { type = "damage", damage = { amount = 10, type = "fire" }},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 5, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 10, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 12,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 1, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 5, type = "fire" }, apply_damage_to_trees = false},
                   {
                     type = "create-sticker",
                     sticker = "fire-sticker",
                   }
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 16,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 2, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          { -- tree fires
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              trigger_target_mask = {"flammable"},
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 100, type = "fire" }},
                   { type = "create-entity", entity_name = data_util.mod_prefix .. "tree-fire-starter" }
                }
              },
            }
          },
        },
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
  },

  {
    type = "explosion",
    name = data_util.mod_prefix .. "energy-glaive-damage-aoe-large",
    localised_name = {"entity-name." .. data_util.mod_prefix .. "energy-beam"},
    animations = blank,

    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 4,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 10, type = "laser" }},
                   { type = "damage", damage = { amount = 10, type = "explosion" }},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 10, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 10, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 16,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 5, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 10, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 24,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 1, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 5, type = "fire" }, apply_damage_to_trees = false},
                   {
                     type = "create-sticker",
                     sticker = "fire-sticker",
                   }
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 32,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 2, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          { -- tree fires
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              trigger_target_mask = {"flammable"},
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 100, type = "fire" }},
                   { type = "create-entity", entity_name = data_util.mod_prefix .. "tree-fire-starter" }
                }
              },
            }
          },

        },
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
  },

  {
    type = "explosion",
    name = data_util.mod_prefix .. "energy-glaive-damage-aoe-large-10",
    localised_name = {"entity-name." .. data_util.mod_prefix .. "energy-beam"},
    animations = blank,

    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 4,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 100, type = "laser" }},
                   { type = "damage", damage = { amount = 100, type = "explosion" }},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 100, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 100, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 16,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 50, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 100, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 24,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 10, type = "laser" }, apply_damage_to_trees = false},
                   { type = "damage", damage = { amount = 50, type = "fire" }, apply_damage_to_trees = false},
                   {
                     type = "create-sticker",
                     sticker = "fire-sticker",
                   }
                 }
              },
            }
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 32,
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 20, type = "fire" }, apply_damage_to_trees = false},
                 }
              },
            }
          },
          { -- tree fires
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              trigger_target_mask = {"flammable"},
              action_delivery = {
                type = "instant",
                target_effects = {
                   { type = "damage", damage = { amount = 100, type = "fire" }},
                   { type = "create-entity", entity_name = data_util.mod_prefix .. "tree-fire-starter" }
                }
              },
            }
          },

        },
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
  },


  {
    type = "projectile",
    name = data_util.mod_prefix .. "energy-glaive-damage-projectile",
    localised_name = {"entity-name." .. data_util.mod_prefix .. "energy-beam"},
    acceleration = -0.01,
    action = {
      action_delivery = {
        target_effects = {
          {
            type = "damage",
            damage = {
              amount = 10,
              type = "fire"
            },
          },
          {
            type = "damage",
            damage = {
              amount = 5,
              type = "laser"
            },
          },
          {
            type = "create-sticker",
            sticker = "fire-sticker",
          }
        },
        type = "instant"
      },
      type = "direct"
    },
    animation = {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      height = 50,
      priority = "high",
      width = 3,
      scale = 1.5,
      tint = {r = 255/255, g = 100/255, b = 38/255},
      blend_mode = "additive"
    },
    collision_box = {
      {
        -0.25,
        -0.25
      },
      {
        0.25,
        0.25
      }
    },
    flags = {
      "not-on-map"
    },
  },

})




data:extend({
  {
      type = "technology",
      name = data_util.mod_prefix .. "energy-beam-defence",
      effects = {
       {  type = "unlock-recipe",  recipe = data_util.mod_prefix .. "energy-beam-defence" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/energy-beam-defence.png",
      icon_size = 128,
      order = "e-a",
      prerequisites = {
        data_util.mod_prefix .. "meteor-defence",
      },
      unit = {
       count = 500,
       time = 30,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       }
      },
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "energy-beam-defence",
      result = data_util.mod_prefix .. "energy-beam-defence",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "glass", 200 },
        { "copper-plate", 200 },
        { "steel-plate", 200 },
        { "concrete", 200 },
        { "battery", 100 },
        { "processing-unit", 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "energy-beam-defence",
      icon = "__space-exploration-graphics__/graphics/icons/energy-beam-defence.png",
      icon_size = 64,
      order = "c-a",
      subgroup = "surface-defense",
      stack_size = 1,
      place_result = data_util.mod_prefix .. "energy-beam-defence",
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "energy-beam-defence",
    icon = "__space-exploration-graphics__/graphics/icons/energy-beam-defence.png",
    icon_size = 64,
    minable = {mining_time = 1, result = data_util.mod_prefix .. "energy-beam-defence"},
    order = "e-a",
    allow_copy_paste = true,
    picture =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver.png",
          priority = "high",
          width = 832/2,
          height = 896/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16),
          animation_speed = 1,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver.png",
            priority = "high",
            width = 832,
            height = 896,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -16),
            animation_speed = 1,
            scale = 0.5,
          }
        },
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver-mask.png",
          priority = "high",
          width = 832/2,
          height = 896/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(0, -16),
          animation_speed = 1,
          tint = {r=58, g=89, b=35},
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver-mask.png",
            priority = "high",
            width = 832,
            height = 896,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, -16),
            animation_speed = 1,
            tint = {r=58, g=89, b=35},
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/receiver-shadow.png",
          priority = "high",
          width = 1214/2,
          height = 820/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 1,
          shift = util.by_pixel(32*3+8, 4),
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/receiver-shadow.png",
            priority = "high",
            width = 1214,
            height = 820,
            frame_count = 1,
            line_length = 1,
            repeat_count = 1,
            shift = util.by_pixel(32*3+8, 4),
            scale = 0.5,
          }
        },
      },
    },
    collosion_mask = {
      "water-tile",
      "object-layer",
      "player-layer",
      "item-layer",
      spaceship_collision_layer
    },
    collision_box = data_util.auto_box(13, 13, 0.2),
    selection_box = data_util.auto_box(13, 13),
    selectable = false,
    continuous_animation = true,
    corpse = "medium-remnants",
    energy_source = {
      buffer_capacity = "1GJ",
      input_flow_limit = "50GW",
      output_flow_limit = "0kW",
      type = "electric",
      usage_priority = "primary-input"
    },
    energy_production = "0kW",
    energy_usage = "10MW", -- platform + 1x per lock + 1x for final energy spike final activation.
    --energy_usage = "60GW", -- platform + 1x per lock + 1x for final energy spike final activation.
    flags = {
      "placeable-player",
      "player-creation",
      "hidden",
      "not-rotatable"
    },
    max_health = 5000,
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
      max_sounds_per_type = 3,
      sound = {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.6
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.6
        }
      }
    },
    --light = {intensity = 1, size = 8, shift = {0.0, 0.0}, color = {r = 0.6, g = 0.9, b = 1}}
  },
  {
    type = "sprite",
    name = data_util.mod_prefix .. "energy-beam-defence-glow",
    filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/sr/defence-glow.png",
    priority = "high",
    width = 832/2,
    height = 896/2,
    frame_count = 1,
    line_length = 1,
    shift = util.by_pixel(0, -16),
    animation_speed = 1,
    blend_mode = "additive",
    apply_runtime_tint = true,
    hr_version = {
      filename = "__space-exploration-graphics-3__/graphics/entity/energy-transmitter/hr/defence-glow.png",
      priority = "high",
      width = 832,
      height = 896,
      frame_count = 1,
      line_length = 1,
      shift = util.by_pixel(0, -16),
      animation_speed = 1,
      blend_mode = "additive",
      apply_runtime_tint = true,
      scale = 0.5,
    }
  },
})
