local mortar_smoke_trail =
{
  type = "trivial-smoke",
  name = "mortar-smoke-trail",
  animation =
  {
    filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
    priority = "high",
    width = 50,
    height = 50,
    frame_count = 16,
    animation_speed = 16 / 60,
    scale = 0.5
  },
  duration = 60,
  fade_away_duration = 30,
  show_when_smoke_off = true
}

local source_offset = { 0, 0.25}

data:extend({
  {
    type = "ammo",
    name = "mortar-he-cluster-bomb",
    order = "d[cannon-shell]-c[explosive]",
    icon = "__com_packrebalance__/graphics/icons/mortar-he-cluster-bomb.png",
    icon_mipmaps = 1,
    icon_size = 64,
    subgroup = "ammo",
    stack_size = 200,
    ammo_type = {
      category = "mortar-bomb",
      target_type = "position",
      clamp_position = true,
      range_modifier = 1,
      action = {
        type = "direct",
        action_delivery = {
          type = "stream",
          stream = "mortar-he-cluster-bomb-projectile-stream",
          source_offset = source_offset,
        },
      },
    },
  },
  {
    type = "stream",
    name = "mortar-he-cluster-bomb-projectile-stream",
    action = {
      {
        type = "area",
        radius = 2.5,
        target_entities = false,
        action_delivery = {
          target_effects = {
            {
              type = "damage",
              damage = {
                amount = 400,
                type = "explosion"
              },
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1,
            },
            {
              type = "destroy-decoratives",
              decoratives_with_trigger_only = false,
              from_render_layer = "decorative",
              include_decals = false,
              include_soft_decoratives = true,
              invoke_decorative_trigger = true,
              radius = 3.0,
              to_render_layer = "object",
            },
            {
              type = "create-entity",
              entity_name = "medium-scorchmark-tintable",
              check_buildability = true,
            },
            {
              type = "create-entity",
              entity_name = "grenade-explosion",
              show_in_tooltip = false,
            }
          },
          type = "instant"
        },
      },
      {
        type = "area",
        radius = 7.0,
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "damage",
              damage = { type = "explosion", amount = 300 },
            },
            {
              type = "create-entity",
              entity_name = "explosion",
            }
          },
        },
      },
      {
        action_delivery = {
          direction_deviation = 0.6,
          projectile = "grenade",
          starting_speed = 0.35,
          starting_speed_deviation = 0.3,
          type = "projectile"
        },
        cluster_count = 16,
        distance = 6,
        distance_deviation = 4,
        type = "cluster"
      }
    },
    flags = {
      "not-on-map"
    },
    ground_light = {
      color = { r = 1, g = 0.9, b = 0.5 },
      intensity = 0.4,
      size = 15
    },
    stream_light = {
      color = { r = 1, g = 0.9, b = 0.5 },
      intensity = 1,
      size = 4
    },
    oriented_particle = true,
    particle = {
      filename = "__base__/graphics/entity/cluster-grenade/hr-cluster-grenade.png",
      width = 48,
      height = 54,
      animation_speed = 0.25,
      frame_count = 16,
      line_length = 8,
      shift = { 0.015625, 0.015625},
      scale = 0.5,
    },
    shadow = {
      draw_as_shadow = true,
      filename = "__base__/graphics/entity/grenade/hr-grenade-shadow.png",
      width = 50,
      height = 40,
      animation_speed = 0.25,
      frame_count = 16,
      line_length = 8,
      shift = { 0.0625, 0.1875 },
      scale = 0.5,
    },
    particle_buffer_size = 1,
    particle_end_alpha = 1,
    particle_fade_out_threshold = 1,
    particle_horizontal_speed = 0.5,
    particle_horizontal_speed_deviation = 0.05,
    particle_loop_exit_threshold = 1,
    particle_loop_frame_count = 1,
    particle_spawn_interval = 0,
    particle_spawn_timeout = 1,
    particle_start_alpha = 1,
    particle_start_scale = 1,
    particle_vertical_acceleration = 0.01,
    progress_to_create_smoke = 0.03,
    smoke_sources = {
      {
        name = mortar_smoke_trail.name,
        deviation = {0.1, 0.1},
        frequency = 1,
        position = {0, 0},
        starting_frame = 4,
        starting_frame_deviation = 4,
      }
    },
  }
})
