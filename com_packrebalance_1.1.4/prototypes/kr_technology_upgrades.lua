local mag_cates = {
	"anti-material-rifle-ammo",
	"pistol-ammo",
}

local shell_cates = {
	"railgun-shell",
}

local laser_cates = {
    "impulse-rifle",
    "laser-cannon"
}

local rocket_cates = {
    "heavy-rocket",
    "missiles-for-turrets"
}

for _,cate in ipairs(mag_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-1"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-2"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-3"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})	
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-damage-7"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})

    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-1"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.2
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-2"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.2
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-3"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-4"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-5"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-bullet-speed-6"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
end

for _,cate in ipairs(shell_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-1"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-2"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-3"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})	
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-damage-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})

    table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-1"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.2
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-2"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.2
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-3"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-4"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-cannon-shell-speed-5"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
end

for _,cate in ipairs(laser_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-1"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-2"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-3"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})	
	table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-energy-weapons-damage-7"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
end

for _,cate in ipairs(rocket_cates) do
	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-1"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-2"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-3"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.25
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-4"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-5"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})	
	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-6"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-damage-7"].effects, {
		type = "ammo-damage",
		ammo_category = cate,
		modifier = 0.35
	})

    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-1"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.2
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-2"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.2
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-3"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-4"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
	table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-5"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
    table.insert(data.raw["technology"]["rampant-arsenal-technology-rocket-speed-6"].effects, {
		type = "gun-speed",
		ammo_category = cate,
		modifier = 0.15
	})
end