local data_util = require("data_util")
--[[
copy of shield projector, SW, SE, NE
copy of laser turret NW
interface addon graphic
interface addon display animation.
]]
local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
}
local connection_point = {
  wire = { red = {-1 -8/32, 2 +20/32},   green = {-1 -2/32, 2 +20/32}, },
  shadow = { red = {2 -8/32, 5}, green = {2 -2/32, 5}, },
}

local function make_spidertron_leg(number)
  local leg = table.deepcopy(data.raw["spider-leg"]["spidertron-leg-"..number])
  leg.name = data_util.mod_prefix.."burbulator-leg-" .. number
  leg.initial_movement_speed = 0.006
  leg.movement_acceleration = 0.003
  leg.movement_based_position_selection_distance = 2
  leg.part_length = 4
  return leg
end

data:extend({
  {
    type = "lamp",
    name = data_util.mod_prefix.. "interburbulator-control",
    icon = "__space-exploration-graphics__/graphics/icons/shield-projector.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    order = "y",
    energy_source = {type = "void"},
    max_health = 10000,
    healing_per_tick = 10000,
    collision_box = data_util.auto_box(2, 2, 0.1),
    selection_box = data_util.auto_box(2, 2),
    collision_mask = {"not-colliding-with-itself"},
    energy_usage_per_tick = "1J",
    always_on = true,
    picture_off = blank_image,
    picture_on = {
      layers = {
        {
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace.png",
          frame_count = 1,
          height = 87,
          hr_version = {
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace.png",
            frame_count = 1,
            height = 174,
            priority = "high",
            scale = 0.5,
            shift = {
              -0.0390625,
              0.0625
            },
            width = 171
          },
          priority = "high",
          shift = {
            -0.046875,
            0.046875
          },
          width = 85
        },
        {
          draw_as_shadow = true,
          filename = "__base__/graphics/entity/steel-furnace/steel-furnace-shadow.png",
          frame_count = 1,
          height = 43,
          hr_version = {
            draw_as_shadow = true,
            filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-shadow.png",
            frame_count = 1,
            height = 85,
            priority = "high",
            scale = 0.5,
            shift = {
              1.2265625,
              0.3515625
            },
            width = 277
          },
          priority = "high",
          shift = {
            1.234375,
            0.359375
          },
          width = 139
        }
      }
    }
  },
  {
    type = "simple-entity",
    name = data_util.mod_prefix.. "interburbulator-interface",
    icon = "__space-exploration-graphics__/graphics/icons/shield-projector.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    order = "y",
    max_health = 10000,
    healing_per_tick = 10000,
    collision_box = data_util.auto_box(1, 1, 0.1),
    selection_box = data_util.auto_box(1, 1),
    collision_mask = {"not-colliding-with-itself"},
    selectable_in_game = false,
    animations = {
      layers = {
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics__/graphics/entity/robot-faction/hr/interface-addon.png",
          frame_count = 1,
          width = 72,
          height = 82,
          line_length = 1,
          repeat_count = 3,
          animation_speed = 0.1,
          shift = { 0,0},
          scale = 0.5
        }),
        data_util.auto_sr_hr({
          filename = "__space-exploration-graphics__/graphics/entity/robot-faction/hr/interface-addon-display.png",
          frame_count = 3,
          width = 78/3,
          height = 42,
          line_length = 3,
          animation_speed = 0.1,
          shift = { 0,-0.1},
          scale = 0.5,
          belnd_mode = "additive"
        }),
      }
    }
  },
  {
      type = "constant-combinator",
      name = data_util.mod_prefix.. "interburbulator-projector",
      icon = "__space-exploration-graphics__/graphics/icons/shield-projector.png",
      icon_size = 64,
      flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
      order = "y",
      max_health = 10000,
      healing_per_tick = 10000,
      collision_box = data_util.auto_box(2, 2, 0.1),
      selection_box = data_util.auto_box(2, 2),
      collision_mask = {"not-colliding-with-itself"},
      scale_info_icons = false,
      selectable_in_game = true,
      item_slot_count = 0,
      sprites =
      {
          north = {
            layers = {
              data_util.auto_sr_hr({
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector.png",
                frame_count = 1,
                x = 196 * 1,
                width = 196,
                height = 284,
                line_length = 1,
                shift = { 1/32, -24/32 },
                scale = 0.5 * 2/3
              }),
              data_util.auto_sr_hr({
                frame_count = 1,
                draw_as_shadow = true,
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector-shadow.png",
                x = 412 * 1,
                width = 412,
                height = 249,
                line_length = 1,
                shift = { (1 + 22/32) * 2/3, (-8/32) * 2/3},
                scale = 0.5 * 2/3
              }),
            }
          },
          east = {
            layers = {
              data_util.auto_sr_hr({
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector.png",
                frame_count = 1,
                x = 196 * 3,
                width = 196,
                height = 284,
                line_length = 1,
                shift = { 1/32, -24/32 },
                scale = 0.5 * 2/3
              }),
              data_util.auto_sr_hr({
                frame_count = 1,
                draw_as_shadow = true,
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector-shadow.png",
                x = 412 * 3,
                width = 412,
                height = 249,
                line_length = 1,
                shift = { (1 + 22/32) * 2/3, (-8/32) * 2/3},
                scale = 0.5 * 2/3
              }),
            }
          },
          south = {
            layers = {
              data_util.auto_sr_hr({
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector.png",
                frame_count = 1,
                x = 196 * 5,
                width = 196,
                height = 284,
                line_length = 1,
                shift = { 1/32, -24/32 },
                scale = 0.5 * 2/3
              }),
              data_util.auto_sr_hr({
                frame_count = 1,
                draw_as_shadow = true,
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector-shadow.png",
                x = 412 * 1,
                y = 249 * 1,
                width = 412,
                height = 249,
                line_length = 1,
                shift = { (1 + 22/32) * 2/3, (-8/32) * 2/3},
                scale = 0.5 * 2/3
              }),
            }
          },
          west = {
            layers = {
              data_util.auto_sr_hr({
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector.png",
                frame_count = 1,
                x = 196 * 7,
                width = 196,
                height = 284,
                line_length = 1,
                shift = { 1/32, -24/32 },
                scale = 0.5 * 2/3
              }),
              data_util.auto_sr_hr({
                frame_count = 1,
                draw_as_shadow = true,
                filename = "__shield-projector__/graphics/entity/shield-projector/hr/shield-projector-shadow.png",
                x = 412 * 3,
                y = 249 * 1,
                width = 412,
                height = 249,
                line_length = 1,
                shift = { (1 + 22/32) * 2/3, (-8/32) * 2/3},
                scale = 0.5 * 2/3
              }),
            }
          }
      },
      activity_led_sprites =
      {
          north = blank_image,
          east = blank_image,
          south = blank_image,
          west = blank_image
      },
      activity_led_light =
      {
          intensity = 0.8,
          size = 1,
      },
      activity_led_light_offsets =
      {
          {0, 0},
          {0, 0},
          {0, 0},
          {0, 0}
      },
      circuit_wire_connection_points =
      {
          connection_point,  connection_point,  connection_point,  connection_point,
      },
      circuit_wire_max_distance = 0
  },
  {
    type = "sprite",
    name = data_util.mod_prefix.."interburbulator-grid",
    filename = "__space-exploration-graphics__/graphics/entity/robot-faction/sr/interburbulator-grid.png",
    width = 832,
    height = 864,
    shift = { 0,-0.5 },
    blend_mode = "additive",
    scale = 1
  },
  {
    type = "sprite",
    name = data_util.mod_prefix.."interburbulator-light",
    filename = "__space-exploration-graphics__/graphics/entity/robot-faction/sr/interburbulator-light.png",
    width = 832/2,
    height = 864/2,
    shift = { 0,-0.5 },
    blend_mode = "additive",
    scale = 2
  },
  {
    type = "spider-vehicle",
    name = data_util.mod_prefix.."burbulator",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    icon = "__base__/graphics/icons/spidertron.png",
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.35 },
    close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.6,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/spidertron/spidertron-vox.ogg",
        volume = 0.35
      },
      activate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-activate.ogg",
        volume = 0.5
      },
      deactivate_sound =
      {
        filename = "__base__/sound/spidertron/spidertron-deactivate.ogg",
        volume = 0.5
      },
      match_speed_to_activity = true,
    },
    icon_size = 64, icon_mipmaps = 4,
    weight = 1,
    braking_force = 1,
    friction_force = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    collision_mask = {},
    --minable = {mining_time = 1, result = "spidertron"},
    max_health = 100000,
    healing_per_tick = 1000,
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
        decrease = 20,
        percent = 75
      },
      {
        type = "acid",
        decrease = 0,
        percent = 70
      },
      {
        type = "laser",
        decrease = 0,
        percent = 70
      },
      {
        type = "electric",
        decrease = 0,
        percent = 70
      }
    },
    minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    corpse = "spidertron-remnants",
    dying_explosion = "spidertron-explosion",
    energy_per_hit_point = 1,
    guns = { "spidertron-rocket-launcher-1", "spidertron-rocket-launcher-2", "spidertron-rocket-launcher-3", "spidertron-rocket-launcher-4" },
    inventory_size = 80,
    equipment_grid = "spidertron-equipment-grid",
    height = 1.5,
    torso_rotation_speed = 0.01,
    chunk_exploration_radius = 3,
    selection_priority = 51,
    graphics_set = table.deepcopy(data.raw["spider-vehicle"].spidertron.graphics_set),
    energy_source =
    {
      type = "void",
    },
    movement_energy_consumption = "250kW",
    automatic_weapon_cycling = true,
    chain_shooting_cooldown_modifier = 0.5,
    spider_engine =
    {
      legs =
      {
        { -- 1
          leg = data_util.mod_prefix.."burbulator-leg-1",
          mount_position = util.by_pixel(15, -22),--{0.5, -0.75},
          ground_position = {2.25, -2.5},
          blocking_legs = {2},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 3
          leg = data_util.mod_prefix.."burbulator-leg-3",
          mount_position = util.by_pixel(24, -3),--{0.75, 0.25},
          ground_position = {3, 1},
          blocking_legs = {1, 3},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 4
          leg = data_util.mod_prefix.."burbulator-leg-4",
          mount_position = util.by_pixel(15, 17),--{0.5, 0.75},
          ground_position = {2.25, 2.5},
          blocking_legs = {2},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 5
          leg = data_util.mod_prefix.."burbulator-leg-5",
          mount_position = util.by_pixel(-15, -22),--{-0.5, -0.75},
          ground_position = {-2.25, -2.5},
          blocking_legs = {5},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 7
          leg = data_util.mod_prefix.."burbulator-leg-7",
          mount_position = util.by_pixel(-24, 3),--{-0.75, 0.25},
          ground_position = {-3, 1},
          blocking_legs = {4,6},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 8
          leg = data_util.mod_prefix.."burbulator-leg-8",
          mount_position = util.by_pixel(-15, 17),--{-0.5, 0.75},
          ground_position = {-2.25, 2.5},
          blocking_legs = {5},
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        }
      },
      military_target = "spidertron-military-target",
    }
  },
  make_spidertron_leg(1),
  --make_spidertron_leg(2),
  make_spidertron_leg(3),
  make_spidertron_leg(4),
  make_spidertron_leg(5),
  --make_spidertron_leg(6),
  make_spidertron_leg(7),
  make_spidertron_leg(8),
})
