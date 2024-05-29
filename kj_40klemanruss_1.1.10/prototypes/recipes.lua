data:extend({
-- lemanrussAmmo
	{
		type = "recipe",
		name = "kj_lemanruss_normal",
		enabled = false,
		energy_required = 15,
		ingredients =
			{
				{type = "item", name = "steel-plate", amount = 4},
				{type = "item", name = "plastic-bar", amount = 3},
				{type = "item", name = "explosives", amount = 12}
			},
		result = "kj_lemanruss_normal"
	}, 

-- lemanruss
	{
		type = "recipe",
		name = "kj_40klemanruss",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 100},
				{type = "item", name = "iron-gear-wheel", amount = 100},
				{type = "item", name = "advanced-circuit", amount = 30},
				{type = "item", name = "steel-plate", amount = 225},
			},
		energy_required = 360,
		result = "kj_40klemanruss"
	},
})