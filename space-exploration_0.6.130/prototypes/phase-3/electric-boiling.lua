local data_util = require("data_util")

local heat_capacity = data_util.string_to_number(data.raw.fluid.steam.heat_capacity)
local boiler_power = 5000000
local efficiency = 0.9

data:extend({
  {
      type = "recipe",
      name = data_util.mod_prefix .. "electric-boiling-void",
      results = {},
      enabled = false,
      energy_required = (100-15) * 100 * heat_capacity / boiler_power / efficiency,
      ingredients = {
        { type = "fluid", name = "water", amount = 100 },
      },
      icons = {
        {icon = data.raw.fluid.water.icon },
        {icon = "__space-exploration-graphics__/graphics/icons/cross.png" },
      },
      icon_size = data.raw.fluid.water.icon_size,
      subgroup = "water",
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = data_util.mod_prefix .. "electric-boiling",
      order = "b-a"
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "electric-boiling-steam-100",
      results = {
        { type = "fluid", name = "steam", amount = 100, temperature = 100 },
      },
      enabled = false,
      energy_required = (100-15) * 100 * heat_capacity / boiler_power / efficiency,
      ingredients = {
        { type = "fluid", name = "water", amount = 100 },
      },
      subgroup = "water",
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = data_util.mod_prefix .. "electric-boiling",
      order = "b-a-b-a"
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "electric-boiling-steam-165",
      results = {
        { type = "fluid", name = "steam", amount = 100, temperature = 165 },
      },
      enabled = false,
      energy_required = (165-15) * 100 * heat_capacity / boiler_power / efficiency,
      ingredients = {
        { type = "fluid", name = "water", amount = 100 },
      },
      subgroup = "water",
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = data_util.mod_prefix .. "electric-boiling",
      order = "b-a-b-b"
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "electric-boiling-steam-500",
      results = {
        { type = "fluid", name = "steam", amount = 100, temperature = 500 },
      },
      enabled = false,
      energy_required = (500-15) * 100 * heat_capacity / boiler_power / efficiency,
      ingredients = {
        { type = "fluid", name = "water", amount = 100 },
      },
      subgroup = "water",
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = data_util.mod_prefix .. "electric-boiling",
      order = "b-a-b-c"
  },
  {
      type = "recipe",
      name = data_util.mod_prefix .. "electric-boiling-steam-5000",
      results = {
        { type = "fluid", name = "steam", amount = 100, temperature = 5000 },
      },
      enabled = false,
      energy_required = (5000-15) * 100 * heat_capacity / boiler_power / efficiency,
      ingredients = {
        { type = "fluid", name = "water", amount = 100 },
      },
      subgroup = "water",
      requester_paste_multiplier = 1,
      always_show_made_in = false,
      category = data_util.mod_prefix .. "electric-boiling",
      order = "b-a-b-d"
  }

})
