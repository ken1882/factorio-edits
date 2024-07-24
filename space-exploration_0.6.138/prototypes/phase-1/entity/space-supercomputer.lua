local data_util = require("data_util")

local cpu1_target_animation_speed = 0.4
local cpu1_crafting_speed = 1
local cpu1_module_slots = 2
local cpu1_animation_speed = (cpu1_target_animation_speed / cpu1_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * cpu1_module_slots)

local cpu2_target_animation_speed = 0.5
local cpu2_crafting_speed = 2
local cpu2_module_slots = 4
local cpu2_animation_speed = (cpu2_target_animation_speed / cpu2_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * cpu2_module_slots)

local cpu3_target_animation_speed = 0.6
local cpu3_crafting_speed = 4
local cpu3_module_slots = 6
local cpu3_animation_speed = (cpu3_target_animation_speed / cpu3_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * cpu3_module_slots)

local cpu4_target_animation_speed = 0.5
local cpu4_crafting_speed = 6
local cpu4_module_slots = 8
local cpu4_animation_speed = (cpu4_target_animation_speed / cpu4_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * cpu4_module_slots)

local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
}
local pipe_pictures = {
  north = blank_image,
  east = {
    filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/pipe-right.png",
    width = 46/2,
    height = 68/2,
    priority = "extra-high",
    shift = util.by_pixel(-28, 2),
    hr_version = {
      filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/pipe-right.png",
      width = 46,
      height = 68,
      priority = "extra-high",
      shift = util.by_pixel(-28, 2),
      scale = 0.5,
    },
  },
  south = {
    filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/pipe-bottom.png",
    width = 84/2,
    height = 58/2,
    priority = "extra-high",
    shift = util.by_pixel(1, -30),
    hr_version = {
      filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/pipe-bottom.png",
      width = 84,
      height = 58,
      priority = "extra-high",
      shift = util.by_pixel(1, -30),
      scale = 0.5,
    },
  },
  west = {
    filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/pipe-left.png",
    width = 46/2,
    height = 74/2,
    priority = "extra-high",
    shift = util.by_pixel(28, 3),
    hr_version = {
      filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/pipe-left.png",
      width = 46,
      height = 74,
      priority = "extra-high",
      shift = util.by_pixel(28, 3),
      scale = 0.5,
    },
  }
}
data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-supercomputer-1",
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-1.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = { mining_time = 0.1, result = data_util.mod_prefix .. "space-supercomputer-1"},
    fast_replaceable_group = data_util.mod_prefix .. "space-supercomputer",
    next_upgrade = data_util.mod_prefix .. "space-supercomputer-2",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, 0),
    resistances =
    {
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/lab.ogg",
          volume = 0.7
        },
      },
      apparent_volume = 1,
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -4.0}, {2.5, 2.5}},
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-1.png",
          priority = "high",
          width = 320/2,
          height = 384/2,
          frame_count = 1,
          shift = util.by_pixel(-0, -16),
          animation_speed = cpu1_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-1.png",
            priority = "high",
            width = 320,
            height = 384,
            frame_count = 1,
            shift = util.by_pixel(-0, -16),
            animation_speed = cpu1_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-shadow.png",
          priority = "high",
          width = 264/2,
          height = 234/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(75, 23),
          animation_speed = cpu1_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-shadow.png",
            priority = "high",
            width = 264,
            height = 234,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(75, 23),
            animation_speed = cpu1_animation_speed,
            scale = 0.5,
          },
        },
      },
    },
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.6, size = 16, shift = {0.0, 0.0}, color = {r = 1, g = 0.2, b = 0.1}}
      },
      {
        animation = {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-1-working.png",
          priority = "high",
          width = 720/9/2,
          height = 258/2,
          frame_count = 9,
          shift = util.by_pixel(-0, -25),
          animation_speed = cpu1_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-1-working.png",
            priority = "high",
            width = 720/9,
            height = 258,
            frame_count = 9,
            shift = util.by_pixel(-0, -25),
            animation_speed = cpu1_animation_speed,
            scale = 0.5,
          }
        },
      }
    },
    crafting_categories = {"space-supercomputing-1"},
    crafting_speed = cpu1_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = cpu1_module_slots
    },
    allowed_effects = {"consumption", "speed", "pollution"} -- not "productivity",
  },

  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-supercomputer-2",
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-2.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = data_util.mod_prefix .. "space-supercomputer-2"},
    fast_replaceable_group = data_util.mod_prefix .. "space-supercomputer",
    next_upgrade = data_util.mod_prefix .. "space-supercomputer-3",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, 0),
    resistances =
    {
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/lab.ogg",
          volume = 0.7
        },
      },
      apparent_volume = 1,
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -4.0}, {2.5, 2.5}},
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-2.png",
          priority = "high",
          width = 320/2,
          height = 384/2,
          frame_count = 1,
          shift = util.by_pixel(-0, -16),
          animation_speed = cpu2_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-2.png",
            priority = "high",
            width = 320,
            height = 384,
            frame_count = 1,
            shift = util.by_pixel(-0, -16),
            animation_speed = cpu2_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-shadow.png",
          priority = "high",
          width = 264/2,
          height = 234/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(75, 23),
          animation_speed = cpu2_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-shadow.png",
            priority = "high",
            width = 264,
            height = 234,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(75, 23),
            animation_speed = cpu2_animation_speed,
            scale = 0.5,
          },
        },
      },
    },
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.6, size = 16, shift = {0.0, 0.0}, color = {r = 1, g = 1, b = 0.1}}
      },
      {
        animation = {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-2-working.png",
          priority = "high",
          width = 720/9/2,
          height = 258/2,
          frame_count = 9,
          shift = util.by_pixel(-0, -25),
          animation_speed = cpu2_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-2-working.png",
            priority = "high",
            width = 720/9,
            height = 258,
            frame_count = 9,
            shift = util.by_pixel(-0, -25),
            animation_speed = cpu2_animation_speed,
            scale = 0.5,
          }
        },
      }
    },
    crafting_categories = {"space-supercomputing-1", "space-supercomputing-2"},
    crafting_speed = cpu2_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "2500kW",
    module_specification =
    {
      module_slots = cpu2_module_slots
    },
    allowed_effects = {"consumption", "speed", "pollution"} -- not "productivity",
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-supercomputer-3",
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-3.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = data_util.mod_prefix .. "space-supercomputer-3"},
    fast_replaceable_group = data_util.mod_prefix .. "space-supercomputer",
    next_upgrade = data_util.mod_prefix .. "space-supercomputer-4",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, 0),
    resistances =
    {
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/lab.ogg",
          volume = 0.7
        },
      },
      apparent_volume = 1,
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -4.0}, {2.5, 2.5}},
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-3.png",
          priority = "high",
          width = 320/2,
          height = 384/2,
          frame_count = 1,
          shift = util.by_pixel(-0, -16),
          animation_speed = cpu3_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-3.png",
            priority = "high",
            width = 320,
            height = 384,
            frame_count = 1,
            shift = util.by_pixel(-0, -16),
            animation_speed = cpu3_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-shadow.png",
          priority = "high",
          width = 264/2,
          height = 234/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(75, 23),
          animation_speed = cpu3_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-shadow.png",
            priority = "high",
            width = 264,
            height = 234,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(75, 23),
            animation_speed = cpu3_animation_speed,
            scale = 0.5,
          },
        },
      },
    },
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.6, size = 16, shift = {0.0, 0.0}, color = {r = 0.1, g = 1, b = 1}}
      },
      {
        animation = {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-3-working.png",
          priority = "high",
          width = 720/9/2,
          height = 258/2,
          frame_count = 9,
          shift = util.by_pixel(-0, -25),
          animation_speed = cpu3_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-3-working.png",
            priority = "high",
            width = 720/9,
            height = 258,
            frame_count = 9,
            shift = util.by_pixel(-0, -25),
            animation_speed = cpu3_animation_speed,
            scale = 0.5,
          }
        },
      }
    },
    crafting_categories = {"space-supercomputing-1", "space-supercomputing-2", "space-supercomputing-3"},
    crafting_speed = cpu3_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "5000kW",
    module_specification =
    {
      module_slots = cpu3_module_slots
    },
    allowed_effects = {"consumption", "speed", "pollution"} -- not "productivity",
  },

  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-supercomputer-4",
    icon = "__space-exploration-graphics__/graphics/icons/supercomputer-4.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = data_util.mod_prefix .. "space-supercomputer-4"},
    fast_replaceable_group = data_util.mod_prefix .. "space-supercomputer",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, 0),
    resistances =
    {
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      --off_when_no_fluid_recipe = true
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/lab.ogg",
          volume = 0.7
        },
      },
      apparent_volume = 1,
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -4.0}, {2.5, 2.5}},
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-4.png",
          priority = "high",
          width = 320/2,
          height = 384/2,
          frame_count = 1,
          shift = util.by_pixel(-0, -16),
          animation_speed = cpu4_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-4.png",
            priority = "high",
            width = 320,
            height = 384,
            frame_count = 1,
            shift = util.by_pixel(-0, -16),
            animation_speed = cpu4_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-shadow.png",
          priority = "high",
          width = 264/2,
          height = 234/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(75, 23),
          animation_speed = cpu4_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-shadow.png",
            priority = "high",
            width = 264,
            height = 234,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(75, 23),
            animation_speed = cpu4_animation_speed,
            scale = 0.5,
          },
        },
      },
    },
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.8, size = 16, shift = {0.0, 0.0}, color = {r = 0.3, g = 0.1, b = 1}}
      },
      {
        animation = {
          filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/sr/supercomputer-4-working.png",
          priority = "high",
          width = 504/4/2,
          height = 1064/4/2,
          line_length = 4,
          frame_count = 16,
          shift = util.by_pixel(-0, -22),
          animation_speed = cpu4_animation_speed,
          blend_mode = "additive",
          draw_as_glow = true,
          max_advance = 1,
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/supercomputer/hr/supercomputer-4-working.png",
            priority = "high",
            width = 504/4,
            height = 1064/4,
            line_length = 4,
            frame_count = 16,
            shift = util.by_pixel(-0, -22),
            animation_speed = cpu4_animation_speed,
            blend_mode = "additive",
            draw_as_glow = true,
            max_advance = 1,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-supercomputing-1", "space-supercomputing-2", "space-supercomputing-3", "space-supercomputing-4"},
    crafting_speed = cpu4_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "10000kW",
    module_specification =
    {
      module_slots = cpu4_module_slots
    },
    allowed_effects = {"consumption", "speed", "pollution"} -- not "productivity",
  }
})
