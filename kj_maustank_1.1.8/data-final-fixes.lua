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
				icon = "__kj_maustank__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_maustank"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_maustank"].order = "o"
	data.raw["item-with-entity-data"]["kj_maustank"].subgroup = "kj_maustank"
	data.raw["ammo"]["kj_120kwk_penetration"].subgroup = "kj_maustank"
	data.raw["ammo"]["kj_120kwk_highexplosive"].subgroup = "kj_maustank"
	data.raw["ammo"]["kj_120kwk_penetration_highexplosive"].subgroup = "kj_maustank"
end
