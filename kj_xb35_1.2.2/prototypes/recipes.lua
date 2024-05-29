data:extend({
	-- 250kg bomb
	{
		type = "recipe",
		name = "kj_xb35_medium",
		enabled = false,
		energy_required = 15,
		ingredients =
			{
				{type = "item", name = "steel-plate", amount = 10},
				{type = "item", name = "plastic-bar", amount = 7},
				{type = "item", name = "explosives", amount = 25}
			},
		result = "kj_xb35_medium"
	}, 
	-- 500kg bomb
	{
		type = "recipe",
		name = "kj_xb35_big",
		enabled = false,
		energy_required = 22,
		ingredients =
			{
				{type = "item", name = "steel-plate", amount = 17},
				{type = "item", name = "plastic-bar", amount = 13},
				{type = "item", name = "explosives", amount = 50}
			},
		result = "kj_xb35_big"
	}, 
	-- 1000kg bomb
	{
		type = "recipe",
		name = "kj_xb35_huge",
		enabled = false,
		energy_required = 30,
		ingredients =
			{
				{type = "item", name = "steel-plate", amount = 28},
				{type = "item", name = "plastic-bar", amount = 22},
				{type = "item", name = "explosives", amount = 100}
			},
		result = "kj_xb35_huge"
	}, 
	-- Atom bomb
	{
		type = "recipe",
		name = "kj_xb35_atom",
		enabled = false,
		energy_required = 200,
		ingredients =
			{
				{type = "item", name = "rocket-control-unit", amount = 10},
				{type = "item", name = "explosives", amount = 10},
				{type = "item", name = "uranium-235", amount = 30},
			},
		result = "kj_xb35_atom"
	}, 
	
-- XB 35
	{
		type = "recipe",
		name = "kj_xb35",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "steel-plate", amount = 10},
				{type = "item", name = "iron-gear-wheel", amount = 160},
				{type = "item", name = "advanced-circuit", amount = 60},
				{type = "item", name = "engine-unit", amount = 40},
				{type = "item", name = "low-density-structure", amount = 150},
			},
		energy_required = 600,
		result = "kj_xb35"
	},
})