-- MG3
	local mg3 = table.deepcopy(data.raw["gun"]["submachine-gun"])
	mg3.name = "kj_mg3_hand"
	mg3.icon = "__kj_2a6__/graphics/equipment/mg42_icon.png"
	mg3.icon_size = 128
	mg3.attack_parameters.movement_slow_down_factor = 0.9
	mg3.attack_parameters.cooldown = 3
	mg3.attack_parameters.range = 45
	mg3.order = "a[basic-clips]-e[mg3]"
	mg3.flags = {}
	mg3.attack_parameters.sound = {
		{
			filename = "__kj_2a6__/sounds/mg42_1.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_2a6__/sounds/mg42_2.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_2a6__/sounds/mg42_3.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_2a6__/sounds/mg42_4.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_2a6__/sounds/mg42_5.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_2a6__/sounds/mg42_6.ogg",
			volume = 0.4,
		},
	}
	data:extend({mg3})
	
data:extend({
-- AmmoAPLeopard
  {
    type = "recipe",
    name = "kj_rh120_penetration",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 6},
		{type = "item", name = "plastic-bar", amount = 4},
		{type = "item", name = "explosives", amount = 12}
	},
	result = "kj_rh120_penetration"
  }, 
-- AmmoHELeopard
  {
    type = "recipe",
    name = "kj_rh120_highexplosive",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 4},
		{type = "item", name = "plastic-bar", amount = 4},
		{type = "item", name = "explosives", amount = 15}
	},
	result = "kj_rh120_highexplosive"
  },  
-- AmmoAPHELeopard
  {
    type = "recipe",
    name = "kj_rh120_penetration_highexplosive",
	enabled = false,
	energy_required = 20,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 7},
		{type = "item", name = "plastic-bar", amount = 5},
		{type = "item", name = "explosives", amount = 18}
	},
	result = "kj_rh120_penetration_highexplosive"

  },
-- AmmoCanisterLeopard
  {
    type = "recipe",
    name = "kj_rh120_canister",
	enabled = false,
	energy_required = 20,
	ingredients =
	{
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "plastic-bar", amount = 3},
		{type = "item", name = "explosives", amount = 5}
	},
	result = "kj_rh120_canister"

  },
	
--mg3
	{
		type = "recipe",
		name = "kj_mg3_hand",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "iron-gear-wheel", amount = 5},
				{type = "item", name = "iron-plate", amount = 5},
				{type = "item", name = "copper-plate", amount = 5},
				{type = "item", name = "iron-stick", amount = 10}
			},
		energy_required = 20,
		result = "kj_mg3_hand"
	},
	
-- Leopard
	{
		type = "recipe",
		name = "kj_2a6",
		enabled = false,
		ingredients =
			{
				{type = "item", name = "steel-plate", amount = 450},
				{type = "item", name = "iron-gear-wheel", amount = 135},
				{type = "item", name = "advanced-circuit", amount = 70},
				{type = "item", name = "engine-unit", amount = 135},
				{type = "item", name = "low-density-structure", amount = 200},
				{type = "item", name = "processing-unit", amount = 50},

			},
		energy_required = 720,
		result = "kj_2a6"
	},
})