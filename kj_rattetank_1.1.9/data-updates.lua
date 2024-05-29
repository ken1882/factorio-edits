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
			icon = "__kj_rattetank__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end

if mods["kj_maustank"] then
	prerequisites_mod = "kj_maustank"
	
	table.insert(data.raw["technology"]["kj_rattetank_ammo"].prerequisites, "kj_maustank_ammo")
else
	prerequisites_mod = "tank"
end
table.insert(data.raw["technology"]["kj_rattetank"].prerequisites, prerequisites_mod)

require("prototypes.equipment_vehicle")
require("recipe_changes")