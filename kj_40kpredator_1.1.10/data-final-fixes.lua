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
				icon = "__kj_40kpredator__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_40kpredator"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_40kpredator"].order = "w-2[tanks]-predator"
	data.raw["item-with-entity-data"]["kj_40kpredator"].subgroup = "kj_40kpredator"
	
	data.raw["ammo"]["kj_predator_normal"].subgroup = "kj_40kpredator"
end

if mods["space-exploration"] then
	data.raw["technology"]["kj_40kpredator"].unit = 
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
	data.raw["technology"]["kj_40kpredator"].prerequisites = {"tank", "kj_gasoline"}	
end
