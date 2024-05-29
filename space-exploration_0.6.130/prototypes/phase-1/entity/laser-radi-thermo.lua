local data_util = require("data_util")

local laser_target_animation_speed = 0.75
local laser_crafting_speed = 1
local laser_module_slots = 4
local laser_animation_speed = (laser_target_animation_speed / laser_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * laser_module_slots)

local radi_target_animation_speed = 0.75
local radi_crafting_speed = 1
local radi_module_slots = 4
local radi_animation_speed = (radi_target_animation_speed / radi_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * radi_module_slots)

local thermo_target_animation_speed = 0.75
local thermo_crafting_speed = 4
local thermo_module_slots = 4
local thermo_animation_speed = (thermo_target_animation_speed / thermo_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * thermo_module_slots)

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-laser-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/laser-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-laser-laboratory"},
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
    fluid_boxes =
    {
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -4} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-4, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 4} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {4, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
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
          filename = "__base__/sound/electric-furnace.ogg",
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
          filename = "__space-exploration-graphics-2__/graphics/entity/laser-laboratory/sr/laser-laboratory.png",
          priority = "high",
          width = 3584/8/2,
          height = 3840/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -8),
          animation_speed = laser_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-2__/graphics/entity/laser-laboratory/hr/laser-laboratory.png",
            priority = "high",
            width = 3584/8,
            height = 3840/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(0, -8),
            animation_speed = laser_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-2__/graphics/entity/laser-laboratory/sr/laser-laboratory-shadow.png",
          priority = "high",
          width = 442/2,
          height = 394/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(21, 13),
          animation_speed = laser_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-2__/graphics/entity/laser-laboratory/hr/laser-laboratory-shadow.png",
            priority = "high",
            width = 442,
            height = 394,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(21, 13),
            animation_speed = laser_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-laser"},
    crafting_speed = laser_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "5MW",
    module_specification =
    {
      module_slots = laser_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 18, shift = {0.0, 0.0}, color = {r = 1, g = 0.2, b = 0.2}}
      },
    },
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-radiation-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/radiation-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-radiation-laboratory"},
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
    fluid_boxes =
    {
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -4} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-4, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 4} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {4, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
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
          filename = "__base__/sound/electric-furnace.ogg",
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
          filename = "__space-exploration-graphics-2__/graphics/entity/radiation-laboratory/sr/radiation-laboratory.png",
          priority = "high",
          width = 3584/8/2,
          height = 3840/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -8),
          animation_speed = radi_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-2__/graphics/entity/radiation-laboratory/hr/radiation-laboratory.png",
            priority = "high",
            width = 3584/8,
            height = 3840/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(0, -8),
            animation_speed = radi_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-2__/graphics/entity/radiation-laboratory/sr/radiation-laboratory-shadow.png",
          priority = "high",
          width = 442/2,
          height = 394/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(21, 13),
          animation_speed = radi_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-2__/graphics/entity/radiation-laboratory/hr/radiation-laboratory-shadow.png",
            priority = "high",
            width = 442,
            height = 394,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(21, 13),
            animation_speed = radi_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-radiation", "centrifuging"},
    crafting_speed = radi_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = radi_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 18, shift = {0.0, 0.0}, color = {r = 0.3, g = 1, b = 0.1}}
      },
    },
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-thermodynamics-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/thermodynamics-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-thermodynamics-laboratory"},
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
    fluid_boxes =
    {
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -4} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-4, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 4} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {4, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
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
          filename = "__base__/sound/electric-furnace.ogg",
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
          filename = "__space-exploration-graphics-2__/graphics/entity/thermodynamics-laboratory/sr/thermodynamics-laboratory.png",
          priority = "high",
          width = 3584/8/2,
          height = 3840/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -8),
          animation_speed = thermo_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-2__/graphics/entity/thermodynamics-laboratory/hr/thermodynamics-laboratory.png",
            priority = "high",
            width = 3584/8,
            height = 3840/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(0, -8),
            animation_speed = thermo_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-2__/graphics/entity/thermodynamics-laboratory/sr/thermodynamics-laboratory-shadow.png",
          priority = "high",
          width = 442/2,
          height = 394/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(21, 13),
          animation_speed = thermo_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-2__/graphics/entity/thermodynamics-laboratory/hr/thermodynamics-laboratory-shadow.png",
            priority = "high",
            width = 442,
            height = 394,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(21, 13),
            animation_speed = thermo_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-thermodynamics", "smelting", "casting", "kiln", "melting"},
    crafting_speed = thermo_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = thermo_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 18, shift = {0.0, 0.0}, color = {r = 1, g = 0.7, b = 0.1}}
      },
    },
  },
})
