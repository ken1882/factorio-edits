local data_util = require("data_util")

local function move_technology(tech_name, techs_to_add, ingredients_to_add, techs_to_remove, ingredients_to_remove)
  if ingredients_to_remove then
    data_util.tech_remove_ingredients(tech_name, ingredients_to_remove)
  end
  if techs_to_remove then
    data_util.tech_remove_prerequisites(tech_name, techs_to_remove)
  end
  if ingredients_to_add then
    data_util.tech_add_ingredients(tech_name, ingredients_to_add)
  end
  if techs_to_add then
    data_util.tech_add_prerequisites(tech_name, techs_to_add)
  end
end

---- Lab Research Speed ----
-- SE has Lab Research Speed as Utility Only, encforced in technology.lua so we make our changes here.
move_technology(
  "research-speed-3",
  {"laser"},
  nil,
  {"chemical-science-pack"}
)

move_technology(
  "research-speed-4",
  {"automation-3"},
  nil,
  {"space-science-pack"}
)

move_technology(
  "research-speed-5",
  {"kr-optimization-tech-card"},
  {"kr-optimization-tech-card"},
  {"utility-science-pack","production-science-pack"},
  {"utility-science-pack"}
)

move_technology(
  "research-speed-6",
  {"se-space-simulation-asbm"},
  {"kr-optimization-tech-card","production-science-pack","se-material-science-pack-1","se-astronomic-science-pack-1","se-biological-science-pack-1"},
  {"se-energy-science-pack-1","utility-science-pack"}
)