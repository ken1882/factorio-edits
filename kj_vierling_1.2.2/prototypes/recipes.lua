data:extend({
-- AmmoAPVierling
	{
	type = "recipe",
	name = "kj_2cmfv_normal_vierling",
	enabled = false,
	energy_required = 3,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 2},
		{type = "item", name = "plastic-bar", amount = 2},
		{type = "item", name = "explosives", amount = 1}
	},
	result = "kj_2cmfv_normal_vierling",
	},
-- vierling
	{
		type = "recipe",
		name = "kj_vierling",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "iron-gear-wheel", amount = 20},
			{type = "item", name = "steel-plate", amount = 50},
			{type = "item", name = "submachine-gun", amount = 4},
		},
		energy_required = 30,
		result = "kj_vierling"
	},
})