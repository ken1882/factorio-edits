data:extend({
-- AmmoAPWirbelwind
  {
    type = "recipe",
    name = "kj_2cmfv_normal",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 2},
		{type = "item", name = "plastic-bar", amount = 2},
		{type = "item", name = "explosives", amount = 1}
	},
	result = "kj_2cmfv_normal"
  },
-- Wirbelwind
	{
		type = "recipe",
		name = "kj_wirbelwind",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "engine-unit", amount = 75},
			{type = "item", name = "steel-plate", amount = 120},
			{type = "item", name = "iron-gear-wheel", amount = 75},
			{type = "item", name = "advanced-circuit", amount = 20}
		},
		energy_required = 180,
		result = "kj_wirbelwind"
	},
})