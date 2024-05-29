
function configChange(data)
	if data.mod_startup_settings_changed == true then
		for _, force in pairs(game.forces) do
			force.reset_technology_effects()
		end
		
		--Doesnt work and I can't be bothered to figure it out rn. Ppl should just not deactivate the option and wonder where the turrets went.
		--[[
		local result = game.get_filtered_entity_prototypes({{filter = "name", name = "kj_phalanx_nonAA"}, {filter = "type", type = "ammo-turret", mode = "and"}})
		--game.print(serpent.block(result))
		game.print("Non AA version deleted.")
		
		if result == nil then
			for _, surface in pairs(game.surfaces) do
			  for _, entity in pairs(surface.find_entities_filtered{name = "kj_phalanx_nonAA"}) do
				game.print("NonAA found.")
				surface.create_entity{
					name = "kj_phalanx",
					position = {entity.position.x, entity.position.y},
					force = entity.force,
				}
			  end
			end
		end
		]]
	end
end

script.on_configuration_changed(configChange)