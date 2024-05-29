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
				icon = "__kj_2a6__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_2a6"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_2a6"].order = "o"
	data.raw["item-with-entity-data"]["kj_2a6"].subgroup = "kj_2a6"
	data.raw["ammo"]["kj_rh120_penetration"].subgroup = "kj_2a6"
	data.raw["ammo"]["kj_rh120_highexplosive"].subgroup = "kj_2a6"
	data.raw["ammo"]["kj_rh120_penetration_highexplosive"].subgroup = "kj_2a6"
	data.raw["ammo"]["kj_rh120_canister"].subgroup = "kj_2a6"
end

--Tech Changes---------------------------------------------------------------------------------------------------------------------------------------------------
if mods["space-exploration"] then
	data.raw["technology"]["kj_2a6"].unit = 
	{
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
	}
	
	data.raw["technology"]["kj_2a6_ammo"].unit = 
	{
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
	}
end
