local data_util = require("data_util")
local blank_image = {
    filename = "__space-exploration-graphics__/graphics/blank.png",
    width = 1,
    height = 1,
    frame_count = 1,
    line_length = 1,
    shift = { 0, 0 },
}
data:extend({
  { -- invisibly dummy vehicle
      type = "car",
      name = data_util.mod_prefix .. "character-_-seat",
      collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
      collision_mask = {"not-colliding-with-itself"},
      has_belt_immunity = true,
      animation = {
        layers = {
          {
            animation_speed = 1,
            direction_count = 1,
            filename = "__space-exploration-graphics__/graphics/blank.png",
            frame_count = 1,
            height = 1,
            width = 1
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
      consumption = "150kW",
      effectivity = 0.5,
      energy_per_hit_point = 1,
      flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
      friction = 0.9,
      icon = data.raw.character.character.icon,
      icon_size = 64,
      inventory_size = 0,
      max_health = 5000,
      open_sound = {
        filename = "__base__/sound/car-door-open.ogg",
        volume = 0.7
      },
      close_sound = {
        filename = "__base__/sound/car-door-close.ogg",
        volume = 0.7
      },
      render_layer = "object",
      rotation_speed = 0.00,
      order = "zz",
      selectable_in_game = false,
      weight = 700,
      minimap_representation = blank_image,
      selected_minimap_representation = blank_image,
  },
})
