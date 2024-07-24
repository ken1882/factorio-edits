local data_util = require("data_util")
local make_recipe = data_util.make_recipe

--[[
Recipes that don't have alternate versions get the default tint.
Recipes that have alternate versions get two separate non-default tints for each recipe.  
]]

make_recipe({
  name = data_util.mod_prefix .. "darkmatter-data",
  ingredients = {
    { data_util.mod_prefix .. "gravitational-lensing-data", 1 },
    { data_util.mod_prefix .. "negative-pressure-data", 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "darkmatter-data", amount_min = 1, amount_max = 1, probability = 0.9 },
    { data_util.mod_prefix .. "junk-data", 1 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.09 },
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "darkmatter-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/darkmatter.png",
  icon_size = 64,
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "gravitational-lensing-data",
  ingredients = {
    { data_util.mod_prefix .. "astrometric-data", 1 },
  },
  results = {
    { name = data_util.mod_prefix .. "gravitational-lensing-data", amount_min = 1, amount_max = 1, probability = 0.95 },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.04},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "gravitational-lensing-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/gravitational-lensing.png",
  icon_size = 64,
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

local pure_white = {r = 1.0, g = 1.0, b = 1.0, a= 1.0}


make_recipe({
  name = data_util.mod_prefix .. "timespace-anomaly-data",
  ingredients = {
    { data_util.mod_prefix .. "gravitational-lensing-data", 1 },
    { data_util.mod_prefix .. "micro-black-hole-data", 1 },
    { data_util.mod_prefix .. "negative-pressure-data", 1 },
    { data_util.mod_prefix .. "zero-point-energy-data", 1 },
    { data_util.mod_prefix .. "naquium-cube", 1 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "timespace-anomaly-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "gravitational-lensing-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "micro-black-hole-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "negative-pressure-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "zero-point-energy-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { name = data_util.mod_prefix .. "broken-data", amount_min = 1, amount_max = 1, probability = 0.6 },
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  crafting_machine_tint =
  {
    primary = pure_white,
    secondary = pure_white,
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "timespace-anomaly-data",
  icon = "__space-exploration-graphics__/graphics/icons/data/timespace-anomaly.png",
  icon_size = 64,
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "dark-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "negative-pressure-data", amount = 1},
    { name = data_util.mod_prefix .. "astrometric-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "dark-energy-data", amount_min = 1, amount_max = 1, probability = 0.75},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.24},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "dark-energy-data",
  category = "space-gravimetrics",
  enabled = false,
  always_show_made_in = true,
})


local space_fold_data_a = {r = 0.055, g = 0.0641, b = 0.805, a = 1.000}
local space_fold_data_b = {r = 0.055, g = 0.805, b = 0.217, a = 1.000}

make_recipe({
  name = data_util.mod_prefix .. "space-fold-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-fold-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-fold-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_fold_data_a,
    secondary = space_fold_data_b,
  },
})
make_recipe({
  name = data_util.mod_prefix .. "space-fold-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-fold-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-fold-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_fold_data_b,
    secondary = space_fold_data_a,
  },
})

local space_warp_data_a = {r = 0.546, g = 0.055, b = 0.805, a = 1.000}
local space_warp_data_b = {r = 0.055, g = 0.086, b = 0.805, a = 1.000}

make_recipe({
  name = data_util.mod_prefix .. "space-warp-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-warp-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-warp-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_warp_data_a,
    secondary = space_warp_data_b,
  },
})
make_recipe({
  name = data_util.mod_prefix .. "space-warp-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-warp-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-warp-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_warp_data_b,
    secondary = space_warp_data_a,
  },
})

local space_dialation_data_a = {r = 0.481, g = 0.805, b = 0.055, a = 1.000}
local space_dialation_data_b = {r = 0.805, g = 0.279, b = 0.055, a = 1.000}

make_recipe({
  name = data_util.mod_prefix .. "space-dilation-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-dilation-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 2},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-dilation-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_dialation_data_a,
    secondary = space_dialation_data_b,
  },
})
make_recipe({
  name = data_util.mod_prefix .. "space-dilation-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-dilation-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-dilation-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_dialation_data_b,
    secondary = space_dialation_data_a,
  },
})

local space_injection_data_a = {r = 0.805, g = 0.055, b = 0.055, a = 1.000}
local space_injection_data_b = {r = 0.805, g = 0.055, b = 0.569, a = 1.000}

make_recipe({
  name = data_util.mod_prefix .. "space-injection-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-injection-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 2},
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 0},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-injection-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_injection_data_a,
    secondary = space_injection_data_b,
  },
})
make_recipe({
  name = data_util.mod_prefix .. "space-injection-data-alt",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-data", amount = 1 },
    { name = data_util.mod_prefix .. "naquium-plate", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "space-injection-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 0},
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 20,
  main_product = data_util.mod_prefix .. "space-injection-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
  localised_description = {"space-exploration.arcosphere-random"},
  crafting_machine_tint =
  {
    primary = space_injection_data_b,
    secondary = space_injection_data_a,
  },
})

make_recipe({
  name = data_util.mod_prefix .. "wormhole-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { name = data_util.mod_prefix .. "arcosphere-a", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-c", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-e", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-g", amount = 1},
    { name = data_util.mod_prefix .. "naquium-cube", amount = 1},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "wormhole-data", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-b", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-d", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-f", amount = 1},
    { name = data_util.mod_prefix .. "arcosphere-h", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  crafting_machine_tint =
  {
    primary = pure_white,
    secondary = pure_white,
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "wormhole-data",
  category = "arcosphere",
  enabled = false,
  always_show_made_in = true,
})
