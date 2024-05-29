data:extend({
-- plane mk108 munition
  {
    type = "recipe",
    name = "kj_ho229_normal",
	enabled = false,
	energy_required = 5,
	ingredients =
	{
		{type = "item", name = "piercing-rounds-magazine", amount = 1},
		{type = "item", name = "steel-plate", amount = 3},
		{type = "item", name = "copper-plate", amount = 3}
	},
	result = "kj_ho229_normal"
  }, 

-- ho 229
	{
		type = "recipe",
		name = "kj_ho229",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 16},
				{type = "item", name = "iron-gear-wheel", amount = 20},
				{type = "item", name = "advanced-circuit", amount = 35},
				{type = "item", name = "steel-plate", amount = 3},
				{type = "item", name = "iron-plate", amount = 3},
				{type = "item", name = "low-density-structure", amount = 40},
			},
		energy_required = 600,
		result = "kj_ho229"
	},
})