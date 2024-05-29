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
				icon = "__kj_ho229__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_plane_fighter_ho229"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_plane_fighter_ho229"].order = "p[plane]-f[fighter]-ho229"
	data.raw["item-with-entity-data"]["kj_ho229"].subgroup = "kj_plane_fighter_ho229"
	data.raw["ammo"]["kj_ho229_normal"].subgroup = "kj_plane_fighter_ho229"
end

local aircraftMod = "military-4"
if mods["Aircraft"] then
	aircraftMod = "advanced-aerodynamics"
end

--Tech Changes---------------------------------------------------------------------------------------------------------------------------------------------------
data.raw["technology"]["kj_ho229"].unit = 
{
  count = 700,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
  },
  time = 30
}
data.raw["technology"]["kj_ho229"].prerequisites = {aircraftMod, "kj_gasoline", "low-density-structure"}
