local data_util = require("data_util")

se_chemical_science_pack_recipe_override()

-- show totals
if data.raw.recipe["sulfuric-acid"] then
  --data.raw.recipe["sulfuric-acid"].main_product = "sulfuric-acid"
  data.raw.recipe["sulfuric-acid"].allow_as_intermediate = true
  data.raw.recipe["sulfuric-acid"].allow_decomposition = true
end

if data.raw.item['electric-motor'] then
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "space-transport-belt", "iron-gear-wheel", 'electric-motor', 2)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "core-fragment-processor", "iron-gear-wheel", 'electric-motor', 15)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "meteor-point-defence", "iron-gear-wheel", 'electric-motor', 10)

  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "fluid-burner-generator", "iron-gear-wheel", 'electric-motor', 10)
  data_util.replace_or_add_ingredient(data_util.mod_prefix .. "fuel-refinery", "iron-gear-wheel", 'electric-motor', 20)
end

if data.raw.item["solid-sand"] and not data.raw.recipe["sand-to-solid-sand"]then -- angels sand
  data:extend({{
      type = "recipe",
      name = "sand-to-solid-sand",
      category = "washing-plant",
      normal = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results= { {type="item", name="solid-sand", amount=10} },
      },
      expensive = {
        energy_required = 0.5,
        enabled = false,
        ingredients = {
          {type="item", name="sand", amount=10},
          {type="fluid", name="water", amount=100},
        },
        results= { {type="item", name="solid-sand", amount=10} },
      },
  }})
end

data:extend({
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "molten-iron",
    subgroup = "iron",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-iron", amount = 900},
    },
    energy_required = 60,
    ingredients = {
      {name = "iron-ore", amount = 24},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "molten-copper",
    subgroup = "copper",
    results = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-copper", amount = 900},
    },
    energy_required = 60,
    ingredients = {
      {name = "copper-ore", amount = 24},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a-b"
  },
  {
    type = "recipe",
    category = "casting",
    name = data_util.mod_prefix .. "iron-ingot",
    results = {
      {name = data_util.mod_prefix .. "iron-ingot", amount = 1},
    },
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-iron", amount = 250},
    },
    icons = data_util.sub_icons(data.raw.item[data_util.mod_prefix .. "iron-ingot"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "molten-iron"].icon),
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-b-b"
  },
  {
    type = "recipe",
    category = "casting",
    name = data_util.mod_prefix .. "steel-ingot",
    results = {
      {name = data_util.mod_prefix .. "steel-ingot", amount = 1},
    },
    energy_required = 100,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-iron", amount = 500},
      {name = "coal", amount = 8},
    },
    icons = data_util.sub_icons(data.raw.item[data_util.mod_prefix .. "steel-ingot"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "molten-iron"].icon),
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "b-b"
  },
  {
    type = "recipe",
    category = "casting",
    name = data_util.mod_prefix .. "copper-ingot",
    results = {
      {name = data_util.mod_prefix .. "copper-ingot", amount = 1},
    },
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = data_util.mod_prefix .. "molten-copper", amount = 250},
    },
    icons = data_util.sub_icons(data.raw.item[data_util.mod_prefix .. "copper-ingot"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "molten-copper"].icon),
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-b"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "iron-ingot-to-plate",
    icons = data_util.sub_icons(data.raw.item["iron-plate"].icon,
                                data.raw.item[data_util.mod_prefix .. "iron-ingot"].icon),
    results = {
      {name = "iron-plate", amount = 10},
    },
    energy_required = 2.5,
    ingredients = {
      {name = data_util.mod_prefix .. "iron-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "steel-ingot-to-plate",
    icons = data_util.sub_icons(data.raw.item["steel-plate"].icon,
                                data.raw.item[data_util.mod_prefix .. "steel-ingot"].icon),
    results = {
      {name = "steel-plate", amount = 10},
    },
    energy_required = 5,
    ingredients = {
      {name = data_util.mod_prefix .. "steel-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "b-c-b"
  },
  {
    type = "recipe",
    category = "crafting",
    name = data_util.mod_prefix .. "copper-ingot-to-plate",
    icons = data_util.sub_icons(data.raw.item["copper-plate"].icon,
                                data.raw.item[data_util.mod_prefix .. "copper-ingot"].icon),
    results = {
      {name = "copper-plate", amount = 10},
    },
    energy_required = 1.25,
    ingredients = {
      {name = data_util.mod_prefix .. "copper-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  --[[{
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "stone-brick-vulcanite",
    results = {
      {name = "stone-brick", amount = 12},
    },
    energy_required = 48,
    ingredients = {
      {name = "stone", amount = 16},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10},
    },
    icons = data_util.sub_icons(data.raw.item["stone-brick"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "pyroflux"].icon),
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },]]
  {
    type = "recipe",
    category = "smelting",
    name = data_util.mod_prefix .. "glass-vulcanite",
    results = {
      {name = "glass", amount = 12},
    },
    energy_required = 48,
    ingredients = {
      {name = "sand", amount = 32},
      {type = "fluid", name = data_util.mod_prefix .. "pyroflux", amount = 10},
    },
    icons = data_util.sub_icons(data.raw.item["glass"].icon,
                                data.raw.fluid[data_util.mod_prefix .. "pyroflux"].icon),
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
})

data_util.replace_or_add_ingredient("small-lamp", "electronic-circuit", 'glass', 1)

data_util.replace_or_add_ingredient("solar-panel", nil, 'glass', 5)
data_util.replace_or_add_ingredient("laser-turret", nil, 'glass', 20)

data_util.replace_or_add_ingredient("electric-furnace", "stone-brick", data_util.mod_prefix .. "heat-shielding", 1)
data_util.replace_or_add_ingredient("electric-furnace", "concrete", data_util.mod_prefix .. "heat-shielding", 1)
data_util.replace_or_add_ingredient("industrial-furnace", nil, data_util.mod_prefix .. "heat-shielding", 4)

data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'fusion-test-data', 50)
data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'superconductive-cable', 50)
data_util.replace_or_add_ingredient("fusion-reactor-equipment", nil, data_util.mod_prefix .. 'heat-shielding', 50)

data_util.replace_or_add_ingredient("rocket-silo", "processing-unit", "advanced-circuit", 200)
data_util.replace_or_add_ingredient("rocket-silo", "electric-engine-unit", "electric-engine-unit", 100)
data_util.replace_or_add_ingredient("rocket-silo", "steel-plate", "steel-plate", 500)

data_util.replace_or_add_ingredient("satellite", "processing-unit", "advanced-circuit", 50)
data_util.replace_or_add_ingredient("satellite", "low-density-structure", "low-density-structure", 50)
data_util.replace_or_add_ingredient("satellite", "solar-panel", "solar-panel", 10)
data_util.replace_or_add_ingredient("satellite", "accumulator", "accumulator", 10)
data_util.replace_or_add_ingredient("satellite", "radar", "radar", 1)

data_util.replace_or_add_ingredient("centrifuge", "iron-gear-wheel", data_util.mod_prefix .. "heat-shielding", 20)
data_util.replace_or_add_ingredient("centrifuge", "advanced-circuit", "processing-unit", 20)
data_util.replace_or_add_ingredient("centrifuge", "electric-motor", "electric-engine-unit", 20)

data_util.replace_or_add_ingredient("nuclear-reactor", "advanced-circuit", "processing-unit", 250)

data_util.replace_or_add_ingredient("atomic-bomb", "explosives", "explosives", 50)
data_util.replace_or_add_ingredient("atomic-bomb", "uranium-235", "uranium-235", 100)
data_util.replace_or_add_ingredient("atomic-bomb", "rocket-fuel", "rocket-fuel", 10)

data_util.replace_or_add_ingredient("jetpack-2", nil, "low-density-structure", 10) -- space
data_util.replace_or_add_ingredient("jetpack-3", nil, data_util.mod_prefix .. "aeroframe-pole", 30) -- astro
data_util.replace_or_add_ingredient("jetpack-4", nil, data_util.mod_prefix .. "naquium-cube", 4) -- deep

data_util.replace_or_add_ingredient("spidertron", "fusion-reactor-equipment", data_util.mod_prefix .. "rtg-equipment", 8)
data_util.replace_or_add_ingredient("spidertron", "raw-fish", data_util.mod_prefix .. "specimen", 1)
data_util.replace_or_add_ingredient("spidertron", "effectivity-module-3", data_util.mod_prefix .. "heavy-girder", 16)

data_util.replace_or_add_ingredient("battery-mk2-equipment", "low-density-structure",  data_util.mod_prefix .. "holmium-cable", 20)

for _, recipe in pairs(data.raw.recipe) do
  if recipe.category == "centrifuging" then
    if not recipe.crafting_machine_tint then
      recipe.crafting_machine_tint = {
        primary = {
          a = 1,
          b = 0,
          r = 0,
          g = 1
        },
      }
    end
  end
end
