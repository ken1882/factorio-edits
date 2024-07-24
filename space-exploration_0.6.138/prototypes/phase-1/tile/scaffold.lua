local data_util = require("data_util")
data:extend(
{
  {
    type = "tile",
    name = data_util.mod_prefix .. "space-platform-scaffold",
    needs_correction = false,
    minable = {mining_time = 0.1, result = data_util.mod_prefix .. "space-platform-scaffold"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {
      space_collision_layer,
      --"resource-layer"
    },
    walking_speed_modifier = 0.75,
    layer = 207,
    decorative_removal_probability = 0.75,
    variants =
    {
      main =
      {
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile1.png",
          count = 16,
          size = 1,
          hr_version =
          {
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile1.png",
            count = 16,
            size = 1,
            scale = 0.5
          }
        },
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile2.png",
          count = 5,
          size = 2,
          probability = 0.05,
          hr_version =
          {
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile2.png",
            count = 5,
            size = 2,
            scale = 0.5
          }
        },
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile4.png",
          count = 1,
          size = 4,
          probability = 0.02,
          hr_version =
          {
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile4.png",
            count = 1,
            size = 4,
            scale = 0.5
          }
        },
      },
      inner_corner =
      {
        picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-inner-corner.png",
        count = 8,
        hr_version =
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-inner-corner.png",
          count = 8,
          scale = 0.5
        }
      },
      outer_corner =
      {
        picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-outer-corner.png",
        count = 8,
        hr_version =
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-outer-corner.png",
          count = 8,
          scale = 0.5
        }
      },
      side =
      {
        picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-side.png",
        count = 8,
        hr_version =
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-side.png",
          count = 8,
          scale = 0.5
        }
      },
      u_transition =
      {
        picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-u.png",
        count = 1,
        hr_version =
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-u.png",
          count = 1,
          scale = 0.5
        }
      },
      o_transition =
      {
        picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-o.png",
        count = 8,
        hr_version =
        {
          picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-o.png",
          count = 8,
          scale = 0.5
        }
      }
    },
    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.2
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.2
      }
    },
    map_color={r=50, g=50, b=50},
    ageing=0,
    vehicle_friction_modifier = 100,
    transitions = {
        {
          to_tiles = {
            "water",
            "deepwater",
            "water-green",
            "deepwater-green",
            "water-shallow",
            "water-mud",
            data_util.mod_prefix .. "space"
          },
          transition_group = 1,
          inner_corner = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 0,
              y = 0
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 0,
            y = 0
          },
          inner_corner_background = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 1088,
              y = 0
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 544,
            y = 0
          },
          inner_corner_mask = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              x = 2176,
              y = 0
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            x = 1088,
            y = 0
          },
          o_transition = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = false,
              x = 0,
              y = 2304
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = false,
            x = 0,
            y = 1152
          },
          o_transition_background = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = false,
              x = 1088,
              y = 2304
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = false,
            x = 544,
            y = 1152
          },
          o_transition_mask = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              x = 2176,
              y = 2304
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            x = 1088,
            y = 1152
          },
          outer_corner = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 0,
              y = 576
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 0,
            y = 288
          },
          outer_corner_background = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 1088,
              y = 576
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 544,
            y = 288
          },
          outer_corner_mask = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              x = 2176,
              y = 576
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            x = 1088,
            y = 288
          },
          side = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 0,
              y = 1152
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 0,
            y = 576
          },
          side_background = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 1088,
              y = 1152
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 544,
            y = 576
          },
          side_mask = {
            count = 8,
            hr_version =  {
              count = 8,
              line_length = 8,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              x = 2176,
              y = 1152
            },
            line_length = 8,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            x = 1088,
            y = 576
          },
          u_transition = {
            count = 1,
            hr_version =  {
              count = 1,
              line_length = 1,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 0,
              y = 1728
            },
            line_length = 1,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 0,
            y = 864
          },
          u_transition_background = {
            count = 1,
            hr_version =  {
              count = 1,
              line_length = 1,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              tall = true,
              x = 1088,
              y = 1728
            },
            line_length = 1,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            tall = true,
            x = 544,
            y = 864
          },
          u_transition_mask = {
            count = 1,
            hr_version =  {
              count = 1,
              line_length = 1,
              picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/hr-tile-transitions.png",
              scale = 0.5,
              x = 2176,
              y = 1728
            },
            line_length = 1,
            picture = "__space-exploration-graphics__/graphics/terrain/space-platform-scaffold/tile-transitions.png",
            x = 1088,
            y = 864
          }
        },
      }
  },
})
