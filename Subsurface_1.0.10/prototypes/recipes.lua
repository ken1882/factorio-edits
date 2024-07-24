data:extend(
{
  {
	type = "recipe-category",
	name = "venting"
  },
  {
	type = "recipe-category",
	name = "prospecting"
  },
  
  {
	type = "recipe",
	name = "surface-drill",
	enabled = false,
	energy_required = 10,
	ingredients =
	{
	  {"electric-mining-drill", 5},
	},
	result = "surface-drill"
  },
  
  {
	type = "recipe",
	name = "prospector",
	enabled = false,
	ingredients =
	{
	  {"radar", 5},
	},
	result = "prospector"
  },
  
  {
	type = "recipe",
	name = "fluid-elevator",
	enabled = false,
	energy_required = 2,
	ingredients =
	{
	  {"pipe", 10},
	  {"pump", 2},
	},
	result = "fluid-elevator",
	result_count = 2
  },
  {
	type = "recipe",
	name = "heat-elevator",
	enabled = false,
	energy_required = 2,
	ingredients =
	{
	  {"heat-pipe", 10},
	},
	result = "heat-elevator",
	result_count = 2
  },
  
  {
	type = "recipe",
	name = "air-vent",
	enabled = false,
	ingredients =
	{
	  {"iron-plate", 10},
	  {"steel-plate", 5},
	},
	result = "air-vent"
  }, 
  {
	type = "recipe",
	name = "active-air-vent",
	enabled = false,
	ingredients =
	{
	  {"plastic-bar", 10},
	  {"steel-plate", 5},
	  {"iron-gear-wheel", 5},
	  {"advanced-circuit", 10},
	},
	result = "active-air-vent"
  },
  {
	type = "recipe",
	name = "cave-sealing",
	enabled = false,
	energy_required = 20,
	ingredients =
	{
	  {"stone", 200},
	},
	result = "cave-sealing"
  },
  
  {
	type = "recipe",
	name = "venting",
	icon = "__core__/graphics/empty.png",
	icon_size = 1,
	subgroup = "inter-surface-transport",
	enabled = true,
	hidden = true,
	category = "venting",
	energy_required = 1,
	ingredients = {},
	results = {}
  },
  {
	type = "recipe",
	name = "prospecting",
	icon = "__core__/graphics/empty.png",
	icon_size = 1,
	subgroup = "inter-surface-transport",
	enabled = true,
	hidden = true,
	category = "prospecting",
	energy_required = 100,
	ingredients = {},
	results = {}
  },
  {
	type = "recipe",
	name = "wooden-support",
	enabled = false,
	ingredients =
	{
	  {"small-electric-pole", 1},
	  {"small-lamp", 1},
	},
	result = "wooden-support"
  },
})
