local boolean = false
local setting = settings.startup["kj_phalanx_target_mask"].value

if data.raw["item"]["kj_compatibility"] then
	boolean = true
	data.raw["item"]["kj_compatibility"].stack_size = 1 + data.raw["item"]["kj_compatibility"].stack_size
else
	data:extend({
		{
			type = "item",
			name = "kj_compatibility",
			icon = "__kj_phalanx__/graphics/compatibility_icon.png",
			icon_size = 128,
			stack_size = 1
		},	
	})
end

require("recipe_changes")

if settings.startup["kj_phalanx_nonAA"].value == true then
	require("nonAA")
end

data:extend({
	{
		type = "trigger-target-type",
		name = "air-unit",
	},
})

data.raw["ammo-turret"]["kj_phalanx"].attack_target_mask = {"air-unit"}


if setting == true then
types = {}
for name, _ in pairs(data.raw["trigger-target-type"]) do
	if name ~= "air-unit" then
		table.insert(types, name)
	end
end
table.insert(types, "common")

	--Assigning Turrets attack_target_mask
	turretTypes = {"ammo", "electric", "fluid"}
	for _, turretType in pairs (turretTypes) do 
		for name, turret in pairs(data.raw[turretType.."-turret"]) do
			log("Name: "..name)
			if string.sub(name,1,3) ~= "kj_" then
				log("Mod foreign turret found.")
				
				if turret.attack_target_mask ~= nil and turret.attack_target_mask["air-unit"] ~= nil then
					data.raw[turretType.."-turret"][name].attack_target_mask["air-unit"] = false
					log("Found a "..turretType.."-turret with air-unit as attack_target_mask. Set to false.")
				else
					data.raw[turretType.."-turret"][name].attack_target_mask = types
				end
			end
		end
	end
end


for name, character in pairs(data.raw["character"]) do
	if character.trigger_target_mask ~= nil then
		table.insert(data.raw["character"][name].trigger_target_mask, "air-unit")
	else
		data.raw["character"][name].trigger_target_mask = {"air-unit", "ground-unit", "common"}
	end
end
