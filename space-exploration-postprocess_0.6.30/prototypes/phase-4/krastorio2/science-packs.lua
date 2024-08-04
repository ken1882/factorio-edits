
-- Reconcile conflicting recipes
data.raw.recipe["production-science-pack"].ingredients = {
  {name = "productivity-module", amount = 1},
  {name = "uranium-238", amount = 2},
  {name = "se-vulcanite-block", amount = 4},
  {name = "se-machine-learning-data", amount = 1},
  {name = "se-iron-ingot", amount = 8},
  {type = "fluid", name = "se-plasma-stream", amount = 100},
}

data.raw.recipe["utility-science-pack"].ingredients = {
  {name = "se-space-transport-belt", amount = 1},
  {name = "effectivity-module", amount = 1},
  {name = "processing-unit", amount = 1},
  {name = "se-cryonite-rod", amount = 6},
  {name = "se-machine-learning-data", amount = 4},
  {type = "fluid", name = "se-space-coolant-warm", amount = 20},
}