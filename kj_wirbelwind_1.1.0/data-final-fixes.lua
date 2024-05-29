local boolean = false

if data.raw["item"]["kj_compatibility"].stack_size > 3 then
	boolean = true
end

if boolean == true then
	if not data.raw["item-group"]["kj_vehicles"] then
		data:extend(
		{	
			{
				type = "item-group",
				name = "kj_vehicles",
				icon = "__kj_wirbelwind__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_wirbelwind"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_wirbelwind"].order = "n-2"
	data.raw["item-with-entity-data"]["kj_wirbelwind"].subgroup = "kj_wirbelwind"
	data.raw["ammo"]["kj_2cmfv_normal"].subgroup = "kj_wirbelwind"
end
