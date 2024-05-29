local data_util = require("data_util")

-- This source is dedicated to maintaining compatability changes required for the K2 and SE resources
-- E.G.
--  - Control the ability to gather gases from the atmosphere

---- Atmospheric Condenser Changes
-- Can't get hydrogen for free. Use electrolyser
data_util.delete_recipe("hydrogen")

local oxygen = data.raw.recipe["oxygen"]
oxygen.energy_required = 7
data_util.disallow_efficiency("oxygen")

-- Atmosphere composition is 70:20 Nitrogen:Oxygen, Nitrogen is easier to collect.
local nitrogen = data.raw.recipe["nitrogen"]
nitrogen.energy_required = 5 -- Down from 30
nitrogen.results = {
  {type = "fluid", name = "nitrogen", amount = 45} -- Up from 30
}
data_util.disallow_efficiency("nitrogen")

---- Ammonia
data_util.replace_or_add_ingredient("ammonia","hydrogen","hydrogen",150,true)
data_util.replace_or_add_ingredient("ammonia","nitrogen","nitrogen",50,true)
data_util.replace_or_add_result("ammonia","ammonia","ammonia",35,true)
data_util.recipe_set_energy_required("ammonia",14)

---- Hydrogen Chloride
data_util.replace_or_add_result("hydrogen-chloride","hydrogen-chloride","hydrogen-chloride",35,true)
data_util.recipe_set_energy_required("hydrogen-chloride",8)

-- Correct Salt Water Electrolysis gas production ratios
-- Original is 40 water for 20 chlorine and 30 hydrogen
local electrolysis = data.raw.recipe["kr-water-electrolysis"]
electrolysis.energy_required = 7 -- Up from 3
electrolysis.results = {
  {type = "fluid", name = "chlorine", amount = 20},
  {type = "fluid", name = "hydrogen", amount = 20},
}
data_util.disallow_productivity("kr-water-electrolysis")
data_util.disallow_efficiency("kr-water-electrolysis") -- To avoid power generation from rocket fuel recipes

-- Correct Water Seperation gas production ratios
-- Original is 50 water for 20 oxygen and 30 hydrogen
local separation = data.raw.recipe["kr-water-separation"]
separation.energy_required = 6 -- Up from 3
separation.ingredients = {
  {type = "fluid", name = "water", amount = 60}
}
separation.results = {
  {type = "fluid", name = "oxygen", amount = 20},
  {type = "fluid", name = "hydrogen", amount = 40},
}
data_util.disallow_productivity("kr-water-separation")
data_util.disallow_efficiency("kr-water-separation") -- To avoid power generation from rocket fuel recipes

-- Correct Water Creation consumption ratios
-- Original is 20 oxygen and 30 hydrogen for 50 water
local water = data.raw.recipe["kr-water"]
water.energy_required = 6
water.ingredients = {
  {type = "fluid", name = "oxygen", amount = 20},
  {type = "fluid", name = "hydrogen", amount = 40},
}
water.results = {
  {type = "fluid", name = "water", amount = 60}
}
data_util.disallow_productivity("kr-water")

-- Remove Imersite Crystal to Imersite Powder recipe, it leads to loops and is unnecessary.
data_util.delete_recipe("imersite-crystal-to-dust")

-- Rebalance Coal Liquefaction to avoid creation of matter with Prod 9 modules
data.raw.recipe["coal-liquefaction"].ingredients = {
  {type = "item", name = "coal", amount = 10},
  {type = "fluid", name = "heavy-oil", amount = 25, catalyst_amount = 25},
  {type = "fluid", name = "steam", amount = 50},
}
data.raw.recipe["coal-liquefaction"].results = {
  {type = "fluid", name = "heavy-oil", amount = 85, catalyst_amount = 25},
  {type = "fluid", name = "light-oil", amount = 20},
  {type = "fluid", name = "petroleum-gas", amount = 10},
}

-- Rebalance Used Fuel Cell Reprocessing to avoid creation of matter with Prod 9 modules
krastorio.recipes.replaceProduct("nuclear-fuel-reprocessing", "uranium-238", {type = "item", name = "uranium-238", amount = 5})
krastorio.recipes.replaceProduct("nuclear-fuel-reprocessing", "stone", {type = "item", name = "stone", amount = 3})

-- Rebalance Lithium Chloride production to avoid chlorine creation with Prod 9 modules when making Lithium.
data_util.replace_or_add_ingredient("lithium","lithium-chloride","lithium-chloride",10)
data_util.replace_or_add_ingredient("lithium-chloride","hydrogen-chloride","hydrogen-chloride",25, true)

-- Vitamelange Bloom
data_util.replace_or_add_ingredient("se-vitamelange-bloom","sand","fertilizer",10)
data.raw.recipe["se-vitamelange-bloom"].category = "vita-growth"