local data_util = require("data_util")

-- Rebalancing the K2 Fusion Reactor
-- 16720 to power 16 K2 Advanced Turbines, for an output of 1.6GW, pretty much the limit of efficiency for D-T Fusion.
data.raw.recipe["kr-fusion"].ingredients = {
	{ type = "fluid", name = "water", amount = 16720},
	{ type = "item", name = "dt-fuel", amount = 1 },
}
data.raw.recipe["kr-fusion"].results = {
	{ type = "fluid", name = "steam", amount = 16720, temperature = 1625},
	{ type = "item", name = "empty-dt-fuel", amount = 1 }
}

-- Adjust Pylon recipies to use Lithium-Sulfur batteries instead
data_util.replace_or_add_ingredient("se-pylon-substation","battery","lithium-sulfur-battery",16)
data_util.replace_or_add_ingredient("se-pylon-construction","battery","lithium-sulfur-battery",16)
data_util.replace_or_add_ingredient("se-pylon-construction-radar","battery","lithium-sulfur-battery",16)

-- Adjust Holmium Accumulator item to require Lithium-Sulfur Batteries
data_util.replace_or_add_ingredient("se-space-accumulator",nil,"energy-control-unit",2)

-- Increase cost Energy Storage recipe to account for now being the final accumulator
data.raw.recipe["kr-energy-storage"].ingredients = {
	{"se-naquium-plate", 20},
	{"se-naquium-heat-pipe", 10},
	{"se-naquium-processor", 4},
	{"se-space-accumulator-2", 10}
}

-- Adjust costs of Flat Solar Panel
data_util.replace_or_add_ingredient("se-space-solar-panel","solar-panel","kr-advanced-solar-panel",1)
data_util.replace_or_add_ingredient("se-space-solar-panel", nil, "se-holmium-cable", 4)
data_util.replace_or_add_ingredient("se-space-solar-panel", nil, "se-holmium-plate", 4)

-- Flat Solar Panel 2
data_util.replace_or_add_ingredient("se-space-solar-panel-2", "se-holmium-plate", "se-holmium-solenoid", 2)
data_util.replace_or_add_ingredient("se-space-solar-panel-2", "se-space-mirror", "se-aeroframe-scaffold", 2)

-- K2 Antimatter (Renamed to Singularity)
-- Add Naquium products to K2 Antimatter processes
data_util.replace_or_add_ingredient("kr-antimatter-reactor", nil, "se-naquium-processor", 10)
data_util.replace_or_add_ingredient("kr-antimatter-reactor", nil, "se-naquium-plate", 350)
data_util.replace_or_add_ingredient("kr-antimatter-reactor", "steel-plate", "se-antimatter-reactor", 1)