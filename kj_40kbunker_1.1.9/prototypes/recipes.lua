data:extend({
-- bunker
	{
		type = "recipe",
		name = "kj_40kbunker",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "concrete", amount = 600},
			{type = "item", name = "steel-plate", amount = 400},
			{type = "item", name = "submachine-gun", amount = 1},
			{type = "item", name = "small-lamp", amount = 5},
		},
		energy_required = 300,
		result = "kj_40kbunker"
	},
-- bunker turret
	{
		type = "recipe",
		name = "kj_40kbunker_turret",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "concrete", amount = 600},
			{type = "item", name = "steel-plate", amount = 400},
			{type = "item", name = "submachine-gun", amount = 1},
			{type = "item", name = "small-lamp", amount = 5},
		},
		energy_required = 300,
		result = "kj_40kbunker_turret"
	},
--[[ bunker turret north
	{
		type = "recipe",
		name = "kj_40kbunker_turret_north",
		enabled = false,
		ingredients =
		{
			{"concrete", 600},
			{"steel-plate", 400},
			{"submachine-gun", 1},
			{"small-lamp", 5},
		},
		energy_required = 20,
		result = "kj_40kbunker_turret_north"
	},
-- bunker turret east
	{
		type = "recipe",
		name = "kj_40kbunker_turret_east",
		enabled = false,
		ingredients =
		{
			{"concrete", 600},
			{"steel-plate", 400},
			{"submachine-gun", 1},
			{"small-lamp", 5},
		},
		energy_required = 20,
		result = "kj_40kbunker_turret_east"
	},
-- bunker turret south
	{
		type = "recipe",
		name = "kj_40kbunker_turret_south",
		enabled = false,
		ingredients =
		{
			{"concrete", 600},
			{"steel-plate", 400},
			{"submachine-gun", 1},
			{"small-lamp", 5},
		},
		energy_required = 20,
		result = "kj_40kbunker_turret_south"
	},
-- bunker turret west
	{
		type = "recipe",
		name = "kj_40kbunker_turret_west",
		enabled = false,
		ingredients =
		{
			{"concrete", 600},
			{"steel-plate", 400},
			{"submachine-gun", 1},
			{"small-lamp", 5},
		},
		energy_required = 20,
		result = "kj_40kbunker_turret_west"
	},
	-- bunker turret west
	{
		type = "recipe",
		name = "kj_40kbunker_turret",
		enabled = false,
		ingredients =
		{
			{"concrete", 600},
			{"steel-plate", 400},
			{"submachine-gun", 1},
			{"small-lamp", 5},
		},
		energy_required = 20,
		result = "kj_40kbunker_turret"
	},]]
--[[conversion
	{
		type = "recipe",
		name = "kj_40kbunker_conversion",
		icon = "__kj_40kbunker__/graphics/bunker_icon_conversion.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[bunker]-t[turret]-e",
		enabled = false,
		ingredients =
		{
			{"kj_40kbunker_turret_north", 1},
			{"kj_40kbunker_turret_east", 1},
			{"kj_40kbunker_turret_south", 1},
			{"kj_40kbunker_turret_west", 1},
		},
		energy_required = 1,
		results = 
		{
			{"concrete", 600},
			{"steel-plate", 400},
			{"submachine-gun", 1},
			{"small-lamp", 5},
			{"kj_40kbunker_turret", 1},
		},
	},]]

})