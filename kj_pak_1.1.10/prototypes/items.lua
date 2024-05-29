data:extend({
-- pak
	{
		type = "item-with-entity-data",
		name = "kj_pak",
		icon = "__kj_pak__/graphics/pak_icon.png",
		icon_size = 128,
		subgroup = "transport",
		order = "a[pak]",
		place_result = "kj_pak",
		stack_size = 1, default_request_amount = 1,
	},	
-- pak
	{
		type = "item-with-entity-data",
		name = "kj_pak_turret",
		icon = "__kj_pak__/graphics/pak_icon.png",
		icon_size = 128,
		subgroup = "transport",
		order = "b[pak-turret]",
		place_result = "kj_pak_turret",
		stack_size = 1, default_request_amount = 1,
	},	
})