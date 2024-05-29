data:extend({
-- banebladeAmmo
  {
    type = "recipe",
    name = "kj_baneblade_normal",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 5},
		{type = "item", name = "plastic-bar", amount = 4},
		{type = "item", name = "explosives", amount = 14}
	},
	result = "kj_baneblade_normal"
  }, 

-- baneblade
	{
		type = "recipe",
		name = "kj_40kbaneblade",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 200},
				{type = "item", name = "iron-gear-wheel", amount = 300},
				{type = "item", name = "advanced-circuit", amount = 100},
				{type = "item", name = "steel-plate", amount = 1000},
				{type = "item", name = "low-density-structure", amount = 100},
				{type = "item", name = "processing-unit", amount = 50},
			},
		energy_required = 1000,
		result = "kj_40kbaneblade"
	},
})