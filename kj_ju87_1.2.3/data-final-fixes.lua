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
				icon = "__kj_ju87__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_plane_bomber_ju87"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_plane_bomber_ju87"].order = "p[plane]-b[bomber]-ju87"
	data.raw["item-with-entity-data"]["kj_ju87"].subgroup = "kj_plane_bomber_ju87"
	
	data.raw["ammo"]["kj_ju87_normal"].subgroup = "kj_plane_bomber_ju87"
	data.raw["ammo"]["kj_ju87_medium"].subgroup = "kj_plane_bomber_ju87"
	data.raw["ammo"]["kj_ju87_big"].subgroup = "kj_plane_bomber_ju87"
	data.raw["ammo"]["kj_ju87_huge"].subgroup = "kj_plane_bomber_ju87"
	data.raw["ammo"]["kj_ju87_gunner_normal"].subgroup = "kj_plane_bomber_ju87"
end

local aircraftMod = "military-4"
if mods["Aircraft"] then
	aircraftMod = "advanced-aerodynamics"
end

--Tech Changes---------------------------------------------------------------------------------------------------------------------------------------------------
if mods["space-exploration"] then
	data.raw["technology"]["kj_ju87"].unit = 
	{
	  count = 500,
	  ingredients =
	  {
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"military-science-pack", 1},
	  },
	  time = 30
	}
	data.raw["technology"]["kj_ju87"].prerequisites = {aircraftMod, "kj_gasoline", "low-density-structure"}

	data.raw["technology"]["kj_ju87_ammo"].unit = 
	{
	  count = 250,
	  ingredients =
	  {
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"military-science-pack", 1},
	  },
	  time = 30
	}
	data.raw["technology"]["kj_ju87_ammo"].prerequisites = {"kj_ju87"}
end
