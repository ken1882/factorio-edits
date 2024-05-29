local data_util = require("data_util")
local original_graphic_size = 8
local structure_size = 8
local shift_y = 0.75
data:extend({
  {
      type = "item",
      name = data_util.mod_prefix .. "nexus",
      icon = "__space-exploration-graphics__/graphics/icons/nexus.png",
      icon_size = 64,
      order = "b-a",
      subgroup = "computation",
      stack_size = 1,
      place_result = data_util.mod_prefix .. "nexus",
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "nexus",
      result = data_util.mod_prefix .. "nexus",
      enabled = false,
      energy_required = 60,
      ingredients = {
        { data_util.mod_prefix .. "aeroframe-bulkhead", 10 },
        { data_util.mod_prefix .. "heavy-assembly", 10 },
        { data_util.mod_prefix .. "naquium-tessaract", 20 },
        { data_util.mod_prefix .. "naquium-processor", 1 },
        { data_util.mod_prefix .. "superconductive-cable", 20 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "interstellar-data",
    energy_required = 10000,
    ingredients = {
      { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    },
    results = {
      { name = data_util.mod_prefix .. "interstellar-data", amount = 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    category="nexus"
  },
  {
    type = "recipe",
    name = data_util.mod_prefix .. "distortion-drive",
    energy_required = 600,
    ingredients = {
      { name = data_util.mod_prefix .. "interstellar-data", amount = 1 },
    },
    results = {
      { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    },
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
    icon =  "__space-exploration-graphics__/graphics/icons/astronomic/anomaly.png",
    icon_size =  64,
    category="nexus",
    localised_name = {"recipe-name."..data_util.mod_prefix .. "distortion-drive"},
    localised_description = {
      "recipe-description."..data_util.mod_prefix .. "distortion-drive",
      Shared.spaceship_victory_speed,
      Shared.spaceship_victory_duration,
      Shared.spaceship_victory_size
    }
  },
  {
      type = "technology",
      name = data_util.mod_prefix .. "nexus",
      effects = {
       {
         type = "unlock-recipe",
         recipe = data_util.mod_prefix .. "nexus",
       },
      },
      icon = "__space-exploration-graphics__/graphics/technology/nexus.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "naquium-processor",
        data_util.mod_prefix .. "heavy-assembly",
        data_util.mod_prefix .. "spaceship",
      },
      unit = {
       count = 2000,
       time = 60,
       ingredients = {
         { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack-3", 1 },
       }
      },
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix .. "nexus",
    icon = "__space-exploration-graphics__/graphics/icons/nexus.png",
    icon_size = 64,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 1, result = data_util.mod_prefix .. "nexus"},
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{structure_size/-2+0.3, structure_size/-2+0.3}, {structure_size/2-0.3, structure_size/2-0.3}},
    selection_box = {{-structure_size/2, -structure_size/2}, {structure_size/2, structure_size/2}},
    display_box = {{-structure_size/2, -structure_size/2-2}, {structure_size/2, structure_size/2}},
    resistances =
    {
      {
        type = "impact",
        percent = 10
      }
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1,
      sound = {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      }
    },
    collision_mask = {
      "water-tile",
      "ground-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    se_allow_in_space = true,
    animation ={
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-base.png",
          width = 467/2,
          height = 290/2,
          line_length = 1,
          frame_count = 1,
          repeat_count = 64,
          animation_speed = 1,
          shift = { 0/32, 50.5/32+shift_y },
          scale = structure_size/original_graphic_size,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-base.png",
            width = 467,
            height = 290,
            line_length = 1,
            frame_count = 1,
            repeat_count = 64,
            animation_speed = 1,
            shift = { 0/32, 50.5/32+shift_y },
            scale = 0.5 * structure_size/original_graphic_size,
          },
        },
        {
          height = 448/2,
          width = 402/2,
          frame_count = 64,
          animation_speed = 1,
          shift = { 1/32, -35/32+shift_y },
          scale = structure_size/original_graphic_size,
          stripes =
          {
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-1.png",
             width_in_frames = 4,
             height_in_frames = 4,
            },
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-2.png",
             width_in_frames = 4,
             height_in_frames = 4,
            },
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-3.png",
             width_in_frames = 4,
             height_in_frames = 4,
            },
            {
             filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-4.png",
             width_in_frames = 4,
             height_in_frames = 4,
            },
          },
          hr_version = {
            height = 448,
            width = 402,
            frame_count = 64,
            animation_speed = 1,
            shift = { 1/32, -35/32+shift_y },
            scale = 0.5 * structure_size/original_graphic_size,
            stripes =
            {
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-1.png",
               width_in_frames = 4,
               height_in_frames = 4,
              },
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-2.png",
               width_in_frames = 4,
               height_in_frames = 4,
              },
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-3.png",
               width_in_frames = 4,
               height_in_frames = 4,
              },
              {
               filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-4.png",
               width_in_frames = 4,
               height_in_frames = 4,
              },
            },
          },
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-shadow.png",
          width = 599/2,
          height = 345/2,
          line_length = 1,
          frame_count = 1,
          repeat_count = 64,
          animation_speed = 1,
          shift = { 1.40625, 0.34375+shift_y },
          scale = structure_size/original_graphic_size,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-shadow.png",
            width = 599,
            height = 345,
            line_length = 1,
            frame_count = 1,
            repeat_count = 64,
            animation_speed = 1,
            shift = { 1.40625, 0.34375+shift_y },
            scale = 0.5 * structure_size/original_graphic_size,
          },
        }
      }
    },
    idle_animation = {
      layers = {
        {
          filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-inactive.png",
          frame_count = 1,
          height = 541/2,
          width = 467/2,
          repeat_count = 64,
          shift = { 0/32, -12/32+shift_y},
          scale = structure_size/original_graphic_size,
          hr_version = {
            filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-inactive.png",
            frame_count = 1,
            height = 541,
            width = 467,
            repeat_count = 64,
            shift = { 0/32, -12/32+shift_y},
            scale = 0.5 * structure_size/original_graphic_size,
          },
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-3__/graphics/entity/nexus/sr/nexus-shadow.png",
          frame_count = 1,
          width = 599/2,
          height = 345/2,
          repeat_count = 64,
          shift = { 1.40625, 0.34375 +shift_y},
          scale = structure_size/original_graphic_size,
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-3__/graphics/entity/nexus/hr/nexus-shadow.png",
            frame_count = 1,
            width = 599,
            height = 345,
            repeat_count = 64,
            shift = { 1.40625, 0.34375 +shift_y},
            scale = 0.5 * structure_size/original_graphic_size,
          },
        }
      }
    },
    crafting_categories = {"nexus"},
    crafting_speed = 1,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "1W",
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {},
    working_visualisations =
    {
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 0.5, size = 8, shift = {0.0, 0.0}, color = {r = 1, g = 0.9, b = 0.5}}
      },
    },
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "nexus-charger",
    icon = "__space-exploration-graphics__/graphics/icons/nexus.png",
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    icon_size = 64,
    order = "b-a",
    selectable_in_game = false,
    collision_box = {{structure_size/-2+0.3, structure_size/-2+0.3}, {structure_size/2-0.3, structure_size/2-0.3}},
    selection_box = {{-structure_size/2, -structure_size/2}, {structure_size/2, structure_size/2}},
    energy_source = {
      buffer_capacity = "100MJ",
      input_flow_limit = "100GW",
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "10MW"
  },
})
