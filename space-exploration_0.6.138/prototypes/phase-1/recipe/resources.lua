local data_util = require("data_util")
local RecipeTints = require("prototypes/recipe-tints")

data:extend({
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "beryllium-sulfate",
    main_product = data_util.mod_prefix .. "beryllium-sulfate",
    results = {
      {name = data_util.mod_prefix .. "beryllium-sulfate", amount = 1}, -- 4
      {name = "sand", probability = 0.25, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {type = "fluid", name = "water", amount = 1, catalyst_amount = 1},
    },
    energy_required = 2,
    ingredients = {
      {type = "fluid", name="sulfuric-acid", amount = 1}, -- 1 per 4 plate
      {name = data_util.mod_prefix .. "beryllium-ore", amount = 4}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.beryllium_tint,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "beryllium-hydroxide",
    main_product = data_util.mod_prefix .. "beryllium-hydroxide",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "beryllium-hydroxide", amount = 50}, --2
    },
    energy_required = 15,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1}, -- 1 per 10 plate
      {type = "fluid", name="water", amount = 25},
      {name = data_util.mod_prefix .. "beryllium-sulfate", amount = 25}
    },
    subgroup = "beryllium",
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.beryllium_tint,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "beryllium-powder",
    main_product = data_util.mod_prefix .. "beryllium-powder",
    results = {
      {name = data_util.mod_prefix .. "beryllium-powder", amount = 4}, -- 2
      {type = "fluid", name = "water", amount = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "beryllium-hydroxide", amount = 4},
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.beryllium_tint,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "molten-beryllium",
    subgroup = "beryllium",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-beryllium", amount = 250}, --0.4
    },
    energy_required = 75,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10}, -- 1 block) per 10 plate
      {name = data_util.mod_prefix .. "beryllium-powder", amount = 50},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-d"
  },
  {
    type = "recipe",
    category = "casting",
    name = data_util.mod_prefix .. "beryllium-ingot",
    results = {
      {name = data_util.mod_prefix .. "beryllium-ingot", amount = 1}, -- 100
    },
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-beryllium", amount = 250},
      {name = "sand", amount = 2},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-e"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "beryllium-ingot-no-vulcanite",
    results = {
      {name = data_util.mod_prefix .. "beryllium-ingot", amount = 1},
    },
    icons = data_util.sub_icons(data.raw.item[data_util.mod_prefix .. "beryllium-ingot"].icon,
                                data.raw.item["coal"].icon),
    energy_required = 25,
    ingredients = {
      {name = data_util.mod_prefix .. "beryllium-powder", amount = 100},
      {name = "coal", amount = 10},
      {name = "sand", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-e-b"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "beryllium-ingot-to-plate",
    results = {
      {name = data_util.mod_prefix .. "beryllium-plate", amount = 10}, -- 10
    },
    energy_required = 5,
    ingredients = {
      {name = data_util.mod_prefix .. "beryllium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-f"
  },
  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "cryonite-powder",
    main_product = data_util.mod_prefix .. "cryonite-powder",
    results = {
      {name = data_util.mod_prefix .. "cryonite-powder", amount = 1}, --1
      {name = "sand", amount_min = 1, amount_max = 1, probability = 0.25, catalyst_amount = 1},
    },
    energy_required = 0.5,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-crystal",
    main_product = data_util.mod_prefix .. "cryonite-crystal",
    results = {
      {name = data_util.mod_prefix .. "cryonite-crystal", amount = 1}, -- 4
      {type = "fluid", name="water", amount = 4, catalyst_amount = 4},
    },
    energy_required = 3,
    ingredients = {
      {type = "fluid", name="steam", amount = 6, catalyst_amount = 6},
      {name = data_util.mod_prefix .. "cryonite-powder", amount = 4}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.cryonite_tint,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "cryonite-rod",
    results = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1}, -- 10
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-crystal", amount = 2},
      {name = data_util.mod_prefix .. "cryonite-powder", amount = 2},
      {type = "fluid", name = "heavy-oil", amount = 1},
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-ion-exchange-beads",
    results = {
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 10},
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
      {name = "plastic-bar", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 5},
      {type = "fluid", name = "steam", amount = 5},
    },
    crafting_machine_tint = RecipeTints.cryonite_tint,
    enabled = false,
    always_show_made_in = true,
    order = "a-d"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-slush",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {name = data_util.mod_prefix .. "cryonite-rod", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 1},
    },
    crafting_machine_tint = RecipeTints.cryonite_tint,
    subgroup = "cryonite",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-e"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-lubricant",
    results = {
      {type = "fluid", name = "lubricant", amount = 20},
    },
    energy_required = 5,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
      {type = "fluid", name = "heavy-oil", amount = 1},
    },
    icons = data_util.sub_icons(data.raw.fluid["lubricant"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "cryonite-slush"].icon),
    subgroup = "oil",
    crafting_machine_tint = data.raw["recipe"]["lubricant"].crafting_machine_tint,
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "l-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-to-water-ice",
    results = {
      {name = data_util.mod_prefix .. "water-ice", amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 1},
      {type = "fluid", name = "water", amount = 100},
    },
    crafting_machine_tint = RecipeTints.cryonite_tint,
    subgroup = "water",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "cryonite-to-methane-ice",
    results = {
      {name = data_util.mod_prefix .. "methane-ice", amount = 10},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 10},
      {type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 100},
    },
    crafting_machine_tint = RecipeTints.methane_tint,
    subgroup = "chemical",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "steam-to-water",
    results = {
      {type = "fluid", name = "water", amount = 99},
    },
    energy_required = 0.5,
    ingredients = {
      {type = "fluid", name = "steam", amount = 100},
    },
    subgroup = "water",
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    crafting_machine_tint = RecipeTints.water_tint,
    order = "a-b"
  },

  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "holmium-ore-crushed",
    main_product = data_util.mod_prefix .. "holmium-ore-crushed",
    results = {
      {name = data_util.mod_prefix .. "holmium-ore-crushed", amount = 1}, -- 2
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25, catalyst_amount = 1}
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "holmium-ore", amount = 2}
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "holmium-chloride",
    main_product = data_util.mod_prefix .. "holmium-chloride",
    results = {
      {name = data_util.mod_prefix .. "holmium-chloride", probability = 0.25, amount_min = 1, amount_max = 1}, -- 4
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "holmium-ore-crushed", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = "sand", probability = 0.1, amount_min = 1, amount_max = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 1, catalyst_amount = 1,},
      {name = data_util.mod_prefix .. "holmium-ore-crushed", amount = 1, catalyst_amount = 1,}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.holmium_tint,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "centrifuging",
    name = data_util.mod_prefix .. "holmium-powder",
    main_product = data_util.mod_prefix .. "holmium-powder",
    results = {
      {name = data_util.mod_prefix .. "holmium-powder", amount = 10}, -- 2
    },
    energy_required = 1,
    ingredients = {
      {name = "copper-cable", amount = 1},
      {name = data_util.mod_prefix .. "holmium-chloride", amount = 5}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.holmium_tint,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "molten-holmium",
    subgroup = "holmium",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-holmium", amount = 250}, -- 0.4
    },
    energy_required = 75,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10},
      {name = data_util.mod_prefix .. "holmium-powder", amount = 50},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-d"
  },
  {
    type = "recipe",
    category = "casting",
    name = data_util.mod_prefix .. "holmium-ingot",
    results = {
      {name = data_util.mod_prefix .. "holmium-ingot", amount = 1}, -- 100
    },
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-holmium", amount = 250},
      {name = "sand", amount = 2},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-e"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "holmium-ingot-no-vulcanite",
    results = {
      {name = data_util.mod_prefix .. "holmium-ingot", amount = 1},
    },
    icons = data_util.sub_icons(data.raw.item[data_util.mod_prefix .. "holmium-ingot"].icon,
                                data.raw.item["coal"].icon),
    energy_required = 25,
    ingredients = {
      {name = data_util.mod_prefix .. "holmium-powder", amount = 100},
      {name = "coal", amount = 10},
      {name = "sand", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-e-b"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "holmium-ingot-to-plate",
    results = {
      {name = data_util.mod_prefix .. "holmium-plate", amount = 10}, -- 10
    },
    energy_required = 2.5,
    ingredients = {
      {name = data_util.mod_prefix .. "holmium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-f"
  },
  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "iridium-ore-crushed",
    main_product = data_util.mod_prefix .. "iridium-ore-crushed",
    results = {
      {name = data_util.mod_prefix .. "iridium-ore", amount_min = 1, amount_max = 1, probability = 0.4, catalyst_amount = 1}, -- uses 0.6 -- catalyst trick: a higher catalyst amount than the result ends up with a "consumed" stat
      {name = data_util.mod_prefix .. "iridium-ore-crushed", amount_min = 1, amount_max = 1, probability = 0.3}, -- 2 -- produces 0.3
      {name = "sand", amount_min = 1, amount_max = 1, probability = 0.1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-ore", amount = 1, catalyst_amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "iridium-powder",
    main_product = data_util.mod_prefix .. "iridium-powder",
    results = {
      {name = data_util.mod_prefix .. "iridium-powder", probability = 0.5, amount_min = 1, amount_max = 1},  -- 2
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", probability = 0.66, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "iridium-ore-crushed", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = "sand", probability = 0.1, amount_min = 1, amount_max = 1, catalyst_amount = 1},
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name="water", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", amount = 1, catalyst_amount = 1,},
      {name = data_util.mod_prefix .. "iridium-ore-crushed", amount = 1, catalyst_amount = 1,}
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.iridium_tint,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "centrifuging",
    name = data_util.mod_prefix .. "iridium-blastcake",
    results = {
      {name = data_util.mod_prefix .. "iridium-blastcake", amount = 4}, -- 10
    },
    energy_required = 20,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-powder", amount = 20},
      {name = data_util.mod_prefix .. "vulcanite-enriched", amount = 1},
    },
    crafting_machine_tint = RecipeTints.iridium_centri_tint,
    enabled = false,
    always_show_made_in = true,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "iridium-ingot",
    main_product = data_util.mod_prefix .. "iridium-ingot",
    results = {
      {type = "fluid", name="steam", amount = 5, catalyst_amount = 5, temperature = 165},
      {name = data_util.mod_prefix .. "iridium-ingot", amount = 1}, -- 100
    },
    energy_required = 50,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-blastcake", amount = 10},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 5},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-d"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "iridium-ingot-to-plate", -- 10
    results = {
      {name = data_util.mod_prefix .. "iridium-plate", amount = 10},
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "iridium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-e"
  },
  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "naquium-ore-crushed",
    main_product = data_util.mod_prefix .. "naquium-ore-crushed",
    results = {
      {name = data_util.mod_prefix .. "naquium-ore-crushed", amount = 2}, -- 4
      {name = data_util.mod_prefix .. "iridium-powder", probability = 0.1, amount_min=1, amount_max=1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "iridium-plate", probability = 0.8, amount_min=1, amount_max=1, catalyst_amount = 1},
      {type = "fluid", name = "water", amount = 10},
    },
    energy_required = 4,
    ingredients = {
      {name = data_util.mod_prefix .. "naquium-ore", amount = 8},
      {name = data_util.mod_prefix .. "iridium-plate", amount = 1, catalyst_amount = 1},
    },
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = true,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "naquium-refined",
    main_product = data_util.mod_prefix .. "naquium-refined",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", probability = 0.5, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "beryllium-powder", probability = 0.2, amount_min=1, amount_max=1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "naquium-refined", amount_min = 5, amount_max = 7}, --6 -- value 4
      {name = data_util.mod_prefix .. "naquium-powder", amount_min = 3, amount_max = 5}, --4 -- value 4
      {type = "fluid", name = "water", amount = 1},
    },
    energy_required = 10,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "cryonite-slush", amount = 1},
      {type = "fluid", name = data_util.mod_prefix .. "beryllium-hydroxide", amount = 2},
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "naquium-ore-crushed", amount = 10}
    },
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = true,
    crafting_machine_tint = RecipeTints.naq_tint,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "naquium-powder",
    main_product = data_util.mod_prefix .. "naquium-powder",
    results = {
      {name = data_util.mod_prefix .. "cryonite-ion-exchange-beads", amount_min = 0, amount_max = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "holmium-powder", probability = 0.2, amount_min = 1, amount_max = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "naquium-refined", amount_min = 4, amount_max = 8}, -- 6 -- value 4
      {name = data_util.mod_prefix .. "naquium-powder", amount_min = 10, amount_max = 16}, -- 14 -- value 4
      {type = "fluid", name = "sulfuric-acid", amount = 1},
    },
    energy_required = 20,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "vitalic-acid", amount = 1},
      {name = data_util.mod_prefix .. "holmium-cable", amount = 1},
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", amount = 2, catalyst_amount = 2},
      {name = data_util.mod_prefix .. "naquium-ore-crushed", amount = 20}
    },
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = true,
    crafting_machine_tint = RecipeTints.naq_tint,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "centrifuging",
    name = data_util.mod_prefix .. "naquium-crystal",
    main_product = data_util.mod_prefix .. "naquium-crystal",
    results = {
      {name = data_util.mod_prefix .. "naquium-crystal", probability = 0.618, amount_min=1, amount_max=1}, -- value 60 ish
      {name = data_util.mod_prefix .. "naquium-powder", amount_min=1, amount_max=6, catalyst_amount = 10}, -- catalyst trick: a higher catalyst amount than the result ends up with a "consumed" stat
      {name = data_util.mod_prefix .. "naquium-refined", amount_min=1, amount_max=4, catalyst_amount = 8},
      {name = data_util.mod_prefix .. "vitalic-reagent", probability = 1-0.618, amount_min=1, amount_max=1, catalyst_amount = 1},
    },
    energy_required = 16,
    ingredients = {
      {name = data_util.mod_prefix .. "vitalic-reagent", amount = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "naquium-powder", amount = 10, catalyst_amount = 10},
      {name = data_util.mod_prefix .. "naquium-refined", amount = 8, catalyst_amount = 8},
    },
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    show_amount_in_title = true,
    crafting_machine_tint = RecipeTints.naq_centri_tint,
    order = "a-d"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "naquium-ingot",
    results = {
      {name = data_util.mod_prefix .. "naquium-ingot", amount = 1}, -- value 200 ish
    },
    energy_required = 150,
    ingredients = {
      {name = data_util.mod_prefix .. "naquium-crystal", amount = 2},
      {name = data_util.mod_prefix .. "naquium-refined", amount = 8},
      {name = data_util.mod_prefix .. "naquium-powder", amount = 8},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 25},
      {type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 25},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-e"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "naquium-ingot-to-plate",
    main_product = data_util.mod_prefix .. "naquium-plate",
    results = {
      {name = data_util.mod_prefix .. "naquium-plate", amount = 10}, -- value 20 ish
      {name = data_util.mod_prefix .. "heavy-bearing", amount_min=1, amount_max=1, probability=0.95, catalyst_amount = 1}
    },
    energy_required = 4,
    ingredients = {
      {name = data_util.mod_prefix .. "heavy-bearing", amount = 1, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "naquium-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-f"
  },

  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "vitamelange-nugget",
    main_product = data_util.mod_prefix .. "vitamelange-nugget",
    results = {
      {name = "wood", amount_min=0, amount_max=2, catalyst_amount = 2},
      {name = "stone",  amount_min=0, amount_max=4, catalyst_amount = 4},
      {name = data_util.mod_prefix .."vitamelange-nugget", amount_min=15, amount_max=25}, -- 0.5
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "vitamelange", amount = 10}
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "vitamelange-bloom",
    results = {
      {name = data_util.mod_prefix .. "vitamelange-bloom", amount = 15}, -- 1
    },
    energy_required = 15,
    ingredients = {
      {name = data_util.mod_prefix .. "vitamelange-nugget", amount = 30},
      {type = "fluid", name = "water", amount = 300},
      {name = "sand", amount = 15},
    },
    crafting_machine_tint = RecipeTints.vita_tint,
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "vitamelange-spice",
    main_product = data_util.mod_prefix .. "vitamelange-spice",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "methane-gas", amount = 5},
      {name = data_util.mod_prefix .. "vitamelange-spice", amount = 40}, -- 5
      {name = data_util.mod_prefix .. "vitamelange-extract", amount_min=1, amount_max=1, probability=0.1}
    },
    energy_required = 100,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
      {name = data_util.mod_prefix .. "vitamelange-bloom", amount = 200}
    },
    crafting_machine_tint = RecipeTints.vita_tint,
    enabled = false,
    always_show_made_in = true,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "vitamelange-extract",
    main_product = data_util.mod_prefix .. "vitamelange-extract",
    results = {
      {name = data_util.mod_prefix .. "vitamelange-spice", amount = 20, catalyst_amount = 20},
      {name = data_util.mod_prefix .. "vitamelange-extract", amount_min=4, amount_max=8, catalyst_amount = 1}, -- 5, value 10
      {type = "fluid", name = "light-oil", amount = 1},
    },
    energy_required = 15,
    ingredients = {
      {name = data_util.mod_prefix .. "vitamelange-spice", amount = 30, catalyst_amount = 20},
      {name = data_util.mod_prefix .. "vitamelange-extract", amount = 1, catalyst_amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    crafting_machine_tint = RecipeTints.vita_centri_tint,
    order = "a-d"
  },

  {
    type = "recipe",
    category = "pulverising",
    name = data_util.mod_prefix .. "vulcanite-crushed",
    main_product = data_util.mod_prefix .. "vulcanite-crushed",
    results = {
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.25},
      {name = data_util.mod_prefix .. "vulcanite-crushed", amount = 3}, -- 2
      {name = data_util.mod_prefix .. "vulcanite-enriched", amount_min=1, amount_max=1, probability=0.1},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite", amount = 6},
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    crafting_machine_tint = RecipeTints.vulcanite_tint,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "centrifuging",
    name = data_util.mod_prefix .. "vulcanite-enriched",
    main_product = data_util.mod_prefix .. "vulcanite-enriched",
    results = {
      {name = "sand", amount_min = 1, amount_max = 1, probability = 0.2, catalyst_amount = 1},
      {name = data_util.mod_prefix .. "vulcanite-enriched", amount = 4, catalyst_amount = 1}, -- 4
      {name = data_util.mod_prefix .. "vulcanite-crushed", amount = 4, catalyst_amount = 4}
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-crushed", amount = 10, catalyst_amount = 4},
      {name = data_util.mod_prefix .. "vulcanite-enriched", amount = 1, catalyst_amount = 1},
      {name = "sulfur", amount = 1},
    },
    enabled = false,
    always_show_made_in = true,
    crafting_machine_tint = RecipeTints.vulcanite_centri_tint,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "vulcanite-block",
    main_product = data_util.mod_prefix .. "vulcanite-block",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1}, -- 10
      {type = "fluid", name="steam", amount = 4, temperature = 165, catalyst_amount = 4},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-crushed", amount = 1},
      {name = data_util.mod_prefix .. "vulcanite-enriched", amount = 2},
      {type = "fluid", name="water", amount = 5, catalyst_amount = 5},
      {type = "fluid", name="petroleum-gas", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-c"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "pyroflux",
    subgroup = "vulcanite",
    main_product = data_util.mod_prefix .. "pyroflux",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10},
    },
    energy_required = 1,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
      {name = "sand", amount = 1}
    },
    crafting_machine_tint = RecipeTints.pyroflux_tint,
    enabled = false,
    always_show_made_in = true,
    order = "a-d"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "pyroflux-steam",
    localised_name = {"recipe-name."..data_util.mod_prefix .. "pyroflux-steam"},
    subgroup = "vulcanite",
    icons = data_util.sub_icons(data.raw.fluid["steam"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "pyroflux"].icon),
    main_product = "steam",
    results = {
      {type = "fluid", name="steam", amount = 500, temperature = 165},
      {name = "stone", amount_min = 1, amount_max = 1, probability = 0.1},
      {name = "iron-ore", amount_min = 1, amount_max = 1, probability = 0.01},
      {name = "copper-ore", amount_min = 1, amount_max = 1, probability = 0.01}
    },
    energy_required = 1,
    ingredients = {
      {type = "fluid", name = "water", amount = 500},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 5},
    },
    enabled = false,
    always_show_made_in = true,
    order = "a-e"
  },
  {
    type = "recipe",
    category = "chemistry",
    name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads",
    results = {
      {name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads", amount = 10},
    },
    energy_required = 10,
    ingredients = {
      {name = data_util.mod_prefix .. "vulcanite-block", amount = 1},
      {name = "plastic-bar", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 5},
      {type = "fluid", name = "steam", amount = 5},
    },
    crafting_machine_tint = RecipeTints.vulcanite_tint,
    enabled = false,
    always_show_made_in = true,
    order = "a-e"
  },


})
