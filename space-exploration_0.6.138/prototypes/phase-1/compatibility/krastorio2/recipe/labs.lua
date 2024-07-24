local data_util = require("data_util")

-- Singularity Lab Recipe
data.raw.recipe["kr-singularity-lab"].category = "space-manufacturing"
data.raw.recipe["kr-singularity-lab"].ingredients = { -- this needs to change too much to make item by item changes
  {"se-space-science-lab", 1},
  {"se-space-radiator-2",8},
  {"se-space-hypercooler",2},
  {"ai-core", 50}, -- Biological
  {"se-heavy-composite",50}, -- Material
  {"se-dynamic-emitter",50}, -- Energy
  {"se-nanomaterial",50}, -- Astronomic
  { type = "fluid", name = "se-space-coolant-supercooled", amount = 2000},
}

-- Replace Battery with Lithium-Sulfur Battery in the Space Science Laboratory recipe
data_util.replace_or_add_ingredient("se-space-science-lab","battery","lithium-sulfur-battery",10)