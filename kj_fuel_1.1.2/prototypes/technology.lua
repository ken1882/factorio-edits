--Technology
data:extend({
  {
    type = "technology",
    name = "kj_gasoline",
    icon = "__kj_fuel__/graphics/technology/gasoline_technology_icon.png",
	icon_size = 128,
    effects =
    {
		{
			type = "unlock-recipe",
			recipe = "kj_gascan_empty"
		},
		{
			type = "unlock-recipe",
			recipe = "kj_gascan_fill"
		},
		{
			type = "unlock-recipe",
			recipe = "kj_kerosine_fill"
		},
		{
			type = "unlock-recipe",
			recipe = "kj_gasbarrel_fill"
		},
    },
    prerequisites = {"advanced-oil-processing"},
    unit =
    {
		count = 100,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
		},
		time = 30
    },
    order = "e-c-d"
  },
  {
    type = "technology",
    name = "kj_energy_cell",
    icon = "__kj_fuel__/graphics/technology/energy_cell_technology_icon.png",
	icon_size = 132,
    effects =
    {
		{
			type = "unlock-recipe",
			recipe = "kj_energy_cell_empty"
		},
		{
			type = "unlock-recipe",
			recipe = "kj_energy_cell_load"
		},
    },
    prerequisites = {"rocket-fuel", "production-science-pack"},
    unit =
    {
		count = 300,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
		},
		time = 30
    },
    order = "e-c-d"
  },
})