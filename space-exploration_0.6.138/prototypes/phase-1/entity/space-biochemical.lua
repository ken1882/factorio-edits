local data_util = require("data_util")

local target_animation_speed = 1
local crafting_speed = 4
local module_slots = 4
local animation_speed = (target_animation_speed / crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * module_slots)

table.insert(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "melting")

local pipe_pics = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_picture)
data_util.replace_filenames_recursive(pipe_pics,
  "__base__",
  "__space-exploration-graphics__")
data_util.replace_filenames_recursive(pipe_pics,
  "assembling-machine-3",
  "assembling-machine")

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-biochemical-laboratory",
    icon = "__space-exploration-graphics__/graphics/icons/biochemical-laboratory.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-biochemical-laboratory"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-4.2, -4.2}, {4.2, 4.2}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    drawing_box = {{-4.5, -4.7}, {4.5, 4.5}},
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
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-5, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-2, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-5, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-5, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {2, -5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-2, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {5, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {5, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, 5} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = pipe_pics,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {5, -2} }},
        secondary_draw_orders = { north = -1 }
      },
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/pumpjack.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
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
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/sr/biochemical-laboratory.png",
          priority = "high",
          width = 4608/8/2,
          height = 5120/8/2,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(0, -16),
          animation_speed = animation_speed,
          hr_version = {
            filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory.png",
            priority = "high",
            width = 4608/8,
            height = 5120/8,
            frame_count = 64,
            line_length = 8,
            shift = util.by_pixel(0, -16),
            animation_speed = animation_speed,
            scale = 0.5,
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/sr/shadow.png",
          priority = "high",
          width = 648/2,
          height = 560/2,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(35, 20),
          hr_version = {
              draw_as_shadow = true,
              filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/shadow.png",
              priority = "high",
              width = 648,
              height = 560,
              frame_count = 1,
              line_length = 1,
              repeat_count = 64,
              shift = util.by_pixel(35, 20),
              scale = 0.5,
          }
        },
      },
    },
    crafting_categories = {"space-biochemical", "chemistry", "oil-processing", "melting"},
    crafting_speed = crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4,
    },
    energy_usage = "3000kW",
    module_specification =
    {
      module_slots = module_slots
    },
    allowed_effects = {"consumption", "speed",  "pollution"}, -- not "productivity",
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.2, size = 16, shift = {0.0, 0.0}, color = {r = 0.6, g = 1, b = 0.5}}
      },
      {
        apply_recipe_tint = "primary",
        always_draw = true,
        animation =
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory-tint-1.png",
          priority = "high",
          width = 1320/8,
          height = 1400/8,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(-88, -122),
          animation_speed = animation_speed,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "secondary",
        always_draw = true,
        animation =
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory-tint-2.png",
          priority = "high",
          width = 50,
          height = 50,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(-94, -11),
          animation_speed = animation_speed,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "secondary",
        always_draw = true,
        animation =
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory-tint-3.png",
          priority = "high",
          width = 800/8,
          height = 800/8,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(103, 87),
          animation_speed = animation_speed,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "tertiary",
        always_draw = true,
        animation =
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory-tint-4.png",
          priority = "high",
          width = 800/8,
          height = 800/8,
          frame_count = 64,
          line_length = 8,
          shift = util.by_pixel(-104, 90),
          animation_speed = animation_speed,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "quaternary",
        always_draw = true,
        animation =
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory-tint-5.png",
          priority = "high",
          width = 140,
          height = 100,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(76, -111),
          animation_speed = animation_speed,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "quaternary",
        always_draw = true,
        animation =
        {
          filename = "__space-exploration-graphics-2__/graphics/entity/biochemical-laboratory/hr/biochemical-laboratory-tint-6.png",
          priority = "high",
          width = 50,
          height = 50,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(-87, -1),
          animation_speed = animation_speed,
          scale = 0.5,
        },
      },
    },
  },
})
