local boolean = false

if data.raw["item"]["kj_compatibility"] then
	boolean = true
	data.raw["item"]["kj_compatibility"].stack_size = 1 + data.raw["item"]["kj_compatibility"].stack_size
else
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_40klemanruss__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end


if mods["kj_40kpredator"] then
	table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_40kpredator")
else
	table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "tank")
	table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "kj_gasoline")
end


if mods["Wh40k_Armoury_fork"] or mods["Wh40k_Armoury"] then
	data.raw["gun"]["kj_lemanruss_bolter"].attack_parameters["ammo_category"] = "bolt100"
	table.insert(data.raw["technology"]["kj_40klemanruss"].prerequisites, "basic-bolter")
else
	table.insert(data.raw["technology"]["kj_40klemanruss"].effects, {type = "unlock-recipe", recipe = "kj_bolt"})
end

require("prototypes.equipment_vehicle")
require("recipe_changes")
