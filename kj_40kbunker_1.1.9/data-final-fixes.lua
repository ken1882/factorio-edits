local boolean = false
modName = "kj_40kbunker"

if data.raw["item"]["kj_compatibility"].stack_size > 3 then
	boolean = true
end


if mods["kj_rattetank"] or mods["kj_utilitarian"] or mods["kj_king_jos_vehicles"] or mods["kj_aventador"] or mods["kj_maustank"] or boolean then
	data:extend(
	{	
		{
			type = "item-group",
			name = "kj_vehicles",
			icon = "__kj_40kbunker__/graphics/thumbnail_categories.png",
			icon_size = 560,
			inventory_order = "x",
			order = "kj_vehicles"
		},
	})
	
	data.raw["item-subgroup"][modName].group = "kj_vehicles"
	data.raw["item-subgroup"][modName].order = "w-0[buildings]-bunker"
end

if mods["space-exploration"] then
	data.raw["technology"][modName].unit = 
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
	data.raw["technology"][modName].prerequisites = {"military-3"}
end


if mods["aai-programmable-vehicles"] then
	log("AAI-P-V Mod found. Correcting the recipes.")

	data.raw["recipe"][modName.."-kj_40kbunker_gun"].hidden = true
	
	for i,effect in ipairs(data.raw["technology"][modName].effects) do
		if effect.type == "unlock-recipe" then
			if effect.recipe == modName.."-kj_40kbunker_gun" --[[or effect.recipe == modName.."-kj_40kbunker_gun-reverse"]] then
				log("Recipe "..effect.recipe.." found. Deleting.")
				data.raw["technology"][modName].effects[i] = nil
			end
		end
	end
end