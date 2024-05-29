local data_util = require("data_util")
--[[
]]

local blank = {
  filename = "__space-exploration-graphics__/graphics/blank.png",
  priority = "high",
  frame_count = 1,
  height = 1,
  width = 1,
  direction_count = 1,
  variation_count = 1
}
local shadow = data_util.auto_sr_hr({
  draw_as_shadow = true,
  filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-shadow.png",
  priority = "high",
  width = 2304,
  height = 1344,
  frame_count = 1,
  line_length = 1,
  repeat_count = 1,
  shift = util.by_pixel(6*32, 2*32 + 16),
  animation_speed = 0.5,
  scale = 0.5
})

local hidden_switch = table.deepcopy(data.raw["power-switch"]["power-switch"])
hidden_switch.name = data_util.mod_prefix .. "space-elevator-power-switch"
hidden_switch.collision_mask = {}
hidden_switch.working_sound = nil
hidden_switch.draw_copper_wires = false
hidden_switch.power_on_animation = blank
hidden_switch.overlay_start = blank
hidden_switch.overlay_loop = blank
hidden_switch.led_on = blank
hidden_switch.led_off = blank
hidden_switch.selectable_in_game = false
data_util.concatenate_tables(hidden_switch.flags, {"hide-alt-info", "not-repairable", "not-blueprintable", "not-deconstructable", "not-on-map", "hidden", "not-in-kill-statistics"})

data:extend({
  hidden_switch,
  {
    type = "explosion",
    name = data_util.mod_prefix .. "train-collision-detection",
    animations = blank,
    flags = { "not-on-map", "placeable-off-grid"},
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "space-elevator-train-collider",
    flags = {"hide-alt-info", "not-repairable", "not-blueprintable", "not-deconstructable", "not-on-map", "hidden", "not-in-kill-statistics"},
    collision_box = {{-2,-3}, {2,3}},
    selection_box = {{-2,-3}, {2,3}},
    selection_priority = 100,
    collision_mask = {"train-layer"},
    picture = blank,
    dying_trigger_effect = {
      type = "create-entity",
      entity_name = data_util.mod_prefix .. "train-collision-detection",
      trigger_created_entity = true
    },
    resistances =
    { -- AOE is the main concern
      { type = "fire", percent = 100 },
      { type = "explosion", percent = 100 },
      { type = "poison", percent = 100 },
      { type = "laser", percent = 100 },
      { type = "meteor", percent = 100 },
      { type = "acid", percent = 100 },
    },
    max_health = 1,
    selectable_in_game = false,
  },

  {
    type = "item",
    name = data_util.mod_prefix .. "space-elevator",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "s-a-z",
    subgroup = "rocket-logistics",
    stack_size = 1,
    place_result = data_util.mod_prefix .. "space-elevator",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "space-elevator-cable",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator-cable.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "t",
    subgroup = "intersurface-part",
    stack_size = 20,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-elevator-cable",
    result = data_util.mod_prefix .. "space-elevator-cable",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { data_util.mod_prefix .. "holmium-cable", 1 },
      { data_util.mod_prefix .. "heavy-girder", 1 },
      { "coal", 2 }, -- for graphene
      { data_util.mod_prefix .. "aeroframe-pole", 3 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-elevator-cable-nano",
    icons = data_util.sub_icons("__space-exploration-graphics-5__/graphics/icons/space-elevator-cable.png",
                                data.raw.item[data_util.mod_prefix .. "nanomaterial"].icon),
    result = data_util.mod_prefix .. "space-elevator-cable",
    result_count = 20,
    enabled = false,
    energy_required = 40,
    ingredients = {
      { data_util.mod_prefix .. "nanomaterial", 4 },
      { data_util.mod_prefix .. "aeroframe-pole", 4 },
      { data_util.mod_prefix .. "superconductive-cable", 1},
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-elevator",
    result = data_util.mod_prefix .. "space-elevator",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { data_util.mod_prefix .. "holmium-cable", 500 },
      { data_util.mod_prefix .. "heavy-bearing", 100 },
      { "processing-unit", 500 },
      { data_util.mod_prefix .. "heavy-girder", 500 },
      { "refined-concrete", 1000 },
      { data_util.mod_prefix .. "aeroframe-pole", 2000 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "space-elevator-maintenance",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_mipmaps = 1,
    icon_size = 64,
    enabled = false,
    energy_required = 0.25,
    ingredients = {
      { data_util.mod_prefix .. "space-elevator-cable", 1 },
    },
    results = {},
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    hidden = true,
    category = "space-elevator",
    subgroup = "spaceship-process",
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-elevator",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-elevator" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-elevator-cable" },
      { type = "unlock-recipe", recipe =  data_util.mod_prefix .. "space-elevator-maintenance" },
    },
    icon = "__space-exploration-graphics-5__/graphics/technology/space-elevator.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "aeroframe-pole",
      data_util.mod_prefix .. "heavy-bearing",
      data_util.mod_prefix .. "holmium-cable",
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix.."rocket-science-pack", 1 },
       { data_util.mod_prefix.."energy-science-pack-1", 1 },
       { data_util.mod_prefix.."astronomic-science-pack-1", 1 },
       { data_util.mod_prefix.."material-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-elevator-cable-nano",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-elevator-cable-nano" },
    },
    icon = "__space-exploration-graphics-5__/graphics/technology/space-elevator.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "nanomaterial",
      data_util.mod_prefix .. "superconductive-cable",
      data_util.mod_prefix .. "space-elevator"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix.."rocket-science-pack", 1 },
       { data_util.mod_prefix.."energy-science-pack-4", 1 },
       { data_util.mod_prefix.."astronomic-science-pack-4", 1 },
       { data_util.mod_prefix.."material-science-pack-4", 1 },
       { data_util.mod_prefix.."biological-science-pack-4", 1 },
     }
    },
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "space-elevator-blocker-vertical",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    flags = { "placeable-neutral", "placeable-off-grid", "not-repairable" },
    picture = blank,
    collision_mask = {"player-layer"},
    collision_box = data_util.auto_box(2, 8, 0.1),
    selection_box = data_util.auto_box(2, 8, 0),
    selectable_in_game = false,
    localised_name = {"entity-name."..data_util.mod_prefix.."space-elevator"}
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix .. "space-elevator-blocker-horizontal",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    flags = { "placeable-neutral", "placeable-off-grid", "not-repairable" },
    picture = blank,
    collision_mask = {"player-layer"},
    collision_box = data_util.auto_box(8, 2, 0.1),
    selection_box = data_util.auto_box(8, 2, 0),
    selectable_in_game = false,
    localised_name = {"entity-name."..data_util.mod_prefix.."space-elevator"}
  },
  --[[{
      type = "car",
      name = data_util.mod_prefix .. "space-elevator-blocker",
      icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
      icon_size = 64,
      allow_passengers = false,
      collision_mask = {
        "player-layer",
        vehicle_collision_layer
      },
      collision_box = data_util.auto_box(2, 8, 0.1),
      selection_box = data_util.auto_box(2, 8, 0),
      animation = blank,
      braking_power = "1000kW",
      flags = {
        "placeable-neutral",
        "building-direction-8-way",
        "placeable-off-grid",
        "not-repairable"
      },
      energy_source = {
        type = "void"
      },
      consumption = "0W",
      effectivity = 0.5,
      energy_per_hit_point = 1,
      friction = 1,
      inventory_size = 0,
      max_health = 5000,
      alert_when_damaged = false,
      healing_per_tick = 1,
      render_layer = "object",
      rotation_speed = 0.00,
      order = "zz",
      selectable_in_game = false,
      weight = 700,
      minimap_representation = blank,
      selected_minimap_representation = blank,
      has_belt_immunity = true,
      hide_resistances = true,
      repair_speed_modifier = 0,
  },]]
  {
    type = "lamp",
    name = data_util.mod_prefix .. "space-elevator-lamp",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
      render_no_power_icon = false,
      render_no_network_icon = false,
    },
    energy_usage_per_tick = "100kW",
    picture_off = blank,
    picture_on = blank,
    always_on = true,
    --darkness_for_all_lamps_off = 0,
    --darkness_for_all_lamps_on = 0,
    collision_mask = {},
    collision_box = data_util.auto_box(24, 24, 0.1),
    selection_box = data_util.auto_box(24, 24, 0),
    selectable_in_game = false,
    light = {
      type = "basic",
      intensity = 1,
      size = 48,
      color = {r=1,g=0.95,b=0.9},
    }
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-elevator",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    minable = {mining_time = 5, result = data_util.mod_prefix .. "space-elevator"},
    flags = {"placeable-neutral","placeable-player", "player-creation", "hide-alt-info"},
    max_health = 10000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = data_util.auto_box(23.9, 24, 0.2), -- non square needed to be diractional
    selection_box = data_util.auto_box(24, 24, 0),
    selection_priority = 40,
    build_grid_size = 2,
    resistances =
    {
      { type = "meteor", percent = 90 },
      { type = "impact", percent = 100 },
      { type = "fire", percent = 100 }
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      fade_in_ticks = 10,
      fade_out_ticks = 15,
      idle_sound = {
        audible_distance_modifier = 3,
        filename = "__base__/sound/rocket-silo-working-2.ogg",
        volume = 0.5
      },
      sound = {
        audible_distance_modifier = 3,
        filename = "__base__/sound/rocket-silo-working-1.ogg",
        volume = 0.8
      }
    },
    collision_mask = {
      "water-tile",
      "item-layer",
      "floor-layer",
      -- vehicle layer?
      --"object-layer",
      --"player-layer",
      spaceship_collision_layer,
    },
    integration_patch_render_layer = "lower-object-above-shadow", -- default
    integration_patch = {
      north = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-left.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
        },
      },
      east = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-right.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
        },
      },
      south = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-right.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
        },
      },
      west = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-left.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
        },
      },
    },
    animation =
    {
      north = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-left-top.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
          shadow
        },
      },
      east = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-right-top.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
          shadow
        },
      },
      south = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-right-top.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
          shadow
        },
      },
      west = {
        layers = {
          data_util.auto_sr_hr({
            filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-left-top.png",
            priority = "high",
            width = 1664,
            height = 1664,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5
          }),
          shadow
        },
      },
    },
    crafting_categories = {"space-elevator"},
    fixed_recipe = data_util.mod_prefix .. "space-elevator-maintenance",
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {},
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 1, g = 1, b = 1}}
      },
    },
    squeak_behaviour = false -- Squeak Through prevents rotating without this
  },
  {
    type = "sprite",
    name = data_util.mod_prefix .. "space-elevator-left",
    filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-left-top.png",
    priority = "high",
    width = 1664,
    height = 1664,
    frame_count = 1,
    line_length = 1,
    shift = util.by_pixel(0, 0),
    scale = 0.5
  },
  {
    type = "sprite",
    name = data_util.mod_prefix .. "space-elevator-right",
    filename = "__space-exploration-graphics-5__/graphics/entity/space-elevator/hr/space-elevator-right-top.png",
    priority = "high",
    width = 1664,
    height = 1664,
    frame_count = 1,
    line_length = 1,
    shift = util.by_pixel(0, 0),
    scale = 0.5
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "space-elevator-energy-interface", -- input
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    order = "b-a",
    selectable_in_game = false,
    collision_mask = {},
    collision_box = data_util.auto_box(23.95, 24, 0.2),
    selection_box = data_util.auto_box(24, 24, 0),
    energy_source = {
      buffer_capacity = "20GJ",
      input_flow_limit = "600MW",
      output_flow_limit = "0GW",
      type = "electric",
      render_no_power_icon = false,
      render_no_network_icon = false,
      usage_priority = "secondary-input"--"tertiary"
    },
    --energy_usage = "10MW"
  },
  {
    type = "electric-pole",
    name = data_util.mod_prefix .. "space-elevator-energy-pole",
    icon = "__space-exploration-graphics-5__/graphics/icons/space-elevator.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    order = "b-a",
    collision_mask = {},
    collision_box = data_util.auto_box(23.95, 24, 0.2),
    selection_box = data_util.auto_box(6, 6, 0),
    selection_priority = 52,
    selectable_in_game = true,
    open_sound = data_util.electric_network_open_sound,
    close_sound = data_util.electric_network_close_sound,
    supply_area_distance = 12,
    connection_points = {
      {
        shadow = {
          copper = { 1.1-0.1, 0.1 },
          green = { 1.1+0.1, 0.1-0.4 },
          red = { 1.1-0.15, 0.1-0.3  }
        },
        wire = {
          copper = { 0+0.1, -2.3-0.2 },
          green = {  0+0.2, -2.3-0.5 },
          red = {  0-0.25, -2.3-0.4 }
        }
      },
    },
    maximum_wire_distance = 32,
    pictures = blank,
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      height = 12,
      priority = "extra-high-no-scale",
      width = 12
    },
  },
  {
    type = "locomotive",
    name = data_util.mod_prefix .. "space-elevator-tug",
    flags = {"hidden", "not-blueprintable", "not-deconstructable"},
    collision_box = {{-0.6, -0.3}, {0.6, 0.3}},
    selection_box = {{-1, -1}, {1, 3}},
    selection_priority = 52,
    air_resistance = 0,
    friction_force = 0.5,
    connection_distance = 0.1,
    joint_distance = 0.1,
    max_health = 1000,
    energy_per_hit_point = 1,
    weight = 20000,
    max_power = "10000kW",
    max_speed = 1,
    reversing_power_modifier = 1,
    braking_force = 10,
    energy_source = {type = "void"},
    pictures = blank,
    vertical_selection_shift = -0.5,
  },
})

local function internalise(prototype)
  prototype.minable = nil
  prototype.placeable_by = nil
  prototype.flags = {"hide-alt-info", "not-repairable", "not-blueprintable", "not-deconstructable", "not-on-map", "hidden", "not-in-kill-statistics"}
  prototype.selectable_in_game = false
  prototype.animations = nil
  prototype.light1 = nil
  prototype.light2 = nil
  prototype.rail_overlay_animations = nil
  prototype.top_animations = nil
  prototype.next_upgrade = nil
  prototype.fast_replaceable_group = nil
  if prototype.pictures and prototype.pictures.straight_rail_horizontal then
    local layers = {metals = blank, backplates=blank, ties=blank, stone_path=blank}
    prototype.pictures.straight_rail_horizontal = layers
    prototype.pictures.straight_rail_vertical = layers
    prototype.pictures.straight_rail_diagonal_left_top = layers
    prototype.pictures.straight_rail_diagonal_right_top = layers
    prototype.pictures.straight_rail_diagonal_right_bottom = layers
    prototype.pictures.straight_rail_diagonal_left_bottom = layers
    prototype.pictures.curved_rail_vertical_left_top = layers
    prototype.pictures.curved_rail_vertical_right_top = layers
    prototype.pictures.curved_rail_vertical_right_bottom = layers
    prototype.pictures.curved_rail_vertical_left_bottom = layers
    prototype.pictures.curved_rail_horizontal_left_top = layers
    prototype.pictures.curved_rail_horizontal_right_top = layers
    prototype.pictures.curved_rail_horizontal_right_bottom = layers
    prototype.pictures.curved_rail_horizontal_left_bottom = layers
    prototype.pictures.rail_endings = {
      north = blank,
      north_east = blank,
      east = blank,
      south_east = blank,
      south = blank,
      south_west = blank,
      west = blank,
      north_west = blank,
    }
  end
end

local internal_trainstop = table.deepcopy(data.raw["train-stop"]["train-stop"])
internal_trainstop.name = data_util.mod_prefix.."space-elevator-train-stop"
internalise(internal_trainstop)

local internal_stright_rail = table.deepcopy(data.raw["straight-rail"]["straight-rail"])
internal_stright_rail.name = data_util.mod_prefix.."space-elevator-straight-rail"
internalise(internal_stright_rail)

local internal_curved_rail = table.deepcopy(data.raw["curved-rail"]["curved-rail"])
internal_curved_rail.name = data_util.mod_prefix.."space-elevator-curved-rail"
internalise(internal_curved_rail)

local internal_rail_signal = table.deepcopy(data.raw["rail-signal"]["rail-signal"])
internal_rail_signal.name = data_util.mod_prefix.."space-elevator-rail-signal"
internalise(internal_rail_signal)

data:extend({internal_trainstop, internal_stright_rail, internal_curved_rail, internal_rail_signal})
