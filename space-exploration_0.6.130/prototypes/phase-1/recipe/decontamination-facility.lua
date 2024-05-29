local data_util = require("data_util")
local make_recipe = data_util.make_recipe

data:extend({{
  type = "recipe",
  name = data_util.mod_prefix .. "space-water",
  enabled = false,
  ingredients = {
    { type = "fluid", name = "water", amount = 99 },
    { type = "fluid", name = "lubricant", amount = 1 }
  },
  energy_required = 1,
  results = { { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10 } },
  allow_as_intermediate = false,
  icon_size = 64,
  crafting_machine_tint = nil, -- TODO: tint
  category = "space-decontamination",
  subgroup = "water",
  always_show_made_in = true,
  order = "c-a"
}})

make_recipe({
  name = data_util.mod_prefix .. "used-lifesupport-canister-cleaning-space",
  ingredients = {
    { data_util.mod_prefix .. "used-lifesupport-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 10},
  },
  results = {
    { data_util.mod_prefix .. "empty-lifesupport-canister", 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 10},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 10},
  },
  energy_required = 10,
  localised_name = {"recipe-name."..data_util.mod_prefix .. "used-lifesupport-canister-cleaning-space"},
  main_product = data_util.mod_prefix .. "empty-lifesupport-canister",
  allow_as_intermediate = false,
  category = "space-decontamination",
  icons = data_util.sub_icons(data.raw.item[data_util.mod_prefix .. "used-lifesupport-canister"].icon,
                              data.raw.fluid[data_util.mod_prefix .. "space-water"].icon),
  icon_size = 64, icon_mipmaps = 1,
  enabled = false,
  always_show_made_in = true,
})

data:extend({{
  type = "recipe",
  name = data_util.mod_prefix .. "bio-sludge-decontamination",
  enabled = false,
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .."contaminated-bio-sludge", amount = 100 },
  },
  results = {
    { name = data_util.mod_prefix .."contaminated-scrap", amount_min = 1, amount_max = 1, probability = 0.01 },
    { type = "fluid", name = data_util.mod_prefix .."bio-sludge", amount = 99 },
  },
  energy_required = 5,
  allow_as_intermediate = false,
  icon_size = 64,
  crafting_machine_tint = nil, -- TODO: tint
  category = "space-decontamination",
  subgroup = "sludge",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "contaminated-bio-sludge"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "contaminated-bio-sludge"].icon_size, scale = 0.5
    },
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "bio-sludge"].icon_size, scale = 0.5
    }
  ),
  always_show_made_in = true,
  order = "b"
}})

data:extend({{
  type = "recipe",
  name = data_util.mod_prefix .. "space-water-decontamination",
  enabled = false,
  ingredients = {
    { type = "fluid", name = data_util.mod_prefix .."contaminated-space-water", amount = 100 },
  },
  results = {
    { type = "fluid", name = data_util.mod_prefix .."space-water", amount = 99 },
    { type = "fluid", name = data_util.mod_prefix .."contaminated-bio-sludge", amount = 1 },
    { name = data_util.mod_prefix .."contaminated-scrap", amount_min = 1, amount_max = 1, probability = 0.01 },
  },
  energy_required = 5,
  allow_as_intermediate = false,
  icon_size = 64,
  crafting_machine_tint = nil, -- TODO: tint
  category = "space-decontamination",
  subgroup = "water",
  icons = data_util.transition_icons(
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "contaminated-space-water"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "contaminated-space-water"].icon_size, scale = 0.5
    },
    {
      icon = data.raw.fluid[data_util.mod_prefix .. "space-water"].icon,
      icon_size = data.raw.fluid[data_util.mod_prefix .. "space-water"].icon_size, scale = 0.5
    }
  ),
  always_show_made_in = true,
  order = "c-b"
}})

make_recipe({
  name = data_util.mod_prefix .. "data-storage-substrate-cleaned",
  ingredients = {
    { data_util.mod_prefix .. "data-storage-substrate", 1},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 5 }
  },
  results = {
    { data_util.mod_prefix .. "data-storage-substrate-cleaned", 1},
    { name = data_util.mod_prefix .. "scrap", amount_min = 1, amount_max = 1, probability = 0.01 },
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 5 }
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "data-storage-substrate-cleaned"].icon, scale = 0.5, icon_size = 64},
    { icon = data.raw.fluid[ data_util.mod_prefix .. "space-water"].icon, scale = 0.375, icon_size = 64},
  },
  energy_required = 2.5,
  main_product = data_util.mod_prefix .. "data-storage-substrate-cleaned",
  category = "space-decontamination",
  enabled = false,
  always_show_made_in = true,
})

make_recipe({
  name = data_util.mod_prefix .. "data-storage-substrate-cleaned-chemical",
  ingredients = {
    { data_util.mod_prefix .. "data-storage-substrate", 1},
    { type = "fluid", name = data_util.mod_prefix .. "chemical-gel", amount = 1 }
  },
  results = {
    { data_util.mod_prefix .. "data-storage-substrate-cleaned", 1},
  },
  icons = {
    { icon = data.raw.item[data_util.mod_prefix .. "data-storage-substrate-cleaned"].icon, scale = 0.5, icon_size = 64},
    { icon = data.raw.fluid[ data_util.mod_prefix .. "chemical-gel"].icon, scale = 0.375, icon_size = 64},
  },
  energy_required = 2.5,
  main_product = data_util.mod_prefix .. "data-storage-substrate-cleaned",
  category = "space-decontamination",
  enabled = false,
  always_show_made_in = true,
})

-- scrap processing
make_recipe({
  name = data_util.mod_prefix .. "scrap-decontamination",
  ingredients = {
    { data_util.mod_prefix .. "contaminated-scrap", 20},
    { type = "fluid", name = data_util.mod_prefix .. "space-water", amount = 2},
  },
  results = {
    { name =  data_util.mod_prefix .. "scrap", amount = 20},
    { name = "uranium-ore", amount_min = 1, amount_max = 1, probability = 0.001},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-space-water", amount = 1},
    { type = "fluid", name = data_util.mod_prefix .. "contaminated-bio-sludge", amount = 1},
  },
  energy_required = 6,
  allow_as_intermediate = false,
  category = "space-decontamination",
  subgroup = "recycling",
  icons = data_util.transition_icons(
    {
      icon = data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "contaminated-scrap"].icon_size, scale = 0.5
    },
    {
      icon = data.raw.item[data_util.mod_prefix .. "scrap"].icon,
      icon_size = data.raw.item[data_util.mod_prefix .. "scrap"].icon_size, scale = 0.5
    }
  ),
  enabled = false,
  always_show_made_in = true,
}, false, true)
