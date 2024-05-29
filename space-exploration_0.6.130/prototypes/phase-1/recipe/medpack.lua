local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "medpack",
  ingredients = {
    { "raw-fish", 5},
    { "wood", 5},
    { "iron-plate", 1},
  },
  results = {
    { data_util.mod_prefix .. "medpack", 1},
  },
  order = "a-a-a",
  energy_required = 10,
  category = "crafting",
  enabled = false,
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "medpack-plastic",
  ingredients = {
    { "iron-plate", 1},
    { "plastic-bar", 5},
    { type = "fluid", name =  "water" , amount = 100},
    { type = "fluid", name =  "heavy-oil" , amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "medpack", 1},
  },
  order = "a-a-b",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "medpack-2",
  ingredients = {
    { data_util.mod_prefix .. "medpack", 1},
    { data_util.mod_prefix .. "canister", 1},
    { type = "fluid", name =  "petroleum-gas" , amount = 100},
  },
  results = {
    { data_util.mod_prefix .. "medpack-2", 1},
  },
  order = "a-b",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "medpack-3",
  ingredients = {
    { data_util.mod_prefix .. "medpack-2", 1},
    { data_util.mod_prefix .. "specimen", 1},
    { type = "fluid", name =  data_util.mod_prefix .. "chemical-gel" , amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "medpack-3", 1},
  },
  order = "a-c",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "medpack-4",
  ingredients = {
    { data_util.mod_prefix .. "medpack-3", 1},
    { data_util.mod_prefix .. "significant-specimen", 1},
    { data_util.mod_prefix .. "self-sealing-gel", 1},
    { type = "fluid", name =  data_util.mod_prefix .. "neural-gel-2" , amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "medpack-4", 1},
  },
  order = "a-d",
  energy_required = 10,
  category = "lifesupport",
  enabled = false,
  always_show_made_in = true,
})
