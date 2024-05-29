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
				icon = "__kj_40klemanruss__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_40klemanruss"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_40klemanruss"].order = "w-2[tanks]-lemanruss"
	data.raw["item-with-entity-data"]["kj_40klemanruss"].subgroup = "kj_40klemanruss"
	
	data.raw["ammo"]["kj_lemanruss_normal"].subgroup = "kj_40klemanruss"
end

if mods["space-exploration"] then
	data.raw["technology"]["kj_40klemanruss"].unit = 
    {
      count = 750,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
    }
	data.raw["technology"]["kj_40klemanruss"].prerequisites = {}
	
	if mods["kj_40kpredator"] then
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_40kpredator")
	else
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "tank")
		table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_gasoline")
	end
end