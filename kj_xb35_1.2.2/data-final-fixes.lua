local boolean = false

--King Jo item category setup------------------------------------------------------------------------------------------------------------------------------------
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
				icon = "__kj_xb35__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_plane_xb35"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_plane_xb35"].order = "p[plane]-b[bomber]-xb35"
	data.raw["item-with-entity-data"]["kj_xb35"].subgroup = "kj_plane_xb35"
	
	data.raw["ammo"]["kj_xb35_medium"].subgroup = "kj_plane_xb35"
	data.raw["ammo"]["kj_xb35_big"].subgroup = "kj_plane_xb35"
	data.raw["ammo"]["kj_xb35_huge"].subgroup = "kj_plane_xb35"
	data.raw["ammo"]["kj_xb35_atom"].subgroup = "kj_plane_xb35"
end

local aircraftMod = "military-4"
if mods["Aircraft"] then
	aircraftMod = "advanced-aerodynamics"
end

--Tech Changes---------------------------------------------------------------------------------------------------------------------------------------------------
if mods["space-exploration"] then
	data.raw["technology"]["kj_xb35"].unit = 
	{
	  count = 600,
	  ingredients =
	  {
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"military-science-pack", 1},
	  },
	  time = 20
	}
	data.raw["technology"]["kj_xb35"].prerequisites = {aircraftMod, "kj_gasoline", "low-density-structure"}
	
	data.raw["technology"]["kj_xb35_atom"].unit = 
	{
	  count = 100,
	  ingredients =
	  {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
	  },
	  time = 50
	}
	data.raw["technology"]["kj_xb35_atom"].prerequisites = {"kj_xb35", "atomic-bomb"}
	

	if mods["kj_b2"] then
		require("recipe_updates_b2")
	end

	if mods["kj_b17"] then
		require("recipe_updates_b17")
	end
end
