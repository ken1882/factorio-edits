local data_util = require("data_util")

local recycle_target_animation_speed = 0.75
local recycle_crafting_speed = 1
local recycle_module_slots = 4
local recycle_animation_speed = (recycle_target_animation_speed / recycle_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * recycle_module_slots)

local mechanical_target_animation_speed = 0.75
local mechanical_crafting_speed = 1
local mechanical_module_slots = 4
local mechanical_animation_speed = (mechanical_target_animation_speed / mechanical_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * mechanical_module_slots)

local pulverise_target_animation_speed = 0.75
local pulverise_crafting_speed = 2
local pulverise_module_slots = 4
local pulverise_animation_speed = (pulverise_target_animation_speed / pulverise_crafting_speed) -- Accepts prod, do not reduce speed based on speed modules

local fluid_boxes_4 =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = -1,
    pipe_connections = {{ type="input", position = {0, -4} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {4, 0} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {0, 4} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = -1,
    pipe_connections = {{ type="output", position = {-4, 0} }},
    secondary_draw_orders = { north = -1 }
  },
}

local fluid_boxes_8 =
{
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = -1,
    pipe_connections = {{ type="input", position = {1, -4} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = -1,
    pipe_connections = {{ type="input", position = {-1, -4} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {-4, -1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {1, 4} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {-4, 1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {4, 1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {4, -1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_covers = pipecoverspictures(),
    base_area = 10,
    base_level = 1,
    pipe_connections = {{ type="output", position = {-1, 4} }},
    secondary_draw_orders = { north = -1 }
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "recycling-facility",
    icon = "__space-exploration-graphics__/graphics/icons/recycling-facility.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "recycling-facility"},
    max_health = 1200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    drawing_box = {{-3.5, -3.9}, {3.5, 3.5}},
    se_allow_in_space = true,
    resistances =
    {
      {
        type = "impact",
        percent = 10
      }
    },
    fluid_boxes = table.deepcopy(fluid_boxes_4),
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/burner-mining-drill.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      --"ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/recycling-facility/sr/recycling-facility.png",
          priority = "high",
          width = 3840/8/2,
          height = 3584/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(-8, 0),
          animation_speed = recycle_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/recycling-facility/hr/recycling-facility.png",
            priority = "high",
            width = 3840/8,
            height = 3584/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(-8, 0),
            animation_speed = recycle_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/recycling-facility/sr/recycling-facility-shadow.png",
          priority = "high",
          width = 694/2,
          height = 400/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(59, 17),
          animation_speed = recycle_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/recycling-facility/hr/recycling-facility-shadow.png",
            priority = "high",
            width = 694,
            height = 400,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(59, 17),
            animation_speed = recycle_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"hand-hard-recycling", "hard-recycling"},
    crafting_speed = recycle_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "100kW",
    module_specification =
    {
      module_slots = recycle_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.5, size = 18, shift = {0.0, 0.0}, color = {r = 0.8, g = 1, b = 0.5}}
      },
    },
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-mechanical-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/mechanical-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-mechanical-laboratory"},
    max_health = 1200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    drawing_box = {{-3.5, -3.9}, {3.5, 3.5}},
    resistances =
    {
      {
        type = "impact",
        percent = 10
      }
    },
    fluid_boxes = table.deepcopy(fluid_boxes_8),
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/burner-mining-drill.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory.png",
          priority = "high",
          width = 3840/8/2,
          height = 3584/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(-8, 0),
          animation_speed = mechanical_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/hr/mechanical-laboratory.png",
            priority = "high",
            width = 3840/8,
            height = 3584/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(-8, 0),
            animation_speed = mechanical_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/sr/mechanical-laboratory-shadow.png",
          priority = "high",
          width = 694/2,
          height = 400/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(59, 17),
          animation_speed = mechanical_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/mechanical-laboratory/hr/mechanical-laboratory-shadow.png",
            priority = "high",
            width = 694,
            height = 400,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(59, 17),
            animation_speed = mechanical_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {
      "space-mechanical",
      "pulverising"
    },
    crafting_speed = mechanical_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "200kW",
    module_specification =
    {
      module_slots = mechanical_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 18, shift = {0.0, 0.0}, color = {r = 1, g = 0.8, b = 0.5}}
      },
    },
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "pulveriser",
    icon = "__space-exploration-graphics__/graphics/icons/pulveriser.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "pulveriser"},
    max_health = 1200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    drawing_box = {{-3.5, -3.9}, {3.5, 3.5}},
    resistances =
    {
      {
        type = "impact",
        percent = 30
      }
    },
    fluid_boxes = table.deepcopy(fluid_boxes_8),
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/burner-mining-drill.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/sr/pulveriser.png",
          priority = "high",
          width = 3840/8/2,
          height = 3584/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(-8, 0),
          animation_speed = pulverise_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/hr/pulveriser.png",
            priority = "high",
            width = 3840/8,
            height = 3584/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(-8, 0),
            animation_speed = pulverise_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/sr/pulveriser-shadow.png",
          priority = "high",
          width = 694/2,
          height = 400/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(59, 17),
          animation_speed = pulverise_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/pulveriser/hr/pulveriser-shadow.png",
            priority = "high",
            width = 694,
            height = 400,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(59, 17),
            animation_speed = pulverise_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"pulverising", "core-fragment-processing"},
    crafting_speed = pulverise_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "500kW",
    module_specification =
    {
      module_slots = pulverise_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution", "productivity"}, -- allow "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 18, shift = {0.0, 0.0}, color = {r = 1, g = 0.8, b = 0.5}}
      },
    },
  },
})
