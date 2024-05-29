data:extend({
-- bunker
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker",
		icon = "__kj_40kbunker__/graphics/bunker_icon.png",
		icon_size = 128,
		subgroup = "kj_40kbunker",
		order = "b[bunker]",
		place_result = "kj_40kbunker",
		stack_size = 5, default_request_amount = 1,
	},
	
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker_turret",
		icon = "__kj_40kbunker__/graphics/bunker_icon.png",
		icon_size = 128,
		subgroup = "kj_40kbunker",
		order = "b[bunker]",
		place_result = "kj_40kbunker_turret",
		stack_size = 5, default_request_amount = 1,
	},
--[[turret north
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker_turret_north",
		icon = "__kj_40kbunker__/graphics/bunker_icon_north.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[bunker]-t[turret]-a",
		place_result = "kj_40kbunker_turret_north",
		stack_size = 5, default_request_amount = 1,
	},	
--turret east
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker_turret_east",
		icon = "__kj_40kbunker__/graphics/bunker_icon_east.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[bunker]-t[turret]-b",
		place_result = "kj_40kbunker_turret_east",
		stack_size = 5, default_request_amount = 1,
	},	
--turret south
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker_turret_south",
		icon = "__kj_40kbunker__/graphics/bunker_icon_south.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[bunker]-t[turret]-c",
		place_result = "kj_40kbunker_turret_south",
		stack_size = 5, default_request_amount = 1,
	},	
--turret west
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker_turret_west",
		icon = "__kj_40kbunker__/graphics/bunker_icon_west.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[bunker]-t[turret]-d",
		place_result = "kj_40kbunker_turret_west",
		stack_size = 5, default_request_amount = 1,
	},	
--turret west
	{
		type = "item-with-entity-data",
		name = "kj_40kbunker_turret",
		icon = "__kj_40kbunker__/graphics/bunker_icon_north.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[bunker]-t[turret]-f",
		place_result = "kj_40kbunker_turret",
		stack_size = 5, default_request_amount = 1,
	},	]]
})