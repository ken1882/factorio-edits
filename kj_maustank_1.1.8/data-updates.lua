local prerequisites_mod = ""
local boolean = false

if data.raw["item"]["kj_compatibility"] then
	boolean = true
	data.raw["item"]["kj_compatibility"].stack_size = 1 + data.raw["item"]["kj_compatibility"].stack_size
else
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_maustank__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end

if mods["kj_panzer4"] then
	table.insert(data.raw["car"]["kj_maustank"].guns, "kj_75kwk40")
	table.insert(data.raw["technology"]["kj_maustank_ammo"].prerequisites, "kj_panzer4_ammo")
	prerequisites_mod = "kj_panzer4"
else
	prerequisites_mod = "tank"
end

table.insert(data.raw["technology"]["kj_maustank"].prerequisites, prerequisites_mod)

require("prototypes.equipment_vehicle")
require("recipe_changes")


