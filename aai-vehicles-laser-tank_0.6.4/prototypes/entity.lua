data:extend({{
    type = "car",
    name = "vehicle-laser-tank",
    order = "z[programmable]", -- programmable in programmable-vehicles
    icon = "__aai-vehicles-laser-tank__/graphics/icons/laser-tank.png",
    icon_size = 64, icon_mipmaps = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = "vehicle-laser-tank"},
    max_health = 2000,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    energy_per_hit_point = 1,
    immune_to_tree_impacts = true,
    crash_trigger = crash_trigger(),
    collision_box = {{-0.9, -1.3}, {0.9, 1.3}},
    selection_box = {{-1.4, -1.9}, {1.4, 1.9}},
    tank_driving = true,
    consumption = "600kW",
    braking_power = "800kW",
    terrain_friction_modifier = 0.2,
    friction = 0.002,
    rotation_speed = 0.0030,
    weight = 19000,
    resistances =
    {
      {
        type = "fire",
        decrease = 15,
        percent = 50
      },
      {
        type = "physical",
        decrease = 15,
        percent = 35
      },
      {
        type = "impact",
        decrease = 50,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 35
      },
      {
        type = "acid",
        decrease = 10,
        percent = 50
      },
      {
        type = "laser",
        decrease = 10,
        percent = 99
      }
    },
    effectivity = 1,
    burner =
    {
      effectivity = 1,
      fuel_inventory_size = 2,
      smoke =
      {
        {
          name = "car-smoke",
          deviation = {0.25, 0.25},
          frequency = 200,
          position = {0, 1.5},
          starting_frame = 0,
          starting_frame_deviation = 60
        }
      }
    },
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.6, -14},
        size = 2,
        intensity = 0.6
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "medium",
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.6, -14},
        size = 2,
        intensity = 0.6
      }
    },
    animation =
    {
      layers =
      {
        {
          width = 1456/8,
          height = 1032/8,
          frame_count = 1,
          direction_count = 64,
          shift = {0, -0.1875},
          animation_speed = 8,
          max_advance = 0.2,
          line_length = 8,
          stripes =
          {
            {
             filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/sr/laser-base.png",
             width_in_frames = 8,
             height_in_frames = 8,
            }
          },
          hr_version = {
            width = 1456/8*2,
            height = 1032/8*2,
            frame_count = 1,
            direction_count = 64,
            shift = {0, -0.1875},
            animation_speed = 8,
            max_advance = 0.2,
            line_length = 8,
            stripes =
            {
              {
               filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/hr/laser-base.png",
               width_in_frames = 8,
               height_in_frames = 8,
              }
            },
            scale = 0.5
          }
        },
        {
          width = 1456/8,
          height = 1032/8,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          animation_speed = 8,
          max_advance = 0.2,
          line_length = 8,
          shift = {0, -0.1875},
          stripes = {
            {
              filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/sr/laser-base-mask.png",
             width_in_frames = 8,
             height_in_frames = 8,
            }
          },
          hr_version = {
            width = 1456/8*2,
            height = 1032/8*2,
            frame_count = 1,
            apply_runtime_tint = true,
            direction_count = 64,
            animation_speed = 8,
            max_advance = 0.2,
            line_length = 8,
            shift = {0, -0.1875},
            stripes = {
              {
                filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/hr/laser-base-mask.png",
               width_in_frames = 8,
               height_in_frames = 8,
              }
            },
            scale = 0.5
          }
        },
        {
          width = 1440/8,
          height = 1040/8,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 64,
          shift = {0.1, 0.0},
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/sr/laser-base-shadow.png",
             width_in_frames = 8,
             height_in_frames = 8,
            }
          },
          hr_version = {
            width = 1440/8*2,
            height = 1040/8*2,
            frame_count = 1,
            draw_as_shadow = true,
            direction_count = 64,
            shift = {0.1, 0.0},
            animation_speed = 8,
            max_advance = 0.2,
            stripes =
            {
              {
               filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/hr/laser-base-shadow.png",
               width_in_frames = 8,
               height_in_frames = 8,
              }
            },
            scale = 0.5
          }
        }
      }
    },
    turret_animation =
    {
      layers =
      {
        {
          width = 1760/16,
          height = 336/4,
          frame_count = 1,
          direction_count = 64,
          shift = {0, -1},
          animation_speed = 8,
          max_advance = 0.2,
          line_length = 16,
          stripes =
          {
            {
             filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/sr/laser-turret.png",
             width_in_frames = 16,
             height_in_frames = 4,
            }
          },
          hr_version = {
            width = 1760/16*2,
            height = 336/4*2,
            frame_count = 1,
            direction_count = 64,
            shift = {0, -1},
            animation_speed = 8,
            max_advance = 0.2,
            line_length = 16,
            stripes =
            {
              {
               filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/hr/laser-turret.png",
               width_in_frames = 16,
               height_in_frames = 4,
              }
            },
            scale = 0.5
          }
        },
        {
          width = 1760/16,
          height = 336/4,
          frame_count = 1,
          apply_runtime_tint = true,
          direction_count = 64,
          animation_speed = 8,
          max_advance = 0.2,
          line_length = 16,
          shift = {0, -1},
          stripes = {
            {
             filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/sr/laser-turret-mask.png",
             width_in_frames = 16,
             height_in_frames = 4,
            }
          },
          hr_version = {
            width = 1760/16*2,
            height = 336/4*2,
            frame_count = 1,
            apply_runtime_tint = true,
            direction_count = 64,
            animation_speed = 8,
            max_advance = 0.2,
            line_length = 16,
            shift = {0, -1},
            stripes = {
              {
               filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-tank/hr/laser-turret-mask.png",
               width_in_frames = 16,
               height_in_frames = 4,
              }
            },
            scale = 0.5
          }
        },
      }
    },
    turret_rotation_speed = 0.5 / 60,
    turret_return_timeout = 300,
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/car-no-fuel-1.ogg",
        volume = 0.6
      },
    },
    stop_trigger_speed = 0.2,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/car-breaks.ogg",
            volume = 0.6
          },
        }
      },
    },
    sound_minimum_speed = 0.2;
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/car-engine.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__base__/sound/car-engine-start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__base__/sound/car-engine-stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true,
    },
    open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
    close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
    guns = { "laser-tank-cannon" },
    inventory_size = 40,
},
{
    type = "explosion",
    name = "laser-cannon-beam-focussed",
    flags = {"not-on-map"},
    animation_speed = 3,
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-cannon/laser-cannon-beam-focussed.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6,
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
},
{
    type = "explosion",
    name = "laser-cannon-beam-piercing",
    flags = {"not-on-map"},
    animation_speed = 3,
    rotate = true,
    beam = true,
    animations =
    {
      {
        filename = "__aai-vehicles-laser-tank__/graphics/entity/laser-cannon/laser-cannon-beam-piercing.png",
        priority = "extra-high",
        width = 187,
        height = 1,
        frame_count = 6,
      }
    },
    light = {intensity = 1, size = 10},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1
},
})
