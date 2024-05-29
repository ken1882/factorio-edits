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
				icon = "__kj_pak__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_pak"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_pak"].order = "n"
	data.raw["item-with-entity-data"]["kj_pak"].subgroup = "kj_pak"
	data.raw["item-with-entity-data"]["kj_pak_turret"].subgroup = "kj_pak"
	
	data.raw["ammo"]["kj_pak_penetration"].subgroup = "kj_pak"
	data.raw["ammo"]["kj_pak_highexplosive"].subgroup = "kj_pak"
	data.raw["ammo"]["kj_pak_incendiary"].subgroup = "kj_pak"
end

data.raw["ammo"]["kj_pak_highexplosive"].ammo_type.action.action_delivery.max_range = settings.startup["kj_pak_range"].value
data.raw["ammo"]["kj_pak_penetration"].ammo_type.action.action_delivery.max_range = settings.startup["kj_pak_range"].value
data.raw["ammo"]["kj_pak_incendiary"].ammo_type.action.action_delivery.max_range = settings.startup["kj_pak_range"].value

data.raw["gun"]["kj_pak_gun"].attack_parameters.range = settings.startup["kj_pak_range"].value
data.raw["ammo-turret"]["kj_pak_turret"].attack_parameters.range = settings.startup["kj_pak_range"].value
