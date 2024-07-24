local data_util = require("data_util")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "magnetic-canister",
  ingredients = {
    { data_util.mod_prefix .. "canister", 1},
    { "battery", 1},
    { data_util.mod_prefix .. "superconductive-cable", 1},
  },
  results = {
    { data_util.mod_prefix .. "magnetic-canister", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bioelectrics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 3},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 20},
  },
  results = {
    { name = data_util.mod_prefix .. "bioelectrics-data", amount_min = 3, amount_max = 3, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 3, amount_max = 3, probability = 0.09},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "bioelectrics-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "conductivity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = "copper-plate", amount = 4},
    { name = data_util.mod_prefix .. "holmium-plate", amount = 1},
    { name = "electronic-circuit", amount = 2},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "conductivity-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "conductivity-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "superconductivity-data",
  ingredients = {
    { name = data_util.mod_prefix .. "holmium-cable", amount = 2},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "superconductivity-data", amount_min = 1, amount_max = 1, probability = 0.7},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.29},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "superconductivity-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "superconductive-cable",
  ingredients = {
    { name = data_util.mod_prefix .. "holmium-cable", amount = 2},
    { name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "superconductive-cable", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 10},
  },
  energy_required = 30,
  main_product = data_util.mod_prefix .. "superconductive-cable",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "forcefield-data",
  ingredients = {
    { name = data_util.mod_prefix .. "polarisation-data", amount = 1},
    { name = data_util.mod_prefix .. "electromagnetic-field-data", amount = 1},
    { name = data_util.mod_prefix .. "holmium-cable", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "forcefield-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "empty-data", amount_min = 1, amount_max = 1, probability = 1},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "forcefield-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "neural-anomaly-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = "processing-unit", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 20},
  },
  results = {
    { name = data_util.mod_prefix .. "neural-anomaly-data", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.49},
    { name = "processing-unit", amount_min = 1, amount_max = 1, probability = 0.75},
    { type = "fluid", name = data_util.mod_prefix .. "neural-gel-2", amount = 15},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "neural-anomaly-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "electromagnetic-field-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-cold", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "electromagnetic-field-data", amount_min = 1, amount_max = 1, probability = 0.95},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.04},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "electromagnetic-field-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "electrical-shielding-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
    { name = "plastic-bar", amount = 1 },
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "electrical-shielding-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 5},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.75 },
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "electrical-shielding-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "naquium-energy-data",
  ingredients = {
    { name = data_util.mod_prefix .. "naquium-crystal", amount = 1},
    { name = data_util.mod_prefix .. "ion-canister", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
  },
  results = {
    { name = data_util.mod_prefix .. "naquium-energy-data", amount = 1},
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 25},
  },
  energy_required = 8,
  main_product = data_util.mod_prefix .. "naquium-energy-data",
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})


data_util.make_recipe({
  name =  data_util.mod_prefix .. "railgun",
  ingredients = {
    { "plastic-bar", 10},
    { data_util.mod_prefix .. "heavy-girder", 10},
    { "copper-cable", 1000},
  },
  results = {
    {  data_util.mod_prefix .. "railgun", 1},
  },
  energy_required = 30,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.make_recipe({
  name =  data_util.mod_prefix .. "railgun-ammo",
  ingredients = {
    { data_util.mod_prefix .. "heavy-girder", 1},
    { "battery", 10},
  },
  results = {
    {  data_util.mod_prefix .. "railgun-ammo", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data_util.make_recipe({
  name = data_util.mod_prefix .. "tesla-gun",
  ingredients = {
    { "plastic-bar", 10},
    { data_util.mod_prefix .. "holmium-plate", 10},
    { data_util.mod_prefix .. "holmium-cable", 10},
    { type = "fluid", name = data_util.mod_prefix .. "ion-stream", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "tesla-gun", 1},
  },
  energy_required = 60,
  category = "space-electromagnetics",
  enabled = false,
})
data_util.make_recipe({
  name = data_util.mod_prefix .. "tesla-ammo",
  ingredients = {
    { "battery", 10},
    { data_util.mod_prefix .. "holmium-plate", 1},
  },
  results = {
    { data_util.mod_prefix .. "tesla-ammo", 1},
  },
  energy_required = 10,
  category = "space-electromagnetics",
  enabled = false,
  always_show_made_in = true,
})

data:extend({
  { -- 1
    type = "recipe",
    name = data_util.mod_prefix .. "holmium-cable",
    results = {{data_util.mod_prefix .. "holmium-cable", 2}},
    energy_required = 1,
    ingredients = {
      { data_util.mod_prefix .. "holmium-plate", 2 },
      { "plastic-bar", 1 },
    },
    category = "crafting-or-electromagnetics",
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  { -- 16
    type = "recipe",
    name = data_util.mod_prefix .. "holmium-solenoid",
    result = data_util.mod_prefix .. "holmium-solenoid",
    energy_required = 2,
    ingredients = {
      { "iron-stick", 1 },
      { data_util.mod_prefix .. "holmium-cable", 8 },
      { data_util.mod_prefix .. "holmium-plate", 8 },
    },
    category = "crafting-or-electromagnetics",
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    enabled = false,
  },
  { -- 64
    type = "recipe",
    name = data_util.mod_prefix .. "quantum-processor",
    result = data_util.mod_prefix .. "quantum-processor",
    result_count = 1,
    energy_required = 16,
    ingredients = {
      { "processing-unit", 4 },
      { data_util.mod_prefix .. "holmium-cable", 32 },
      { data_util.mod_prefix .. "holmium-plate", 32 },
      { data_util.mod_prefix .. "quantum-phenomenon-data", 1},
    },
    category = "space-electromagnetics",
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
  },
  { -- 128
    type = "recipe",
    name = data_util.mod_prefix .. "dynamic-emitter",
    result = data_util.mod_prefix .. "dynamic-emitter",
    energy_required = 6,
    ingredients = {
      { data_util.mod_prefix .. "cryonite-rod", 4 },
      { data_util.mod_prefix .. "holmium-solenoid", 4 },
      { data_util.mod_prefix .. "quantum-processor", 1 },
      { type = "fluid", name = data_util.mod_prefix .. "particle-stream", amount = 10 },
    },
    category = "space-electromagnetics",
    requester_paste_multiplier = 1,
    always_show_made_in = true,
    enabled = false,
  },
})
