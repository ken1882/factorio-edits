local shell_cates = {
	"kj_280SKC34",
	"kj_rh120",
	"kj_128kwk",
	"kj_pak",
	"kj_75kwk40",
}

local mag_cates = {
	"kj_plane_mg17",
	"kj_plane_mk108",
	"kj_apds_phalanx",
	"kj_2cmfv_vierling",
	"kj_2cmfv",
}

local bomb_cates = {
	"kj_b17_bombs",
	"kj_ju87_big",
	"kj_ju87_small",
	"kj_plane_xb35",
}

for _,cate in ipairs(shell_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-2"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.3
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-3"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.5
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.8
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 1.2
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 1.5
	})

	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-2"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.1
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-3"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.25
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-4"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.35
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-5"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.5
	})
end

for _,cate in ipairs(mag_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-2"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.1
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-3"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.1
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.2
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.3
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.4
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-7"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.5
	})


	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-2"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.05
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-3"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.1
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-4"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.1
	})	
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-5"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.1
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-6"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
end

for _,cate in ipairs(bomb_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-stronger-explosives-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.8
	})
		
	table.insert(data.raw["technology"]["rampant-arsenal-technology-stronger-explosives-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 1.2
	})
		
	table.insert(data.raw["technology"]["rampant-arsenal-technology-stronger-explosives-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 1.5
	})

	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-4"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.3
	})
		
	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-5"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.5
	})
end