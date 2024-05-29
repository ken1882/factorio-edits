local function getTableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

local function insertItems(oldInventory, newInventory)
    if oldInventory then
        assert(newInventory, "Old plane has inventory, new plane does not. Check plane prototypes")
        -- With this method, inventory items stay in the same place
        for i = 1, #oldInventory, 1 do
            if i <= #newInventory then
                newInventory[i].set_stack(oldInventory[i])
            end
        end
    end
end

function transitionHeli(oldPlane, newPlane, game, defines, takingOff)
    newPlane.copy_settings(oldPlane)

    -- Set Fuel bar
    if oldPlane.burner then
        assert(newPlane.burner, "Old plane has burner, new plane does not. Check plane prototypes")
        newPlane.burner.currently_burning = oldPlane.burner.currently_burning
        newPlane.burner.remaining_burning_fuel = oldPlane.burner.remaining_burning_fuel
    end

    -- The inventories cannot differ, or else items disappear
    -- Set fuel inventory
    insertItems(oldPlane.get_fuel_inventory(), newPlane.get_fuel_inventory())

    -- Set item inventory
    insertItems(oldPlane.get_inventory(defines.inventory.car_trunk), newPlane.get_inventory(defines.inventory.car_trunk))

    -- Set weapon item inventory
    insertItems(oldPlane.get_inventory(defines.inventory.car_ammo), newPlane.get_inventory(defines.inventory.car_ammo))

    -- Select the last weapon
    if oldPlane.selected_gun_index then
        assert(getTableLength(oldPlane.prototype.guns) == getTableLength(newPlane.prototype.guns), "Old plane does not have same number of guns as new plane. Check plane prototypes")
        newPlane.selected_gun_index = oldPlane.selected_gun_index
    end

    -- Transfer over equipment grid
    if oldPlane.grid then
        assert(newPlane.grid, "Old plane has grid, new plane does not. Check plane prototypes")
        for index,item in pairs(oldPlane.grid.equipment) do
            local addedEquipment = newPlane.grid.put{name=item.name, position=item.position}
            assert(addedEquipment, "Could not insert old plane equipment into new plane. Check plane prototypes")

            -- Transfer over charge and shield capacity

            -- We MUST check for non zero, otherwise attempting to set for item which
            -- does not have energy or shield is an error
            if item.energy ~= 0 then addedEquipment.energy = item.energy end
            if item.shield ~= 0 then addedEquipment.shield = item.shield end

            if item.burner then
                assert(addedEquipment.burner, "Old plane equipment has burner, new plane equipment does not. Check plane prototypes")
                -- Transfer burner contents
                insertItems(item.burner.inventory, addedEquipment.burner.inventory)

                addedEquipment.burner.currently_burning = item.burner.currently_burning
                addedEquipment.burner.heat = item.burner.heat
                addedEquipment.burner.remaining_burning_fuel = item.burner.remaining_burning_fuel
            end
        end
    end

    -- Health (Grounded planes have 2x less health with realistic health option checked)
    -- Test if planes have the different max healths, to perform health scaling
    if game.entity_prototypes[newPlane.name].max_health ~= game.entity_prototypes[oldPlane.name].max_health then
        if takingOff then
            -- Airborne
            newPlane.health = oldPlane.health * 2
        else
            -- Grounded
            newPlane.health = oldPlane.health / 2

        end
    else
        newPlane.health = oldPlane.health
    end

    newPlane.destructible = oldPlane.destructible
    newPlane.operable = oldPlane.operable
    if oldPlane.relative_turret_orientation then
        assert(newPlane.relative_turret_orientation, "Old plane has relative_turret_orientation, new plane does not. Check plane prototypes")
        newPlane.relative_turret_orientation = oldPlane.relative_turret_orientation
    end
    newPlane.effectivity_modifier = oldPlane.effectivity_modifier
    newPlane.consumption_modifier = oldPlane.consumption_modifier
    newPlane.friction_modifier = oldPlane.friction_modifier
    newPlane.speed = oldPlane.speed
    newPlane.orientation = oldPlane.orientation

    -- Destroy the old plane first before setting the passenger and driver to the new plane or else the game doesn't like it
    local driver = oldPlane.get_driver()
    local passenger = oldPlane.get_passenger()
    oldPlane.destroy{ raise_destroy = true }

    -- Drivers / passengers
    newPlane.set_driver(driver)
    newPlane.set_passenger(passenger)
end

function heliTakeoff(player, heli, game, defines, settings)
    -- assert(player.vehicle)
    -- If player is grounded and plane is greater than the specified takeoff speed
    -- if utility.isGroundedPlane(player.vehicle.prototype.name) and
    -- player.vehicle.speed > utility.getTransitionSpeed(player.vehicle.prototype.name) then
    local newPlane = player.surface.create_entity{
        name    = "heli-entity-_-airborne",
        position=player.position,
        force   =player.force,
        create_build_effect_smoke=false,
        raise_built = true
    }

    transitionHeli(
        heli,
        newPlane,
        game,
        defines,
        true
    )
    --Accelerate the new plane that the player is in so they don't need to press w again
    -- player.riding_state = {acceleration=defines.riding.acceleration.accelerating, direction=defines.riding.direction.straight}

    -- return
    -- end
    return newPlane
end

function heliLand(player, heli, game, defines, settings)
    -- assert(player.vehicle)
    local groundedName = "heli-entity-_-"

    -- If player is airborne and plane is less than the specified landing speed
    -- if utility.isAirbornePlane(player.vehicle.prototype.name) and
    --    player.vehicle.speed < utility.getTransitionSpeed(player.vehicle.prototype.name) then

    local newPlane = player.surface.create_entity{
        name    =groundedName,
        position=player.position,
        force   =player.force,
        create_build_effect_smoke=false,
        raise_built = true
    }

    -- Brake held, land the plane ==========
    transitionHeli(
        heli,
        newPlane,
        game,
        defines,
        false
    )
    return newPlane
    --Auto brake
    -- player.riding_state = {acceleration=defines.riding.acceleration.braking, direction=defines.riding.direction.straight}
    --     return
    -- end
end