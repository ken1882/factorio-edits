local data_util = require("data_util")

-- Laser Artillery Turret
data_util.replace_or_add_ingredient("kr-laser-artillery-turret", "ai-core", "se-holmium-solenoid", 20)
data_util.replace_or_add_ingredient("kr-laser-artillery-turret", "steel-beam", "se-heavy-girder", 10)

-- Rocket Turret
data_util.replace_or_add_ingredient("kr-rocket-turret", "steel-beam", "se-heavy-girder", 10)

-- Impulse Rifle
data_util.replace_or_add_ingredient("impulse-rifle", "steel-plate", "imersium-plate", 5)

-- Power Armour Mk3
data_util.replace_or_add_ingredient("power-armor-mk3", nil, "se-iridium-plate", 25)

--Power Armour Mk4
data_util.replace_or_add_ingredient("power-armor-mk4", "ai-core", "ai-core", 10)
data_util.replace_or_add_ingredient("power-armor-mk4", "nitric-acid", "se-quantum-processor", 30)
data_util.replace_or_add_ingredient("power-armor-mk4", "imersite-crystal", "energy-control-unit", 15)
data_util.replace_or_add_ingredient("power-armor-mk4", "imersium-plate", "imersium-plate", 15)
data_util.replace_or_add_ingredient("power-armor-mk4", nil, "se-heavy-composite", 20)
data_util.replace_or_add_ingredient("power-armor-mk4", nil, "se-heavy-bearing", 5)

-- Thruster Suit 3
data_util.replace_or_add_ingredient("thruster-suit-3", "processing-unit", "processing-unit", 50)
data_util.replace_or_add_ingredient("thruster-suit-3", nil, "energy-control-unit", 20)

-- Thruster Suit 4
data_util.replace_or_add_ingredient("thruster-suit-4", "processing-unit", "processing-unit", 100)
data_util.replace_or_add_ingredient("thruster-suit-4", nil, "energy-control-unit", 30)
data_util.replace_or_add_ingredient("thruster-suit-4", nil, "ai-core", 5)

-- Adaptive Armor 3
data_util.replace_or_add_ingredient("se-adaptive-armour-equipment-3",nil,"lithium-sulfur-battery",5)

-- Adaptive Armor 4
data_util.replace_or_add_ingredient("se-adaptive-armour-equipment-4", "steel-plate", "imersium-plate", 20)

-- Adaptive Armor 5
data_util.replace_or_add_ingredient("se-adaptive-armour-equipment-5", "processing-unit", "processing-unit", 20)
data_util.replace_or_add_ingredient("se-adaptive-armour-equipment-5", "steel-plate", "imersium-plate", 40)
data_util.replace_or_add_ingredient("se-adaptive-armour-equipment-5", nil, "energy-control-unit", 5)

-- Medpack 1
data_util.replace_or_add_ingredient("se-medpack", "iron-plate", "first-aid-kit", 1)
data_util.replace_or_add_ingredient("se-medpack", "wood", "wood", 2)
data_util.replace_or_add_ingredient("se-medpack", "raw-fish", "raw-fish", 1)
data_util.replace_or_add_ingredient("se-medpack", "biomass", "biomass", 1)

-- Alt Medpack 1
data_util.replace_or_add_ingredient("se-medpack-plastic", "iron-plate", "first-aid-kit", 1)

-- Creep Virus capsule
data_util.replace_or_add_ingredient("kr-creep-virus","sulfuric-acid","se-vitalic-acid",25, true)
data_util.replace_or_add_ingredient("kr-creep-virus", nil, "se-genetic-data", 1)

-- Biter Virus capsule
data_util.replace_or_add_ingredient("kr-biter-virus", "imersite-powder", "se-capsule-big-spitter", 1)
data_util.replace_or_add_ingredient("kr-biter-virus", "poison-capsule", "se-capsule-big-biter", 1)
data_util.replace_or_add_ingredient("kr-biter-virus", nil, "kr-creep-virus", 1)

-- Tesla Gun Ammo
data_util.replace_or_add_ingredient("se-tesla-ammo", "battery", "lithium-sulfur-battery", 10)

-- Advanced Exoskeleton
data_util.replace_or_add_ingredient("advanced-exoskeleton-equipment", "advanced-circuit", "processing-unit", 10)
data_util.replace_or_add_ingredient("advanced-exoskeleton-equipment", "speed-module-2", "speed-module-3", 10)
data_util.replace_or_add_ingredient("advanced-exoskeleton-equipment", nil, "lubricant", 10, true)
data.raw.recipe["advanced-exoskeleton-equipment"].category = "crafting-with-fluid"

-- Superiror Exoskeleton
data_util.replace_or_add_ingredient("superior-exoskeleton-equipment", "ai-core", "se-aeroframe-scaffold", 10)
data_util.replace_or_add_ingredient("superior-exoskeleton-equipment", "speed-module-3", "speed-module-5", 10)
data_util.replace_or_add_ingredient("superior-exoskeleton-equipment", nil, "se-heavy-bearing", 10)
data_util.replace_or_add_ingredient("superior-exoskeleton-equipment", nil, "processing-unit", 20)

-- K2 Tank
data_util.replace_or_add_ingredient("kr-advanced-tank", "imersium-gear-wheel", "imersium-gear-wheel", 20)
data_util.replace_or_add_ingredient("kr-advanced-tank", "low-density-structure", "low-density-structure", 50)
data_util.replace_or_add_ingredient("kr-advanced-tank", nil, "se-heavy-bearing", 20)
data_util.replace_or_add_ingredient("kr-advanced-tank", nil, "se-heavy-girder", 10)
data_util.replace_or_add_ingredient("kr-advanced-tank", nil, "se-holmium-solenoid", 10)

-- Antimatter Rocket WDC
se_delivery_cannon_ammo_recipes = se_delivery_cannon_ammo_recipes or {}
se_delivery_cannon_ammo_recipes["antimatter-rocket"] = {
  type = "ammo",
  name="antimatter-rocket",
  amount = 1,
  ingredients = {
    { "antimatter-rocket", 1},
    { data_util.mod_prefix .. "delivery-cannon-weapon-capsule", 1 }
  }
}
