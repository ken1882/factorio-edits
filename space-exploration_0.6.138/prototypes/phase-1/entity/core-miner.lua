local data_util = require("data_util")
local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
}
local shadow =
{
  filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-shadow.png",
  priority = "high",
  width = 951,
  height = 491,
  frame_count = 1,
  shift = {2 + 3/32, 1 + 22/32},
  draw_as_shadow = true,
  scale=0.5,
}

local shadow_anim = table.deepcopy(shadow)
shadow_anim.repeat_count = 30
local off_layer = {
  layers = {
    shadow,
    {
      filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-off.png",
      priority = "high",
      width = 691,
      height = 737,
      frame_count = 1,
      shift = {0, -8/32},
      scale=0.5,
    },
  }
}
local core_miner_collision_box = {{-5.2, -5.2}, {5.2, 5.2}} -- needs to stay the same for resource, seam collision, and main entity.
local oriented_cliff_dummy = {
  collision_bounding_box = core_miner_collision_box,
  fill_volume = 0,
  pictures = {blank_image}
}

data:extend({
  {
    type = "mining-drill",
    name = data_util.mod_prefix .. "core-miner-drill",
    minable = {mining_time = 0.5, result = data_util.mod_prefix .. "core-miner"},
    selection_priority = 50,
    icon = "__space-exploration-graphics__/graphics/icons/core-miner.png",
    icon_size = 64,
    order = "zzz",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    placeable_by = {item = data_util.mod_prefix .. "core-miner", count=1},
    max_health = 5000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      { type = "fire", percent = 70 },
      { type = "meteor", percent = 90 },
      { type = "explosion", percent = 70 },
      { type = "impact", percent = 70 },
    },
    collision_mask = {"player-layer", "water-tile", space_collision_layer},
    collision_box = core_miner_collision_box,
    selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
    resource_categories = { data_util.mod_prefix .. "core-mining" },
    resource_searching_radius = 0.4,
    mining_speed = 100,
    always_draw_idle_animation = false,
    energy_usage = "25MW",
    vector_to_place_result = { 0, -5.85 },
    animations = {
      layers = {
        shadow_anim,
        {
          priority = "high",
          width = 691,
          height = 737,
          frame_count = 30,
          animation_speed = 1,
          shift = {0, -8/32},
          scale=0.5,
          stripes =
          {
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-1.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-2.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-3.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-4.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-5.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-6.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-7.png",
              width_in_frames = 2,
              height_in_frames = 2,
            },
            {
              filename = "__space-exploration-graphics-3__/graphics/entity/core-miner/hr/core-miner-8.png",
              width_in_frames = 2,
              height_in_frames = 1,
            },
          },
        },
      }
    },
    working_visualisations =
    {
      shadow,
      {
        effect = "uranium-glow", -- changes alpha based on energy source light intensity
        light = {intensity = 1, size = 32, shift = {0.0, 0.0}, color = {r = 1.0, g = 0.6, b = 0.1}}
      },
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/electric-mining-drill.ogg",
          volume = 1
        },
      },
      apparent_volume = 2
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 200,
    },
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {}
  },
  { -- Stops players from walking into the hole and allows the seam to be closed via cliff explosive
    type = "cliff",
    name = data_util.mod_prefix .. "core-seam-fissure",
    cliff_explosive = "cliff-explosives",
    collision_mask = {
      --"player-layer",
      "train-layer", -- also block player but not core miner
      "object-layer",
      "floor-layer",
    },
    grid_size = {1, 1},
    grid_offset = {0.5, 0.5},
    selectable_in_game = false,
    orientations = {
      west_to_east = oriented_cliff_dummy,
      north_to_south = oriented_cliff_dummy,
      east_to_west = oriented_cliff_dummy,
      south_to_north = oriented_cliff_dummy,
      west_to_north = oriented_cliff_dummy,
      north_to_east = oriented_cliff_dummy,
      east_to_south = oriented_cliff_dummy,
      south_to_west = oriented_cliff_dummy,
      west_to_south = oriented_cliff_dummy,
      north_to_west = oriented_cliff_dummy,
      east_to_north = oriented_cliff_dummy,
      south_to_east = oriented_cliff_dummy,
      west_to_none = oriented_cliff_dummy,
      none_to_east = oriented_cliff_dummy,
      north_to_none = oriented_cliff_dummy,
      none_to_south = oriented_cliff_dummy,
      east_to_none = oriented_cliff_dummy,
      none_to_west = oriented_cliff_dummy,
      south_to_none = oriented_cliff_dummy,
      none_to_north = oriented_cliff_dummy,
    }
  },
  { -- spawns smoke
    type = "smoke-with-trigger",
    name = data_util.mod_prefix .. "core-seam-smoke-generator",
    selectable_in_game = false,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          type = "create-trivial-smoke",
          smoke_name = data_util.mod_prefix .. "core-seam-smoke",
          speed = {0, -0.03},
          initial_height = 0.5,
          speed_multiplier = 1,
          speed_multiplier_deviation = 0.5,
          starting_frame_deviation = 2,
          offset = {util.by_pixel( 0, -10.0)},
          offset_deviation = {{-4, -4}, {4, 4}},
          speed_from_center = 0.04,
          speed_from_center_deviation = 0.04
        }
      },
    },
    action_cooldown = 10,
    cyclic = true,
    duration = 4294967295,
    fade_in_duration = 0,
    fade_away_duration = 0,
    show_when_smoke_off = true,
    affected_by_wind = false,
    flags = {"placeable-off-grid", "not-on-map"},
    render_layer = "object",
    animation = blank_image
  },
  {
    type = "trivial-smoke",
    name = data_util.mod_prefix .. "core-seam-smoke",
    duration = 400,
    fade_in_duration = 100,
    fade_away_duration = 200,
    spread_duration= 400,
    start_scale = 0.60,
    end_scale = 1.5,
    color = {r = 0.4, b = 0.4, g = 0.4, a = 0.4},
    cyclic = true,
    affected_by_wind = true,
    movement_slow_down_factor = 0.0001,
    animation =
    {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = {-0.53125, -0.4375},
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" }
    },
    vertical_speed_slowdown = 0.001
  },
})
