if mods["Krastorio2"] then
	data:extend({	
		-- Cargoship
		{
			type = "equipment-grid",
			name = "cargoship-grid",
			width = 20,
			height = 12,
			equipment_categories = {
				"universal-equipment",
				"reactor-equipment",
				"vehicle-robot-interaction-equipment",
				"vehicle-equipment",
				"vehicle-motor",
				"armor-shield",
				"armor-weapons",
			}
		},
		{
			type = "equipment-grid",
			name = "shipwagon-grid",
			width = 28,
			height = 14,
			equipment_categories = {
				"universal-equipment",
				"reactor-equipment",
				"vehicle-robot-interaction-equipment",
				"vehicle-equipment",
				"vehicle-motor",
				"armor-shield",
				"armor-weapons",
			}
		},
		{
			type = "equipment-grid",
			name = "boat-grid",
			width = 10,
			height = 8,
			equipment_categories = {
				"universal-equipment",
				"reactor-equipment",
				"vehicle-robot-interaction-equipment",
				"vehicle-equipment",
				"vehicle-motor",
				"armor-shield",
				"armor-weapons",
			}
		},
	})
else
	data:extend({
		-- Cargoship
		{
			type = "equipment-grid",
			name = "cargoship-grid",
			width = 20,
			height = 12,
			equipment_categories = {"armor"}
		},
		{
			type = "equipment-grid",
			name = "shipwagon-grid",
			width = 28,
			height = 14,
			equipment_categories = {"armor"}
		},
		{
			type = "equipment-grid",
			name = "boat-grid",
			width = 10,
			height = 8,
			equipment_categories = {"armor"}
		},
	})
end