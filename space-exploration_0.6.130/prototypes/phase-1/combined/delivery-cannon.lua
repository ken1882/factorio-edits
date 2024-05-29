local data_util = require("data_util")

local blank = {
  direction_count = 8,
  frame_count = 1,
  filename = "__space-exploration-graphics__/graphics/blank.png",
  width = 1,
  height = 1,
  priority = "low"
}

data:extend({

  {
    type = "technology",
    name = data_util.mod_prefix .. "delivery-cannon",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-chest", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-capsule", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/delivery-cannon.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "explosives",
      data_util.mod_prefix .. "meteor-defence",
      data_util.mod_prefix .. "rocket-science-pack",
    },
    unit = {
     count = 200,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "delivery-cannon-capsule-iridium",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-capsule-iridium", },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/delivery-cannon.png", scale = 1, icon_size = 128, shift = {6, 6}},
      {icon = "__space-exploration-graphics__/graphics/technology/iridium-processing.png", scale = 0.5, icon_size = 128, shift = {-32, -32}},
    },
    order = "e-g",
    prerequisites = {
      "explosives",
      data_util.mod_prefix .. "delivery-cannon",
      data_util.mod_prefix .. "material-science-pack-1"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "delivery-cannon-weapon",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-weapon", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-weapon-capsule", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/delivery-cannon-weapon.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "military-4",
      data_util.mod_prefix .. "delivery-cannon",
      data_util.mod_prefix .. "heavy-girder",
      data_util.mod_prefix .. "holmium-cable",
      data_util.mod_prefix .. "aeroframe-pole",
    },
    unit = {
     count = 200,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },

  {
      type = "item",
      name = data_util.mod_prefix .. "delivery-cannon",
      icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon.png",
      icon_size = 64,
      order = "j-a",
      subgroup = "rocket-logistics",
      stack_size = 20,
      place_result = data_util.mod_prefix .. "delivery-cannon",
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "delivery-cannon-weapon",
      icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon.png",
      icon_size = 64,
      order = "j-a",
      subgroup = "surface-defense",
      stack_size = 1,
      place_result = data_util.mod_prefix .. "delivery-cannon-weapon",
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "delivery-cannon-chest",
      icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-chest.png",
      icon_size = 64,
      order = "j-b",
      subgroup = "rocket-logistics",
      stack_size = 50,
      place_result = data_util.mod_prefix .. "delivery-cannon-chest",
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "delivery-cannon-capsule",
      icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
      icon_size = 64,
      order = "s",
      subgroup = "intersurface-part",
      stack_size = 50,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "delivery-cannon-weapon-capsule",
      icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon-capsule.png",
      icon_size = 64,
      order = "j-c",
      subgroup = "surface-defense",
      stack_size = 20,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "delivery-cannon-targeter",
      icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-targeter.png",
      icon_mipmaps = 4,
      icon_size = 64,
      subgroup = "tool",
      order = "c[automated-construction]-e[unit-remote-control]",
      stack_size = 1,
      hidden = true,
      flags = {"hidden", "only-in-cursor"}
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-capsule",
      result = data_util.mod_prefix .. "delivery-cannon-capsule",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "low-density-structure", 1 },
        { data_util.mod_prefix .. "heat-shielding", 1 },
        { "explosives", 5 },
        { "copper-cable", 10 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-capsule-iridium",
      result = data_util.mod_prefix .. "delivery-cannon-capsule",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { data_util.mod_prefix .. "iridium-plate", 2 },
        { "explosives", 4 },
      },
      icons = data_util.sub_icons("__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
                                  data.raw.item[data_util.mod_prefix .. "iridium-plate"].icon),
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-weapon-capsule",
      result = data_util.mod_prefix .. "delivery-cannon-weapon-capsule",
      enabled = false,
      energy_required = 20,
      ingredients = {
        { "low-density-structure", 10 },
        { data_util.mod_prefix .. "heat-shielding", 10 },
        { data_util.mod_prefix .. "iridium-plate", 10 },
        { data_util.mod_prefix .. "holmium-cable", 20 },
        { "explosives", 50 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon",
      result = data_util.mod_prefix .. "delivery-cannon",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "steel-chest", 10 },
        { "pipe", 10 },
        { "electric-engine-unit", 10 },
        { data_util.mod_prefix .. "heat-shielding", 10 },
        { "concrete", 20 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-weapon",
      result = data_util.mod_prefix .. "delivery-cannon-weapon",
      enabled = false,
      energy_required = 30,
      ingredients = {
        { "electric-engine-unit", 50 },
        { data_util.mod_prefix .. "heat-shielding", 50 },
        { data_util.mod_prefix .. "heavy-girder", 100 },
        { data_util.mod_prefix .. "holmium-cable", 200 },
        { data_util.mod_prefix .. "aeroframe-pole", 200 },
        { "processing-unit", 100 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "delivery-cannon-chest",
      result = data_util.mod_prefix .. "delivery-cannon-chest",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { "radar", 1 },
        { "steel-chest", 10 },
        { "concrete", 20 },
        { data_util.mod_prefix .. "heat-shielding", 10 },
      },
      requester_paste_multiplier = 1,
      always_show_made_in = false,
  },
  {
    type = "assembling-machine",
    name = data_util.mod_prefix.."delivery-cannon",
    minable = {
      mining_time = 0.5,
      result = data_util.mod_prefix.."delivery-cannon",
    },
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "a-a",
    max_health = 1500,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.5-5}, {2.5, 2.5}},
    se_allow_in_space = true,
    resistances =
    {
      { type = "meteor", percent = 99 },
      { type = "explosion", percent = 99 },
      { type = "impact", percent = 99 },
      { type = "fire", percent = 99 },
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon.png",
          frame_count = 1,
          line_length = 1,
          width = 320/2,
          height = 640/2,
          shift = {0,-2.5},
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon.png",
            frame_count = 1,
            line_length = 1,
            width = 320,
            height = 640,
            shift = {0,-2.5},
            scale = 0.5,
          },
        },
        {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-shadow.png",
            shift = { 1.25, 1/32 },
            width = 470/2,
            height = 306/2,
            hr_version = {
                draw_as_shadow = true,
                filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-shadow.png",
                shift = { 1.25, 1/32 },
                width = 470,
                height = 306,
                scale = 0.5,
            }
        }
      }
    },
    crafting_categories = {"delivery-cannon"},
    crafting_speed = 1,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "100kW",
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {},
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "delivery-cannon-energy-interface",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "z-d-a",
    picture =
    {
      layers =
      {
        blank
      },
    },
    collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    selectable_in_game = false,
    collision_mask = {},
    continuous_animation = true,
    corpse = "medium-remnants",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "50MW",
      output_flow_limit = "0kW",
      buffer_capacity = "1000MJ",-- launch energy cost is removed from buffer
      drain = "100kW",
    },
    energy_production = "0kW",
    energy_usage = "0GW",
    flags = {
      "placeable-player",
      "player-creation",
      "hidden",
      "not-rotatable"
    },
    max_health = 1500,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
  },

  {
    type = "assembling-machine",
    name = data_util.mod_prefix.."delivery-cannon-weapon",
    minable = {
      mining_time = 1,
      result = data_util.mod_prefix.."delivery-cannon-weapon",
    },
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "a-a",
    max_health = 1500,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    collision_box = { { -4.3, -4.3 }, { 4.3, 4.3 } },
    selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
    drawing_box = { { -4.5, -4.5-9 }, { 4.5, 4.5 } },
    se_allow_in_space = true,
    resistances =
    {
      { type = "meteor", percent = 99 },
      { type = "explosion", percent = 50 },
      { type = "impact", percent = 99 },
      { type = "fire", percent = 50 },
    },
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      apparent_volume = 1.5,
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.6
      },
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t1-2.ogg",
          volume = 0.8
        }
      }
    },
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    animation =
    {
      layers = {
        {
            filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-weapon.png",
            shift = { 0, -4.75 },
            width = 616/2,
            height = 1198/2,
            hr_version = {
                filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-weapon.png",
                shift = { 0, -4.75 },
                width = 616,
                height = 1198,
                scale = 0.5,
            }
        },
        {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-weapon-shadow.png",
            shift = { 2.5, 2/32 },
            width = 890/2,
            height = 578/2,
            hr_version = {
                draw_as_shadow = true,
                filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-weapon-shadow.png",
                shift = { 2.5, 2/32 },
                width = 890,
                height = 578,
                scale = 0.5,
            }
        }
      }
    },
    crafting_categories = {"delivery-cannon-weapon"},
    crafting_speed = 1,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "100kW",
    module_specification =
    {
      module_slots = 0
    },
    allowed_effects = {},
  },
  {
    type = "electric-energy-interface",
    name = data_util.mod_prefix .. "delivery-cannon-weapon-energy-interface",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon.png",
    icon_size = 64,
    icon_mipmaps = 1,
    order = "z-d-a",
    picture =
    {
      layers =
      {
        blank
      },
    },
    collision_box = { { -4.3, -4.3 }, { 4.3, 4.3 } },
    selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
    selectable_in_game = false,
    collision_mask = {},
    continuous_animation = true,
    corpse = "medium-remnants",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "500MW",
      output_flow_limit = "0kW",
      buffer_capacity = "10000MJ",-- launch energy cost is removed from buffer - copied to DeliveryCannon.weapon_delivery_cannon_electric_buffer_size so update that if you modify this value
      drain = "1000kW",
    },
    energy_production = "0kW",
    energy_usage = "0GW",
    flags = {
      "placeable-player",
      "player-creation",
      "hidden",
      "not-rotatable"
    },
    max_health = 1500,
    vehicle_impact_sound = {
      filename = "__base__/sound/car-metal-impact.ogg",
      volume = 0.65
    },
  },

  {
    type = "container",
    name = data_util.mod_prefix .. "delivery-cannon-chest",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-chest.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = data_util.mod_prefix .. "delivery-cannon-chest"},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.3,-1.3},{1.3,1.3}},
    collision_mask = {
      "water-tile",
      "item-layer",
      "object-layer",
      "player-layer",
    },
    selection_box = {{-1.5,-1.5},{1.5,1.5}},
    se_allow_in_space = true,
    inventory_size = 40,
    resistances = {
      { type = "meteor", percent = 99 },
      { type = "explosion", percent = 75 },
      { type = "impact", percent = 90 },
      { type = "fire", percent = 90 },
    },
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    picture = {
      layers = {
        {
          filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-chest.png",
          frame_count = 1,
          line_length = 1,
          width = 208/2,
          height = 200/2,
          shift = {0,0},
          hr_version = {
            filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-chest.png",
            frame_count = 1,
            line_length = 1,
            width = 208,
            height = 200,
            shift = {0,0},
            scale = 0.5,
          },
        },
        {
          draw_as_shadow = true,
          filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-chest-shadow.png",
          frame_count = 1,
          line_length = 1,
          width = 278/2,
          height = 150/2,
          shift = {0.5625,0.5875},
          hr_version = {
            draw_as_shadow = true,
            filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-chest-shadow.png",
            frame_count = 1,
            line_length = 1,
            width = 278,
            height = 150,
            shift = {0.5625,0.5875},
            scale = 0.5,
          },
        },
      }
    },
    circuit_wire_connection_point =
    {
        shadow =
        {
            red = {0.7, -1.3},
            green = {0.7, -1.3},
        },
        wire =
        {
            red = {0.7, -1.3},
            green = {0.7, -1.3},
        }
    },
    circuit_wire_max_distance = 12.5,
  },

  {
    type = "explosion",
    name = data_util.mod_prefix .. "delivery-cannon-beam",
    animations = {
      {
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-beam.png",
        frame_count = 6,
        height = 1,
        priority = "extra-high",
        width = 187
      }
    },
    beam = true,
    flags = { "not-on-map", "placeable-off-grid"},
    light = {
      color = {
        b = 0.8,
        g = 1,
        r = 0.9
      },
      intensity = 1,
      size = 20
    },
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = {
      {
        filename = "__base__/sound/fight/old/huge-explosion.ogg",
        volume = 1
      }
    },
  },
  {
    type = "explosion",
    name = data_util.mod_prefix .. "delivery-cannon-weapon-beam",
    animations = {
      {
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-weapon-beam.png",
        frame_count = 6,
        height = 1,
        priority = "extra-high",
        width = 187
      }
    },
    beam = true,
    flags = { "not-on-map", "placeable-off-grid"},
    light = {
      color = {
        b = 0.8,
        g = 0.9,
        r = 1
      },
      intensity = 1,
      size = 20
    },
    rotate = true,
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = {
      {
        filename = "__base__/sound/fight/old/huge-explosion.ogg",
        volume = 1
      }
    },
  },
  {
    -- making these artillery-projectile(s) instead of projectile(s) makes it possible for them to show up on the map
    type = "artillery-projectile",
    name = data_util.mod_prefix.."delivery-cannon-capsule-artillery-projectile",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
    icon_size = 64,
    acceleration = 0,
    rotatable = false,
    picture = {
      filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-capsule.png",
      width = 58/2,
      height = 94/2,
      priority = "high",
      shift = { 0, 0 },
      {
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-capsule.png",
        width = 58,
        height = 94,
        priority = "high",
        shift = { 0, 0 },
        scale = 0.5,
      },
    },
    -- reveal_map, map_color, and chart_picture are specific to artillery-projectile and dictate how it will behave with the map
    -- because charting is handled by the delivery cannon script, reveal_map should be left false
    reveal_map = false,
    map_color = {r=0.3, g=0.6, b=0.1},
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.20,
      tint = {r=0.3, g=0.6, b=0.1},
    },
    flags = { "not-on-map", "placeable-off-grid"},
    light = { intensity = 0.2, size = 10},
    smoke = {
      {
        deviation = {
          0.15,
          0.15
        },
        frequency = 1,
        name = "smoke-fast",
        --name = "smoke-explosion-particle",
        --name = "soft-fire-smoke", -- lasts longer
        position = {0,0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    },
  },
  {
    -- making these artillery-projectile(s) instead of projectile(s) makes it possible for them to show up on the map
    type = "artillery-projectile",
    name = data_util.mod_prefix.."delivery-cannon-weapon-capsule-artillery-projectile",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon-capsule.png",
    icon_size = 64,
    acceleration = 0,
    rotatable = false,
    picture = {
      filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-weapon-capsule.png",
      width = 58/2,
      height = 94/2,
      priority = "high",
      shift = { 0, 0 },
      hr_version = {
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-weapon-capsule.png",
        width = 58,
        height = 94,
        priority = "high",
        shift = { 0, 0 },
        scale = 0.5,
      },
    },
    -- reveal_map, map_color, and chart_picture are specific to artillery-projectile and dictate how it will behave with the map
    -- because charting is handled by the delivery cannon script, reveal_map should be left false
    reveal_map = false,
    map_color = {r=1, g=1, b=0},
    chart_picture =
    {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.25
    },
    flags = { "not-on-map", "placeable-off-grid"},
    light = { intensity = 0.2, size = 10},
    smoke = {
      {
        deviation = {
          0.15,
          0.15
        },
        frequency = 1,
        name = "smoke-fast",
        --name = "smoke-explosion-particle",
        --name = "soft-fire-smoke", -- lasts longer
        position = {0,0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    },
  },
  {
    type = "projectile",
    name = data_util.mod_prefix.."delivery-cannon-capsule-shadow",
    acceleration = 0,
    rotatable = false,
    animation = {
      draw_as_shadow = true,
      filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-capsule-shadow.png",
      frame_count = 1,
      width = 98/2,
      height = 50/2,
      line_length = 1,
      priority = "high",
      shift = { 0, 0 },
      hr_version = {
        draw_as_shadow = true,
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-capsule-shadow.png",
        frame_count = 1,
        width = 98,
        height = 50,
        line_length = 1,
        priority = "high",
        shift = { 0, 0 },
        scale = 0.5,
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
  },
  {
    type = "explosion",
    name = data_util.mod_prefix.."delivery-cannon-capsule-explosion",
    localised_name = {"item-name." .. data_util.mod_prefix .. "delivery-cannon-capsule"},
    animations = table.deepcopy(data.raw.explosion["medium-explosion"].animations),
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.08,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
            repeat_count = 16,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.08,
          },
          {
            type = "create-particle",
            particle_name = "stone-particle",
            initial_height = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.1,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
            repeat_count = 60,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.08,
          },
          {
            action = {
              action_delivery = {
                target_effects = {
                  {
                    damage = {
                      amount = 5,
                      type = "meteor"
                    },
                    type = "damage"
                  },
                },
                type = "instant"
              },
              radius = 10,
              type = "area"
            },
            type = "nested-result"
          },
          {
            action = {
              action_delivery = {
                target_effects = {
                  {
                    damage = {
                      amount = 10,
                      type = "meteor"
                    },
                    type = "damage"
                  },
                },
                type = "instant"
              },
              radius = 4,
              type = "area"
            },
            type = "nested-result"
          },
          {
            action = {
              action_delivery = {
                target_effects = {
                  {
                    damage = {
                      amount = 35,
                      type = "meteor"
                    },
                    type = "damage"
                  },
                },
                type = "instant"
              },
              radius = 2,
              type = "area"
            },
            type = "nested-result"
          },
          {
            action = {
              action_delivery = {
                target_effects = {
                  {
                    damage = {
                      amount = 100,
                      type = "meteor"
                    },
                    type = "damage"
                  },
                },
                type = "instant"
              },
              radius = 1,
              type = "area"
            },
            type = "nested-result"
          },
        },
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
    light = { color = { r = 1, g = 0.9, b = 0.8 }, intensity = 1, size = 30 },
    sound = {
      aggregation = { max_count = 1, remove = true },
      variations = table.deepcopy(data.raw.explosion["medium-explosion"].sound.variations)
    },
  },
})

-- deprecated with the change from projectile -> artillery-projectile for the actual delivery cannon projectiles
-- but there is no option to do prototype migration for these types so the old type is left-in to avoid the "removed prototypes"
-- popup for players and to prevent issues with in-flight delivery cannons projectiles when loading the save
data:extend({
  {
    type = "projectile",
    name = data_util.mod_prefix.."delivery-cannon-capsule-projectile",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
    icon_size = 64,
    acceleration = 0,
    rotatable = false,
    animation = {
      filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-capsule.png",
      frame_count = 1,
      width = 58/2,
      height = 94/2,
      line_length = 1,
      priority = "high",
      shift = { 0, 0 },
      {
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-capsule.png",
        frame_count = 1,
        width = 58,
        height = 94,
        line_length = 1,
        priority = "high",
        shift = { 0, 0 },
        scale = 0.5,
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
    light = { intensity = 0.2, size = 10},
    smoke = {
      {
        deviation = {
          0.15,
          0.15
        },
        frequency = 1,
        name = "smoke-fast",
        --name = "smoke-explosion-particle",
        --name = "soft-fire-smoke", -- lasts longer
        position = {0,0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    },
  },
  {
    type = "projectile",
    name = data_util.mod_prefix.."delivery-cannon-weapon-capsule-projectile",
    icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon-capsule.png",
    icon_size = 64,
    acceleration = 0,
    rotatable = false,
    animation = {
      filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/delivery-cannon-weapon-capsule.png",
      frame_count = 1,
      width = 58/2,
      height = 94/2,
      line_length = 1,
      priority = "high",
      shift = { 0, 0 },
      hr_version = {
        filename = "__space-exploration-graphics-5__/graphics/entity/delivery-cannon/hr-delivery-cannon-weapon-capsule.png",
        frame_count = 1,
        width = 58,
        height = 94,
        line_length = 1,
        priority = "high",
        shift = { 0, 0 },
        scale = 0.5,
      },
    },
    flags = { "not-on-map", "placeable-off-grid"},
    light = { intensity = 0.2, size = 10},
    smoke = {
      {
        deviation = {
          0.15,
          0.15
        },
        frequency = 1,
        name = "smoke-fast",
        --name = "smoke-explosion-particle",
        --name = "soft-fire-smoke", -- lasts longer
        position = {0,0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    },
  },
})