local planeCounter = {}

local planes = {
	kj_b2 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_b2"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_b2")
		end,
	},
	kj_b17 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_b17"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_b17")
		end,
	},
	kj_bf109 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_bf109"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_bf109")
		end,
	},
	kj_ho229 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_ho229"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_ho229")
		end,
	},
	kj_ju52 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_ju52"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_ju52")
		end,
	},
	kj_ju87 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_ju87"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_ju87")
		end,
	},
	kj_jug38 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_jug38"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_jug38")
		end,
	},
	kj_xb35 = {
		["1.2.1"] = function()
			local setting = "aircraft-takeoff-speed-kj_xb35"
			local default = game.get_filtered_mod_setting_prototypes{{filter = "mod", mod = "kj_aircrafts"}}[setting]
			settings.global[setting] = {value = default.default_value}
			table.insert(planeCounter,"kj_xb35")
		end,
	},
}
local migrationFile = require("__flib__.migration")
local message = "There was a major update. It's advised to globally reset the takeoff speed of the following planes in the mod map settings:"

script.on_configuration_changed(function(e)
	for plane, migration in pairs(planes) do 
		if game.active_mods[plane] then
			migrationFile.on_config_changed(e, migration, plane)
		end
	end
	
	for _, lulz in pairs(planeCounter) do
		game.print('[font=heading-1][color=#ff0015]'..message..'[/color][/font]')
		goto lulz
	end
	::lulz::
	
	local planes = ""
	for _, plane in pairs(planeCounter) do
		game.print({"", "[color=#ff0015]- ", {"item-name."..plane}, "[/color]"})
	end
end)


function OnDied(e)
	local entity = e.entity
	
	if entity ~= nil then
		if entity.name ~= nil then
			local name = string.sub(entity.name,1,string.len(entity.name)-9)
			if settings.global[name.."_crash_boom"] then
				if settings.global[name.."_crash_boom"].value == true then
				
					--game.print("Entity died: "..name)
					local surface = entity.surface
					local position = entity.position
					
					inventory = entity.get_inventory(defines.inventory.car_ammo)
					if inventory and inventory.is_empty() == false then
						for i = 1, #inventory, 1 do
							if inventory[i].count > 0 then
								--game.print("Name: "..inventory[i].name)
								--game.print("Count: "..inventory[i].count)
								
								if inventory[i].name == name.."_atom" then
									math.randomseed(game.tick)
									local randomNumber = math.random(1, 100)
									randomNumber = math.random(1, 100)
									randomNumber = math.random(1, 100)
									--game.print("Random: "..randomNumber)
									
									if randomNumber > 65 then
										local bomb = surface.create_entity {
											name = "atomic-rocket",
											position = position,
											force = "enemy",
											target = entity,
											speed = 1,
										}
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

script.on_event(defines.events.on_entity_died, OnDied)