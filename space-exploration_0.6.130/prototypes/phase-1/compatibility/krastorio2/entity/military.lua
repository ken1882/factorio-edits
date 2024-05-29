

-- Rebalance Portable RTGs stats compared with K2 balancing
-- Portable RTG
data.raw["generator-equipment"]["se-rtg-equipment"].power = "800kW"
table.insert(data.raw["generator-equipment"]["se-rtg-equipment"].categories, "universal-equipment")

-- Portable RTG 2
data.raw["generator-equipment"]["se-rtg-equipment-2"].power = "1200kW"
table.insert(data.raw["generator-equipment"]["se-rtg-equipment-2"].categories, "universal-equipment")

-- First Aid Kit
data.raw.capsule["first-aid-kit"].subgroup = "tool"
data.raw.capsule["first-aid-kit"].order = "a"
data.raw.capsule["first-aid-kit"].stack_size = 20
data.raw.capsule["first-aid-kit"].capsule_action = {
  attack_parameters = {
    ammo_category = "capsule",
    ammo_type = {
      action = {
        action_delivery = {
          target_effects = {
            damage = {
              amount = -25,
              type = "poison"
            },
            type = "damage"
          },
          type = "instant"
        },
        type = "direct"
      },
      category = "capsule",
      target_type = "position"
    },
    cooldown = 10,
    range = 0,
    type = "projectile"
  },
  type = "use-on-self"
}

-- Allow Jackhammer to collect Space Platform Scaffolding and Plating
table.insert(data.raw["selection-tool"]["kr-jackhammer"].tile_filters,"se-space-platform-scaffold")
table.insert(data.raw["selection-tool"]["kr-jackhammer"].alt_tile_filters,"se-space-platform-scaffold")
table.insert(data.raw["selection-tool"]["kr-jackhammer"].tile_filters,"se-space-platform-plating")
table.insert(data.raw["selection-tool"]["kr-jackhammer"].alt_tile_filters,"se-space-platform-plating")