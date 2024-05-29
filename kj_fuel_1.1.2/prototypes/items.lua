data:extend({
-- Gas Can Empty
	{
		type = "item",
		name = "kj_gascan_empty",
		icon = "__kj_fuel__/graphics/equipment/gascan_empty_icon.png",
		icon_size = 128,
		subgroup = "kj_fuels",
		order = "aa",
		stack_size = 10, default_request_amount = 1,
	},
	
-- Energy Cell Empty
	{
		type = "item",
		name = "kj_energy_cell_empty",
		icon = "__kj_fuel__/graphics/equipment/nuclear-fuel-empty.png",
		icon_size = 64, icon_mipmaps = 4,
		subgroup = "kj_fuels",
		order = "ab",
		stack_size = 10, default_request_amount = 1,
	},
	
-- Gas Can Filled
	{
		type = "item",
		name = "kj_gascan",
		icon = "__kj_fuel__/graphics/equipment/gascan_icon.png",
		icon_size = 128,
		subgroup = "kj_fuels",
		order = "m",
		stack_size = 4, default_request_amount = 1,
		
		burnt_result = "kj_gascan_empty",
		fuel_value = "24MJ",
		fuel_acceleration_multiplier = 1.8,
		fuel_category = "kj_gas_can",
	},
	
-- Energy Cell
	{
		type = "item",
		name = "kj_energy_cell",
		icon = "__kj_fuel__/graphics/equipment/nuclear-fuel.png",
		icon_size = 64, icon_mipmaps = 4,
		pictures =
		{
		  layers =
		  {
			{
			  size = 64,
			  filename = "__kj_fuel__/graphics/equipment/nuclear-fuel.png",
			  scale = 0.25,
			  mipmap_count = 4
			},
			{
			  draw_as_light = true,
			  flags = {"light"},
			  size = 64,
			  filename = "__kj_fuel__/graphics/equipment/nuclear-fuel-light.png",
			  scale = 0.25,
			  mipmap_count = 4
			}
		  }
		},
		subgroup = "kj_fuels",
		order = "p",
		stack_size = 1, default_request_amount = 1,
		
		burnt_result = "kj_energy_cell_empty",
		fuel_value = "1GJ",
		fuel_acceleration_multiplier = 2.5,
		fuel_top_speed_multiplier = 1.15,
		fuel_glow_color = {r = 0.87, g = 1, b = 0.01},
		fuel_category = "kj_energy_cell",
	},
	
-- Kerosin
	{
		type = "item",
		name = "kj_kerosine",
		icon = "__kj_fuel__/graphics/equipment/kerosene_icon.png",
		icon_size = 128,
		subgroup = "kj_fuels",
		order = "n",
		stack_size = 10, default_request_amount = 10,
		
		burnt_result = "kj_gascan_empty",
		fuel_value = "100MJ",
		fuel_acceleration_multiplier = 1.5,
		fuel_category = "kj_kerosine",
	},
	
-- Gas Barrel
	{
		type = "item",
		name = "kj_gasbarrel",
		icon = "__kj_fuel__/graphics/equipment/gasbarrel_icon.png",
		icon_size = 64,
		subgroup = "kj_fuels",
		order = "o",
		stack_size = 5, default_request_amount = 5,
		
		burnt_result = "empty-barrel",
		fuel_value = "60MJ",
		fuel_acceleration_multiplier = 1,
		fuel_category = "kj_gas_barrel",
	},
})