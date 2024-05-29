function on_configuration_changed(ConfigurationChangedData)
	local Old
	local New
	
	if ConfigurationChangedData.mod_changes["kj_b17"] ~= nil then
		if ConfigurationChangedData.mod_changes["kj_b17"].old_version ~= nil then
			Old = ConfigurationChangedData.mod_changes["kj_b17"].old_version
		end
		
		if ConfigurationChangedData.mod_changes["kj_b17"].new_version ~= nil then
			New = ConfigurationChangedData.mod_changes["kj_b17"].new_version
		end
		
		if Old ~= nil and New ~= nil then
			if Old <= '1.1.5' and New >= '1.1.6' then
				game.print('[font=heading-1][color=#FF2D00]B-17 Mod Update Information![/color][/font]')
				game.print('Version: 1.1.6')
				game.print('Date: 27.09.2021')
				game.print('[font=heading-1]Changes:[/font]')
				game.print('- Plane now takes off more easily (problem with not enabling realistic acceleration)')
				game.print('[color=#f5cb48]- I RECOMMEND RESETTING THE TAKEOFF SPEED TO DEFAULT IN THE SETTINGS!!![/color]')
			end
		end
	end
end

script.on_configuration_changed(on_configuration_changed)