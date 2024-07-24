data:extend({
-- Gas Can Empty
	{
		type = "recipe",
		name = "kj_gascan_empty",
		enabled = false,
		subgroup = "kj_fuels",
		order = "a",
		ingredients = {
			{type = "item", name = "steel-plate", amount = 1},
		},
		energy_required = 1,
		result = "kj_gascan_empty",
		category = "crafting",
		hidden = false,
	},
	
-- Gas Can Fill
	{
		type = "recipe",
		name = "kj_gascan_fill",
		enabled = false,
		subgroup = "kj_fuels",
		order = "m",
		ingredients =  {
			{type = "item", name = "kj_gascan_empty", amount = 1},
			{type = "fluid", name = "light-oil", amount = 20.0, },
		},
		energy_required = 0.2,
		result = "kj_gascan",
		category = "crafting-with-fluid",
		hidden = false,
	},	
	
-- Energy Cell Empty
	{
		type = "recipe",
		name = "kj_energy_cell_empty",
		enabled = false,
		subgroup = "kj_fuels",
		order = "b",
		ingredients = {
			{type = "item", name = "uranium-235", amount = 10},
		},
		energy_required = 60,
		result = "kj_energy_cell_empty",
		category = "crafting",
		hidden = false,
	},
	
-- Energy Cell
	{
		type = "recipe",
		name = "kj_energy_cell_load",
		enabled = false,
		subgroup = "kj_fuels",
		order = "p",
		ingredients = {
			{type = "item", name = "kj_energy_cell_empty", amount = 1},
		},
		energy_required = 60,
		result = "kj_energy_cell",
		category = "crafting-with-fluid",
		hidden = false,
	},	
	
-- kerosine
	{
		type = "recipe",
		name = "kj_kerosine_fill",
		enabled = false,
		subgroup = "kj_fuels",
		order = "n",
		ingredients = {
			{type = "item", name = "kj_gascan_empty", amount = 1},
			{type = "fluid", name = "light-oil", amount = 120.0, },
		},
		energy_required = 5,
		result = "kj_kerosine",
		category = "crafting-with-fluid",
		hidden = false,
	},	
	
-- Gas Barrel Fill
	{
		type = "recipe",
		name = "kj_gasbarrel_fill",
		enabled = false,
		subgroup = "kj_fuels",
		order = "o",
		ingredients = {
			{type = "item", name = "empty-barrel", amount = 1},
			{type = "fluid", name = "light-oil", amount = 50.0, },
		},
		energy_required = 0.2,
		result = "kj_gasbarrel",
		category = "crafting-with-fluid",
		hidden = false,
	},	
})