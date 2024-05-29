local boolean = false


if data.raw["item"]["kj_compatibility"] then
	boolean = true
	data.raw["item"]["kj_compatibility"].stack_size = 1 + data.raw["item"]["kj_compatibility"].stack_size
else
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_tower__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end

if mods["kj_rattetank"] or mods["kj_utilitarian"] or mods["kj_king_jos_vehicles"] or mods["kj_aventador"] or mods["kj_maustank"] or boolean then
	data:extend(
	{	
		{
			type = "item-group",
			name = "kj_vehicles",
			icon = "__kj_tower__/graphics/thumbnail_categories.png",
			icon_size = 560,
			inventory_order = "x",
			order = "kj_vehicles"
		},
	})
	
	data.raw["item-subgroup"]["kj_tower"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_tower"].order = "w-0[buildings]-tower"
end


require("recipe_changes")
