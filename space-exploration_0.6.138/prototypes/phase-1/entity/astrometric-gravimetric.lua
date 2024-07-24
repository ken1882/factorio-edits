local data_util = require("data_util")

local astrometric_target_animation_speed = 1
local astrometric_crafting_speed = 1
local astrometric_module_slots = 4
local astrometric_animation_speed = (astrometric_target_animation_speed / astrometric_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * astrometric_module_slots)

local gravimetric_target_animation_speed = 0.75
local gravimetric_crafting_speed = 1
local gravimetric_module_slots = 4
local gravimetric_animation_speed = (gravimetric_target_animation_speed / gravimetric_crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * gravimetric_module_slots)

local astrometrics_pipe_pictures = {
  north = {
    filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/sr/pipe-top.png",
    width = 128/2,
    height = 128/2,
    priority = "extra-high",
    shift = util.by_pixel(0, 22),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/hr/pipe-top.png",
      width = 128,
      height = 128,
      priority = "extra-high",
      shift = util.by_pixel(0, 22),
      scale = 0.5,
    },
  },
  east = {
    filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/sr/pipe-right.png",
    width = 10/2,
    height = 60/2,
    priority = "extra-high",
    shift = util.by_pixel(-18, 1),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/hr/pipe-right.png",
      width = 10,
      height = 60,
      priority = "extra-high",
      shift = util.by_pixel(-18, 1),
      scale = 0.5,
    },
  },
  south = {
    filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/sr/pipe-bottom.png",
    width = 70/2,
    height = 44/2,
    priority = "extra-high",
    shift = util.by_pixel(3, -27),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/hr/pipe-bottom.png",
      width = 70,
      height = 44,
      priority = "extra-high",
      shift = util.by_pixel(3, -27),
      scale = 0.5,
    },
  },
  west = {
    filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/sr/pipe-left.png",
    width = 10/2,
    height = 64/2,
    priority = "extra-high",
    shift = util.by_pixel(18, 2),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/hr/pipe-left.png",
      width = 10,
      height = 64,
      priority = "extra-high",
      shift = util.by_pixel(18, 2),
      scale = 0.5,
    },
  }
}


local gravimetrics_pipe_pictures = {
  north = {
    filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/pipe-top.png",
    width = 128/2,
    height = 128/2,
    priority = "extra-high",
    shift = util.by_pixel(0, 32),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/pipe-top.png",
      width = 128,
      height = 128,
      priority = "extra-high",
      shift = util.by_pixel(0, 32),
      scale = 0.5,
    },
  },
  east = {
    filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/pipe-right.png",
    width = 46/2,
    height = 68/2,
    priority = "extra-high",
    shift = util.by_pixel(-27, 1),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/pipe-right.png",
      width = 46,
      height = 68,
      priority = "extra-high",
      shift = util.by_pixel(-27, 1),
      scale = 0.5,
    },
  },
  south = {
    filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/pipe-bottom.png",
    width = 70/2,
    height = 44/2,
    priority = "extra-high",
    shift = util.by_pixel(3, -27),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/pipe-bottom.png",
      width = 70,
      height = 44,
      priority = "extra-high",
      shift = util.by_pixel(3, -27),
      scale = 0.5,
    },
  },
  west = {
    filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/pipe-left.png",
    width = 46/2,
    height = 74/2,
    priority = "extra-high",
    shift = util.by_pixel(27, 3),
    hr_version = {
      filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/pipe-left.png",
      width = 46,
      height = 74,
      priority = "extra-high",
      shift = util.by_pixel(27, 3),
      scale = 0.5,
    },
  }
}

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-astrometrics-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/astrometrics-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = data_util.mod_prefix .. "space-astrometrics-laboratory"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -3.5}, {2.5, 2.5}},
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
        pipe_picture = astrometrics_pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = astrometrics_pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
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
      spaceship_collision_layer,
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/sr/astrometrics-laboratory.png",
          priority = "high",
          width = 2752/8/2,
          height = 3120/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -11),
          animation_speed = astrometric_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/hr/astrometrics-laboratory.png",
            priority = "high",
            width = 2752/8,
            height = 3120/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(0, -11),
            animation_speed = astrometric_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/sr/astrometrics-laboratory-shadow.png",
          priority = "high",
          width = 330/2,
          height = 220/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(26, 24),
          animation_speed = astrometric_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-4__/graphics/entity/astrometrics-laboratory/hr/astrometrics-laboratory-shadow.png",
            priority = "high",
            width = 330,
            height = 220,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(26, 24),
            animation_speed = astrometric_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-astrometrics"},
    crafting_speed = astrometric_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = astrometric_module_slots
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
    name = data_util.mod_prefix .. "space-gravimetrics-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/gravimetrics-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = data_util.mod_prefix .. "space-gravimetrics-laboratory"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -3.5}, {2.5, 2.5}},
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
        pipe_picture = gravimetrics_pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1}
      },
      {
        production_type = "output",
        pipe_picture = gravimetrics_pipe_pictures,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1}
      },
      off_when_no_fluid_recipe = true
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
          filename = "__space-exploration__/sound/gravimetrics-facility-working-sound.ogg",
          volume = 0.5
        },
      }
    },
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/gravimetrics-laboratory.png",
          priority = "high",
          width = 3360/10/2,
          height = 2304/6/2,
          frame_count = 60,
          line_length = 10,
          shift = util.by_pixel(0, -11),
          animation_speed = gravimetric_animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/gravimetrics-laboratory.png",
            priority = "high",
            width = 3360/10,
            height = 2304/6,
            frame_count = 60,
            line_length = 10,
            shift = util.by_pixel(0, -11),
            animation_speed = gravimetric_animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/gravimetrics-laboratory-shadow.png",
          priority = "high",
          width = 4480/10/2,
          height = 1500/6/2,
          frame_count = 30,
          line_length = 10,
          repeat_count = 2,
          shift = util.by_pixel(26, 24),
          animation_speed = gravimetric_animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/gravimetrics-laboratory-shadow.png",
            priority = "high",
            width = 4480/10,
            height = 1500/6,
            frame_count = 30,
            line_length = 10,
            repeat_count = 2,
            shift = util.by_pixel(26, 24),
            animation_speed = gravimetric_animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-gravimetrics", "arcosphere"},
    crafting_speed = gravimetric_crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "1000kW",
    module_specification =
    {
      module_slots = gravimetric_module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    default_recipe_tint =
    {
      -- differentiation between primary and secondary is for the recipes that can alternate
      primary = {r = 81.0/255.0, g = 0.0, b = 252.0/255.0, a = 1.000}, -- purple tint that matches the building colors
      secondary = {r = 81.0/255.0, g = 0.0, b = 252.0/255.0, a = 1.000}, -- purple tint that matches the building colors
    },
    status_colors =
    {
      working = {r = 0.0, g = 1.0, b = 0.0, a = 1.0}, -- green
      full_output = {r = 1.0, g = 1.0, b = 0.0, a = 1.0}, -- yellow
      idle = {r = 1.0, g = 0.0, b = 0.0, a = 1.0}, -- red
    },
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 100/255, g = 48/255, b = 1}}
      },
      {
        apply_recipe_tint = "primary",
        animation =
        {
          filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/gravimetrics-laboratory-tint.png",
          width = 3360/10/2,
          height = 2304/6/2,
          frame_count = 60,
          line_length = 10,
          shift = util.by_pixel(0, -11),
          animation_speed = gravimetric_animation_speed,
          blend_mode = "additive",
          hr_version = {
            filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/gravimetrics-laboratory-tint.png",
            width = 3360/10,
            height = 2304/6,
            frame_count = 60,
            line_length = 10,
            shift = util.by_pixel(0, -11),
            animation_speed = gravimetric_animation_speed,
            scale = 0.5,
            blend_mode = "additive",
          },
        }
      },
      {
        apply_recipe_tint = "secondary",
        animation =
        {
          filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/gravimetrics-laboratory-tint-2.png",
          width = 112/2,
          height = 112/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(68, 45),
          animation_speed = gravimetric_animation_speed,
          blend_mode = "additive",
          hr_version = {
            filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/gravimetrics-laboratory-tint-2.png",
            width = 112,
            height = 112,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(68, 45),
            animation_speed = gravimetric_animation_speed,
            scale = 0.5,
            blend_mode = "additive",
          }
        }
      },
      {
        always_draw = true,
        apply_tint = "status",
        animation =
        {
          filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/sr/gravimetrics-laboratory-working.png",
          width = 24/2,
          height = 24/2,
          frame_count = 1,
          line_length = 1,
          shift = util.by_pixel(57, 34),
          animation_speed = gravimetric_animation_speed,
          blend_mode = "additive",
          hr_version = {
            filename = "__space-exploration-graphics-4__/graphics/entity/gravimetrics-laboratory/hr/gravimetrics-laboratory-working.png",
            width = 24,
            height = 24,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(57, 34),
            animation_speed = gravimetric_animation_speed,
            scale = 0.5,
            blend_mode = "additive",
          },
        }
      }
    },
  },
})
