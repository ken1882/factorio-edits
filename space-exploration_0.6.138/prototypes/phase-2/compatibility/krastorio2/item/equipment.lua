
--Equipment Catagories we have:
-- "armor"
-- "armor-jetpack"
-- "armor-shield"
-- "armor-weapon"
-- "robot-interaction-equipment"
-- "spidertron-only"
-- "universal-equipment"
-- "vehicle-equipment"
-- "vehicle-motor"
-- "vehicle-robot-interaction-equipment"

data.raw["equipment-grid"]["kr-car-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
    "armor-shield",
    "armor-weapons",
    "belt-immunity"
}

data.raw["equipment-grid"]["kr-tank-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
    "armor-shield",
    "armor-weapons",
    "belt-immunity"
}

data.raw["equipment-grid"]["kr-tank-grid-2"].equipment_categories = {
    "universal-equipment",
    "reactor-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
    "armor-shield",
    "armor-weapons",
    "belt-immunity"
}

data.raw["equipment-grid"]["kr-spidertron-equipment-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "armor-shield",
    "armor-weapons",
    "belt-immunity",
    "movement-improving"
}

data.raw["equipment-grid"]["kr-locomotive-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-equipment",
    "vehicle-equipment",
    "vehicle-motor",
    "armor-shield",
    "armor-weapons"
}

data.raw["equipment-grid"]["kr-wagons-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-equipment",
    "vehicle-robot-interaction-equipment",
    "vehicle-equipment",
    "vehicle-motor",
    "armor-shield",
    "armor-weapons"
}

data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories = {
    "universal-equipment",
    "armor",
    "armor-jetpack",
    "robot-interaction-equipment",
    "combat-tier-1",
    "belt-immunity",
    "movement-improving"
}

data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "armor",
    "armor-jetpack",
    "robot-interaction-equipment",
    "combat-tier-1",
    "belt-immunity",
    "movement-improving"
}

data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "armor-jetpack",
    "robot-interaction-equipment",
    "combat-tier-1",
    "combat-tier-2",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "movement-improving"
}

data.raw["equipment-grid"]["mk3-armor-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "reactor-tier-2",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "shield-tier-3",
    "shield-tier-4",
    "armor-jetpack",
    "robot-interaction-equipment",
    "combat-tier-1",
    "combat-tier-2",
    "combat-tier-3",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "movement-improving"
}

data.raw["equipment-grid"]["mk4-armor-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "reactor-tier-2",
    "reactor-tier-3",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "shield-tier-3",
    "shield-tier-4",
    "shield-tier-5",
    "shield-tier-6",
    "armor-jetpack",
    "robot-interaction-equipment",
    "combat-tier-1",
    "combat-tier-2",
    "combat-tier-3",
    "combat-tier-4",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "movement-improving"
}

data.raw["equipment-grid"]["se-thruster-suit-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "shield-tier-3",
    "armor-jetpack",
    "robot-interaction-equipment",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "movement-improving"
}

data.raw["equipment-grid"]["se-thruster-suit-2-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "reactor-tier-2",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "shield-tier-3",
    "shield-tier-4",
    "armor-jetpack",
    "robot-interaction-equipment",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "movement-improving"
}

data.raw["equipment-grid"]["se-thruster-suit-3-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "reactor-tier-2",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "shield-tier-3",
    "shield-tier-4",
    "shield-tier-5",
    "armor-jetpack",
    "robot-interaction-equipment",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "life-support-tier-3",
    "movement-improving"
}

data.raw["equipment-grid"]["se-thruster-suit-4-grid"].equipment_categories = {
    "universal-equipment",
    "reactor-tier-1",
    "reactor-tier-2",
    "reactor-tier-3",
    "armor",
    "shield-tier-1",
    "shield-tier-2",
    "shield-tier-3",
    "shield-tier-4",
    "shield-tier-5",
    "shield-tier-6",
    "armor-jetpack",
    "robot-interaction-equipment",
    "belt-immunity",
    "life-support-tier-1",
    "life-support-tier-2",
    "life-support-tier-3",
    "life-support-tier-4",
    "movement-improving"
}

-- Energy Shield Mk1
data.raw.item["energy-shield-equipment"].icons = nil
data.raw.item["energy-shield-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-red.png"
data.raw.item["energy-shield-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-red.png"
data.raw["energy-shield-equipment"]["energy-shield-equipment"].sprite.width = 64
data.raw["energy-shield-equipment"]["energy-shield-equipment"].sprite.height = 64
data.raw["energy-shield-equipment"]["energy-shield-equipment"].sprite.hr_version = nil
data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories = {"armor-shield","shield-tier-1"}

-- Energy Shield Mk2
data.raw.item["energy-shield-mk2-equipment"].icons = nil
data.raw.item["energy-shield-mk2-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-yellow.png"
data.raw.item["energy-shield-mk2-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-yellow.png"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].sprite.width = 64
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].sprite.height = 64
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].sprite.hr_version = nil
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories = {"armor-shield","shield-tier-2"}

-- Energy Shield Mk3
data.raw.item["energy-shield-mk3-equipment"].icons = nil
data.raw.item["energy-shield-mk3-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-green.png"
data.raw.item["energy-shield-mk3-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-green.png"
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].sprite.width = 64
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].sprite.height = 64
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].sprite.hr_version = nil
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].categories = {"armor-shield","shield-tier-3"}

-- Energy Shield Mk4
data.raw.item["energy-shield-mk4-equipment"].icons = nil
data.raw.item["energy-shield-mk4-equipment"].icon = "__space-exploration-graphics__/graphics/icons/energy-shield-cyan.png"
data.raw.item["energy-shield-mk4-equipment"].icon_size = 64
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].sprite.filename = "__space-exploration-graphics__/graphics/equipment/energy-shield-cyan.png"
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].sprite.width = 64
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].sprite.height = 64
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].sprite.hr_version = nil
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].categories = {"armor-shield","shield-tier-4"}

-- Energy Shield Mk5
-- Add K2 properties to the Shields
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].categories = {"armor-shield","shield-tier-5"}

-- Energy Shield Mk6
-- Add K2 properties to the Shields
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].categories = {"armor-shield","shield-tier-6"}


data.raw["generator-equipment"]["small-portable-generator"].categories = {"universal-equipment"}
data.raw["generator-equipment"]["portable-generator"].categories = {"universal-equipment"}
data.raw["generator-equipment"]["nuclear-reactor-equipment"].categories = {"reactor-equipment","reactor-tier-1"}
data.raw["generator-equipment"]["fusion-reactor-equipment"].categories = {"reactor-equipment","reactor-tier-2"}
data.raw["generator-equipment"]["antimatter-reactor-equipment"].categories = {"reactor-equipment","reactor-tier-3"}
data.raw["generator-equipment"]["se-rtg-equipment"].categories = {"universal-equipment"}
data.raw["generator-equipment"]["se-rtg-equipment-2"].categories = {"universal-equipment"}

data.raw["solar-panel-equipment"]["solar-panel-equipment"].categories = {"universal-equipment"}
data.raw["solar-panel-equipment"]["big-solar-panel-equipment"].categories = {"universal-equipment"}
data.raw["solar-panel-equipment"]["imersite-solar-panel-equipment"].categories = {"universal-equipment"}
data.raw["solar-panel-equipment"]["big-imersite-solar-panel-equipment"].categories = {"universal-equipment"}

data.raw["battery-equipment"]["energy-absorber"].categories = {"universal-equipment"}
data.raw["battery-equipment"]["battery-equipment"].categories = {"universal-equipment"}
data.raw["battery-equipment"]["big-battery-equipment"].categories = {"universal-equipment"}
data.raw["battery-equipment"]["battery-mk2-equipment"].categories = {"universal-equipment"}
data.raw["battery-equipment"]["big-battery-mk2-equipment"].categories = {"universal-equipment"}
data.raw["battery-equipment"]["battery-mk3-equipment"].categories = {"universal-equipment"}
data.raw["battery-equipment"]["big-battery-mk3-equipment"].categories = {"universal-equipment"}

data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-1"].categories = {"armor"}
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-2"].categories = {"armor"}
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-3"].categories = {"armor"}
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-4"].categories = {"armor"}
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-5"].categories = {"armor"}

data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].categories = {"movement-improving"}
data.raw["movement-bonus-equipment"]["advanced-exoskeleton-equipment"].categories = {"movement-improving"}
data.raw["movement-bonus-equipment"]["superior-exoskeleton-equipment"].categories = {"movement-improving"}
data.raw["movement-bonus-equipment"]["additional-engine"].categories = {"vehicle-motor"}
data.raw["movement-bonus-equipment"]["advanced-additional-engine"].categories = {"vehicle-motor"}

data.raw["battery-equipment"]["jetpack-1"].categories = {"armor"}
data.raw["battery-equipment"]["jetpack-2"].categories = {"armor"}
data.raw["battery-equipment"]["jetpack-3"].categories = {"armor"}
data.raw["battery-equipment"]["jetpack-4"].categories = {"armor"}

data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].categories = {"belt-immunity"}

data.raw["night-vision-equipment"]["night-vision-equipment"].categories = {"armor"}
data.raw["night-vision-equipment"]["imersite-night-vision-equipment"].categories = {"armor"}
data.raw["roboport-equipment"]["personal-roboport-equipment"].categories = {"robot-interaction-equipment"}
data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].categories = {"robot-interaction-equipment"}
data.raw["roboport-equipment"]["vehicle-roboport"].categories = {"vehicle-robot-interaction-equipment"}
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-1"].categories = {"life-support-tier-1"}
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-2"].categories = {"life-support-tier-2"}
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-3"].categories = {"life-support-tier-3"}
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-4"].categories = {"life-support-tier-4"}

data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk1-equipment"].categories = {"armor-weapons","combat-tier-1"}
data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk2-equipment"].categories = {"armor-weapons","combat-tier-2"}
data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk3-equipment"].categories = {"armor-weapons","combat-tier-3"}
data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk4-equipment"].categories = {"armor-weapons","combat-tier-4"}
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].categories = {"armor-weapons","combat-tier-1"}
data.raw["active-defense-equipment"]["personal-laser-defense-mk2-equipment"].categories = {"armor-weapons","combat-tier-2"}
data.raw["active-defense-equipment"]["personal-laser-defense-mk3-equipment"].categories = {"armor-weapons","combat-tier-3"}
data.raw["active-defense-equipment"]["personal-laser-defense-mk4-equipment"].categories = {"armor-weapons","combat-tier-4"}
data.raw["active-defense-equipment"]["discharge-defense-equipment"].categories = {"armor"}