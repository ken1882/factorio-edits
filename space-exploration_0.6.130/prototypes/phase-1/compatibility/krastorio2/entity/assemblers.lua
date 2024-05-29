local data_util = require("data_util")

---- Advanced Assembler
local adv_assembler = data.raw["assembling-machine"]["kr-advanced-assembling-machine"]
table.insert(adv_assembler.crafting_categories, "crafting-or-electromagnetics")
adv_assembler.energy_usage = "4.5MW"

-- Advanced Chemical Plant
local adv_chem_plant = data.raw["assembling-machine"]["kr-advanced-chemical-plant"]
table.insert(adv_chem_plant.crafting_categories, "melting")
adv_chem_plant.energy_usage = "6.5MW"

-- Advanced Furnace
local adv_furnace = data.raw["assembling-machine"]["kr-advanced-furnace"]
adv_furnace.energy_usage = "5.5MW"
adv_furnace.crafting_speed = 8
adv_furnace.module_specification.module_slots = 5

-- Add K2 recipe categories to SE machines

-- Pulveriser
if data.raw["assembling-machine"]["se-pulveriser"].crafting_categories then
  table.insert(data.raw["assembling-machine"]["se-pulveriser"].crafting_categories, "crushing")
else
  data.raw["assembling-machine"]["se-pulveriser"].crafting_categories = {"crushing"}
end

-- Decontamination Facility
if data.raw["assembling-machine"]["se-space-decontamination-facility"].crafting_categories then
  table.insert(data.raw["assembling-machine"]["se-space-decontamination-facility"].crafting_categories, "fluid-filtration")
else
  data.raw["assembling-machine"]["se-space-decontamination-facility"].crafting_categories = {"fluid-filtration"}
end

-- Mechanical Facility
if data.raw["assembling-machine"]["se-space-mechanical-laboratory"].crafting_categories then
  table.insert(data.raw["assembling-machine"]["se-space-mechanical-laboratory"].crafting_categories, "crushing")
else
  data.raw["assembling-machine"]["se-space-mechanical-laboratory"].crafting_categories =  {"crushing"}
end

if data.raw["assembling-machine"]["kr-greenhouse"].crafting_categories then
  table.insert(data.raw["assembling-machine"]["kr-greenhouse"].crafting_categories,"vita-growth")
else
  data.raw["assembling-machine"]["kr-greenhouse"].crafting_categories = {"vita-growth"}
end

if data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories then
  table.insert(data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories,"vita-growth")
else
  data.raw["assembling-machine"]["se-space-biochemical-laboratory"].crafting_categories = {"vita-growth"}
end

---- Atmospheric Condenser
-- Do not allow Productivity or Efficiency effects.
data.raw["assembling-machine"]["kr-atmospheric-condenser"].allowed_effects = {"consumption","speed","pollution"}
data.raw["assembling-machine"]["kr-atmospheric-condenser"].energy_usage = "4MW"

-- Waterless Atmospheric Condenser as a deepcopy
local waterless_prototype = table.deepcopy(data.raw["assembling-machine"]["kr-atmospheric-condenser"])
waterless_prototype.name = waterless_prototype.name .. "-_-" .. "waterless"
waterless_prototype.placeable_by = {item = "kr-atmospheric-condenser", count = 1}
data:extend({waterless_prototype})

-- Add Water to the regular Atmospheric Condenser
table.insert(data.raw["assembling-machine"]["kr-atmospheric-condenser"].crafting_categories, "atmosphere-condensation-water")

-- Bring Research Server closer to the Supercomputer 1
data_util.remove_from_table(data.raw["assembling-machine"]["kr-research-server"].allowed_effects, "productivity")
data.raw["assembling-machine"]["kr-research-server"].energy_source.emissions_per_minute = 4
data.raw["assembling-machine"]["kr-research-server"].energy_usage = "1MW"
data.raw["assembling-machine"]["kr-research-server"].se_allow_in_space = true
data.raw["assembling-machine"]["kr-research-server"].collision_mask = {
  "water-tile",
  "ground-tile",
  "item-layer",
  "object-layer",
  "player-layer",
}

-- Bring Advanced Research Server closer to the Supercomputer 3
data_util.remove_from_table(data.raw["assembling-machine"]["kr-quantum-computer"].allowed_effects, "productivity")
data.raw["assembling-machine"]["kr-quantum-computer"].energy_usage = "6MW"
data.raw["assembling-machine"]["kr-quantum-computer"].se_allow_in_space = true
data.raw["assembling-machine"]["kr-quantum-computer"].collision_mask = {
  "water-tile",
  "ground-tile",
  "item-layer",
  "object-layer",
  "player-layer",
}

-- Convert pipe connections of the Matter Plant and Matter Assembler to non-"input-output" type to avoid player confusion due to added recipes.
local matter_plant = data.raw["assembling-machine"]["kr-matter-plant"]
local matter_assembler = data.raw["assembling-machine"]["kr-matter-assembler"]

for field, fluid_box in pairs(matter_plant.fluid_boxes) do
  if field ~= "off_when_no_fluid_recipe" then
    if fluid_box.production_type == "input" then
      for _, pipe_connection in pairs(fluid_box.pipe_connections) do
        pipe_connection.type = "input"
      end
    end
    if fluid_box.production_type == "output" then
      for _, pipe_connection in pairs(fluid_box.pipe_connections) do
        pipe_connection.type = "output"
      end
    end
  end
end

for field, fluid_box in pairs(matter_assembler.fluid_boxes) do
  if field ~= "off_when_no_fluid_recipe" then
    if fluid_box.production_type == "input" then
      for _, pipe_connection in pairs(fluid_box.pipe_connections) do
        pipe_connection.type = "input"
      end
    end
    if fluid_box.production_type == "output" then
      for _, pipe_connection in pairs(fluid_box.pipe_connections) do
        pipe_connection.type = "output"
      end
    end
  end
end