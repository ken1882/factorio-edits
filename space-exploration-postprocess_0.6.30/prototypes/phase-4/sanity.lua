local data_util = require("data_util")

-- rocket fuel stack size is critically important to space capsule range.
-- 100MJ for 1, stacks to 10, 1GJ per stack
data.raw.item["rocket-fuel"].stack_size = math.ceil(1000000000 / data_util.string_to_number(data.raw.item["rocket-fuel"].fuel_value))

-- all rails now are required to collide
for _, rail in pairs(data.raw["straight-rail"]) do
  if rail.collision_mask and not data_util.table_contains(rail.collision_mask, "rail-layer") then
    table.insert( rail.collision_mask, "rail-layer" )
  end
end

for _, rail in pairs(data.raw["curved-rail"]) do
  if rail.collision_mask and not data_util.table_contains(rail.collision_mask, "rail-layer") then
    table.insert( rail.collision_mask, "rail-layer" )
  end
end

-- Make sure there are no impossible energy loops
for _, type in pairs({"boiler", "burner-generator", "generator", "reactor"}) do
  for _, proto in pairs(data.raw[type]) do
    if proto.effectivity then proto.effectivity = math.min(proto.effectivity, 1) end
    if proto.efficiency then proto.efficiency = math.min(proto.efficiency, 1) end
    if proto.burner and proto.burner.effectivity then proto.burner.effectivity = math.min(proto.burner.effectivity, 1) end
    if proto.burner and proto.burner.efficiency then proto.burner.efficiency = math.min(proto.burner.efficiency, 1) end
    if proto.energy_source and proto.energy_source.effectivity then proto.energy_source.effectivity = math.min(proto.energy_source.effectivity, 1) end
    if proto.energy_source and proto.energy_source.efficiency then proto.energy_source.efficiency = math.min(proto.energy_source.efficiency, 1) end
  end
end

-- some crafting categories can't have machines with built-in productivity
-- becuase they ignore the recipe productivity settings.
local crafting_categories = {
  "basic-crafting",
  "crafting",
  "advanced-crafting",
  "crafting-with-fluid",
  "chemistry",
  "arcosphere",
  "condenser-turbine",
  "big-turbine",
  "delivery-cannon",
  "delivery-cannon-weapon",
  "fixed-recipe", -- generic group for anything with a fixed recipe, not chosen by player
  "fuel-refining",
  "core-fragment-processing",
  "lifesupport", -- same as "space-lifesupport" but can be on land
  "nexus",
  "pulverising",
  "hard-recycling", -- no conflict with "recycling"
  "hand-hard-recycling", -- no conflict with "recycling"
  "se-electric-boiling", -- needs to be SE specific otherwise energy values will be off
  "space-accelerator",
  "space-astrometrics",
  "space-biochemical",
  "space-collider",
  "space-crafting", -- same as basic assembling but only in space
  "space-decontamination",
  "space-electromagnetics",
  "space-materialisation",
  "space-genetics",
  "space-gravimetrics",
  "space-growth",
  "space-hypercooling",
  "space-laser",
  "space-lifesupport", -- same as "lifesupport" but can only be in space
  "space-manufacturing",
  "space-mechanical",
  "space-observation-gammaray",
  "space-observation-xray",
  "space-observation-uv",
  "space-observation-visible",
  "space-observation-infrared",
  "space-observation-microwave",
  "space-observation-radio",
  "space-plasma",
  "space-radiation",
  "space-radiator",
  "space-hard-recycling", -- no conflict with "recycling"
  "space-research",
  "space-spectrometry",
  "space-supercomputing-1",
  "space-supercomputing-2",
  "space-supercomputing-3",
  "space-supercomputing-4",
  "space-thermodynamics",
  "spaceship-console",
  "spaceship-antimatter-engine",
  "spaceship-rocket-engine",
  "pressure-washing",
  "dummy",
  "no-category" -- has no recipes
}
local crafting_categories_dict = {}
for _, category in pairs(crafting_categories) do
  crafting_categories_dict[category] = true
end
for _, prototype in pairs(data.raw["assembling-machine"]) do
  local categories = prototype.crafting_categories or { prototype.crafting_category }
  for _, category in pairs(categories) do
    if crafting_categories_dict[category] then
      prototype.base_productivity = nil
    end
  end
end
