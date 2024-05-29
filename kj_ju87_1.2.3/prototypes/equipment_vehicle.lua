if mods["Krastorio2"] then
	data:extend(
	{	
		{
			type = "equipment-category",
			name = "vehicle-motor"
		},
		-- Maustank
		{
			type = "equipment-grid",
			name = "kj_ju87",
			width = 8,
			height = 8,
			equipment_categories = {
				"universal-equipment",
				"reactor-equipment",
				"vehicle-robot-interaction-equipment",
				"vehicle-equipment",
				"vehicle-motor",
				"armor-shield",
				"armor-weapons",
				"belt-immunity"
			}
		},
	})
else
	data:extend(
	{	
		{
			type = "equipment-category",
			name = "vehicle-motor"
		},
		-- Ju 87
		{
			type = "equipment-grid",
			name = "kj_ju87",
			width = 8,
			height = 8,
			equipment_categories = {"armor"}
		},
	})
end