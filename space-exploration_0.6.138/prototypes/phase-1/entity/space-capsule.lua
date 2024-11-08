local scale = 0.4
local data_util = require("data_util")

local generic_impact = {
  {
    filename = "__base__/sound/car-metal-impact-2.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-3.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-4.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-5.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-6.ogg", volume = 0.5
  }
}

local function shadow_pictures()
  local frame_count = 24
  local width = 359
  local height = 120
  local line_length = 3
  local pictures = {}
  for i = 1, frame_count do
    pictures[i] = {
      draw_as_shadow = true,
      filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule-shadow.png",
      width = width,
      height = height,
      x = width * ((i -1) % line_length),
      y = height * math.floor((i -1) / line_length),
      shift = {21/32, 12/32},
      scale = scale
    }
  end
  return pictures
end

data:extend({
  { -- Capsule vehicle
    type = "car",
    name = data_util.mod_prefix .. "space-capsule-_-vehicle",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- 2 wide is most a vehicle can be and be able to get in
    selection_box = {{-1, -1}, {1, 1}},
    display_box = {{-1.5, -4}, {1.5, 1.5}},
    collision_mask  = {},
    --minable = { mining_time = 0.25, result = data_util.mod_prefix .. "space-capsule"},
    has_belt_immunity = true,
    selection_priority = 100,
    selectable_in_game = false,
    animation = {
      layers = {
        {
          animation_speed = 1,
          direction_count = 24,
          line_length = 8,
          filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule.png",
          frame_count = 1,
          height = 362,
          width = 188,
          shift = {1/32, -8/32},
          scale = scale
        },
      }
    },
    braking_power = "200kW",
    burner = {
      effectivity = 1,
      fuel_category = "chemical",
      fuel_inventory_size = 0,
      render_no_power_icon = false
    },
    consumption = "1W",
    effectivity = 0.0,
    energy_per_hit_point = 1,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid", "no-automated-item-removal", "no-automated-item-insertion"},
    friction = 0.9,
    icon = "__space-exploration-graphics__/graphics/icons/space-capsule.png",
    icon_size = 64,
    inventory_size = 0,
    max_health = 1000,
    open_sound = {
      filename = "__base__/sound/car-door-open.ogg",
      volume = 0.7
    },
    close_sound = {
      filename = "__base__/sound/car-door-close.ogg",
      volume = 0.7
    },
    render_layer = "wires-above",
    rotation_speed = 0.00,
    order = "zz",
    weight = 10000,
  },
  { -- Scorched vehicle
    type = "car",
    name = data_util.mod_prefix .. "space-capsule-scorched-_-vehicle",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- 2 wide is most a vehicle can be and be able to get in
    selection_box = {{-1, -1}, {1, 1}},
    display_box = {{-1.5, -4}, {1.5, 1.5}},
    collision_mask  = {},
    --minable = { mining_time = 0.25, result = data_util.mod_prefix .. "space-capsule-scorched"},
    has_belt_immunity = true,
    selection_priority = 100,
    selectable_in_game = false,
    animation = {
      layers = {
        {
          animation_speed = 1,
          direction_count = 24,
          line_length = 8,
          filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule-scorched.png",
          frame_count = 1,
          height = 362,
          width = 188,
          shift = {1/32, -8/32},
          scale = scale
        },
      }
    },
    braking_power = "200kW",
    burner = {
      effectivity = 1,
      fuel_category = "chemical",
      fuel_inventory_size = 0,
      render_no_power_icon = false
    },
    consumption = "1W",
    effectivity = 0.5,
    energy_per_hit_point = 1,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid", "no-automated-item-removal", "no-automated-item-insertion"},
    friction = 0.9,
    icon = "__space-exploration-graphics__/graphics/icons/space-capsule-scorched.png",
    icon_size = 64,
    inventory_size = 0,
    max_health = 1000,
    open_sound = {
      filename = "__base__/sound/car-door-open.ogg",
      volume = 0.7
    },
    close_sound = {
      filename = "__base__/sound/car-door-close.ogg",
      volume = 0.7
    },
    render_layer = "wires-above",
    rotation_speed = 0.00,
    order = "zz",
    weight = 10000,
  },
  { -- Capsule container
    type = "container",
    name = data_util.mod_prefix .. "space-capsule",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- 2 wide is most a vehicle can be and be able to get in
    selection_box = {{-1, -1}, {1, 1}},
    selection_priority = 200,
    display_box = {{-1.5, -4}, {1.5, 1.5}},
    collision_mask  = {
      "water-tile",
      -- "object-layer", -- Placeable on empty space
      "floor-layer",
      --"player-layer",
    },
    icon = "__space-exploration-graphics__/graphics/icons/space-capsule.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid"},
    is_military_target = true,
    minable = { mining_time = 0.25, result = data_util.mod_prefix .. "space-capsule"},
    max_health = 1000,
    dying_explosion = "roboport-explosion",
    inventory_size = 40,
    open_sound = {filename = "__base__/sound/car-door-open.ogg",volume = 0.7},
    close_sound = {filename = "__base__/sound/car-door-close.ogg",volume = 0.7},
    vehicle_impact_sound = generic_impact,
    picture =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule.png",
          frame_count = 1,
          height = 362,
          width = 188,
          shift = {1/32, -8/32},
          scale = scale
        },
      }
    },
    order = "zz",
  },
  { -- Scorched container
    type = "container",
    name = data_util.mod_prefix .. "space-capsule-scorched",
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}}, -- 2 wide is most a vehicle can be and be able to get in
    selection_box = {{-1, -1}, {1, 1}},
    selection_priority = 200,
    display_box = {{-1.5, -4}, {1.5, 1.5}},
    collision_mask  = {
      "water-tile",
      -- "object-layer", -- Placeable on empty space
      "floor-layer",
      --"player-layer",
    },
    icon = "__space-exploration-graphics__/graphics/icons/space-capsule-scorched.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation", "placeable-off-grid"},
    is_military_target = true,
    minable = { mining_time = 0.25, result = data_util.mod_prefix .. "space-capsule-scorched"},
    max_health = 1000,
    dying_explosion = "roboport-explosion",
    inventory_size = 40,
    open_sound = {filename = "__base__/sound/car-door-open.ogg",volume = 0.7},
    close_sound = {filename = "__base__/sound/car-door-close.ogg",volume = 0.7},
    vehicle_impact_sound = generic_impact,
    picture =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/space-capsule/space-capsule-scorched.png",
          frame_count = 1,
          height = 362,
          width = 188,
          shift = {1/32, -8/32},
          scale = scale
        },
      }
    },
    order = "zz",
  },
  { -- Capsule shadow
    type = "simple-entity-with-force",
    name = data_util.mod_prefix .. "space-capsule-_-vehicle-shadow",
    collision_box = {{-0, -0}, {0, 0}},
    selection_box = {{-0, -0}, {0, 0}},
    collision_mask  = {"not-colliding-with-itself"},
    selectable_in_game = false,
    pictures = shadow_pictures(),
    flags = { "placeable-neutral", "placeable-off-grid"},
    icon = "__space-exploration-graphics__/graphics/icons/space-capsule.png",
    icon_size = 64,
    render_layer = "object",
    order = "zz",
  },
  { -- Capsule target selection tool
    type = "item",
    name = data_util.mod_prefix .. "space-capsule-targeter",
    icon = "__space-exploration-graphics__/graphics/icons/target.png",
    icon_mipmaps = 1,
    icon_size = 64,
    subgroup = "rocket-logistics",
    order = "a-d",
    stack_size = 1,
    hidden = true,
    flags = {"hidden", "only-in-cursor"},
  }
})
