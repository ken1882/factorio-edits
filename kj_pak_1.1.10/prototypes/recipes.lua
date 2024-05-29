data:extend({
-- pakAmmoAP
  {
    type = "recipe",
    name = "kj_pak_penetration",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 8}
	},
	result = "kj_pak_penetration"
  }, 

-- pakAmmoHE
  {
    type = "recipe",
    name = "kj_pak_highexplosive",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 3},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 10}
	},
	result = "kj_pak_highexplosive"
  }, 
  
-- pakAmmoHEI
  {
    type = "recipe",
    name = "kj_pak_incendiary",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 4},
		{type = "item", name = "explosives", amount = 6},
		{type = "item", name = "sulfur", amount = 5}
	},
	result = "kj_pak_incendiary"
  }, 
	
-- pak
	{
		type = "recipe",
		name = "kj_pak",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 25},
			{type = "item", name = "iron-gear-wheel", amount = 5},
			{type = "item", name = "engine-unit", amount = 3},
		},
		energy_required = 60,
		result = "kj_pak"
	},
	
-- pak turret
	{
		type = "recipe",
		name = "kj_pak_turret",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "steel-plate", amount = 25},
			{type = "item", name = "iron-gear-wheel", amount = 5},
			{type = "item", name = "engine-unit", amount = 3},
		},
		energy_required = 60,
		result = "kj_pak_turret"
	},
})