local helpers = require("helpers")
local planes = {
	kj_747 = 	{takeoff = 300, landing = 200},
	kj_b2 = 	{takeoff = 200, landing = 150},
	kj_b17 =	{takeoff = 200, landing = 150},
	kj_bf109 =	{takeoff = 180, landing = 130},
	kj_ho229 =	{takeoff = 180, landing = 130},
	kj_ju52 =	{takeoff = 120, landing = 106},
	kj_ju87 =	{takeoff = 180, landing = 130},
	kj_jug38 =	{takeoff = 120, landing = 100},
	kj_xb35 =	{takeoff = 200, landing = 150},
}

for name, plane in pairs(planes) do
	if mods[name] then
		if not helpers.versions(mods[name], "1.2.1") then
			data:extend({
				{
					type = "double-setting",
					name = "aircraft-takeoff-speed-"..name,
					setting_type = "runtime-global",
					minimum_value = 0,
					default_value = plane.takeoff,
					localised_name = {"", {"item-name."..name}, {"mod-setting-name.takeoff_speed"}},
					localised_description = {"", {"mod-setting-description.takeoff_speed"}},
					order = name.."_takeoff_speed",
				},
				{
					type = "double-setting",
					name = "aircraft-landing-speed-"..name,
					setting_type = "runtime-global",
					minimum_value = 0,
					default_value = plane.landing,
					localised_name = {"", {"item-name."..name}, {"mod-setting-name.landing_speed"}},
					localised_description = {"", {"mod-setting-description.landing_speed"}},
					order = name.."_landing_speed",
					hidden = true,
				},
			})
		end
	end
end

if mods["kj_b17"] then
	if not helpers.versions(mods["kj_b17"], "1.2.1") then
		data:extend({
			{
				type = "bool-setting",
				name = "kj_b17_crash_boom",
				setting_type = "runtime-global",
				default_value = true,
				localised_name = {"", {"item-name.kj_b17"}, {"mod-setting-name.crash_boom"}},
				localised_description = {"", {"mod-setting-description.crash_boom"}},
				order = "kj_b17_crash_boom",
			}
		})
	end
end

if mods["kj_b2"] then
	if not helpers.versions(mods["kj_b2"], "1.2.1") then
		data:extend({
			{
				type = "bool-setting",
				name = "kj_b2_crash_boom",
				setting_type = "runtime-global",
				default_value = true  ,
				localised_name = {"", {"item-name.kj_b2"}, {"mod-setting-name.crash_boom"}},
				localised_description = {"", {"mod-setting-description.crash_boom"}},
				order = "kj_b2_crash_boom",
			}
		})
	end
end

if mods["kj_xb35"] then
	if not helpers.versions(mods["kj_xb35"], "1.2.1") then
		data:extend({
			{
				type = "bool-setting",
				name = "kj_xb35_crash_boom",
				setting_type = "runtime-global",
				default_value = true  ,
				localised_name = {"", {"item-name.kj_xb35"}, {"mod-setting-name.crash_boom"}},
				localised_description = {"", {"mod-setting-description.crash_boom"}},
				order = "kj_xb35_crash_boom",
			}
		})
	end
end
