local data_util = require("data_util")


local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
    repeat_count = 32,
}


data:extend({
  {
    type = "beacon",
    name = data_util.mod_prefix .. "compact-beacon",
    icon = "__space-exploration-graphics__/graphics/icons/compact-beacon.png",
    icon_mipmaps = 1,
    icon_size = 64,
    flags = { "placeable-player", "player-creation" },
    minable = {
      mining_time = 0.1,
      result = data_util.mod_prefix .. "compact-beacon"
    },
    next_upgrade = data_util.mod_prefix .. "compact-beacon-2",
    fast_replaceable_group = "compact-beacon",
    se_allow_in_space = true,
    allowed_effects = { "consumption", "speed", "pollution" },
    animation = {
      layers = {
        {
          filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/sr/compact-beacon-base.png",
          priority = "high",
          width = 116,
          height = 93,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          scale = 0.66,
          shift = { 0.25 , 0 },
          hr_version = {
            filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/hr/compact-beacon-base.png",
            priority = "high",
            width = 116*2,
            height = 93*2,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            scale = 0.66/2,
            shift = { 0.25 , 0 },
          }
        },
        {
          animation_speed = 0.25,
          filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/sr/compact-beacon-antenna.png",
          priority = "high",
          frame_count = 32,
          width = 54,
          height = 50,
          line_length = 8,
          scale = 0.66,
          shift = { 0 , -1-5/32},
          hr_version = {
            animation_speed = 0.25,
            filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/hr/compact-beacon-antenna.png",
            priority = "high",
            frame_count = 32,
            width = 54*2,
            height = 50*2,
            line_length = 8,
            scale = 0.66/2,
            shift = { 0 , -1-5/32},
          }
        },
        {
          animation_speed = 0.25,
          filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/sr/compact-beacon-antenna-shadow.png",
          frame_count = 32,
          width = 63,
          height = 49,
          line_length = 8,
          scale = 0.66,
          shift = { 2+3/32 , 0+9/32 },
          hr_version = {
            animation_speed = 0.25,
            filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/hr/compact-beacon-antenna-shadow.png",
            frame_count = 32,
            width = 63*2,
            height = 49*2,
            line_length = 8,
            scale = 0.66/2,
            shift = { 2+3/32 , 0+9/32 },
          }
        },
      }
    },
    animation_shadow = blank_image,
    base_picture = blank_image,
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    allow_in_space = true,
    drawing_box = { { -1, -1.7 }, { 1, 1 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    corpse = "medium-remnants",
    damaged_trigger_effect = {
      entity_name = "spark-explosion",
      offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
      offsets = { { 0, 1 } },
      type = "create-entity"
    },
    dying_explosion = "beacon-explosion",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "800kW",
    max_health = 400,
    module_specification = {
      module_info_icon_shift = { 0, 0.5 },
      module_info_max_icons_per_row = 5,
      module_info_max_icon_rows = 2,
      module_info_multi_row_initial_height_modifiesr = -0.3,
      module_slots = 10
    },
    distribution_effectivity = 0.75,
    supply_area_distance = 2, -- extends from edge of collision box, actual is 6
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      height = 10,
      priority = "extra-high-no-scale",
      width = 10
    },
    vehicle_impact_sound = {
      {
        filename = "__base__/sound/car-metal-impact.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/car-metal-impact-2.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/car-metal-impact-3.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/car-metal-impact-4.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/car-metal-impact-5.ogg",
        volume = 0.5
      },
      {
        filename = "__base__/sound/car-metal-impact-6.ogg",
        volume = 0.5
      }
    },
    water_reflection = {
      orientation_to_variation = false,
      pictures = {
        filename = "__base__/graphics/entity/beacon/beacon-reflection.png",
        height = 28,
        priority = "extra-high",
        scale = 5,
        shift = {
          0,
          1.71875
        },
        variation_count = 1,
        width = 24
      },
      rotate = false
    },
    open_sound = data.raw.beacon.beacon.open_sound,
    close_sound = data.raw.beacon.beacon.close_sound
  }
})

local compact_beacon_2 = table.deepcopy(data.raw.beacon[data_util.mod_prefix .. "compact-beacon"])
compact_beacon_2.name = data_util.mod_prefix .. "compact-beacon-2"
compact_beacon_2.distribution_effectivity = 1
compact_beacon_2.icon = "__space-exploration-graphics__/graphics/icons/compact-beacon-2.png"
compact_beacon_2.minable.result = data_util.mod_prefix .. "compact-beacon-2"
compact_beacon_2.animation.layers[1].filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/sr/compact-beacon-base-2.png"
compact_beacon_2.animation.layers[1].hr_version.filename = "__space-exploration-graphics-4__/graphics/entity/compact-beacon/hr/compact-beacon-base-2.png"
compact_beacon_2.next_upgrade = nil
data:extend({compact_beacon_2})
