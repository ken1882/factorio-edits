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
				icon = "__kj_40kbaneblade__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_40kbaneblade"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_40kbaneblade"].order = "w-2[tanks]-baneblade"
	data.raw["item-with-entity-data"]["kj_40kbaneblade"].subgroup = "kj_40kbaneblade"
	
	data.raw["ammo"]["kj_baneblade_normal"].subgroup = "kj_40kbaneblade"
end

if mods["space-exploration"] then
	data.raw["technology"]["kj_40kbaneblade"].unit = 
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 40
    }
	data.raw["technology"]["kj_40kbaneblade"].prerequisites = {"military-3"}
	
	if mods["kj_40klemanruss"] then
		table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_40klemanruss")
	else
		if mods["kj_40kpredator"] then
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_40kpredator")
		else
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "tank")
			table.insert(data.raw["technology"]["kj_40kbaneblade"].prerequisites, "kj_gasoline")
		end
	end
end

if mods["Krastorio2"] then
	prototype = data.raw["car"]["kj_40kbaneblade"]
	prototype.burner.fuel_categories = {"vehicle-fuel", "kj_gas_barrel"}
	prototype.burner.fuel_category = nil
	prototype.burner.burnt_inventory_size = 1
end