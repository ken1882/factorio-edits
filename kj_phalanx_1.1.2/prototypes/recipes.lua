data:extend({
-- AmmoAPphalanx
	{
	type = "recipe",
	name = "kj_apds_normal",
	enabled = false,
	energy_required = 1140,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 2325},
		{type = "item", name = "copper-plate", amount = 775},
		{type = "item", name = "explosives", amount = 775},
	},
	result = "kj_apds_normal",
	},
-- phalanx
	{
		type = "recipe",
		name = "kj_phalanx",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "iron-gear-wheel", amount = 20},
			{type = "item", name = "steel-plate", amount = 40},
			{type = "item", name = "submachine-gun", amount = 6},
			{type = "item", name = "electric-engine-unit", amount = 10},
			{type = "item", name = "processing-unit", amount = 10},
			{type = "item", name = "radar", amount = 1},
		},
		energy_required = 45,
		result = "kj_phalanx"
	},
})