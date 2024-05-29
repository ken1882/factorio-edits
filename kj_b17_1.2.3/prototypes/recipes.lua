data:extend({
-- plane mgm2 munition
  {
    type = "recipe",
    name = "kj_b17_gunner_normal",
	enabled = false,
	energy_required = 5,
	ingredients =
	{
		{type = "item", name = "piercing-rounds-magazine", amount = 1},
		{type = "item", name = "steel-plate", amount = 1},
		{type = "item", name = "copper-plate", amount = 5}
	},
	result = "kj_b17_gunner_normal"
  }, 
-- 50kg bomb
  {
    type = "recipe",
    name = "kj_b17_normal",
	enabled = false,
	energy_required = 3,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 5},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 5}
	},
	result = "kj_b17_normal"
  }, 
-- 250kg bomb
  {
    type = "recipe",
    name = "kj_b17_medium",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "plastic-bar", amount = 7},
		{type = "item", name = "explosives", amount = 25}
	},
	result = "kj_b17_medium"
  }, 
-- 500kg bomb
  {
    type = "recipe",
    name = "kj_b17_big",
	enabled = false,
	energy_required = 22,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 17},
		{type = "item", name = "plastic-bar", amount = 13},
		{type = "item", name = "explosives", amount = 50}
	},
	result = "kj_b17_big"
  }, 
-- 1000kg bomb
  {
    type = "recipe",
    name = "kj_b17_huge",
	enabled = false,
	energy_required = 30,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 28},
		{type = "item", name = "plastic-bar", amount = 22},
		{type = "item", name = "explosives", amount = 100}
	},
	result = "kj_b17_huge"
  }, 
--[[Napalm bomb
  {
    type = "recipe",
    name = "kj_b17_napalm",
	enabled = false,
	energy_required = 30,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 28},
		{type = "item", name = "plastic-bar", amount = 22},
		{type = "item", name = "explosives", amount = 100}
	},
	result = "kj_b17_napalm"
  },]] 
  
-- Atom bomb
  {
    type = "recipe",
    name = "kj_b17_atom",
	enabled = false,
	energy_required = 200,
	ingredients =
	{
		{type = "item", name = "rocket-control-unit", amount = 10},
		{type = "item", name = "explosives", amount = 10},
		{type = "item", name = "uranium-235", amount = 30},
	},
	result = "kj_b17_atom"
  }, 
	
-- B17
	{
		type = "recipe",
		name = "kj_b17",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 40},
				{type = "item", name = "iron-gear-wheel", amount = 160},
				{type = "item", name = "advanced-circuit", amount = 50},
				{type = "item", name = "steel-plate", amount = 25},
				{type = "item", name = "iron-plate", amount = 20},
				{type = "item", name = "low-density-structure", amount = 50},
			},
		energy_required = 420,
		result = "kj_b17"
	},
})