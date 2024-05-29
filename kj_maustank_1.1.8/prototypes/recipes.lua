-- MG42
	local mg42 = table.deepcopy(data.raw["gun"]["submachine-gun"])
	mg42.name = "kj_mg42_hand"
	mg42.icon = "__kj_maustank__/graphics/equipment/mg42_icon.png"
	mg42.icon_size = 128
	mg42.attack_parameters.movement_slow_down_factor = 0.9
	mg42.attack_parameters.cooldown = 3
	mg42.attack_parameters.range = 45
	mg42.order = "a[basic-clips]-d[mg42]"
	mg42.flags = {}
	mg42.attack_parameters.sound = {
		{
			filename = "__kj_maustank__/sounds/mg42_1.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_2.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_3.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_4.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_5.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_6.ogg",
			volume = 0.4,
		},
	}
	data:extend({mg42})
	
data:extend({
-- AmmoAPMaus
  {
    type = "recipe",
    name = "kj_120kwk_penetration",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 8}
	},
	result = "kj_120kwk_penetration"
  }, 
-- AmmoHEMaus
  {
    type = "recipe",
    name = "kj_120kwk_highexplosive",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 3},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 10}
	},
	result = "kj_120kwk_highexplosive"
  },  
-- AmmoAMHEMaus
  {
    type = "recipe",
    name = "kj_120kwk_penetration_highexplosive",
	enabled = false,
	energy_required = 20,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 10}
	},
	result = "kj_120kwk_penetration_highexplosive"

  },
	
--MG42
	{
		type = "recipe",
		name = "kj_mg42_hand",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "iron-gear-wheel", amount = 5},
				{type = "item", name = "iron-plate", amount = 5},
				{type = "item", name = "copper-plate", amount = 5},
				{type = "item", name = "iron-stick", amount = 10}
			},
		energy_required = 20,
		result = "kj_mg42_hand"
	},
	
-- Maustank
	{
		type = "recipe",
		name = "kj_maustank",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "engine-unit", amount = 150},
				{type = "item", name = "iron-gear-wheel", amount = 150},
				{type = "item", name = "advanced-circuit", amount = 50},
				{type = "item", name = "steel-plate", amount = 500},
			},
		energy_required = 600,
		result = "kj_maustank"
	},
})