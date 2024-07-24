local data_util = require("data_util")

-- Add recipe categories to the machines
table.insert(data.raw["assembling-machine"]["se-space-material-fabricator"].crafting_categories, "advanced-particle-stream")
table.insert(data.raw["assembling-machine"]["kr-matter-plant"].crafting_categories, "basic-matter-conversion")
table.insert(data.raw["assembling-machine"]["kr-matter-plant"].crafting_categories, "advanced-matter-conversion")

-- Update some matter fusion recipes.
data_util.replace_or_add_ingredient("se-matter-fusion-raw-rare-metals", "se-fusion-test-data", "se-kr-matter-synthesis-data", 1)
data_util.replace_or_add_ingredient("se-matter-fusion-raw-imersite", nil, "se-kr-matter-synthesis-data", 1)

---- K2 Matter Recipes
-- Remove biological matter recipes as conversion is not able to make "complex biochemistry"
krastorio.matter_func.removeMatterRecipe("wood")
krastorio.matter_func.removeMatterRecipe("biomass")
-- Remove imersite powder to bring in line with vulcanite and cryonite
krastorio.matter_func.removeMatterRecipe("imersite-powder")

-- Experimental Matter Processing
data_util.make_recipe({
    type = "recipe",
    name = "se-kr-experimental-matter-processing",
    localised_name = {"recipe-name.se-kr-experimental-matter-processing"},
    category = "basic-matter-conversion",
    subgroup = "basic-matter-conversion",
    ingredients = {
      { name = "se-material-testing-pack", amount = 5},
      { name = "se-kr-matter-catalogue-1", amount = 1},
      { type = "fluid", name = "se-particle-stream", amount = 50},
    },
    results = {
      { name = "se-scrap", amount = 15},
      { type = "fluid", name = "matter", amount = 10}, -- amount can change if needed.
    },
    icons = {
      { icon = kr_arrows_icons_path .. "arrow-m.png", icon_size = 64},
      { icon = data.raw.fluid["se-particle-stream"].icon, icon_size = 64, scale = 0.28, shift = {-8,-6}},
      { icon = "__Krastorio2Assets__/icons/fluids/matter.png", icon_size = 64, scale = 0.28, shift = {4,8}},
    },
    main_product = "matter",
    allow_as_intermediate = false,
  })

  -- Add Naquium Cube nad other SE Materials to K2 Matter buildings
data.raw.recipe["kr-matter-plant"].normal.ingredients = {
  { name = "imersium-beam", amount = 5},
  { name = "se-heat-shielding", amount = 10},
  { name = "se-heavy-assembly", amount = 4},
  { name = "ai-core", amount = 2},
  { name = "se-lattice-pressure-vessel", amount = 5},
  { name = "se-kr-matter-catalogue-1", amount = 1},
  { name = "se-naquium-cube", amount = 1},
  { name = "se-space-pipe", amount = 10},
}
data.raw.recipe["kr-matter-plant"].expensive.ingredients = data.raw.recipe["kr-matter-plant"].normal.ingredients

data.raw.recipe["kr-matter-assembler"].normal.ingredients = {
  { name = "imersium-beam", amount = 5},
  { name = "se-heat-shielding", amount = 10},
  { name = "se-heavy-assembly", amount = 4},
  { name = "ai-core", amount = 2},
  { name = "se-lattice-pressure-vessel", amount = 5},
  { name = "se-kr-matter-catalogue-2", amount = 1},
  { name = "se-naquium-cube", amount = 1},
  { name = "se-space-pipe", amount = 10},
}
data.raw.recipe["kr-matter-assembler"].expensive.ingredients = data.raw.recipe["kr-matter-assembler"].normal.ingredients

-- Make Basic Stabilizer recipes
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-basic-stabilizer",
  ingredients = {
    { name = "se-magnetic-canister", amount = 1},
    { name = "se-kr-matter-catalogue-2", amount = 1},
    { name = "se-lattice-pressure-vessel", amount = 1},
    { name = "energy-control-unit", amount = 2},
    { name = "ai-core", amount = 1},
  },
  results = {
    { name = "se-kr-basic-stabilizer", amount = 1},
  },
  icons = {
    {icon = kr_items_icons_path .. "matter-stabilizer.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/compatability/icons/basic-matter-stabilizer-layer.png", icon_size = 64}
  },
  main_product = "se-kr-basic-stabilizer",
  allow_as_intermediate = false,
  allow_productivity = true,
  energy_required = 5
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-charge-basic-stabilizer",
  category = "stabilizer-charging",
  subgroup = "intermediate-product",
  ingredients = {
    { name = "se-kr-basic-stabilizer", amount = 1},
  },
  results = {
    { name = "se-kr-charged-basic-stabilizer", amount = 1},
  },
  icons = {
    {icon = kr_items_icons_path .. "charged-matter-stabilizer.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/compatability/icons/basic-matter-stabilizer-layer.png", icon_size = 64}
  },
  main_product = "se-kr-charged-basic-stabilizer",
  allow_as_intermediate = false,
  energy_required = 2,
})

-- Require Naquium Cube and other SE Materials for the Stabilizer Charging Station
data_util.replace_or_add_ingredient("kr-stabilizer-charging-station", nil, "se-heavy-assembly", 2)
data_util.replace_or_add_ingredient("kr-stabilizer-charging-station", nil, "se-quantum-processor", 2)
data_util.replace_or_add_ingredient("kr-stabilizer-charging-station", nil, "se-dynamic-emitter", 1)
data_util.replace_or_add_ingredient("kr-stabilizer-charging-station", nil, "se-naquium-cube", 1)

-- Non-basic Stabiliser recipe
data_util.replace_or_add_ingredient("matter-stabilizer", "processing-unit", "se-kr-basic-stabilizer", 1)
data_util.replace_or_add_ingredient("matter-stabilizer", "energy-control-unit", "ai-core", 1)
data_util.replace_or_add_ingredient("matter-stabilizer", "imersium-plate", "se-quantum-processor", 2)
data_util.replace_or_add_ingredient("matter-stabilizer", nil, "se-naquium-tessaract", 1)

-- Introduce the basic stabilizer to the raw resource matter deconversion recipes.
local function add_basic_stabilizer(recipe)
  data_util.replace_or_add_ingredient(recipe, nil, "se-kr-charged-basic-stabilizer", 1)
  data_util.replace_or_add_result(recipe, nil, "se-kr-charged-basic-stabilizer", nil, nil, 1, 1, 0.199)
  data_util.replace_or_add_result(recipe, nil, "se-kr-basic-stabilizer", nil, nil, 1, 1, 0.8)
end

add_basic_stabilizer("matter-to-stone")
add_basic_stabilizer("matter-to-sand")
add_basic_stabilizer("matter-to-coal")
add_basic_stabilizer("matter-to-copper-ore")
add_basic_stabilizer("matter-to-iron-ore")
add_basic_stabilizer("matter-to-crude-oil")
add_basic_stabilizer("matter-to-raw-rare-metals")
add_basic_stabilizer("matter-to-uranium-ore")
add_basic_stabilizer("matter-to-uranium-238")
add_basic_stabilizer("matter-to-water")
add_basic_stabilizer("matter-to-mineral-water")

-- Replace Singularity Cells with Antimatter Canisters in Antimatter Weaponry
data_util.replace_or_add_ingredient("antimatter-turret-rocket", "charged-antimatter-fuel-cell", "se-antimatter-canister", 1)
data_util.replace_or_add_ingredient("antimatter-artillery-shell", "charged-antimatter-fuel-cell", "se-antimatter-canister", 3)
data_util.replace_or_add_ingredient("antimatter-rocket", "charged-antimatter-fuel-cell", "se-antimatter-canister", 2)
data_util.replace_or_add_ingredient("antimatter-railgun-shell", "charged-antimatter-fuel-cell", "se-antimatter-canister", 1)

data_util.replace_or_add_ingredient("antimatter-reactor-equipment", nil, "se-naquium-processor", 1)

-- reduce effectivness of matter deconversion
-- otherwise it is too easy to bypass planet resource restrictions.
for _, recipe in pairs(data.raw.recipe) do
  if recipe.subgroup == "matter-deconversion" then
    if recipe.ingredients then
      for _, ingredient in pairs(recipe.ingredients) do
        if ingredient.name == "matter" then
          ingredient.amount = ingredient.amount * 2
          if ingredient.catalyst_amount then
            ingredient.catalyst_amount = ingredient.catalyst_amount * 2
          end
        end
      end
    end
    if recipe.normal then
      for _, ingredient in pairs(recipe.normal.ingredients) do
        if ingredient.name == "matter" then
          ingredient.amount = ingredient.amount * 2
          if ingredient.catalyst_amount then
            ingredient.catalyst_amount = ingredient.catalyst_amount * 2
          end
        end
      end      
    end
    if recipe.expensive then
      for _, ingredient in pairs(recipe.expensive.ingredients) do
        if ingredient.name == "matter" then
          ingredient.amount = ingredient.amount * 2
          if ingredient.catalyst_amount then
            ingredient.catalyst_amount = ingredient.catalyst_amount * 2
          end
        end
      end
    end
  end
end