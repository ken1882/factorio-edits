local ModName = "kj_ju87"

function on_configuration_changed(ConfigurationChangedData)
	local Old
	local New
	
	if ConfigurationChangedData.mod_changes[ModName] ~= nil then
		if ConfigurationChangedData.mod_changes[ModName].old_version ~= nil then
			--game.print('Mod Old '..ConfigurationChangedData.mod_changes[ModName].old_version)
			Old = ConfigurationChangedData.mod_changes[ModName].old_version
		end
		
		if ConfigurationChangedData.mod_changes[ModName].new_version ~= nil then
			--game.print('Mod New '..ConfigurationChangedData.mod_changes[ModName].new_version)
			New = ConfigurationChangedData.mod_changes[ModName].new_version
		end
		
		if Old ~= nil and New ~= nil then
			if Old <= '1.1.4' and New >= '1.1.5' then
				game.print('[font=heading-1][color=#FF2D00]Ju-87 Mod Update Information![/color][/font]')
				game.print('Version: 1.1.5')
				game.print('Date: 27.09.2021')
				game.print('[font=heading-1]Changes:[/font]')
				game.print('- Plane now takes off more easily (problem with not enabling realistic acceleration)')
				game.print('[color=#f5cb48]- I RECOMMEND RESETTING THE TAKEOFF SPEED TO DEFAULT IN THE SETTINGS!!![/color]')
			end
		end
	end
end

script.on_configuration_changed(on_configuration_changed)