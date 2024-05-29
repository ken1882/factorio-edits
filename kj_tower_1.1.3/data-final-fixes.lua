local boolean = false


if data.raw["item"]["kj_compatibility"].stack_size > 3 then
	boolean = true
end


if mods["kj_rattetank"] or mods["kj_utilitarian"] or mods["kj_king_jos_vehicles"] or mods["kj_aventador"] or mods["kj_maustank"] or boolean then
	data:extend(
	{	
		{
			type = "item-group",
			name = "kj_vehicles",
			icon = "__kj_tower__/graphics/thumbnail_categories.png",
			icon_size = 560,
			inventory_order = "x",
			order = "kj_vehicles"
		},
	})
	
	data.raw["item-subgroup"]["kj_tower"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_tower"].order = "w-0[buildings]-tower"
end
--[[
if mods["space-exploration"] then
	data.raw["technology"]["kj_tower"].unit = 
    {
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 40
    }
	data.raw["technology"]["kj_tower"].prerequisites = {"military-3"}
end]]
