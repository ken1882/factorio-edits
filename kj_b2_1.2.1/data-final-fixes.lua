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
				icon = "__kj_b2__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_plane_bomber_b2"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_plane_bomber_b2"].order = "p[plane]-b[bomber]-b2"
	data.raw["item-with-entity-data"]["kj_b2"].subgroup = "kj_plane_bomber_b2"
	
	data.raw["ammo"]["kj_b2_medium"].subgroup = "kj_plane_bomber_b2"
	data.raw["ammo"]["kj_b2_big"].subgroup = "kj_plane_bomber_b2"
	data.raw["ammo"]["kj_b2_huge"].subgroup = "kj_plane_bomber_b2"
	data.raw["ammo"]["kj_b2_atom"].subgroup = "kj_plane_bomber_b2"
end

local aircraftMod = "military-4"
if mods["Aircraft"] then
	aircraftMod = "advanced-aerodynamics"
end

data.raw["technology"]["kj_b2"].unit = 
{
  count = 1500,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
    {"utility-science-pack", 1},
  },
  time = 50
}
data.raw["technology"]["kj_b2"].prerequisites = {aircraftMod, "kj_gasoline", "low-density-structure"}

if mods["kj_b17"] then
	require("recipe_updates")
end
