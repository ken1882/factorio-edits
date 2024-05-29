local tank = data.raw.car.tank
local tank_shift_y = 12
data:extend({
  {
    type = "car",
    name = "ironclad",
    icon = "__aai-vehicles-ironclad__/graphics/icons/ironclad.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
    minable = {mining_time = 0.5, result = "ironclad"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 2500,
    --corpse = "tank-remnants", -- it sinks?
    dying_explosion = "tank-explosion",
    alert_icon_shift = util.by_pixel(0, -13),
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.5,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 60
      },
      {
        type = "physical",
        decrease = 15,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 70
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      }
    },
    collision_mask = {
      "ground-tile",
      --"object-layer",
      "train-layer"
    },
    collision_box = {{-0.9, -1.9}, {0.9, 1.9}},
    selection_box = {{-1.2, -2.6}, {1.2, 2.6}},
    damaged_trigger_effect = table.deepcopy(tank.damaged_trigger_effect),
    drawing_box = {{-2.7, -2.5}, {2.7, 2.5}},
    burner =
    {
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 3,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0, 1},
          starting_frame = 0,
          starting_frame_deviation = 60,
          height = 0.5,
          height_deviation = 0.1
        },
        {
          name = "ironclad-splash",
          deviation = {0.5, 0.5},
          frequency = 40,
          position = {0, 2},
          starting_frame = 6,
          starting_frame_deviation = 6,
          height = -0.1,
          height_deviation = 0.2
        },
        {
          name = "ironclad-ripple",
          deviation = {1, 1},
          frequency = 20,
          position = {0, 1},
          height = -0.1,
        }
      }
    },
    created_smoke =
    {
      smoke_name = "ironclad-ripple",
      deviation = {1, 1},
      frequency = 10,
      offsets = {{0, 0.25}}
    },
    rotation_speed = 0.0035,
    tank_driving = true,
    weight = 80000,
    consumption = "1100kW", -- "1100kW" is the min to move backwards for a weight of 80000
    braking_power = "1100kW", --"800kW",
    effectivity = 1,
    terrain_friction_modifier = 0.1,
    friction = 0.002,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.1, -14 + tank_shift_y / 32},
        size = 2,
        intensity = 0.8,
        color = {r = 1.0, g = 1.0, b = 0.8},
        source_orientation_offset = -0.02
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.1, -14 + tank_shift_y / 32},
        size = 2,
        intensity = 0.8,
        color = {r = 1.0, g = 1.0, b = 0.8},
        source_orientation_offset = 0.02
      }
    },
    light_animation =
    {
      --blend_mode = "additive",
      draw_as_light = true,
      priority = "low",
      width = 384,
      height = 384,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(0, -7 + tank_shift_y),
      animation_speed = 8,
      max_advance = 1,
      filename = "__aai-vehicles-ironclad__/graphics/entity/ironclad/ironclad-light.png",
      line_length = 8,
      scale = 0.5
    },
    animation =
    {
      layers =
      {
        {
          priority = "low",
          width = 384,
          height = 384,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(0, -7 + tank_shift_y),
          animation_speed = 8,
          max_advance = 1,
          filename = "__aai-vehicles-ironclad__/graphics/entity/ironclad/ironclad.png",
          line_length = 8,
          scale = 0.5
        },
        {
          apply_runtime_tint = true,
          priority = "low",
          width = 384,
          height = 384,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(0, -7 + tank_shift_y),
          animation_speed = 8,
          max_advance = 1,
          filename = "__aai-vehicles-ironclad__/graphics/entity/ironclad/ironclad-mask.png",
          line_length = 8,
          scale = 0.5
        },
        {
          draw_as_shadow = true,
          priority = "low",
          width = 400,
          height = 384,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(12, -5 + tank_shift_y),
          animation_speed = 8,
          max_advance = 1,
          filename = "__aai-vehicles-ironclad__/graphics/entity/ironclad/ironclad-shadow.png",
          line_length = 8,
          scale = 0.5
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          filename = "__aai-vehicles-ironclad__/graphics/entity/mortar-turret/mortar-turret.png",
          priority = "low",
          line_length = 16,
          width = 2048/16,
          height = 448/4,
          frame_count = 1,
          direction_count = 64,
          shift = util.by_pixel(0, -48 + tank_shift_y),
          animation_speed = 8,
          scale = 0.5
        },
        {
          filename = "__aai-vehicles-ironclad__/graphics/entity/mortar-turret/mortar-turret-mask.png",
          priority = "low",
          line_length = 16,
          width = 2048/16,
          height = 448/4,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          shift = util.by_pixel(0, -48 + tank_shift_y),
          scale = 0.5
        },
        {
          filename = "__aai-vehicles-ironclad__/graphics/entity/mortar-turret/mortar-turret-shadow.png",
          priority = "low",
          line_length = 4,
          width = 672/4,
          height = 1472/16,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = util.by_pixel(58.5-10, 0.5 + tank_shift_y),
          scale = 0.5
        }
      }
    },
    turret_rotation_speed = 0.35 / 60,
    turret_return_timeout = 300,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.4
      }
    },
    sound_minimum_speed = 0.2,
    sound_scaling_ratio = 0.8,
    vehicle_impact_sound = table.deepcopy(tank.vehicle_impact_sound),
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/tank-engine.ogg",
        volume = 0.37
      },
      activate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-start.ogg",
        volume = 0.37
      },
      deactivate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-stop.ogg",
        volume = 0.37
      },
      match_speed_to_activity = true
    },
    stop_trigger_speed = 0.1,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/fight/tank-brakes.ogg",
            volume = 0.3
          }
        }
      }
    },
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
    inventory_size = 100,
    track_particle_triggers = table.deepcopy(tank.track_particle_triggers),
    guns = { "ironclad-mortar", "ironclad-cannon" },
    water_reflection =
    {
      pictures =
      {
        filename = "__aai-vehicles-ironclad__/graphics/entity/ironclad/ironclad-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 48,
        shift = util.by_pixel(0, 12),
        variation_count = 1,
        scale = 4.8
      },
      rotate = true,
      orientation_to_variation = false
    },
  },
  {
    type = "trivial-smoke",
    name = "ironclad-splash",
    duration = 60,
    fade_in_duration = 10,
    fade_away_duration = 10,
    spread_duration = 600,
    start_scale = 0.50,
    end_scale = 1.5,
    color = { r = 1, g = 1, b = 1, a = 1},
    cyclic = false,
    affected_by_wind = false,
    render_layer = "ground-tile",
    movement_slow_down_factor = 0,
    show_when_smoke_off = true,
    animation =
    {
      filename = "__aai-vehicles-ironclad__/graphics/entity/water-effects/water-splash.png",
      width = 920/5,
      height = 396/3,
      line_length = 5,
      frame_count = 5*3,
      shift = util.by_pixel(0,-16),
      priority = "high",
      animation_speed = 0.05,
    }
  },
  {
    type = "trivial-smoke",
    name = "ironclad-ripple",
    duration = 200,
    fade_in_duration = 10,
    fade_away_duration = 190,
    spread_duration = 300,
    start_scale = 0.10,
    end_scale = 0.6,
    color = { r = 1, g = 1, b = 1, a = 1},
    cyclic = true,
    affected_by_wind = false,
    render_layer = "water-tile",
    movement_slow_down_factor = 0,
    show_when_smoke_off = true,
    animation =
    {
      filename = "__aai-vehicles-ironclad__/graphics/entity/water-effects/water-ripple.png",
      width = 640,
      height = 512,
      line_length = 1,
      frame_count = 1,
      shift = util.by_pixel(0,-16),
      priority = "high",
      animation_speed = 0.001,
    }
  },
  {
    type = "animation",
    name = "ironclad-ripple-animation",
    filename = "__aai-vehicles-ironclad__/graphics/entity/water-effects/water-ripple-animation.png",
    priority = "high",
    animation_speed = 0.25,
    frame_count = 8,
    line_length = 3,
    scale = 0.5,
    width = 640,
    height = 512,
  }
})
