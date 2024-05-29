data:extend({
-- plane mg17 munition
  {
    type = "recipe",
    name = "kj_ju87_gunner_normal",
	enabled = false,
	energy_required = 5,
	ingredients =
	{
		{type = "item", name = "piercing-rounds-magazine", amount = 1},
		{type = "item", name = "steel-plate", amount = 1},
		{type = "item", name = "copper-plate", amount = 5}
	},
	result = "kj_ju87_gunner_normal"
  }, 
-- 50kg bomb
  {
    type = "recipe",
    name = "kj_ju87_normal",
	enabled = false,
	energy_required = 3,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 5},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 5}
	},
	result = "kj_ju87_normal"
  }, 
-- 250kg bomb
  {
    type = "recipe",
    name = "kj_ju87_medium",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "plastic-bar", amount = 7},
		{type = "item", name = "explosives", amount = 25}
	},
	result = "kj_ju87_medium"
  }, 
-- 500kg bomb
  {
    type = "recipe",
    name = "kj_ju87_big",
	enabled = false,
	energy_required = 22,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 17},
		{type = "item", name = "plastic-bar", amount = 13},
		{type = "item", name = "explosives", amount = 50}
	},
	result = "kj_ju87_big"
  }, 
-- 1000kg bomb
  {
    type = "recipe",
    name = "kj_ju87_huge",
	enabled = false,
	energy_required = 30,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 28},
		{type = "item", name = "plastic-bar", amount = 22},
		{type = "item", name = "explosives", amount = 100}
	},
	result = "kj_ju87_huge"
  }, 

-- ju 87
	{
		type = "recipe",
		name = "kj_ju87",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 10},
				{type = "item", name = "iron-gear-wheel", amount = 40},
				{type = "item", name = "advanced-circuit", amount = 30},
				{type = "item", name = "steel-plate", amount = 5},
				{type = "item", name = "iron-plate", amount = 10},
				{type = "item", name = "low-density-structure", amount = 30},
			},
		energy_required = 240,
		result = "kj_ju87"
	},
})