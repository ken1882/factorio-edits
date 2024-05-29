data:extend({
-- 250kg bomb
  {
    type = "recipe",
    name = "kj_b2_medium",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "plastic-bar", amount = 7},
		{type = "item", name = "explosives", amount = 25}
	},
	result = "kj_b2_medium"
  }, 
-- 500kg bomb
  {
    type = "recipe",
    name = "kj_b2_big",
	enabled = false,
	energy_required = 22,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 17},
		{type = "item", name = "plastic-bar", amount = 13},
		{type = "item", name = "explosives", amount = 50}
	},
	result = "kj_b2_big"
  }, 
-- 1000kg bomb
  {
    type = "recipe",
    name = "kj_b2_huge",
	enabled = false,
	energy_required = 30,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 28},
		{type = "item", name = "plastic-bar", amount = 22},
		{type = "item", name = "explosives", amount = 100}
	},
	result = "kj_b2_huge"
  }, 
-- Atom bomb
  {
    type = "recipe",
    name = "kj_b2_atom",
	enabled = false,
	energy_required = 200,
	ingredients =
	{
		{type = "item", name = "rocket-control-unit", amount = 10},
		{type = "item", name = "explosives", amount = 10},
		{type = "item", name = "uranium-235", amount = 30},
	},
	result = "kj_b2_atom"
  }, 

-- b2
	{
		type = "recipe",
		name = "kj_b2",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 32},
				{type = "item", name = "iron-gear-wheel", amount = 30},
				{type = "item", name = "processing-unit", amount = 60},
				{type = "item", name = "steel-plate", amount = 10},
				{type = "item", name = "low-density-structure", amount = 80},
			},
		energy_required = 750,
		result = "kj_b2"
	},
})