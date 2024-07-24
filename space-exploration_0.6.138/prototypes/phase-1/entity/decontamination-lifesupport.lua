local data_util = require("data_util")

local decontamination_target_animation_speed = 0.75
local decontamination_crafting_speed = 2
local decontamination_module_slots = 4
local decontamination_animation_speed = (decontamination_target_animation_speed / decontamination_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * decontamination_module_slots)

local lifesupport_target_animation_speed = 0.75
local lifesupport_crafting_speed = 1
local lifesupport_module_slots = 4
local lifesupport_animation_speed = (lifesupport_target_animation_speed / lifesupport_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * lifesupport_module_slots)

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-decontamination-facility",
    icon = "__space-exploration-graphics__/graphics/icons/decontamination-facility.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-decontamination-facility"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3, -3}, {3, 3}},
    drawing_box = {{-3, -3.5}, {3, 3}},
    se_allow_in_space = true,
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
        pipe_connections = {{ type="input", position = {-1.5, -3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1.5, -3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3.5, -1.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {3.5, -1.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-1.5, 3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {1.5, 3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3.5, 1.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-3.5, 1.5} }},
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
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
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
          filename = "__space-exploration-graphics-5__/graphics/entity/decontamination-facility/sr/decontamination-facility.png",
          priority = "high",
          width = 3072/8/2,
          height = 1792/4/2,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = decontamination_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/decontamination-facility/hr/decontamination-facility.png",
            priority = "high",
            width = 3072/8,
            height = 1792/4,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -16),
            animation_speed = decontamination_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/decontamination-facility/sr/decontamination-facility-shadow.png",
          priority = "high",
          width = 426/2,
          height = 298/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          shift = util.by_pixel(26, 24),
          animation_speed = decontamination_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/decontamination-facility/hr/decontamination-facility-shadow.png",
            priority = "high",
            width = 426,
            height = 298,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(26, 24),
            animation_speed = decontamination_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-decontamination"},
    crafting_speed = decontamination_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "2000kW",
    module_specification =
    {
      module_slots = decontamination_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 1, g = 0.9, b = 0.5}}
      },
    },
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "lifesupport-facility",
    icon = "__space-exploration-graphics__/graphics/icons/lifesupport-facility.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "lifesupport-facility"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    se_allow_in_space = true,
    selection_box = {{-3, -3}, {3, 3}},
    drawing_box = {{-3, -3.5}, {3, 3}},
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
        pipe_connections = {{ type="input", position = {-1.5, -3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1.5, -3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3.5, -1.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {3.5, -1.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-1.5, 3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {1.5, 3.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3.5, 1.5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-3.5, 1.5} }},
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
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      --"ground-tile", -- allow on ground
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/lifesupport-facility/sr/lifesupport-facility.png",
          priority = "high",
          width = 3072/8/2,
          height = 1792/4/2,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = lifesupport_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/lifesupport-facility/hr/lifesupport-facility.png",
            priority = "high",
            width = 3072/8,
            height = 1792/4,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -16),
            animation_speed = lifesupport_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/lifesupport-facility/sr/lifesupport-facility-shadow.png",
          priority = "high",
          width = 426/2,
          height = 298/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          shift = util.by_pixel(26, 24),
          animation_speed = lifesupport_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/lifesupport-facility/hr/lifesupport-facility-shadow.png",
            priority = "high",
            width = 426,
            height = 298,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            shift = util.by_pixel(26, 24),
            animation_speed = lifesupport_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"lifesupport"},
    crafting_speed = lifesupport_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = lifesupport_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 100/255, g = 48/255, b = 1}}
      },
    },
  },
})
