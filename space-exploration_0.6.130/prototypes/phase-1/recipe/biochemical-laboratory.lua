local data_util = require("data_util")
local RecipeTints = require("prototypes/recipe-tints")
local make_recipe = data_util.make_recipe

make_recipe({
  name = data_util.mod_prefix .. "space-coolant",
  ingredients = {
    { type = "fluid", name = "heavy-oil", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 5},
    { name = "copper-plate", amount = 2},
    { name = "iron-plate", amount = 1},
    { name = "sulfur", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  crafting_machine_tint = RecipeTints.nutrient_tint,
  energy_required = 5,
  subgroup = "thermofluid",
  category = "space-biochemical",
  localised_name = {"fluid-name." .. data_util.mod_prefix .. "space-coolant"},
  always_show_made_in = true,
  order = "a-a",
})

make_recipe({
  name = data_util.mod_prefix .. "space-coolant-cryonite",
  ingredients = {
    { type = "fluid", name = "heavy-oil", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 2},
    { name = "copper-plate", amount = 2},
    { name = "iron-plate", amount = 1},
    { name = "sulfur", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-hot", amount = 10},
  },
  icons = data_util.sub_icons(data.raw.fluid[data_util.mod_prefix .. "space-coolant-hot"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "cryonite-slush"].icon),
  crafting_machine_tint = RecipeTints.nutrient_tint,
  energy_required = 5,
  subgroup = "thermofluid",
  category = "space-biochemical",
  localised_name = {"fluid-name." .. data_util.mod_prefix .. "space-coolant"},
  always_show_made_in = true,
  order = "a-b",
})

make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-from-fish",
  ingredients = {
    { name = "raw-fish", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 0.5, icon_size = 64  },
    { icon = data.raw.capsule["raw-fish"].icon, scale = 0.375, icon_size = 64  },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 10,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-fish"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "sludge",
  order = "a-d",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-from-wood",
  ingredients = {
    { name = "wood", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 1 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 1 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 0.5, icon_size = 64 },
    { icon = data.raw.item["wood"].icon, scale = 0.375, icon_size = 64 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 1,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-wood"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "sludge",
  order = "a-c",
  always_show_made_in = true,
})
make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-from-vitamelange",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "vitalic-acid", amount = 4},
    { name = data_util.mod_prefix .. "vitamelange-nugget", amount = 40},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 0.5, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "vitamelange-nugget"].icon, scale = 0.375, icon_size = 64 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 10,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge-from-vitamelange"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "sludge",
  order = "a-e",
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-sludge",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 },
    { name = data_util.mod_prefix .. "specimen", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 30 },
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 0.5, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "specimen"].icon, scale = 0.375, icon_size = 64 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 4,
  main_product = data_util.mod_prefix .. "bio-sludge",
  localised_name = {"recipe-name."..data_util.mod_prefix .. "bio-sludge"},
  category = "space-biochemical",
  enabled = false,
  subgroup = "sludge",
  order = "a-a",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "bio-sludge-crude-oil",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5 },
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 },
    { type = "fluid", name = "crude-oil", amount = 100 },
    { name = data_util.mod_prefix .. "contaminated-scrap", amount = 1 },
  },
  icons = {
    { icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon, scale = 0.5, icon_size = 64 },
    { icon = data.raw.item[data_util.mod_prefix .. "experimental-specimen"].icon, scale = 0.375, icon_size = 64 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 10,
  category = "space-biochemical",
  enabled = false,
  subgroup = "sludge",
  order = "a-b",
  allow_as_intermediate = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "biochemical-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "specimen", amount = 1},
    { name = data_util.mod_prefix .. "vitamelange-spice", amount = 1},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biochemical-data", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biochemical-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "cryogenics-data",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 3},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-supercooled", amount = 30},
  },
  results = {
    { name = data_util.mod_prefix .. "cryogenics-data", amount_min = 3, amount_max = 3, probability = 0.9},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 3, amount_max = 3, probability = 0.09},
    { type="fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-coolant-warm", amount = 30},
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 30,
  main_product = data_util.mod_prefix .. "cryogenics-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "biochemical-resistance-data",
  ingredients = {
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { name = data_util.mod_prefix .. "experimental-specimen", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "vitalic-acid", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 10},
  },
  results = {
    { name = data_util.mod_prefix .. "biochemical-resistance-data", amount_min = 1, amount_max = 1, probability = 0.9},
    { name = data_util.mod_prefix .. "experimental-specimen", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "junk-data", amount_min = 1, amount_max = 1, probability = 0.09},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 5 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 10,
  main_product = data_util.mod_prefix .. "biochemical-resistance-data",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nutrient-gel",
  ingredients = {
    { name = "coal", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 4},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 25},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  icons = data_util.sub_icons(data.raw.fluid[data_util.mod_prefix .. "nutrient-gel"].icon,
                              data.raw.item["coal"].icon),
  crafting_machine_tint = RecipeTints.nutrient_tint,
  energy_required = 5,
  category = "space-biochemical",
  subgroup = "gel",
  order = "b-a",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nutrient-gel-methane",
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 50},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 5},
    { type = "fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 20},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  icons = data_util.sub_icons(data.raw.fluid[data_util.mod_prefix .. "nutrient-gel"].icon,
                              data.raw.fluid[data_util.mod_prefix .. "methane-gas"].icon),
  crafting_machine_tint = RecipeTints.nutrient_tint,
  energy_required = 10,
  category = "space-biochemical",
  subgroup = "gel",
  order = "b-b",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "nutrient-vat",
  ingredients = {
    { name = "iron-plate", amount = 1},
    { name = "glass", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "nutrient-gel", amount = 50},
  },
  results = {
    { name = data_util.mod_prefix .. "nutrient-vat", amount = 5},
  },
  crafting_machine_tint = RecipeTints.nutrient_tint,
  energy_required = 10,
  category = "space-biochemical",
  order = "c-a",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "plague-bomb",
  ingredients = {
    { name = data_util.mod_prefix .. "significant-specimen", amount = 100},
    { name = data_util.mod_prefix .. "biological-catalogue-4", amount = 10},
    { type="fluid", name = data_util.mod_prefix .. "bio-sludge", amount = 1000},
    { type="fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 1000},
  },
  results = {
    { name = data_util.mod_prefix .. "plague-bomb", amount = 1 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 2000 },
  },
  crafting_machine_tint = RecipeTints.bio_sludge_tint,
  energy_required = 60,
  main_product = data_util.mod_prefix .. "plague-bomb",
  category = "space-biochemical",
  enabled = false,
  always_show_made_in = true,
})


make_recipe({
  name = data_util.mod_prefix .. "melting-water-ice",
  ingredients = {
    { name = data_util.mod_prefix .. "water-ice", amount = 1},
  },
  results = {
    { type = "fluid", name = "water", amount = 100},
  },
  crafting_machine_tint = RecipeTints.water_tint,
  energy_required = 0.25,
  subgroup = "water",
  category = "melting",
  always_show_made_in = true,
  order = "a-a",
})

make_recipe({
  name = data_util.mod_prefix .. "melting-methane-ice",
  ingredients = {
    { name = data_util.mod_prefix .. "methane-ice", amount = 1},
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 10},
  },
  crafting_machine_tint = RecipeTints.methane_tint,
  energy_required = 0.25,
  subgroup = "chemical",
  category = "melting",
  always_show_made_in = true,
  order = "a-ab",
})

make_recipe({
  name = data_util.mod_prefix .. "corrosion-resistance-data",
  ingredients = {
    { name = "glass", amount = 4},
    { name = data_util.mod_prefix .. "material-testing-pack", amount = 4},
    { name = data_util.mod_prefix .. "iridium-plate", amount = 1},
    { name = data_util.mod_prefix .. "empty-data", amount = 1},
    { type = "fluid", name =  data_util.mod_prefix .. "chemical-gel", amount = 5},
  },
  results = {
    { name = data_util.mod_prefix .. "corrosion-resistance-data", amount = 1},
    { name = data_util.mod_prefix .. "iridium-plate", amount_min = 1, amount_max = 1, probability = 0.5},
    { name = data_util.mod_prefix .. "scrap", amount = 6},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5},
  },
  energy_required = 10,
  main_product = data_util.mod_prefix .. "corrosion-resistance-data",
  category = "space-mechanical",
  enabled = false,
  always_show_made_in = true,
})
