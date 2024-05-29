local aircraftMaker = require("__AircraftRealism__.aircraftMaker")
local utility 		= require("__AircraftRealism__.logic.utility")
local helpers		= require("helpers")
local userSettings 	= aircraftMaker.getSettings()
local errorSpritesheetLogs = false
local errorLogs = true
local aircraftsBP = {}
local groundedCrafts = {}
local airborneCrafts = {}
local craftName = ""

--Boeing 747
craftName = "kj_747"
if mods[craftName] then
	if errorLogs == true then log("747 found.") end
	aircraftsBP[craftName] = {grounded = {}, airborne = {}}
	aircraftsBP[craftName].name = craftName
	aircraftsBP[craftName].grounded.weight = 6000
	aircraftsBP[craftName].grounded.braking_power = "800kW"
	aircraftsBP[craftName].grounded.rotation_speed = 0.002
	aircraftsBP[craftName].endSpeed = 100
	aircraftsBP[craftName].sounds = true
	aircraftsBP[craftName].soundRatio = true
	aircraftsBP[craftName].flyingSheet = false
	aircraftsBP[craftName].airborne.weight = 6000
	aircraftsBP[craftName].airborne.friction = 0.0002
	aircraftsBP[craftName].airborne.braking_power = "1300kW"
	aircraftsBP[craftName].airborne.rotation_speed = 0.0016
	aircraftsBP[craftName].extra = function(plane)
		plane.animation.layers[1] = helpers.emptyLayer(plane.animation.layers[1])
		return plane
	end
	aircraftsBP[craftName].lightFunction = function(plane)
		plane.light[1].shift[2] = plane.light[1].shift[2] - 5
		plane.light[2].shift[2] = plane.light[2].shift[2] - 5
		plane.light[3].shift[2] = plane.light[3].shift[2] + 4
		return plane
	end
	groundedCrafts[craftName] = data.raw["car"][craftName]
	airborneCrafts[craftName] = craftName
	if errorLogs == true then log("747 properties initialised.") end
end

--Northrop B-2 Spirit
craftName = "kj_b2"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("B2 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 5000
		aircraftsBP[craftName].grounded.braking_power = "1000kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.003
		aircraftsBP[craftName].endSpeed = 120
		aircraftsBP[craftName].sounds = true
		aircraftsBP[craftName].soundRatio = true
		aircraftsBP[craftName].flyingSheet = true
		aircraftsBP[craftName].airborne.weight = 1500
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "1000kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.004
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] - 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("B2 properties initialised.") end
	end
end

--Flying Fortress B17-Bomber
craftName = "kj_b17"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("B17 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 10000
		aircraftsBP[craftName].grounded.braking_power = "900kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.002
		aircraftsBP[craftName].endSpeed = 60
		aircraftsBP[craftName].sounds = true
		aircraftsBP[craftName].soundRatio = true
		aircraftsBP[craftName].flyingSheet = false
		aircraftsBP[craftName].airborne.weight = 10000
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "900kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.0016
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] - 5
			plane.light[3].shift[2] = plane.light[3].shift[2] + 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("B17 properties initialised.") end
	end
end

--Bf 109
craftName = "kj_bf109"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("BF-109 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 2200
		aircraftsBP[craftName].grounded.braking_power = "200kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.009
		aircraftsBP[craftName].endSpeed = 60
		aircraftsBP[craftName].sounds = false
		aircraftsBP[craftName].soundRatio = false
		aircraftsBP[craftName].flyingSheet = false
		aircraftsBP[craftName].airborne.weight = 2200
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "150kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.004
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] + 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("BF-109 properties initialised.") end
	end
end

--Ho-229
craftName = "kj_ho229"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("HO-299 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 5000
		aircraftsBP[craftName].grounded.braking_power = "800kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.009
		aircraftsBP[craftName].endSpeed = 220
		aircraftsBP[craftName].sounds = true
		aircraftsBP[craftName].soundRatio = true
		aircraftsBP[craftName].flyingSheet = true
		aircraftsBP[craftName].airborne.weight = 1500
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "600kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.004
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("HO-299 properties initialised.") end
	end
end

--Ju 52
craftName = "kj_ju52"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("Ju 52 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 5700
		aircraftsBP[craftName].grounded.braking_power = "380kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.003
		aircraftsBP[craftName].endSpeed = 60
		aircraftsBP[craftName].sounds = false
		aircraftsBP[craftName].soundRatio = false
		aircraftsBP[craftName].flyingSheet = false
		aircraftsBP[craftName].airborne.weight = 5700
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "450kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.0019
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] + 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("Ju 52 properties initialised.") end
	end
end

--Ju 87
craftName = "kj_ju87"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("Ju 87 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 2750
		aircraftsBP[craftName].grounded.braking_power = "200kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.008
		aircraftsBP[craftName].endSpeed = 60
		aircraftsBP[craftName].sounds = false
		aircraftsBP[craftName].soundRatio = false
		aircraftsBP[craftName].flyingSheet = false
		aircraftsBP[craftName].airborne.weight = 2750
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "350kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.0035
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] + 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("Ju 87 properties initialised.") end
	end
end

--Ju G38
craftName = "kj_jug38"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("Ju G38 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 16000
		aircraftsBP[craftName].grounded.braking_power = "500kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.002
		aircraftsBP[craftName].endSpeed = 100
		aircraftsBP[craftName].sounds = true
		aircraftsBP[craftName].soundRatio = true
		aircraftsBP[craftName].soundScalingRatio = 0.08
		aircraftsBP[craftName].flyingSheet = false
		aircraftsBP[craftName].airborne.weight = 16000
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "700kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.0016
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] + 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("Ju G38 properties initialised.") end
	end
end

--XB 35
craftName = "kj_xb35"
if mods[craftName] then
	if not helpers.versions(mods[craftName], "1.2.1") then
		if errorLogs == true then log("XB 35 found.") end
		aircraftsBP[craftName] = {grounded = {}, airborne = {}}
		aircraftsBP[craftName].name = craftName
		aircraftsBP[craftName].grounded.weight = 11000
		aircraftsBP[craftName].grounded.braking_power = "900kW"
		aircraftsBP[craftName].grounded.rotation_speed = 0.002
		aircraftsBP[craftName].endSpeed = 100
		aircraftsBP[craftName].sounds = true
		aircraftsBP[craftName].soundRatio = true
		aircraftsBP[craftName].soundScalingRatio = 0.01
		aircraftsBP[craftName].flyingSheet = false
		aircraftsBP[craftName].airborne.weight = 11000
		aircraftsBP[craftName].airborne.friction = 0.0002
		aircraftsBP[craftName].airborne.braking_power = "1400kW"
		aircraftsBP[craftName].airborne.rotation_speed = 0.0016
		aircraftsBP[craftName].extra = function(plane)
			plane.animation.layers[1] = helpers.emptyLayer(plane.animation.layers[1])
			return plane
		end
		aircraftsBP[craftName].lightFunction = function(plane)
			plane.light[1].shift[2] = plane.light[1].shift[2] - 5
			plane.light[2].shift[2] = plane.light[2].shift[2] + 5
			return plane
		end
		groundedCrafts[craftName] = data.raw["car"][craftName]
		airborneCrafts[craftName] = craftName
		if errorLogs == true then log("XB 35 properties initialised.") end
	end
end


---------------------------
--Grounded Plane Settings--
---------------------------
for name, groundedPlane in pairs(groundedCrafts) do
	if errorLogs == true then log("Making "..name.." grounded.") end
    groundedPlane.burner.smoke = data.raw["car"][name].burner.smoke
    groundedPlane.turret_rotation_speed = 1
	
    --if userSettings.rAcceleration then
        groundedPlane.weight = aircraftsBP[name].grounded.weight
    --end
    if userSettings.rBraking then
        groundedPlane.braking_power = aircraftsBP[name].grounded.braking_power
    end
    if userSettings.rTurnRadius then
        groundedPlane.rotation_speed = aircraftsBP[name].grounded.rotation_speed;
    end
		
    local lightFileG = require("__"..name.."__.prototypes.light")
    groundedPlane.light = lightFileG
	
    aircraftMaker.makeGrounded({prototype = groundedPlane})
	
	if errorLogs == true then log("Made "..name.." grounded.") end
end


---------------------------
--Airborne Plane Settings--
---------------------------
for name, airbornePlane in pairs(airborneCrafts) do
	if errorLogs == true then log("Making "..name.." airborne.") end
	airbornePlane = aircraftMaker.makeAirborne({name = airbornePlane})
    helpers.findChadows(airbornePlane)
    helpers.makeAirborne({
        name = name,
        shadow = {
            directionCount = 128,
            endSpeed = aircraftsBP[name].endSpeed / 216,
        }
    })

    if settings.startup[name.."no_melee_damage"].value == true then
        for i,value in ipairs(airbornePlane.resistances) do
            if value.type ~= "flak" then
                airbornePlane.resistances[i].decrease = 50
                airbornePlane.resistances[i].percent = 100
            end
        end
    end
	
	airbornePlane.is_military_target = true
    airbornePlane.terrain_friction_modifier = 0
	
    local lightFileA = require("__"..name.."__.prototypes.light")
    airbornePlane.light = table.deepcopy(lightFileA)
    airbornePlane = aircraftsBP[name].lightFunction(airbornePlane)

    if mods["PickerVehicles"] or mods["light-overhaul"] then
        --CHANGE LIGHT CONES TO BETTER ONES
    end

    --Does the Plane use a different Sound when airborne?
    if aircraftsBP[name].sounds == true then
        airbornePlane.working_sound.sound.filename = "__"..name.."__/sounds/motor_airborne.ogg"
		if aircraftsBP[name].soundRatio == true then
			if aircraftsBP[name].soundScalingRatio then
				airbornePlane.sound_scaling_ratio = aircraftsBP[name].soundScalingRatio
			else
				airbornePlane.sound_scaling_ratio = airbornePlane.sound_scaling_ratio * 0.5
			end
		end
    end
    
    --Does the Plane use a different Animation Sheet when airborne?
    if aircraftsBP[name].flyingSheet == true then
        for i, stripe in ipairs(airbornePlane.animation.layers[1].stripes) do
            airbornePlane.animation.layers[1].stripes[i].filename = "__"..name.."__/graphics/entity/"..string.sub(name, 4, string.len(name)).."_flying_spritesheet"..(i-1)..".png"
            airbornePlane.animation.layers[1].hr_version.stripes[i].filename = "__"..name.."__/graphics/entity/"..string.sub(name, 4, string.len(name)).."_flying_hr_spritesheet"..(i-1)..".png"
        end
    end

    --Setup of airborne Plane Settings
    airbornePlane.turret_rotation_speed = 1
    airbornePlane.weight = aircraftsBP[name].airborne.weight
    airbornePlane.friction = aircraftsBP[name].airborne.friction
    airbornePlane.burner.smoke = data.raw["car"][name].burner.smoke
    if userSettings.rBraking then
        airbornePlane.braking_power = aircraftsBP[name].airborne.braking_power
    end
    if userSettings.rTurnRadius then
        airbornePlane.rotation_speed = aircraftsBP[name].airborne.rotation_speed
    end

	if aircraftsBP[name].extra then
		airbornePlane = aircraftsBP[name].extra(airbornePlane)
		if errorLogs == true then log("Doing extras.") end
	end

	if errorLogs == true then log("Made "..name.." airborne.") end
end
