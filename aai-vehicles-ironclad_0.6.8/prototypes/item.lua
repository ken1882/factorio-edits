local sounds = require("__base__/prototypes/entity/sounds")
local projectile_center = {-0, -1.2}
local projectile_creation_distance = 0.5
data:extend({
  {
    type = "item-with-entity-data",
    name = "ironclad",
    icon = "__aai-vehicles-ironclad__/graphics/icons/ironclad.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "transport",
    order = "b[personal-transport]-b[tank]-b[boat]",
    place_result = "ironclad",
    stack_size = 1
  },
  {
    type = "gun",
    name = "ironclad-cannon",
    icon = "__base__/graphics/icons/tank-cannon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "cannon-shell",
      cooldown = 90,
      movement_slow_down_factor = 0,
      projectile_creation_distance = projectile_creation_distance,
      projectile_center = projectile_center,
      range = 60,
      sound = sounds.tank_gunshot
    },
    stack_size = 1
  },
  {
    type = "gun",
    name = "ironclad-mortar",
    icon = "__aai-vehicles-ironclad__/graphics/icons/ironclad-mortar.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[tank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "mortar-bomb",
      cooldown = 180,
      movement_slow_down_factor = 0,
      projectile_creation_distance = projectile_creation_distance,
      projectile_center = projectile_center,
      range = 180,
      sound = sounds.tank_gunshot
    },
    stack_size = 1
  },
})
data.raw["utility-constants"].default.bonus_gui_ordering["ironclad-mortar"] = "k-b"
