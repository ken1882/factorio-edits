local data_util = require("data_util")

local path = "prototypes/phase-1/compatibility/krastorio2/recipe/"

-- This source is dedicated to making changes to K2 and SE recipes

-- Ordering changes for recipes are collated in this sources for ease of cross referencing
require(path .. "recipe_ordering")

-- Bulk recipes
require(path .. "containers")
require(path .. "miners")
require(path .. "power")
require(path .. "assemblers")
require(path .. "logistics")
require(path .. "military")
require(path .. "intermediates")
require(path .. "resources")
require(path .. "science")
require(path .. "labs")
require(path .. "delivery-cannon")
require(path .. "matter")
require(path .. "smelt-crafting")

-- Individual recipes, files named by recipe name
require(path .. "se-dimensional-anchor")
