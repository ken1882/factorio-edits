data:extend({
-- plane mg17 munition
  {
    type = "recipe",
    name = "kj_bf109_normal",
	enabled = false,
	energy_required = 5,
	ingredients =
	{
		{type = "item", name = "piercing-rounds-magazine", amount = 1},
		{type = "item", name = "steel-plate", amount = 1},
		{type = "item", name = "copper-plate", amount = 5}
	},
	result = "kj_bf109_normal"
  }, 

-- bf 109
	{
		type = "recipe",
		name = "kj_bf109",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 8},
				{type = "item", name = "iron-gear-wheel", amount = 35},
				{type = "item", name = "advanced-circuit", amount = 25},
				{type = "item", name = "steel-plate", amount = 5},
				{type = "item", name = "iron-plate", amount = 8},
				{type = "item", name = "low-density-structure", amount = 20},
			},
		energy_required = 200,
		result = "kj_bf109"
	},
})