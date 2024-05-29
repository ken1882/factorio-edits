local prerequisites_mod = ""
local multiplier = 1
local boolean = false

if data.raw["item"]["kj_compatibility"] then
	boolean = true
	data.raw["item"]["kj_compatibility"].stack_size = 1 + data.raw["item"]["kj_compatibility"].stack_size
else
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_2a6__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end

if mods["kj_maustank"] then
	prerequisites_mod = "kj_maustank"
	multiplier = 0.5
elseif mods["kj_panzer4"] then 
	prerequisites_mod = "kj_panzer4"
	multiplier = 0.75
else 
	prerequisites_mod = "tank"
end

data.raw["technology"]["kj_2a6"].unit.count = multiplier * data.raw["technology"]["kj_2a6"].unit.count
data.raw["technology"]["kj_2a6_ammo"].unit.count = multiplier * data.raw["technology"]["kj_2a6_ammo"].unit.count

table.insert(data.raw["technology"]["kj_2a6"].prerequisites, prerequisites_mod)

require("prototypes.equipment_vehicle")
require("recipe_changes")


