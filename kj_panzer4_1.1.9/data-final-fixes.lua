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
				icon = "__kj_panzer4__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_panzer4"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_panzer4"].order = "n"
	data.raw["item-with-entity-data"]["kj_panzer4"].subgroup = "kj_panzer4"
	data.raw["ammo"]["kj_75kwk40_penetration"].subgroup = "kj_panzer4"
	data.raw["ammo"]["kj_75kwk40_highexplosive"].subgroup = "kj_panzer4"
	data.raw["ammo"]["kj_75kwk40_penetration_highexplosive"].subgroup = "kj_panzer4"
end
