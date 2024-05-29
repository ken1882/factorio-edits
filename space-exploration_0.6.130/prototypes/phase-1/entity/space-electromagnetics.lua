local data_util = require("data_util")

local target_animation_speed = 1
local crafting_speed = 1
local module_slots = 4
local animation_speed = (target_animation_speed / crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * module_slots)

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-electromagnetics-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/electromagnetics-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-electromagnetics-laboratory"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    drawing_box = {{-3.5, -5.5}, {3.5, 3.5}},
    resistances =
    {
      {
        type = "electric",
        percent = 70
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
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/lab.ogg",
          volume = 0.8
        },
      },
      apparent_volume = 1.5,
    },
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      spaceship_collision_layer,
    },
    idle_animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/base.png",
          priority = "high",
          width = 448/2,
          height = 576/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(0, -16),
          animation_speed = animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/base.png",
            priority = "high",
            width = 448,
            height = 576,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(0, -16),
            animation_speed = animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/shadow.png",
          priority = "high",
          width = 566/2,
          height = 400/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(35, 20),
          animation_speed = animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/shadow.png",
            priority = "high",
            width = 566,
            height = 400,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(35, 20),
            animation_speed = animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/base.png",
          priority = "high",
          width = 448/2,
          height = 576/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(0, -16),
          animation_speed = animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/base.png",
            priority = "high",
            width = 448,
            height = 576,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(0, -16),
            animation_speed = animation_speed,
            scale = 0.5,
          }
        },
        {
          priority = "high",
          width = 1392/4/2,
          height = 1880/5/2,
          frame_count = 64,
          shift = util.by_pixel(0.5, -17),
          animation_speed = animation_speed,
          stripes =
          {
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/animation-1.png",
             width_in_frames = 4,
             height_in_frames = 5,
            },
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/animation-2.png",
             width_in_frames = 4,
             height_in_frames = 5,
            },
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/animation-3.png",
             width_in_frames = 4,
             height_in_frames = 5,
            },
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/animation-4.png",
             width_in_frames = 4,
             height_in_frames = 1,
            },
          },
          hr_version = {
            priority = "high",
            width = 1392/4,
            height = 1880/5,
            frame_count = 64,
            shift = util.by_pixel(0.5, -17),
            animation_speed = animation_speed,
            scale = 0.5,
            stripes =
            {
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/animation-1.png",
               width_in_frames = 4,
               height_in_frames = 5,
              },
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/animation-2.png",
               width_in_frames = 4,
               height_in_frames = 5,
              },
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/animation-3.png",
               width_in_frames = 4,
               height_in_frames = 5,
              },
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/animation-4.png",
               width_in_frames = 4,
               height_in_frames = 1,
              },
            },
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/sr/shadow.png",
          priority = "high",
          width = 566/2,
          height = 400/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(35, 20),
          animation_speed = animation_speed,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/electromagnetics-laboratory/hr/shadow.png",
            priority = "high",
            width = 566,
            height = 400,
            frame_count = 1,
            line_length = 1,
            repeat_count = 64,
            shift = util.by_pixel(35, 20),
            animation_speed = animation_speed,
            scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-electromagnetics", "crafting-or-electromagnetics"},
    crafting_speed = crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "5MW",
    module_specification =
    {
      module_slots = module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.6, size = 16, shift = {0.0, 0.0}, color = {r = 0.3, g = 0.5, b = 1}}
      },
    },
  },
})
