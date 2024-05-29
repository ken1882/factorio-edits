
local ModName = "kj_40kbunker"

function on_configuration_changed(ConfigurationChangedData)
	if game.active_mods["aai-programmable-vehicles"] ~= nil then
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
				if Old <= '1.1.8' and New >= '1.1.9' then
					game.print('[font=heading-1][color=#FF2D00]WH 40K Bunker Mod Update Information![/color][/font]')
					game.print('Version: 1.1.9')
					game.print('Date: 23.05.2023')
					game.print('[font=heading-1]Changes:[/font]')
					game.print('- Recipe for aai version of bunker has been hidden since it was causing lag when attacked by many enemies. Please refrain from using it and use the turret version instead.')
				end
			end
		end
	end
end

script.on_configuration_changed(on_configuration_changed)