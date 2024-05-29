local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

data:extend({
  {
    type = "assembling-machine",
    name = "kr-advanced-chemical-plant",
    icon = kr_entities_icons_path .. "advanced-chemical-plant.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-advanced-chemical-plant" },
    max_health = 1500,
    corpse = "kr-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 70 },
      { type = "impact", percent = 70 },
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 20,
        base_level = -1,
        pipe_connections = { { type = "input", position = { 2, -4 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 20,
        base_level = -1,
        pipe_connections = { { type = "input", position = { 0, -4 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 20,
        base_level = -1,
        pipe_connections = { { type = "input", position = { -2, -4 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 2, 4 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 0, 4 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { -2, 4 } } },
      },

      off_when_no_fluid_recipe = false,
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    fast_replaceable_group = "assembling-machine",
    scale_entity_info_icon = kr_icons_size,
    animation = {
      layers = {
        {
          filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant.png",
          priority = "high",
          width = 226,
          height = 268,
          shift = { 0, -0.48 },
          frame_count = 20,
          line_length = 5,
          animation_speed = 0.25,
          scale = 1,
          hr_version = {
            filename = kr_entities_path .. "advanced-chemical-plant/hr-advanced-chemical-plant.png",
            priority = "high",
            width = 451,
            height = 535,
            shift = { 0, -0.48 },
            frame_count = 20,
            line_length = 5,
            animation_speed = 0.25,
            scale = 0.5,
          },
        },
        {
          filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant-sh.png",
          priority = "high",
          width = 258,
          height = 229,
          shift = { 0.33, 0.32 },
          frame_count = 1,
          repeat_count = 20,
          animation_speed = 0.25,
          scale = 1,
          draw_as_shadow = true,
          hr_version = {
            filename = kr_entities_path .. "advanced-chemical-plant/hr-advanced-chemical-plant-sh.png",
            priority = "high",
            width = 516,
            height = 458,
            shift = { 0.33, 0.32 },
            frame_count = 1,
            repeat_count = 20,
            animation_speed = 0.25,
            scale = 0.5,
            draw_as_shadow = true,
          },
        },
      },
    },
    crafting_categories = { "chemistry" },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = kr_buildings_sounds_path .. "advanced-chemical-plant.ogg", volume = 0.5 },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
      apparent_volume = 1,
    },
    crafting_speed = 8,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 30,
    },

    water_reflection = {
      pictures = {
        filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant-reflection.png",
        priority = "extra-high",
        width = 80,
        height = 60,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "1.75MW",
    ingredient_count = 6,
    module_specification = { module_slots = 4, module_info_icon_shift = { 0, 1.7 }, module_info_icon_scale = 1 },
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})
