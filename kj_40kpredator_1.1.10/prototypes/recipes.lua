data:extend({
-- PredatorAmmo
  {
    type = "recipe",
    name = "kj_predator_normal",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 3},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 6}
	},
	result = "kj_predator_normal"
  }, 

-- Predator
	{
		type = "recipe",
		name = "kj_40kpredator",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 100},
				{type = "item", name = "iron-gear-wheel", amount = 100},
				{type = "item", name = "advanced-circuit", amount = 30},
				{type = "item", name = "steel-plate", amount = 225},
			},
		energy_required = 360,
		result = "kj_40kpredator"
	},
})