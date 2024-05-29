local utility = require("__AircraftRealism__.logic.utility")
local migrationFile = require("__flib__.migration")

local helpers = {}

------------------
--HELP FUNCTIONS--
------------------

--Makes an Empty Layer
local function emptyLayer(data)
	local layer
	layer = {
		width = 1,
		height = 1,
		frame_count = data.frame_count,
		direction_count = data.direction_count,
        animation_speed = data.animation_speed,
        max_advance = data.max_advance,
		filename = "__kj_aircrafts__/graphics/empty128.png"
	}
end

--Find Shadow Layers and replace with Empty Layers
local function findChadows(entity)
	for i,value in ipairs(entity.animation.layers) do
		if value.draw_as_shadow == true then
			entity.animation.layers[i] = emptyLayer(value)
		end
	end
end

--Saves the runtime Info of each Plane
local function setupRuntimeInfo(groundedName, airborneName, airborne, setupData)
    local planeData = utility.getPlaneData(true)

    local dataIdx = 0
    if airborne then
        if planeData.grounded[groundedName] then
            -- Already created grounded plane, save data using its index
            dataIdx = planeData.grounded[groundedName]
        else
            table.insert(planeData.data, {})
            dataIdx = utility.getTableLength(planeData.data)
        end
        planeData.airborne[airborneName] = dataIdx
    end
    if setupData then
        setupData(planeData.data[dataIdx])
    end

    utility.savePlaneData(planeData)
end

--Make the airborne Plane
local function makeAirborne(config)
    -- Validate config
    if config.name == nil then
        error("Missing table member: name")
    end

    if config.shadow then
        if config.shadow.directionCount == nil then
            error("Missing table member: directionCount")
        end
        if config.shadow.endSpeed == nil then
            error("Missing table member: endSpeed")
        end
        if config.shadow.tileOffsetFinal == nil then
            config.shadow.tileOffsetFinal = {50, 20}
        end
        if config.shadow.renderLayer == nil then
            config.shadow.renderLayer = "smoke" -- Layer right below air-object
        end
        if config.shadow.alphaInitial == nil then
            config.shadow.alphaInitial = 0.5
        end
	end
	
    setupRuntimeInfo(config.name, config.name.."-airborne", true, function(data)
        if config.shadow then
            assert(data.shadow == nil, config.name.." already has shadow data, did you call makeAirborne twice?")
            data.shadow = {}
            data.shadow.endSpeed = config.shadow.endSpeed
            data.shadow.tileOffsetFinal = config.shadow.tileOffsetFinal
            data.shadow.renderLayer = config.shadow.renderLayer
            data.shadow.alphaInitial = config.shadow.alphaInitial
            data.shadow.directionCount = config.shadow.directionCount
        end
    end)


     -- Shadow creation
    if errorSpritesheetLogs == true then log(config.name.." Shadow Sprites Creation") end
    if config.shadow then
        -- Load each rotation as its own sprite, so it can be rendered
        
        local sprites = {}
        local shadowlayer = 0
        for i, layer in ipairs(data.raw["car"][config.name].animation.layers) do
            local count = 0
            
            if layer.draw_as_shadow == true then
                if errorSpritesheetLogs == true then log(config.name.."---------------------------") end
                if errorSpritesheetLogs == true then log(config.name.." Found shadow layer: #"..i) end
                shadowlayer = shadowlayer + 1
                -- loop over every shadow layer

                local filename = ""
                for j, stripe in ipairs(layer.stripes) do
                    if filename == stripe.filename then
                        if errorSpritesheetLogs == true then log(config.name.." File Duplicate, Skipping") end
                        goto continueSprite
                    end
                    -- skip sprite if its a duplicate

                    filename = stripe.filename
                    
                    if string.find(filename, "rotor") then
                        if errorSpritesheetLogs == true then log(config.name.." Found Rotor Sprite, Skipping Layer") end
						shadowlayer = shadowlayer - 1
                        goto continueNextLayer
					elseif string.find(filename, "wheels") then
                        if errorSpritesheetLogs == true then log(config.name.." Found Wheels Sprite, Skipping Layer") end
						shadowlayer = shadowlayer - 1
                        goto continueNextLayer
                    end
                    -- skip layer if it contains rotor shadows

                    if errorSpritesheetLogs == true then log(config.name.." Stripe "..j) end
                    if errorSpritesheetLogs == true then log(config.name.." "..stripe.filename) end
                    if errorSpritesheetLogs == true then log(config.name.." W|H "..stripe.width_in_frames.."|"..stripe.height_in_frames) end
                    -- loop over every stripe in the layer

                    for y = 0, stripe.height_in_frames - 1 do

                        --Does plane have an animation or still pic
                        local frameCount
                        if layer.frame_count > 1 then
                            frameCount = (stripe.width_in_frames - layer.frame_count) % 1
                        else
                            frameCount = stripe.width_in_frames - 1
                        end

                        for x = 0, frameCount do
                            if errorSpritesheetLogs == true then log(config.name.." Attempt to add Sprite X|Y "..y.."|"..x) end
                            -- loop over every shadow in the images

                            if shadowlayer == 1 then
                                table.insert(sprites, {
                                        type = "sprite",
                                        name = config.name .. "-airborne-shadow-" .. tostring(count),
                                        layers = {
                                            {
                                                filename = stripe.filename,
                                                width = layer.width,
                                                height= layer.height,
                                                x = x * layer.width,
                                                y = y * layer.height,
                                                shift = layer.shift,
                                                scale = layer.scale,
                                                -- draw_as_shadow puts the shadow on the wrong layer - below the entities
                                            }
                                        }
                                    }
                                )
                            else
                                table.insert(sprites[count+1].layers, {
                                        filename = stripe.filename,
                                        width = layer.width,
                                        height= layer.height,
                                        x = x * layer.width,
                                        y = y * layer.height,
                                        shift = layer.shift,
                                        scale = layer.scale,
                                        -- draw_as_shadow puts the shadow on the wrong layer - below the entities
                                    }
                                )
                            end

                            count = count + 1
                            if errorSpritesheetLogs == true then log(config.name.." Sprite inserted. Number: "..count.." Layer: "..shadowlayer) end
                        end
                    end
                    
                    ::continueSprite::
                end
                
                count = 0
                filename = ""
                if layer.hr_version then
                    if errorSpritesheetLogs == true then log(config.name.." Found hr version") end
                    for j, stripe in ipairs(layer.hr_version.stripes) do
                        if filename == stripe.filename then
                            if errorSpritesheetLogs == true then log(config.name.." HR File Duplicate, Skipping") end
                            goto continueHR
                        end
                        filename = stripe.filename
                        if errorSpritesheetLogs == true then log(config.name.." HR Stripe "..j) end
                        if errorSpritesheetLogs == true then log(config.name.." "..stripe.filename) end
                        if errorSpritesheetLogs == true then log(config.name.." W|H "..stripe.width_in_frames.."|"..stripe.height_in_frames) end
                        -- loop over every stripe in the hr version of the layer

                        for y = 0, stripe.height_in_frames - 1 do

                            --Does plane have an animation or still pic
                            local frameCount
                            if layer.frame_count > 1 then
                                frameCount = (stripe.width_in_frames - layer.frame_count) % 1
                            else
                                frameCount = stripe.width_in_frames - 1
                            end

                            for x = 0, frameCount do
                                if errorSpritesheetLogs == true then log(config.name.." Attempt to add HR Sprite X|Y "..y.."|"..x) end
                                -- loop over every shadow in the images

                                sprites[count+1].layers[shadowlayer]["hr_version"] = {
                                    filename = stripe.filename,
                
                                    width = layer.hr_version.width,
                                    height= layer.hr_version.height,
                                    x = x * layer.hr_version.width,
                                    y = y * layer.hr_version.height,
                                    shift = layer.hr_version.shift,
                                    scale = layer.hr_version.scale,
                                    -- draw_as_shadow puts the shadow on the wrong layer - below the entities
                                }

                                count = count + 1
                                if errorSpritesheetLogs == true then log(config.name.." HR Count: "..count) end
                            end
                        end
                        
                        ::continueHR::
                    end
                end
            end
            
            ::continueNextLayer::
        end

        for _, sprite in ipairs(sprites) do
            data:extend{sprite}
        end
    end
end

--Compare two Mod Versions
local function versions(old, new)
	return migrationFile.is_newer_version(migrationFile.format_version(old, "%03d"), migrationFile.format_version(new, "%03d"))
end

helpers.emptyLayer = emptyLayer
helpers.findChadows = findChadows
helpers.makeAirborne = makeAirborne
helpers.versions = versions

return helpers