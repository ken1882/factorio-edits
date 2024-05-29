data:extend({
-- AmmoAPRatte
  {
    type = "recipe",
    name = "kj_280SKC34_penetration",
      enabled = false,
      energy_required = 15,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 14},
        {type = "item", name = "plastic-bar", amount = 10},
        {type = "item", name = "explosives", amount = 15},
      },
      result = "kj_280SKC34_penetration"
  },
-- AmmoHERatte
  {
    type = "recipe",
    name = "kj_280SKC34_highexplosive",
      enabled = false,
      energy_required = 15,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "plastic-bar", amount = 10},
        {type = "item", name = "explosives", amount = 20},
      },
      result = "kj_280SKC34_highexplosive"
  },
-- AmmoINRatte
  {
    type = "recipe",
    name = "kj_280SKC34_incendiary",
      enabled = false,
      energy_required = 15,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "plastic-bar", amount = 10},
        {type = "item", name = "explosives", amount = 12},
        {type = "item", name = "sulfur", amount = 8},
      },
      result = "kj_280SKC34_incendiary"
  },
 
-- Ratte Tank
	{
		type = "recipe",
		name = "kj_rattetank",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 500},
				{type = "item", name = "iron-gear-wheel", amount = 500},
				{type = "item", name = "advanced-circuit", amount = 200},
				{type = "item", name = "steel-plate", amount = 5000},
			},
		energy_required = 3000,
		result = "kj_rattetank"
	},	
})