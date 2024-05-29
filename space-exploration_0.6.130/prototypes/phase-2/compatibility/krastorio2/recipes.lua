local data_util = require("data_util")

local recipe = data.raw.recipe
local tech = data.raw.technology
local fluid = data.raw.fluid

-- Solar Panel recipe
data_util.replace_or_add_ingredient("solar-panel","glass","glass",15)

-- Crusher does Crushing, not as fine a result as the pulveriser?

-- Merge the Sand/Glass recipes
data_util.tech_lock_recipes("kr-stone-processing",{"sand-from-stone"})
data.raw.recipe["sand-from-stone"].category = "crushing"

data_util.tech_lock_recipes("se-pulveriser",{"sand"})
data.raw.recipe["sand"].category = "pulverising"