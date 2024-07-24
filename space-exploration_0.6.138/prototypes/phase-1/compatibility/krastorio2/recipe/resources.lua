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

-- Cryo-condensation of Air
local cryo_air = table.deepcopy(data.raw.recipe["nitrogen"])
cryo_air.name = "se-kr-liquid-air"
cryo_air.icon = data.raw.fluid["se-kr-liquid-air"].icon
cryo_air.icon_size = data.raw.fluid["se-kr-liquid-air"].icon_size
cryo_air.icon_mipmaps = data.raw.fluid["se-kr-liquid-air"].icon_mipmaps
cryo_air.energy_required = 45
cryo_air.ingredients = {
  {type = "item", name = "se-cryonite-rod", amount = 10, catalyst_amount = 9},
}
cryo_air.results = {
  {type = "fluid", name = "se-kr-liquid-air", amount = 3000},
  {type = "item", name = "se-cryonite-rod", amount = 9, catalyst_amount = 9}
}

-- Filtration of cryo condensed air
local air_filtration = table.deepcopy(data.raw.recipe["quartz"])
air_filtration.name = "se-kr-liquid-purified-air"
air_filtration.icon = data.raw.fluid["se-kr-liquid-purified-air"].icon
air_filtration.icon_size = data.raw.fluid["se-kr-liquid-purified-air"].icon_size
air_filtration.icon_mipmaps = data.raw.fluid["se-kr-liquid-purified-air"].icon_mipmaps
air_filtration.energy_required = 50
air_filtration.ingredients = {
  {type = "fluid", name = "se-kr-liquid-air", amount = 2000},
  {type = "item", name = "se-cryonite-rod", amount = 10, catalyst_amount = 9},
}
air_filtration.results = {
  {type = "fluid", name = "se-kr-liquid-purified-air", amount = 1250},
  {type = "item", name = "se-cryonite-rod", amount = 9, catalyst_amount = 9},
}

-- Seperation of gases from purified liquid air
local air_sep = table.deepcopy(data.raw.recipe["nitric-acid"])
air_sep.name = "se-kr-air-separation"
air_sep.icon = nil
air_sep.icon_size = nil
air_sep.icon_mipmaps = nil
air_sep.icons = {
  {
    icon = "__space-exploration-graphics__/graphics/blank.png",
    icon_size = 64,
    scale = 0.5,
    shift = {0, 0},
  },
  {
    icon = data.raw.fluid["se-kr-liquid-purified-air"].icon,
    icon_size = data.raw.fluid["se-kr-liquid-purified-air"].icon_size,
    scale = 0.33,
    shift = {8, -8}
  },
  {
    icon = data.raw.fluid["nitrogen"].icon,
    icon_size = data.raw.fluid["nitrogen"].icon_size,
    scale = 0.25,
    shift = {-12,9},
  },
  {
    icon = data.raw.fluid["oxygen"].icon,
    icon_size = data.raw.fluid["oxygen"].icon_size,
    scale = 0.25,
    shift = {-4,9},
  },
  {
    icon = "__space-exploration-graphics__/graphics/icons/transition-arrow.png",
    icon_size = 64,
    scale = 0.5,
    shift = {0, 0},
  },
}
air_sep.energy_required = 10
air_sep.ingredients = {
  {type = "fluid", name = "se-kr-liquid-purified-air", amount = 120},
}
air_sep.results = {
  {type = "fluid", name = "nitrogen", amount = 40},
  {type = "fluid", name = "oxygen", amount = 20},
}
data:extend({cryo_air, air_filtration, air_sep})
data_util.disallow_efficiency("se-kr-liquid-air")
data_util.allow_productivity({"se-kr-liquid-purified-air"})

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

-- Catalysed Salt Water Electrolysis
local cat_elec = table.deepcopy(data.raw.recipe["kr-water-electrolysis"])
cat_elec.name = "se-kr-catalysed-water-electrolysis"
cat_elec.icons = {
  {
    icon = "__space-exploration-graphics__/graphics/blank.png",
    icon_size = 64,
    scale = 0.5,
    shift = {0, 0},
  },
  {
    icon = "__Krastorio2Assets__/icons/recipes/water-electrolysis.png",
    icon_size = 128
  },
  {
    icon = data.raw.item["se-iridium-plate"].icon,
    icon_size = data.raw.item["se-iridium-plate"].icon_size,
    scale = 0.15,
    shift = {0,2}
  },
}
cat_elec.ingredients = {
  {type = "fluid", name = "water", amount = 400},
  {type = "item", name = "sand", amount = 100},
  {type = "item", name = "se-iridium-plate", amount = 10, catalyst_amount = 9},
}
cat_elec.results = {
  {type = "fluid", name = "chlorine", amount = 200},
  {type = "fluid", name = "hydrogen", amount = 200},
  {type = "item", name = "se-iridium-plate", amount = 9, catalyst_amount = 9},
}
cat_elec.energy_required = 14
data:extend({cat_elec})
data_util.disallow_efficiency("se-kr-catalysed-water-electrolysis")

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

-- Catalysed Water Seperation
local cat_sep = table.deepcopy(data.raw.recipe["kr-water-separation"])
cat_sep.name = "se-kr-catalysed-water-separation"
cat_sep.icon = nil
cat_sep.icon_size = nil
cat_sep.icon_mipmaps = nil
cat_sep.icons = {
  {
    icon = "__space-exploration-graphics__/graphics/blank.png",
    icon_size = 64,
    scale = 0.5,
    shift = {0, 0},
  },
  {
    icon = "__Krastorio2Assets__/icons/recipes/water-separation.png",
    icon_size = 128
  },
  {
    icon = data.raw.item["se-iridium-plate"].icon,
    icon_size = data.raw.item["se-iridium-plate"].icon_size,
    scale = 0.15,
    shift = {0,2}
  },
}
cat_sep.energy_required = 12
cat_sep.ingredients = {
  {type = "fluid", name = "water", amount = 600},
  {type = "item", name = "se-iridium-plate", amount = 10, catalyst_amount = 9},
}
cat_sep.results = {
  {type = "fluid", name = "oxygen", amount = 200},
  {type = "fluid", name = "hydrogen", amount = 400},
  {type = "item", name = "se-iridium-plate", amount = 9, catalyst_amount = 9}
}
data:extend({cat_sep})
data_util.disallow_efficiency("se-kr-catalysed-water-separation")

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

-- swap recipe item icons to make steel ingots dark and iron ingots light
if data.raw.recipe["se-iron-ingot"] and data.raw.recipe["se-steel-ingot"] then
  data.raw.recipe["se-iron-ingot"].icons, data.raw.recipe["se-steel-ingot"].icons = data.raw.recipe["se-steel-ingot"].icons, data.raw.recipe["se-iron-ingot"].icons
end
