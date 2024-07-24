local data_util = require("data_util")

local target_animation_speed = 1
local crafting_speed = 2
local module_slots = 4
local animation_speed = (target_animation_speed / crafting_speed) / (1 + data_util.speed_module_3_speed_bonus * module_slots)

data:extend({
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "space-hypercooler",
    icon = "__space-exploration-graphics__/graphics/icons/hypercooler.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = data_util.mod_prefix .. "space-hypercooler"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, 0),
    resistances =
    {
      {
        type = "fire",
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
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-3, 0} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 3} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {3, 0} }},
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
          filename = "__base__/sound/pumpjack.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
      --spaceship_collision_layer,
    },
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.7}, {2.5, 2.5}},
    animation =
    {
      layers =
      {
        {
          priority = "high",
          width = 320,
          height = 352,
          frame_count = 64,
          shift = util.by_pixel(-0, -8),
          animation_speed = animation_speed,
          scale = 0.5,
          stripes =
          {
            {
             filename = "__space-exploration-graphics-4__/graphics/entity/hypercooler/hr/hypercooler-1.png",
             width_in_frames = 6,
             height_in_frames = 5,
            },
            {
             filename = "__space-exploration-graphics-4__/graphics/entity/hypercooler/hr/hypercooler-2.png",
             width_in_frames = 6,
             height_in_frames = 5,
            },
            {
             filename = "__space-exploration-graphics-4__/graphics/entity/hypercooler/hr/hypercooler-3.png",
             width_in_frames = 4,
             height_in_frames = 1,
            },
          }
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-4__/graphics/entity/hypercooler/hr/shadow.png",
          priority = "high",
          width = 424,
          height = 280,
          frame_count = 1,
          line_length = 1,
          repeat_count = 64,
          shift = util.by_pixel(25, 11),
          scale = 0.5,
        },
      },
    },
    crafting_categories = {"space-hypercooling"},
    crafting_speed = crafting_speed,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 2,
    },
    energy_usage = "200kW",
    module_specification =
    {
      module_slots = module_slots
    },
    allowed_effects = {"consumption", "speed", "pollution"} -- not "productivity",
  },
})
