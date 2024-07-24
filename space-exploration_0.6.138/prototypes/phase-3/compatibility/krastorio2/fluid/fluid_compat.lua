local data_util = require("data_util")
local path = "prototypes/phase-3/compatibility/krastorio2/fluid/"


--require(path .. "water")
data.raw.fluid["water"].heat_capacity = "0.3KJ"
data.raw.fluid["steam"].heat_capacity = "0.3KJ"

local heat_capacity = data_util.string_to_number(data.raw.fluid.steam.heat_capacity)
local boiler_power = data_util.string_to_number(data.raw["assembling-machine"]["se-electric-boiler"].energy_usage)
local efficiency = 0.9

-- Update the Steam Turbines water use due to the Heat Capacity change above
data.raw["generator"]["steam-turbine"].fluid_usage_per_tick = data.raw["generator"]["steam-turbine"].fluid_usage_per_tick * (5/3)

-- Update the Electric Boiler recipe times due to the Heat Capacity change above
data_util.recipe_set_energy_required(data.raw.recipe["se-electric-boiling-steam-100"], (100-15) * 100 * heat_capacity / boiler_power / efficiency)
data_util.recipe_set_energy_required(data.raw.recipe["se-electric-boiling-steam-165"], (165-15) * 100 * heat_capacity / boiler_power / efficiency)
data_util.recipe_set_energy_required(data.raw.recipe["se-electric-boiling-steam-500"], (500-15) * 100 * heat_capacity / boiler_power / efficiency)
data_util.recipe_set_energy_required(data.raw.recipe["se-electric-boiling-steam-5000"], (5000-15) * 100 * heat_capacity / boiler_power / efficiency)

-- Include new 415 temp boiling recipe since K2 reduces the regular steam turbines to this number
local steam_415_recipe = table.deepcopy(data.raw.recipe["se-electric-boiling-steam-500"])
steam_415_recipe.name = "se-kr-electric-boiling-steam-415"
steam_415_recipe.energy_required = (415-15) * 100 * heat_capacity / boiler_power / efficiency
steam_415_recipe.results = {
  {type = "fluid", name = "steam", amount = 100, temperature = 415},
}
steam_415_recipe.order = "b-a-b-c-a"

data.raw.recipe["se-electric-boiling-steam-500"].order = "b-a-b-c-b"

data:extend({steam_415_recipe})
data_util.tech_lock_recipes("se-electric-boiler",{"se-kr-electric-boiling-steam-415"})