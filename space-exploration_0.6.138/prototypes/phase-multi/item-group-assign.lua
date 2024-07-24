local data_util = require("data_util")
local types = {"item", "item-with-entity-data", "rail-planner", "capsule"}

local function change_group (name, group, order)
  if data.raw["item-subgroup"][name] then
    data.raw["item-subgroup"][name].group = group
    if order then
      data.raw["item-subgroup"][name].order = order
    end
  end
end

change_group("fluid-recipes", "resources")
change_group("fuel-processing", "resources")
change_group("raw-resource", "resources")
change_group("raw-material", "resources")
change_group("fill-barrel", "intermediate-products")
change_group("empty-barrel", "intermediate-products")
change_group("science-pack", "science", "a")
change_group("tool", "combat", "a-a")
change_group("gun", "combat", "a-b")

local function change_subgroup (name, subgroup, order)
  for _, type in pairs(types) do
    if data.raw[type][name] then
      data.raw[type][name].subgroup = subgroup
      if order then
        data.raw[type][name].order = order
      end
    end
  end
  if data.raw.recipe[name] then
    if data.raw.recipe[name].subgroup then
      data.raw.recipe[name].subgroup = subgroup
      if order then
        data.raw.recipe[name].order = order
      end
    end
  end
end

local function change_recipe_subgroup (name, subgroup, order)
  if data.raw.recipe[name] then
    data.raw.recipe[name].subgroup = subgroup
    if order then
      data.raw.recipe[name].order = order
    end
  end
end

if mods["aai-containers"] then
  change_subgroup("logistic-chest-active-provider", "container-1")
  change_subgroup("logistic-chest-passive-provider", "container-1")
  change_subgroup("logistic-chest-storage", "container-1")
  change_subgroup("logistic-chest-buffer", "container-1")
  change_subgroup("logistic-chest-requester", "container-1")
else
  change_subgroup("logistic-chest-active-provider", "storage")
  change_subgroup("logistic-chest-passive-provider", "storage")
  change_subgroup("logistic-chest-storage", "storage")
  change_subgroup("logistic-chest-buffer", "storage")
  change_subgroup("logistic-chest-requester", "storage")
end

change_subgroup("transport-belt", "transport-belt")
change_subgroup("fast-transport-belt", "transport-belt")
change_subgroup("express-transport-belt", "transport-belt")

change_subgroup("underground-belt", "underground-belt")
change_subgroup("fast-underground-belt", "underground-belt")
change_subgroup("express-underground-belt", "underground-belt")

change_subgroup("splitter", "splitter")
change_subgroup("fast-splitter", "splitter")
change_subgroup("express-splitter", "splitter")

change_subgroup("pipe", "pipe")
change_subgroup("pipe-to-ground", "pipe")
change_subgroup("pump", "pipe")
change_subgroup("storage-tank", "pipe")

change_subgroup("rail", "rail")
change_subgroup("train-stop", "rail")
change_subgroup("rail-signal", "rail")
change_subgroup("rail-chain-signal", "rail")
change_subgroup("locomotive", "rail")
change_subgroup("cargo-wagon", "rail")
change_subgroup("fluid-wagon", "rail")
change_subgroup("artillery-wagon", "rail")

change_subgroup("burner-lab", "lab")
change_subgroup("lab", "lab")

change_subgroup("solar-panel", "solar")
change_subgroup("accumulator", "solar")

change_subgroup("chemical-plant", "chemistry")
change_subgroup("oil-refinery", "chemistry")
change_subgroup("fuel-processor", "chemistry")

change_subgroup("burner-assembling-machine", "assembling")
change_subgroup("assembling-machine-1", "assembling")
change_subgroup("assembling-machine-2", "assembling")
change_subgroup("assembling-machine-3", "assembling")

change_subgroup("centrifuge", "radiation")

change_recipe_subgroup("basic-oil-processing", "oil", "b-a")
change_recipe_subgroup("advanced-oil-processing", "oil", "b-b")
change_recipe_subgroup("oil-processing-heavy", "oil", "b-c")
change_recipe_subgroup("coal-liquefaction", "oil", "b-d")
change_recipe_subgroup("light-oil-cracking", "oil", "c-a")
change_recipe_subgroup("heavy-oil-cracking", "oil", "c-b")
change_recipe_subgroup("lubricant", "oil", "l-a")

change_recipe_subgroup("solid-fuel-from-petroleum-gas", "fuel")
change_recipe_subgroup("solid-fuel-from-light-oil", "fuel")
change_recipe_subgroup("solid-fuel-from-heavy-oil", "fuel")

change_subgroup("raw-fish", "water", "z")

change_subgroup("processed-fuel", "fuel", "a")
change_subgroup("solid-fuel", "fuel", "b")
change_subgroup("rocket-fuel", "fuel", "c")
change_subgroup("nuclear-fuel", "fuel", "z")

change_recipe_subgroup("sulfuric-acid", "chemical")
change_subgroup("sulfur", "chemical")
change_subgroup("plastic-bar", "chemical")
change_subgroup("explosives", "chemical")

change_subgroup("wood", "chemical", "a-b")
change_subgroup("coal", "chemical", "b")
change_subgroup("stone", "stone", "a-b")
change_subgroup("sand", "stone")
change_subgroup("glass", "stone")
change_subgroup("stone-tablet", "stone")
change_subgroup("iron-ore", "iron", "a-a-b")
change_subgroup("iron-plate", "iron", "a-c")
change_subgroup("steel-plate", "iron", "b-c")
change_subgroup("copper-ore", "copper", "a-a-b")
change_subgroup("copper-plate", "copper", "a-c")

change_subgroup("uranium-ore", "uranium", "a-a-b")
change_subgroup("uranium-238", "uranium", "b")
change_subgroup("uranium-235", "uranium", "c")
change_recipe_subgroup("uranium-processing", "uranium", "r-a-a")
change_recipe_subgroup("kovarex-enrichment-process", "uranium", "r-a-b")
change_subgroup("uranium-fuel-cell", "uranium", "r-b-a")
change_subgroup("used-up-uranium-fuel-cell", "uranium", "r-b-b")
change_recipe_subgroup("nuclear-fuel-reprocessing", "uranium", "r-b-b")

change_subgroup("iron-stick", "basic-assembling")
change_subgroup("iron-gear-wheel", "basic-assembling")
change_subgroup("empty-barrel", "basic-assembling")
change_subgroup("motor", "basic-assembling")
change_subgroup("engine-unit", "basic-assembling")
change_subgroup("electric-motor", "basic-assembling")
change_subgroup("electric-engine-unit", "basic-assembling")
change_subgroup("flying-robot-frame", "basic-assembling")

change_subgroup("copper-cable", "electronic", "a")
change_subgroup("battery", "electronic", "f")

change_subgroup("electronic-circuit", "processor")
change_subgroup("advanced-circuit", "processor")
change_subgroup("processing-unit", "processor")

change_subgroup("cliff-explosives", "capsule")

if data.raw.item["logistic-train-stop"] then data.raw.item["logistic-train-stop"].subgroup = "rail" end
if data.raw["item-subgroup"]["angels-warehouses"] then data.raw["item-subgroup"]["angels-warehouses"].order = "a1-"..data.raw["item-subgroup"]["angels-warehouses"].order end
if data.raw.item["angels-pressure-tank-1"] then data.raw.item["angels-pressure-tank-1"].subgroup = "pipe" end
