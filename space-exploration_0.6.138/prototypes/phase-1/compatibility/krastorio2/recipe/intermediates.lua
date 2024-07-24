local data_util = require("data_util")

-- This source is dedicated to integrating K2 and SEs materials into each others intermediaries

-- This recipe was removed from K2 during SE v0.6, but we want to keep it for SE-K2 so we keep the name the same so that players keep it in thier
-- assemblers at the moment. This can change with the next major version of SE.
if not data.raw.recipe["electronic-components-lithium"] then
  data:extend({
    {
      type = "recipe",
      name = "electronic-components-lithium",
      ingredients = {
        { name = "glass", amount = 3},
        { name = "plastic-bar", amount = 3},
        { name = "silicon", amount = 3},
        { name = "lithium", amount = 3},
      },
      results = {
        { name = "electronic-components", amount = 10}
      },
      energy_required = 10,
      main_product = "electronic-components",
      icons = {
        {icon = "__Krastorio2Assets__/icons/items-with-variations/electronic-components/electronic-components.png", icon_size = 64},
        {icon = "__Krastorio2Assets__/icons/items-with-variations/lithium/lithium.png", icon_size = 64, scale = 0.33, shift = {-8,-8}}
      },
      category = "crafting",
      enabled = false,
      always_show_made_in = false,
    }
  })
  data_util.allow_productivity("electronic-components-lithium")
end

-- Small Electric Motor
local em_2 = table.deepcopy(data.raw.recipe["electric-motor"])
em_2.name = "rare-metal-electric-motor"
em_2.allow_as_intermediate = false
if em_2.normal then
  em_2.normal.allow_as_intermediate = false
end
if em_2.expensive then
  em_2.expensive.allow_as_intermediate = false
end
data:extend({em_2})
data_util.allow_productivity("rare-metal-electric-motor")
data_util.replace_or_add_ingredient("rare-metal-electric-motor","iron-gear-wheel","iron-gear-wheel",2)
data_util.replace_or_add_ingredient("rare-metal-electric-motor","iron-plate","iron-plate",2)
data_util.replace_or_add_ingredient("rare-metal-electric-motor","copper-cable","copper-cable",5)
data_util.replace_or_add_ingredient("rare-metal-electric-motor",nil,"rare-metals",2)
data_util.replace_or_add_result("rare-metal-electric-motor","electric-motor","electric-motor",2)
data_util.tech_lock_recipes("electricity",{"rare-metal-electric-motor"})

-- AI Core
table.insert(data.raw.recipe["ai-core"].ingredients, {type = "fluid", name = "se-neural-gel-2", amount = 20})
data_util.replace_or_add_ingredient("ai-core", "processing-unit", "se-quantum-processor", 2)
data_util.replace_or_add_ingredient("ai-core", "nitric-acid", "se-vitalic-reagent",4)
data_util.replace_or_add_ingredient("ai-core", nil, "se-bioelectrics-data", 2)

-- Integrate the K2 AI Core into the Naquium Processor recipe
data_util.replace_or_add_ingredient("se-naquium-processor","se-quantum-processor","ai-core",1)
data_util.replace_or_add_ingredient("se-naquium-processor-alt","se-quantum-processor","ai-core",1)

-- Nitric Acid has the nitrogen for Anion resin
data_util.replace_or_add_ingredient("se-cryonite-ion-exchange-beads","sulfuric-acid","nitric-acid",5,true)

-- Improved Pollution Filter
data_util.replace_or_add_ingredient("improved-pollution-filter",nil,"se-cryonite-ion-exchange-beads",1)
data_util.replace_or_add_ingredient("improved-pollution-filter",nil,"se-vulcanite-ion-exchange-beads",1)

---- Beryllium
-- Adjust Aeroframe Scaffold to use Imersium Plate
data_util.replace_or_add_ingredient("se-aeroframe-scaffold", nil, "imersium-plate", 1)

-- Adjust Aeroframe Bulkhead to use Imersium Plate
data_util.replace_or_add_ingredient("se-aeroframe-bulkhead", "se-beryllium-plate", "se-beryllium-plate", 2)
data_util.replace_or_add_ingredient("se-aeroframe-bulkhead", nil, "imersium-plate", 2)

---- Iridium
-- Adjust Heavy Composite item to require Rare Metals
data_util.replace_or_add_ingredient("se-heavy-composite",nil,"rare-metals",4)

-- Adjust Heavy Assembly item to require Imersium Beams
data_util.replace_or_add_ingredient("se-heavy-assembly",nil,"imersium-beam",2)

---- Holmium
-- Replace Holmium plate with Rare metals in Holmium solenoid recipe
data_util.replace_or_add_ingredient("se-holmium-solenoid", "se-holmium-plate", "rare-metals", 2)

-- Adjust Quantum processor to use Imersite crystal
data_util.replace_or_add_ingredient("se-quantum-processor", nil, "imersite-crystal", 2)

-- Adjust Dynamic Emitter item to require Imersite Crystals
data_util.replace_or_add_ingredient("se-dynamic-emitter",nil,"imersite-crystal",2)

---- Vitamelange
-- Replace Sulfuric acid with Nitric acid in Vitalic acid recipe
data_util.replace_or_add_ingredient("se-vitalic-acid", "sulfuric-acid", "nitric-acid", 2, true)

-- Adjust Vitalic reagent to use Lithium chloride
data_util.replace_or_add_ingredient("se-vitalic-reagent", nil, "lithium-chloride", 10)

---- Streams
-- Replace Battery with Lithium-Sulfur Battery in the Magnetic Canister recipe
data_util.replace_or_add_ingredient("se-magnetic-canister","battery","lithium-sulfur-battery",1)
data_util.replace_or_add_ingredient("se-magnetic-canister",nil,"rare-metals",1)

-- Replace Copper in Ion Stream recipe with Rare Metals
data_util.replace_or_add_ingredient("se-ion-stream","copper-plate","rare-metals",1)

-- Replace Stone in Plasma Stream recipe with Lithium
data_util.replace_or_add_ingredient("se-plasma-stream","stone","lithium",2)

-- Replace Iron in Proton Stream recipe with Lithium
data_util.replace_or_add_ingredient("se-proton-stream","iron-plate","lithium",2)

---- Lubricant alternate recipe
-- Lithium + Sulfuric Acid + Light Oil = Lubricant?

---- Biological Science
-- Adjust Nutrient gel to use fertilizer
data_util.replace_or_add_ingredient("se-nutrient-gel", nil, "fertilizer", 5)
data_util.replace_or_add_ingredient("se-nutrient-gel-methane", nil, "fertilizer", 5)

-- Adjust Genetic Data item to require Lithium Chloride
data_util.replace_or_add_ingredient("se-genetic-data",nil,"lithium-chloride",5)

---- Energy Science
-- Adjust Magnetic data packs to require Rare Metals
data_util.replace_or_add_ingredient("se-magnetic-monopole-data",nil,"rare-metals",1)
data_util.replace_or_add_ingredient("se-electromagnetic-field-data",nil,"rare-metals",5)

---- Material Science
-- Replace Stone in Material Testing Pack with Rare Metals
data_util.replace_or_add_ingredient("se-material-testing-pack","stone","rare-metals",1)

-- Adjust Material Testing Pack to require Imersite Crystals
data_util.replace_or_add_ingredient("se-material-testing-pack",nil,"imersite-crystal",1)

-- Replace Copper in Experimental Alloys Data with Rare Metals
data_util.replace_or_add_ingredient("se-experimental-alloys-data","copper-plate","rare-metals",1)

-- Fertilizer needs maybe 1 sand and some Mineral Water
data_util.replace_or_add_ingredient("fertilizer",nil,"sand",5)
data_util.replace_or_add_ingredient("fertilizer",nil,"mineral-water",50,true)

local enhanced_fert_recipe = table.deepcopy(data.raw.recipe["fertilizer"])
enhanced_fert_recipe.name = "se-kr-fertilizer-with-nutrients"
enhanced_fert_recipe.main_product = "fertilizer"
data:extend({enhanced_fert_recipe})

data_util.replace_or_add_ingredient("se-kr-fertilizer-with-nutrients","mineral-water","mineral-water",20,true)
data_util.replace_or_add_ingredient("se-kr-fertilizer-with-nutrients",nil,"se-nutrient-gel",10,true)
data_util.replace_or_add_result("se-kr-fertilizer-with-nutrients","fertilizer","fertilizer",20)
data_util.replace_or_add_result("se-kr-fertilizer-with-nutrients",nil,"se-contaminated-bio-sludge",2,true)
data_util.replace_or_add_result("se-kr-fertilizer-with-nutrients",nil,"se-contaminated-space-water",1,true)

-- Include Rare Metal in scrap recycling
if data.raw.recipe["se-scrap-recycling"] then
  table.insert(data.raw.recipe["se-scrap-recycling"].results,
    {name = "raw-rare-metals", amount_min = 1, amount_max = 1, probability = 0.05}
  )
end

-- Adjust Holmium cable Processing Unit recipe to require Rare Metals
data.raw.recipe["se-processing-unit-holmium"].normal = nil
data.raw.recipe["se-processing-unit-holmium"].expensive = nil
data.raw.recipe["se-processing-unit-holmium"].ingredients = {
  {"advanced-circuit", 3},
  {"rare-metals", 2},
  {"se-holmium-cable", 8},
  {type = "fluid", name="sulfuric-acid", amount=4}
}
data.raw.recipe["se-processing-unit-holmium"].result_count = 2

--Biosludge
data_util.replace_or_add_ingredient("se-bio-sludge-from-wood", "wood", "wood", 50)
data_util.replace_or_add_ingredient("se-bio-sludge-from-wood", "se-space-water", "se-space-water", 20, true)

-- Biosluge balance
local biomass_recipe = table.deepcopy(data.raw.recipe["se-bio-sludge-from-wood"])
biomass_recipe.name = "se-bio-sludge-from-biomass"
biomass_recipe.icons = {
  { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 1, icon_size = 64  },
  { icon = data.raw.item["biomass"].icon, scale = 0.75/2, icon_size = 64  },
}
biomass_recipe.localised_name = {"recipe-name.se-bio-sludge-from-biomass"}
data:extend({biomass_recipe})
data_util.replace_or_add_ingredient("se-bio-sludge-from-biomass", "wood", "biomass", 10)
data_util.tech_lock_recipes("se-space-biochemical-laboratory", {"se-bio-sludge-from-biomass"})

-- Integrate Silicon into the Data Card recipe
data_util.replace_or_add_ingredient("se-data-storage-substrate", nil, "silicon", 2)

-- Create a recipe for Data Cards using Rare Metals
local adv_data_recipe = table.deepcopy(data.raw.recipe["se-data-storage-substrate"])
adv_data_recipe.name = "se-kr-rare-metal-substrate"
adv_data_recipe.energy_required = 10
adv_data_recipe.ingredients = {
  {"glass",2},
  {"iron-plate",2},
  {"silicon",2},
  {"rare-metals",2}
}
adv_data_recipe.results = {
  { "se-data-storage-substrate", 2},
  { name = "se-scrap", amount_min = 1, amount_max = 2, probability = 0.5 },
}
adv_data_recipe.icon = nil
adv_data_recipe.icons = data_util.add_icons_to_stack(
  nil, {
    {icon = data.raw.item["se-data-storage-substrate"], properties = {scale = 1, offset = {0,0}}},
    {icon = data.raw.item["rare-metals"], properties = {scale = 0.5, offset = {-0.3,-0.3}}}
  }
)
data:extend({adv_data_recipe})
data_util.allow_productivity("se-kr-rare-metal-substrate")