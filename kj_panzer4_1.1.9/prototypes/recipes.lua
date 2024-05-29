-- mg34
	local mg34 = table.deepcopy(data.raw["gun"]["submachine-gun"])
	mg34.name = "kj_mg34_hand"
	mg34.icon = "__kj_panzer4__/graphics/equipment/mg34_icon.png"
	mg34.icon_size = 128
	mg34.attack_parameters.movement_slow_down_factor = 0.6
	mg34.attack_parameters.cooldown = 3.5
	mg34.attack_parameters.range = 45
	mg34.order = "a[basic-clips]-e[mg34]"
	mg34.flags = {}
	mg34.attack_parameters.sound = {
		{
			filename = "__kj_panzer4__/sounds/mg34_1.ogg",
			volume = 0.6,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_2.ogg",
			volume = 0.6,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_3.ogg",
			volume = 0.6,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_4.ogg",
			volume = 0.6,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_5.ogg",
			volume = 0.6,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_6.ogg",
			volume = 0.6,
		},
	}
	data:extend({mg34})
	
data:extend({
--MG34
	{
		type = "recipe",
		name = "kj_mg34_hand",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "iron-gear-wheel", amount = 4},
				{type = "item", name = "iron-plate", amount = 4},
				{type = "item", name = "copper-plate", amount = 4},
				{type = "item", name = "iron-stick", amount = 8}
			},
		energy_required = 15,
		result = "kj_mg34_hand"
	},
-- AmmoAPPanzer4
  {
    type = "recipe",
    name = "kj_75kwk40_penetration",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 2},
		{type = "item", name = "explosives", amount = 3}
	},
	result = "kj_75kwk40_penetration"
  },
-- AmmoHEPanzer4
  {
    type = "recipe",
    name = "kj_75kwk40_highexplosive",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 3},
		{type = "item", name = "plastic-bar", amount = 2},
		{type = "item", name = "explosives", amount = 4}
	},
	result = "kj_75kwk40_highexplosive"
  }, 
-- AmmoAPHEPanzer4
  {
    type = "recipe",
    name = "kj_75kwk40_penetration_highexplosive",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 2},
		{type = "item", name = "explosives", amount = 4}
	},
	result = "kj_75kwk40_penetration_highexplosive"
  },  
-- Panzer4
	{
		type = "recipe",
		name = "kj_panzer4",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "engine-unit", amount = 75},
			{type = "item", name = "steel-plate", amount = 150},
			{type = "item", name = "iron-gear-wheel", amount = 75},
			{type = "item", name = "advanced-circuit", amount = 20}
		},
		energy_required = 200,
		result = "kj_panzer4"
	},
})