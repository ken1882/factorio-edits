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
				icon = "__kj_b17__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_plane_bomber_b17"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_plane_bomber_b17"].order = "p[plane]-b[bomber]-b17"
	data.raw["item-with-entity-data"]["kj_b17"].subgroup = "kj_plane_bomber_b17"
	
	data.raw["ammo"]["kj_b17_normal"].subgroup = "kj_plane_bomber_b17"
	data.raw["ammo"]["kj_b17_medium"].subgroup = "kj_plane_bomber_b17"
	data.raw["ammo"]["kj_b17_big"].subgroup = "kj_plane_bomber_b17"
	data.raw["ammo"]["kj_b17_huge"].subgroup = "kj_plane_bomber_b17"
	data.raw["ammo"]["kj_b17_atom"].subgroup = "kj_plane_bomber_b17"
	data.raw["ammo"]["kj_b17_gunner_normal"].subgroup = "kj_plane_bomber_b17"
end


--Atomic Bomb recipe----------------------------------------------------------------------------------------------------------------------------------------------
local ingredients = {}
for i,value in ipairs(data.raw["recipe"]["atomic-bomb"].ingredients) do
	ingredients[i] = value
end
data.raw["recipe"]["kj_b17_atom"].ingredients = ingredients

for iterator,value in ipairs(data.raw["recipe"]["kj_b17_atom"].ingredients) do 
	if data.raw["recipe"]["kj_b17_atom"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b17_atom"].ingredients[iterator].amount = value.amount * settings.startup["kj_b17ammo_cost_setting_multiplicator"].value
	end
end	


--Tech Changes---------------------------------------------------------------------------------------------------------------------------------------------------
local aircraftMod = "military-4"
if mods["Aircraft"] then
	aircraftMod = "advanced-aerodynamics"
end

if mods["space-exploration"] then
	data.raw["technology"]["kj_b17"].unit = 
	{
		count = 650,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"military-science-pack", 1},
		},
		time = 40
	}
	data.raw["technology"]["kj_b17"].prerequisites = {aircraftMod, "kj_gasoline", "low-density-structure"}

	data.raw["technology"]["kj_b17_ammo"].unit = 
	{
		count = 350,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"military-science-pack", 1},
		},
		time = 40
	}
	data.raw["technology"]["kj_b17_ammo"].prerequisites = {"kj_b17"}

	data.raw["technology"]["kj_b17_atom"].unit = 
	{
		count = 100,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"military-science-pack", 1},
			{"production-science-pack", 1},
		},
		time = 40
	}
	data.raw["technology"]["kj_b17_atom"].prerequisites = {"kj_b17_ammo", "atomic-bomb"}
end