local data_util = require("data_util")

---- Matter Science Pack
-- Matter Science Pack Tint
local matter_pack_tint = {r = 255, g = 51, b = 151}

-- Data Card Recipes
-- Matter Analysis
local matter_analysis = data.raw.recipe["matter-research-data"]
matter_analysis.icon = "__space-exploration-graphics__/graphics/compatability/icons/matter-analysis.png"
matter_analysis.icon_size = 64
matter_analysis.ingredients = {
  {name = "se-material-testing-pack", amount = 1},
  {name = "se-quantum-phenomenon-data", amount = 1},
  {name = "se-quark-data", amount = 1},
  {type = "fluid", name = "se-particle-stream", amount = 50},
}
matter_analysis.result = nil
matter_analysis.results = {
  {name = "matter-research-data", amount = 1},
  {name = "se-junk-data", amount_min = 1, amount_max = 1, probability = 0.70},
  {name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.30},
  {type = "fluid", name = "se-particle-stream", amount = 35},
}
matter_analysis.main_product = "matter-research-data"
matter_analysis.category = "space-materialisation"
matter_analysis.subgroup = "data-matter"

-- Matter Synthesis
local matter_synthesis = data.raw.recipe["se-matter-fusion-dirty"]
matter_synthesis.localised_name = {"",{"recipe-name.se-kr-matter-synthesis-data"}}
matter_synthesis.icon = "__space-exploration-graphics__/graphics/compatability/icons/matter-synthesis.png"
matter_synthesis.icon_size = 64
matter_synthesis.icons = nil
matter_synthesis.main_product = "se-kr-matter-synthesis-data"
matter_synthesis.subgroup = "data-matter"
matter_synthesis.ingredients = {
  { name = "se-quark-data", amount = 1},
  { type = "fluid", name = "se-particle-stream", amount = 50},
  { type = "fluid", name = "se-space-coolant-supercooled", amount = 25}
}
matter_synthesis.results = {
  { name = "se-contaminated-scrap", amount = 15},
  { name = "se-kr-matter-synthesis-data", amount_min = 1, amount_max = 1, probability = 0.90},
  { name = "se-junk-data", amount_min = 1, amount_max = 1, probability = 0.10},
  { type = "fluid", name = "se-space-coolant-hot", amount = 25}
}
matter_synthesis.energy_required = 10

-- Matter Liberation
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-liberation-data",
  category = "space-materialisation",
  subgroup = "data-matter",
  ingredients = {
    { name = "se-radiation-data", amount = 1},
    { name = "se-hot-thermodynamics-data", amount = 1},
    { name = "se-material-testing-pack", amount = 5},
    { type = "fluid", name = "se-particle-stream", amount = 100}
  },
  results = {
    { name = "se-kr-matter-liberation-data", amount = 1},
    { name = "se-junk-data", amount_min = 1, amount_max = 1, probability = 0.80},
    { name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.20},
    { name = "se-contaminated-scrap", amount = 15},
    { type = "fluid", name = "se-particle-stream", amount = 110}
  },
  main_product = "se-kr-matter-liberation-data",
  always_show_made_in = true,
})

-- Matter Containment
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-containment-data",
  category = "space-materialisation",
  subgroup = "data-matter",
  ingredients = {
    { name = "se-forcefield-data", amount = 1},
    { name = "se-pressure-containment-data", amount = 1},
    { name = "se-magnetic-canister", amount = 5},
    { type = "fluid", name = "se-particle-stream", amount = 100}
  },
  results = {
    { name = "se-kr-matter-containment-data", amount_min = 2, amount_max = 2, probability = 0.70},
    { name = "se-junk-data", amount_min = 2, amount_max = 2, probability = 0.30},
    { name = "se-scrap", amount = 15},
    { name = "se-contaminated-scrap", amount = 10}
  },
  main_product = "se-kr-matter-containment-data",
  always_show_made_in = true,
})

-- Matter Manipulation
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-manipulation-data",
  group = "science",
  category = "basic-matter-conversion",
  subgroup = "data-matter",
  ingredients = {
    { name = "se-forcefield-data", amount = 1},
    { name = "se-hot-thermodynamics-data", amount = 1},
    { type = "fluid", name = "matter", amount = 50},
  },
  results = {
    { name = "se-kr-matter-manipulation-data", amount = 2},
    { name = "se-scrap", amount = 10},
    { type = "fluid", name = "se-particle-stream", amount = 40},
    { type = "fluid", name = "matter", amount = 10},
  },
  main_product = "se-kr-matter-manipulation-data",
  always_show_made_in = true,
})

-- Matter Recombination
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-recombination-data",
  group = "science",
  category = "basic-matter-conversion",
  subgroup = "data-matter",
  ingredients = {
    { name = "ai-core", amount = 1},
    { name = "se-boson-data", amount = 1},
    { name = "se-fusion-test-data", amount = 1},
    { type = "fluid", name = "matter", amount = 50},
  },
  results = {
    { name = "se-kr-matter-recombination-data", amount = 1},
    { name = "se-junk-data", amount_min = 1, amount_max = 1, probability = 0.80},
    { name = "se-broken-data", amount_min = 1, amount_max = 1, probability = 0.20},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { name = "se-scrap", amount = 15},
  },
  main_product = "se-kr-matter-recombination-data",
  allow_as_intermediate = false,
})

-- Matter Stabilization
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-stabilization-data",
  group = "science",
  category = "basic-matter-conversion",
  subgroup = "data-matter",
  ingredients = {
    { name = "ai-core", amount = 1},
    { name = "se-kr-matter-containment-data", amount = 1},
    { name = "se-experimental-alloys-data", amount = 1},
    { type = "fluid", name = "matter", amount = 50},
  },
  results = {
    { name = "se-kr-matter-stabilization-data", amount = 2},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.80},
    { type = "fluid", name = "matter", amount = 45},
  },
  main_product = "se-kr-matter-stabilization-data",
  allow_as_intermediate = false,
})

-- Matter Utilization
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-utilization-data",
  group = "science",
  category = "basic-matter-conversion",
  subgroup = "data-matter",
  ingredients = {
    { name = "ai-core", amount = 1},
    { name = "se-magnetic-canister", amount = 5},
    { name = "se-kr-matter-containment-data", amount = 1},
    { type = "fluid", name = "matter", amount = 50},
  },
  results = {
    { name = "se-kr-matter-utilization-data", amount = 1},
    { name = "ai-core", amount = 1},
    { name = "se-magnetic-canister", amount_min = 1, amount_max = 4},
    { type = "fluid", name = "matter", amount = 35},
  },
  main_product = "se-kr-matter-utilization-data",
  allow_as_intermediate = false,
})

-- Catalogue recipes
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-catalogue-1",
  ingredients = {
    { name = "matter-research-data", amount = 1 },
    { name = "se-kr-matter-synthesis-data", amount = 1},
    { name = "se-kr-matter-liberation-data", amount = 1},
    { name = "se-kr-matter-containment-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = "se-kr-matter-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 50,
  main_product = "se-kr-matter-catalogue-1",
  subgroup = "data-catalogue-matter",
  icons = {
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/base-catalogue-1.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-catalogue-1.png", icon_size = 64, tint = matter_pack_tint}
  },
  category = "catalogue-creation-1",
  always_show_made_in = true,
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-catalogue-2",
  ingredients = {
    { name = "se-kr-matter-manipulation-data", amount = 1},
    { name = "se-kr-matter-recombination-data", amount = 1},
    { name = "se-kr-matter-stabilization-data", amount = 1},
    { name = "se-kr-matter-utilization-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = "se-kr-matter-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 60,
  main_product = "se-kr-matter-catalogue-2",
  subgroup = "data-catalogue-matter",
  icons = {
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/base-catalogue-2.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-catalogue-2.png", icon_size = 64, tint = matter_pack_tint}
  },
  category = "catalogue-creation-2",
  always_show_made_in = true,
})

-- Science Pack Recipes
local matter_tech_card_recipe = data.raw.recipe["matter-tech-card"]
matter_tech_card_recipe.category = "science-pack-creation-1"
matter_tech_card_recipe.subgroup = "matter-science-pack"
matter_tech_card_recipe.ingredients = {
  {name = "se-scrap", amount = 10},
  {name = "se-significant-data", amount = 1},
  {name = "se-kr-matter-catalogue-1", amount = 1},
  {type = "fluid", name = "se-particle-stream", amount = 5},
  {type = "fluid", name = "se-space-coolant-supercooled", amount = 50}
}
matter_tech_card_recipe.results = {
  {name = "matter-tech-card", amount = 2},
  {name = "se-junk-data", amount = 4},
  {name = "se-broken-data", amount = 1},
  {type = "fluid", name = "se-space-coolant-hot", amount = 50}
}
matter_tech_card_recipe.energy_required = 10
matter_tech_card_recipe.main_product = "matter-tech-card"
matter_tech_card_recipe.always_show_made_in = true

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-matter-science-pack-2",
  category = "science-pack-creation-2",
  subgroup = "matter-science-pack",
  ingredients = {
    { name = "se-scrap", amount = 10}, -- needs changed?
    { name = "se-significant-data", amount = 1},
    { name = "se-kr-matter-catalogue-2", amount = 1},
    { name = "matter-tech-card", amount = 2},
    { type = "fluid", name = "matter", amount = 50 },
    { type = "fluid", name = "se-space-coolant-supercooled", amount = 100},
  },
  results = {
    { name = "se-kr-matter-science-pack-2", amount = 4},
    { name = "se-junk-data", amount = 4},
    { name = "se-broken-data", amount = 1},
    { type = "fluid", name = "se-space-coolant-hot", amount = 100},
  },
  energy_required = 20,
  main_product = "se-kr-matter-science-pack-2",
  icons = {
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/deep-3.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-3.png", icon_size = 64, tint = matter_pack_tint}
  },
  always_show_made_in = true,
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-combined-catalogue",
  category = "catalogue-creation-1",
  subgroup = "data-catalogue-advanced",
  energy_required = 40,
  main_product = "se-kr-combined-catalogue",
  icons = {
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/universal-catalogue.png", icon_size = 64}
  },
  ingredients = {
    {name = "se-astronomic-catalogue-3", amount = 1},
    {name = "se-biological-catalogue-3", amount = 1},
    {name = "se-energy-catalogue-3", amount = 1},
    {name = "se-material-catalogue-3", amount = 1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10}
  },
  results = {
    {name = "se-kr-combined-catalogue", amount = 2},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10}
  }
})

local advanced_pack_tint = {r = 133, g = 33, b = 209}
data_util.make_recipe({
  type = "recipe",
  name = "se-kr-advanced-catalogue-1",
  category = "catalogue-creation-1",
  subgroup = "data-catalogue-advanced",
  energy_required = 50,
  main_product = "se-kr-advanced-catalogue-1",
  icons = {
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/base-catalogue-1.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-catalogue-1.png", icon_size = 64, tint = advanced_pack_tint}
  },
  ingredients = {
    { name = "se-kr-power-density-data", amount = 1},
    { name = "se-kr-quantum-computation-data", amount = 1},
    { name = "se-kr-remote-sensing-data", amount = 1},
    { name = "se-kr-combined-catalogue", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = "se-kr-advanced-catalogue-1", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-advanced-catalogue-2",
  category = "catalogue-creation-2",
  subgroup = "data-catalogue-advanced",
  energy_required = 80,
  main_product = "se-kr-advanced-catalogue-2",
  icons = {
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/base-catalogue-2.png", icon_size = 64},
    {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-catalogue-2.png", icon_size = 64, tint = advanced_pack_tint}
  },
  ingredients = {
    { name = "se-kr-macroscale-entanglement-data", amount = 1},
    { name = "se-kr-timespace-manipulation-data", amount = 1},
    { name = "se-kr-singularity-application-data", amount = 1},
    { name = "se-kr-combined-catalogue", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = "se-kr-advanced-catalogue-2", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
})

-- Adjust Advanced Tech Card cost
data_util.replace_or_add_ingredient("advanced-tech-card","electric-engine-unit","se-bioscrubber",5)
data_util.replace_or_add_ingredient("advanced-tech-card",nil,"se-pylon",2)
data_util.replace_or_add_ingredient("advanced-tech-card",nil,"se-space-platform-plating",1)

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-power-density-data",
  group = "science",
  category = "space-electromagnetics",
  subgroup = "data-advanced",
  energy_required = 30,
  main_product = "se-kr-power-density-data",
  order = "a-a",
  allow_productivity = false,
  ingredients = {
    {name = "lithium-sulfur-battery", amount = 1},
    {name = "se-space-accumulator", amount = 1},
    {name = "energy-control-unit", amount = 1},
    {name = "se-empty-data", amount = 3}
  },
  results = {
    {name = "se-kr-power-density-data", amount = 3}
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-quantum-computation-data",
  group = "science",
  category = "space-supercomputing-2",
  subgroup = "data-advanced",
  energy_required = 90,
  main_product = "se-kr-quantum-computation-data",
  order = "a-b",
  allow_productivity = false,
  ingredients = {
    {name = "se-quantum-processor", amount = 6},
    {name = "se-empty-data", amount = 6},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 30}
  },
  results = {
    {name = "se-kr-quantum-computation-data", amount = 6},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 30}
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-remote-probe",
  group = "science",
  category = "space-manufacturing",
  subgroup = "data-advanced",
  energy_required = 60,
  main_product = "se-kr-remote-probe",
  order = "a-c",
  allow_productivity = false,
  ingredients = {
    {name = "radar", amount = 20},
    {name = "rocket-control-unit", amount = 20},
    {name = "rocket-fuel", amount = 100},
    {name = "se-space-solar-panel-2", amount = 10},
    {name = "se-empty-data", amount = 1000}
  },
  results = {
    {name = "se-kr-remote-probe", amount = 1}
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-macroscale-entanglement-data",
  group = "science",
  category = "arcosphere",
  subgroup = "data-advanced",
  energy_required = 20,
  main_product = "se-kr-macroscale-entanglement-data",
  order = "b-a",
  allow_productivity = false,
  ingredients = {
    {data_util.mod_prefix .. "arcosphere-a", 1}, -- lambda
    --{data_util.mod_prefix .. "arcosphere-b", 0}, -- xi
    --{data_util.mod_prefix .. "arcosphere-c", 0}, -- zeta
    {data_util.mod_prefix .. "arcosphere-d", 1}, -- theta
    --{data_util.mod_prefix .. "arcosphere-g", 0}, -- gamma
    {data_util.mod_prefix .. "arcosphere-h", 1}, -- omega
    {data_util.mod_prefix .. "significant-data", 1},
    {"ai-core",1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20}
  },
  results = {
    { name = "se-kr-macroscale-entanglement-data", amount = 1},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    {"se-arcosphere-a", 1}, -- lambda
    {"se-arcosphere-b", 0}, -- xi
    {"se-arcosphere-c", 1}, -- zeta
    {"se-arcosphere-d", 0}, -- theta
    {"se-arcosphere-g", 1}, -- gamma
    {"se-arcosphere-h", 0}, -- omega
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-macroscale-entanglement-data-alt",
  group = "science",
  category = "arcosphere",
  subgroup = "data-advanced",
  energy_required = 20,
  main_product = "se-kr-macroscale-entanglement-data",
  order = "b-b",
  allow_productivity = false,
  ingredients = {
    {data_util.mod_prefix .. "arcosphere-a", 1}, -- lambda
    --{data_util.mod_prefix .. "arcosphere-b", 0}, -- xi
    --{data_util.mod_prefix .. "arcosphere-c", 0}, -- zeta
    {data_util.mod_prefix .. "arcosphere-d", 1}, -- theta
    --{data_util.mod_prefix .. "arcosphere-g", 0}, -- gamma
    {data_util.mod_prefix .. "arcosphere-h", 1}, -- omega
    {data_util.mod_prefix .. "significant-data", 1},
    {"ai-core",1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20}
  },
  results = {
    { name = "se-kr-macroscale-entanglement-data", amount = 1},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    {"se-arcosphere-a", 0}, -- lambda
    {"se-arcosphere-b", 1}, -- xi
    {"se-arcosphere-c", 0}, -- zeta
    {"se-arcosphere-d", 1}, -- theta
    {"se-arcosphere-g", 0}, -- gamma
    {"se-arcosphere-h", 1}, -- omega
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-timespace-manipulation-data",
  group = "science",
  category = "arcosphere",
  subgroup = "data-advanced",
  energy_required = 20,
  main_product = "se-kr-timespace-manipulation-data",
  order = "b-c",
  allow_productivity = false,
  ingredients = {
    {data_util.mod_prefix .. "arcosphere-a", 1}, -- lambda
    --{data_util.mod_prefix .. "arcosphere-b", 0}, -- xi
    {data_util.mod_prefix .. "arcosphere-e", 1}, -- epsilon
    --{data_util.mod_prefix .. "arcosphere-f", 0}, -- phi
    --{data_util.mod_prefix .. "arcosphere-g", 0}, -- gamma
    {data_util.mod_prefix .. "arcosphere-h", 1}, -- omega
    {data_util.mod_prefix .. "significant-data", 1},
    {"ai-core",1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20}
  },
  results = {
    { name = "se-kr-timespace-manipulation-data", amount = 1},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    {"se-arcosphere-a", 1}, -- lambda
    {"se-arcosphere-b", 0}, -- xi
    {"se-arcosphere-e", 1}, -- epsilon
    {"se-arcosphere-f", 0}, -- phi
    {"se-arcosphere-g", 1}, -- gamma
    {"se-arcosphere-h", 0}, -- omega
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-timespace-manipulation-data-alt",
  group = "science",
  category = "arcosphere",
  subgroup = "data-advanced",
  energy_required = 20,
  main_product = "se-kr-timespace-manipulation-data",
  order = "b-d",
  allow_productivity = false,
  ingredients = {
    {data_util.mod_prefix .. "arcosphere-a", 1}, -- lambda
    --{data_util.mod_prefix .. "arcosphere-b", 0}, -- xi
    {data_util.mod_prefix .. "arcosphere-e", 1}, -- epsilon
    --{data_util.mod_prefix .. "arcosphere-f", 0}, -- phi
    --{data_util.mod_prefix .. "arcosphere-g", 0}, -- gamma
    {data_util.mod_prefix .. "arcosphere-h", 1}, -- omega
    {data_util.mod_prefix .. "significant-data", 1},
    {"ai-core",1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20}
  },
  results = {
    { name = "se-kr-timespace-manipulation-data", amount = 1},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    {"se-arcosphere-a", 0}, -- lambda
    {"se-arcosphere-b", 1}, -- xi
    {"se-arcosphere-e", 0}, -- epsilon
    {"se-arcosphere-f", 1}, -- phi
    {"se-arcosphere-g", 0}, -- gamma
    {"se-arcosphere-h", 1}, -- omega
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-singularity-application-data",
  group = "science",
  category = "arcosphere",
  subgroup = "data-advanced",
  energy_required = 20,
  main_product = "se-kr-singularity-application-data",
  order = "b-e",
  allow_productivity = false,
  ingredients = {
    --{data_util.mod_prefix .. "arcosphere-c", 0}, -- zeta
    {data_util.mod_prefix .. "arcosphere-d", 1}, -- theta
    {data_util.mod_prefix .. "arcosphere-e", 1}, -- epsilon
    --{data_util.mod_prefix .. "arcosphere-f", 0}, -- phi
    --{data_util.mod_prefix .. "arcosphere-g", 0}, -- gamma
    {data_util.mod_prefix .. "arcosphere-h", 1}, -- omega
    {data_util.mod_prefix .. "significant-data", 1},
    {"ai-core",1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20}
  },
  results = {
    { name = "se-kr-singularity-application-data", amount = 1},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    {"se-arcosphere-c", 1}, -- zeta
    {"se-arcosphere-d", 0}, -- theta
    {"se-arcosphere-e", 1}, -- epsilon
    {"se-arcosphere-f", 0}, -- phi
    {"se-arcosphere-g", 1}, -- gamma
    {"se-arcosphere-h", 0}, -- omega
  }
})

data_util.make_recipe({
  type = "recipe",
  name = "se-kr-singularity-application-data-alt",
  group = "science",
  category = "arcosphere",
  subgroup = "data-advanced",
  energy_required = 20,
  main_product = "se-kr-singularity-application-data",
  order = "b-f",
  allow_productivity = false,
  ingredients = {
    --{data_util.mod_prefix .. "arcosphere-c", 0}, -- zeta
    {data_util.mod_prefix .. "arcosphere-d", 1}, -- theta
    {data_util.mod_prefix .. "arcosphere-e", 1}, -- epsilon
    --{data_util.mod_prefix .. "arcosphere-f", 0}, -- phi
    --{data_util.mod_prefix .. "arcosphere-g", 0}, -- gamma
    {data_util.mod_prefix .. "arcosphere-h", 1}, -- omega
    {data_util.mod_prefix .. "significant-data", 1},
    {"ai-core",1},
    {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 20}
  },
  results = {
    { name = "se-kr-singularity-application-data", amount = 1},
    { name = "ai-core", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 20},
    {"se-arcosphere-c", 0}, -- zeta
    {"se-arcosphere-d", 1}, -- theta
    {"se-arcosphere-e", 0}, -- epsilon
    {"se-arcosphere-f", 1}, -- phi
    {"se-arcosphere-g", 0}, -- gamma
    {"se-arcosphere-h", 1}, -- omega
  }
})

local adv_card = data.raw.recipe["advanced-tech-card"]
adv_card.category = "science-pack-creation-1"
adv_card.energy_required = 20
adv_card.allow_productivity = false
adv_card.ingredients = {
  {name = "se-significant-data", amount = 1},
  {name = "se-kr-advanced-catalogue-1", amount = 1},
  {type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 50},
  {type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 100}
}
adv_card.result = nil
adv_card.result_count = nil
adv_card.results = {
  {name = "advanced-tech-card", amount = 6},
  {name = "se-junk-data", amount = 9},
  {name = "se-broken-data", amount = 2},
  {type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 100}
}
adv_card.main_product = "advanced-tech-card"
adv_card.always_show_made_in = true

-- Need to leave these in to migrate away from them.
local card = data.raw.recipe["singularity-tech-card"]
card.category = "arcosphere"
card.energy_required = 180
card.allow_productivity = false
card.ingredients = {
  {"se-deep-space-science-pack-3" , 6},
  {"se-significant-data", 1},
  {"ai-core", 1},
  {"se-arcosphere-a", 1}, -- lambda
  --{"se-arcosphere-b", 0}, -- xi
  --{"se-arcosphere-c", 0}, -- zeta
  {"se-arcosphere-d", 1}, -- theta
  {"se-arcosphere-e", 1}, -- epsilon
  --{"se-arcosphere-f", 0}, -- phi
  --{"se-arcosphere-g", 0}, -- gamma
  {"se-arcosphere-h", 1}, -- omega
  { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 200}
}
card.result = nil
card.result_count = nil
card.results = {
  {"singularity-tech-card", 8},
  {"se-junk-data", 4},
  {"se-broken-data", 1},
  { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
  {"se-arcosphere-a", 1}, -- lambda
  {"se-arcosphere-b", 0}, -- xi
  {"se-arcosphere-c", 1}, -- zeta
  {"se-arcosphere-d", 0}, -- theta
  {"se-arcosphere-e", 1}, -- epsilon
  {"se-arcosphere-f", 0}, -- phi
  {"se-arcosphere-g", 1}, -- gamma
  {"se-arcosphere-h", 0}, -- omega
}
card.hidden = true
card.main_product = "singularity-tech-card"
card.always_show_made_in = true
card.icon = "__Krastorio2Assets__/icons/cards/singularity-tech-card.png"
card.icon_size = 64
card.icon_mipmaps = 4
card.subgroup = "science-pack"
card.order = "b11[singularity-tech-card]"
data_util.enable_recipe("singularity-tech-card")

local card_alt = table.deepcopy(data.raw.recipe["singularity-tech-card"])
card_alt.name = "singularity-tech-card-alt"
card_alt.ingredients = {
  {"se-deep-space-science-pack-3" , 6},
  {"se-significant-data", 1},
  {"ai-core", 1},
  {"se-arcosphere-a", 1}, -- lambda
  --{"se-arcosphere-b", 0}, -- xi
  --{"se-arcosphere-c", 0}, -- zeta
  {"se-arcosphere-d", 1}, -- theta
  {"se-arcosphere-e", 1}, -- epsilon
  --{"se-arcosphere-f", 0}, -- phi
  --{"se-arcosphere-g", 0}, -- gamma
  {"se-arcosphere-h", 1}, -- omega
  { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 200}
}
card_alt.results = {
  {"singularity-tech-card", 8},
  {"se-junk-data", 4},
  {"se-broken-data", 1},
  { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
  {"se-arcosphere-a", 0}, -- lambda
  {"se-arcosphere-b", 1}, -- xi
  {"se-arcosphere-c", 0}, -- zeta
  {"se-arcosphere-d", 1}, -- theta
  {"se-arcosphere-e", 0}, -- epsilon
  {"se-arcosphere-f", 1}, -- phi
  {"se-arcosphere-g", 0}, -- gamma
  {"se-arcosphere-h", 1}, -- omega
}
card_alt.icon = "__Krastorio2Assets__/icons/cards/singularity-tech-card.png"
card_alt.icon_size = 64
card_alt.icon_mipmaps = 4
card_alt.subgroup = "science-pack"
card_alt.order = "b11[singularity-tech-card]"
data:extend({card_alt})


local sing_pack = table.deepcopy(data.raw.recipe["singularity-tech-card"])
sing_pack.name = "se-kr-advanced-science-pack-2"
sing_pack.category = "science-pack-creation-2"
sing_pack.subgroup = "advanced-science-pack"
sing_pack.order = "g[optimization-tech-card-3]-c"
sing_pack.energy_required = 40
sing_pack.allow_productivity = false
sing_pack.normal = nil
sing_pack.expensive = nil
sing_pack.ingredients = {
  {"advanced-tech-card", 6},
  {"se-significant-data", 1},
  {"se-kr-advanced-catalogue-2", 1},
  {"ai-core", 5},
  { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 10},
  { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 200}
}
sing_pack.result = nil
sing_pack.result_count = nil
sing_pack.results = {
  {"singularity-tech-card", 8},
  {"se-junk-data", 9},
  {"se-broken-data", 2},
  { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 200},
}
sing_pack.icon = nil
sing_pack.icon_size = nil
sing_pack.icon_mipmaps = nil
sing_pack.icons = {
  {icon = "__space-exploration-graphics__/graphics/icons/catalogue/deep-3.png", icon_size = 64},
  {icon = "__space-exploration-graphics__/graphics/icons/catalogue/mask-3.png", icon_size = 64, tint = advanced_pack_tint}
}
sing_pack.main_product = "singularity-tech-card"
sing_pack.always_show_made_in = true
data:extend({sing_pack})
data_util.tech_lock_recipes("kr-singularity-tech-card",{"se-kr-advanced-science-pack-2"})

local recipe = data.raw.recipe
-- Add categories to K2 Research Server and Quantum Computer (Advanced Research Server)
local catalog_1 = "catalogue-creation-1"
local catalog_2 = "catalogue-creation-2"
local science_1 = "science-pack-creation-1"
local science_2 = "science-pack-creation-2"

-- Add recipes to these new categories
recipe["se-astronomic-catalogue-1"].category = catalog_1
recipe["se-astronomic-catalogue-2"].category = catalog_1
recipe["se-astronomic-catalogue-3"].category = catalog_1
recipe["se-astronomic-catalogue-4"].category = catalog_1
recipe["se-biological-catalogue-1"].category = catalog_1
recipe["se-biological-catalogue-2"].category = catalog_1
recipe["se-biological-catalogue-3"].category = catalog_1
recipe["se-biological-catalogue-4"].category = catalog_1
recipe["se-energy-catalogue-1"].category = catalog_1
recipe["se-energy-catalogue-2"].category = catalog_1
recipe["se-energy-catalogue-3"].category = catalog_1
recipe["se-energy-catalogue-4"].category = catalog_1
recipe["se-material-catalogue-1"].category = catalog_1
recipe["se-material-catalogue-2"].category = catalog_1
recipe["se-material-catalogue-3"].category = catalog_1
recipe["se-material-catalogue-4"].category = catalog_1

recipe["se-deep-catalogue-1"].category = catalog_2
recipe["se-deep-catalogue-2"].category = catalog_2
recipe["se-deep-catalogue-3"].category = catalog_2
recipe["se-deep-catalogue-4"].category = catalog_2

recipe["se-astronomic-science-pack-1"].category = science_1
--recipe["se-astronomic-science-pack-1-no-beryllium"].category = science_1
recipe["se-astronomic-science-pack-2"].category = science_1
recipe["se-astronomic-science-pack-3"].category = science_1
recipe["se-astronomic-science-pack-4"].category = science_1
recipe["se-biological-science-pack-1"].category = science_1
recipe["se-biological-science-pack-2"].category = science_1
recipe["se-biological-science-pack-3"].category = science_1
recipe["se-biological-science-pack-4"].category = science_1
recipe["se-energy-science-pack-1"].category = science_1
recipe["se-energy-science-pack-2"].category = science_1
recipe["se-energy-science-pack-3"].category = science_1
recipe["se-energy-science-pack-4"].category = science_1
recipe["se-material-science-pack-1"].category = science_1
recipe["se-material-science-pack-2"].category = science_1
recipe["se-material-science-pack-3"].category = science_1
recipe["se-material-science-pack-4"].category = science_1

recipe["se-deep-space-science-pack-1"].category = science_2
recipe["se-deep-space-science-pack-2"].category = science_2
recipe["se-deep-space-science-pack-3"].category = science_2
recipe["se-deep-space-science-pack-4"].category = science_2

-- Original SE timings
-- Automation: 5s
-- 2x Logistic: 10s
-- 2x Military: 10s
-- 3x Chemical: 26s
-- 8x Rocket: 80s
-- 5x Space: 75s
-- Utility: 80s
-- Production: 60s
-- A/B/E/M 1/2/3/4 : 30s
-- Deep Space Science 1/2/3/4 : 60s/120s/180s/240s

-- Additionally, since the pack creation recipes previously took place in a 10 crafting speed machine, adjust time to craft down.
-- The servers consume much higher power per crafting speed as well, so science packs now cost more energy to craft too.
-- The servers also have fewer module slots, so their moduled and beaconed top speed is lower than a top speed manufactury as well.
local time_factor = 6 -- Arbitrary factor, can be changed as required for balance
recipe["se-astronomic-science-pack-1"].energy_required = recipe["se-astronomic-science-pack-1"].energy_required / time_factor
--recipe["se-astronomic-science-pack-1-no-beryllium"].energy_required = recipe["se-astronomic-science-pack-1-no-beryllium"].energy_required / time_factor
recipe["se-astronomic-science-pack-2"].energy_required = recipe["se-astronomic-science-pack-2"].energy_required / time_factor
recipe["se-astronomic-science-pack-3"].energy_required = recipe["se-astronomic-science-pack-3"].energy_required / time_factor
recipe["se-astronomic-science-pack-4"].energy_required = recipe["se-astronomic-science-pack-4"].energy_required / time_factor
recipe["se-biological-science-pack-1"].energy_required = recipe["se-biological-science-pack-1"].energy_required / time_factor
recipe["se-biological-science-pack-2"].energy_required = recipe["se-biological-science-pack-2"].energy_required / time_factor
recipe["se-biological-science-pack-3"].energy_required = recipe["se-biological-science-pack-3"].energy_required / time_factor
recipe["se-biological-science-pack-4"].energy_required = recipe["se-biological-science-pack-4"].energy_required / time_factor
recipe["se-energy-science-pack-1"].energy_required = recipe["se-energy-science-pack-1"].energy_required / time_factor
recipe["se-energy-science-pack-2"].energy_required = recipe["se-energy-science-pack-2"].energy_required / time_factor
recipe["se-energy-science-pack-3"].energy_required = recipe["se-energy-science-pack-3"].energy_required / time_factor
recipe["se-energy-science-pack-4"].energy_required = recipe["se-energy-science-pack-4"].energy_required / time_factor
recipe["se-material-science-pack-1"].energy_required = recipe["se-material-science-pack-1"].energy_required / time_factor
recipe["se-material-science-pack-2"].energy_required = recipe["se-material-science-pack-2"].energy_required / time_factor
recipe["se-material-science-pack-3"].energy_required = recipe["se-material-science-pack-3"].energy_required / time_factor
recipe["se-material-science-pack-4"].energy_required = recipe["se-material-science-pack-4"].energy_required / time_factor

recipe["se-deep-space-science-pack-1"].energy_required = recipe["se-deep-space-science-pack-1"].energy_required / time_factor
recipe["se-deep-space-science-pack-2"].energy_required = recipe["se-deep-space-science-pack-2"].energy_required / time_factor
recipe["se-deep-space-science-pack-3"].energy_required = recipe["se-deep-space-science-pack-3"].energy_required / time_factor
recipe["se-deep-space-science-pack-4"].energy_required = recipe["se-deep-space-science-pack-4"].energy_required / time_factor