if mods["Krastorio2"] then
	data:extend(
	{	

		{
			type = "equipment-category",
			name = "vehicle-motor"
		},
		-- Rattetank
		{
			type = "equipment-grid",
			name = "kj_rattetank",
			width = 28,
			height = 20,
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
		-- Rattetank
		{
			type = "equipment-grid",
			name = "kj_rattetank",
			width = 28,
			height = 20,
			equipment_categories = {"armor"}
		},
	})
end