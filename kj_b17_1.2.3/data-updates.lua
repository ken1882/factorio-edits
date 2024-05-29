local boolean = false

if data.raw["item"]["kj_compatibility"] then
	boolean = true
	data.raw["item"]["kj_compatibility"].stack_size = 1 + data.raw["item"]["kj_compatibility"].stack_size
else
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_b17__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end

if settings.startup["kj_b17unrealistic_bombload"].value == true then
	data.raw["ammo"]["kj_b17_normal"].stack_size = 20 * data.raw["ammo"]["kj_b17_normal"].stack_size
	data.raw["ammo"]["kj_b17_medium"].stack_size = 20 * data.raw["ammo"]["kj_b17_medium"].stack_size
	data.raw["ammo"]["kj_b17_big"].stack_size    = 20 * data.raw["ammo"]["kj_b17_big"].stack_size
	data.raw["ammo"]["kj_b17_huge"].stack_size   = 20 * data.raw["ammo"]["kj_b17_huge"].stack_size
	data.raw["ammo"]["kj_b17_atom"].stack_size   = 20 * data.raw["ammo"]["kj_b17_atom"].stack_size
end

require("recipe_changes")
