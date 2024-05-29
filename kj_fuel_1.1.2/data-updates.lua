
if not data.raw["item"]["kj_compatibility"] then
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_fuel__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1,
			hidden = true,
		},	
	})
end
