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
				icon = "__kj_ju52__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_plane_transporter"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_plane_transporter"].order = "p[plane]-t[transporter]-ju52"
	data.raw["item-with-entity-data"]["kj_ju52"].subgroup = "kj_plane_transporter"
end

local aircraftMod = {"lubricant"}
if mods["Aircraft"] then
	aircraftMod = {"advanced-aerodynamics"}
end

--Tech Changes---------------------------------------------------------------------------------------------------------------------------------------------------
data.raw["technology"]["kj_ju52"].unit = 
{
  count = 350,
  ingredients =
  {
	{"automation-science-pack", 1},
	{"logistic-science-pack", 1},
	{"chemical-science-pack", 1},
	{"military-science-pack", 1},
  },
  time = 20
}

data.raw["technology"]["kj_ju52"].prerequisites = aircraftMod
table.insert(data.raw["technology"]["kj_ju52"].prerequisites, "kj_gasoline")
table.insert(data.raw["technology"]["kj_ju52"].prerequisites, "low-density-structure")

if mods["Krastorio2"] then
	prototype = data.raw["car"]["kj_ju52"]
	prototype.burner.fuel_categories = {"vehicle-fuel", "kj_kerosine"}
	prototype.burner.fuel_category = nil
	prototype.burner.burnt_inventory_size = 1
	if mods["AircraftRealism"] then
		prototype = data.raw["car"]["kj_ju52-airborne"]
		prototype.burner.fuel_categories = {"vehicle-fuel", "kj_kerosine"}
		prototype.burner.fuel_category = nil
		prototype.burner.burnt_inventory_size = 1
	end
end
