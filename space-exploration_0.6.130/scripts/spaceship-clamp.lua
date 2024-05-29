local SpaceshipClamp = {}

SpaceshipClamp.name_spaceship_clamp_keep = mod_prefix .. "spaceship-clamp"
SpaceshipClamp.name_spaceship_clamp_place = mod_prefix .. "spaceship-clamp-place"
SpaceshipClamp.name_spaceship_clamp_internal_power_pole = mod_prefix .. "spaceship-clamp-power-pole-internal"
SpaceshipClamp.name_spaceship_clamp_external_power_pole_east = mod_prefix .. "spaceship-clamp-power-pole-external-east"
SpaceshipClamp.name_spaceship_clamp_external_power_pole_west = mod_prefix .. "spaceship-clamp-power-pole-external-west"

SpaceshipClamp.internal_power_pole_offsets = {
  [defines.direction.east] = { x = 0.35, y = 0},
  [defines.direction.west] = { x = -0.35, y = 0}
}

SpaceshipClamp.external_power_pole_names = {
  [defines.direction.east] = SpaceshipClamp.name_spaceship_clamp_external_power_pole_east,
  [defines.direction.west] = SpaceshipClamp.name_spaceship_clamp_external_power_pole_west
}

SpaceshipClamp.external_power_pole_offsets = {
  [defines.direction.east] = { x = -0.75, y = -0.5},
  [defines.direction.west] = { x = 0.75, y = -0.5}
}

SpaceshipClamp.other_clamp_offsets = {
  [defines.direction.east] = { x = 2, y = 0},
  [defines.direction.west] = { x = -2, y = 0}
}

SpaceshipClamp.signal_for_disable = {type = "virtual", name = "signal-red"}

--- Gets the SpaceshipClamp for this unit_number
---@param unit_number number
---@return SpaceshipClampInfo?
function SpaceshipClamp.from_unit_number (unit_number)
  if not unit_number then Log.debug("SpaceshipClamp.from_unit_number: invalid unit_number: nil") return end
  unit_number = tonumber(unit_number)
  -- NOTE: only supports container as the entity
  if global.spaceship_clamps[unit_number] then
    return global.spaceship_clamps[unit_number]
  else
    Log.debug("SpaceshipClamp.from_unit_number: invalid unit_number: " .. unit_number)
  end
end

--- Gets the SpaceshipClamp for this entity
---@param entity LuaEntity
---@return SpaceshipClampInfo?
function SpaceshipClamp.from_entity (entity)
  if not(entity and entity.valid) then
    Log.debug("SpaceshipClamp.from_entity: invalid entity")
    return
  end
  -- NOTE: only supports container as the entity
  return SpaceshipClamp.from_unit_number(entity.unit_number)
end

--[[========================================================================================
Lifecycle methods for maintaining state of composite entity
]]--

---@param spaceship_clamp SpaceshipClampInfo
---@return LuaEntity?
function SpaceshipClamp.get_make_internal_power_pole(spaceship_clamp)
  if spaceship_clamp.internal_power_pole and spaceship_clamp.internal_power_pole.valid then
    return spaceship_clamp.internal_power_pole
  end

  local entity = spaceship_clamp.main
  local offset = SpaceshipClamp.internal_power_pole_offsets[entity.direction]
  if not offset then return Log.debug('could not get offset for clamp external power pole because the direction of ' .. entity.direction .. ' does not match') end
  local power_pole_position = util.vectors_add(entity.position, offset)
  local power_pole = entity.surface.find_entity(SpaceshipClamp.name_spaceship_clamp_internal_power_pole, power_pole_position)
  if not power_pole then
    local power_pole_ghosts = entity.surface.find_entities_filtered{
      ghost_name = SpaceshipClamp.name_spaceship_clamp_internal_power_pole,
      position = power_pole_position}
    -- take the first one, delete the rest
    for _, power_pole_ghost in pairs(power_pole_ghosts) do
      if power_pole_ghost.valid then
        if not power_pole then
          local collisions, pole = power_pole_ghosts[1].revive({})
          if pole then
            power_pole = pole
          end
          if power_pole_ghost.valid then
            power_pole_ghost.destroy()
          end
        else
          power_pole_ghost.destroy()
        end
      end
    end
  end
  if not power_pole then
    power_pole = entity.surface.create_entity{
      name = SpaceshipClamp.name_spaceship_clamp_internal_power_pole,
      position = power_pole_position,
      force = entity.force
    }
    ---@cast power_pole -?
  end

  power_pole.destructible = false
  power_pole.rotatable = false

  spaceship_clamp.internal_power_pole = power_pole
  return spaceship_clamp.internal_power_pole
end

---@param entity LuaEntity
function SpaceshipClamp.delete_internal_power_pole(entity)
  local power_poles = entity.surface.find_entities_filtered{
    name = SpaceshipClamp.name_spaceship_clamp_internal_power_pole,
    area = entity.bounding_box
  }
  for _, power_pole in pairs(power_poles) do
    if power_pole.valid then
      power_pole.destroy()
    end
  end
  local power_pole_ghosts = entity.surface.find_entities_filtered{
    ghost_name = SpaceshipClamp.name_spaceship_clamp_internal_power_pole,
    area = entity.bounding_box
  }
  for _, power_pole_ghost in pairs(power_pole_ghosts) do
    if power_pole_ghost.valid then
      power_pole_ghost.destroy()
    end
  end
end

---@param spaceship_clamp SpaceshipClampInfo
---@return LuaEntity?
function SpaceshipClamp.get_make_external_power_pole(spaceship_clamp)
  if spaceship_clamp.external_power_pole and spaceship_clamp.external_power_pole.valid then
    return spaceship_clamp.external_power_pole
  end
  local entity = spaceship_clamp.main
  local offset = SpaceshipClamp.external_power_pole_offsets[entity.direction]
  if not offset then return Log.debug('could not get offset for clamp external power pole because the direction of ' .. entity.direction .. ' does not match') end
  local name = SpaceshipClamp.external_power_pole_names[entity.direction]
  local power_pole_position = util.vectors_add(entity.position, offset)

  -- try to find the power pole *anywhere* inside the main entity
  -- because it is not centered on the main entity and the entity can be rotated
  local power_pole = nil
  local power_poles = entity.surface.find_entities_filtered{
    name = {SpaceshipClamp.name_spaceship_clamp_external_power_pole_east, SpaceshipClamp.name_spaceship_clamp_external_power_pole_west},
    area = entity.bounding_box
  }
  for _, pole in pairs(power_poles) do
    if pole.valid and util.area_contains_position(entity.bounding_box, pole.position) then
      -- if the name is correct for the direction, reuse as-is
      if pole.name == name and util.position_equal(pole.position, power_pole_position) then
        power_pole = pole
      else
        -- otherwise the circuit connections have to be recorded, the entity deleted
        -- the correct direction entity created, and circuit connections restored
        pole.destroy()
      end
    end
  end

  if not power_pole then
    -- try to find the power pole ghost *anywhere* inside the main entity
    -- because it is not centered on the main entity and the entity can be rotated
    local power_pole_ghosts = entity.surface.find_entities_filtered{
      ghost_name = {SpaceshipClamp.name_spaceship_clamp_external_power_pole_east, SpaceshipClamp.name_spaceship_clamp_external_power_pole_west},
      area = entity.bounding_box
    }
    for _, power_pole_ghost in pairs(power_pole_ghosts) do
      if power_pole_ghost.valid and util.area_contains_position(entity.bounding_box, power_pole_ghost.position) then
        local collisions, pole = power_pole_ghost.revive({})
        if pole then
          -- if the name is correct for the direction, reuse as-is
          if pole.name == name and util.position_equal(pole.position, power_pole_position) then
            power_pole = pole
          else
            -- otherwise the circuit connections have to be recorded, the entity deleted
            -- the correct direction entity created, and circuit connections restored
            pole.destroy()
          end
        end
      end
    end
  end

  if not power_pole then
    -- it's not anywhere inside the clamp so make a new one
    power_pole = entity.surface.create_entity{
      name = name,
      position = power_pole_position,
      force = entity.force
    }
    ---@cast power_pole -?
  end

  power_pole.destructible = false
  power_pole.rotatable = false

  spaceship_clamp.external_power_pole = power_pole
  return spaceship_clamp.external_power_pole
end

---@param entity LuaEntity
function SpaceshipClamp.delete_external_power_pole(entity)
  local power_poles = entity.surface.find_entities_filtered{
    name = {SpaceshipClamp.name_spaceship_clamp_external_power_pole_east, SpaceshipClamp.name_spaceship_clamp_external_power_pole_west},
    area = entity.bounding_box
  }
  for _, power_pole in pairs(power_poles) do
    if power_pole.valid then
      power_pole.destroy()
    end
  end
  local power_pole_ghosts = entity.surface.find_entities_filtered{
    ghost_name = {SpaceshipClamp.name_spaceship_clamp_external_power_pole_east, SpaceshipClamp.name_spaceship_clamp_external_power_pole_west},
    area = entity.bounding_box
  }
  for _, power_pole_ghost in pairs(power_pole_ghosts) do
    if power_pole_ghost.valid then
      power_pole_ghost.destroy()
    end
  end
end

---@param event EntityCreationEvent|EventData.on_entity_cloned Event data
function SpaceshipClamp.on_entity_created(event)
  local entity = util.get_entity_from_event(event)

  if not entity then return end
  local entity_name = entity.name
  if entity_name == SpaceshipClamp.name_spaceship_clamp_place or entity_name == SpaceshipClamp.name_spaceship_clamp_keep then

    if entity.position.x % 2 ~= 1 or entity.position.y % 2 ~= 1 then
      -- TODO: Add locale.
      SpaceshipClamp.delete_internal_power_pole(entity)
      SpaceshipClamp.delete_external_power_pole(entity)
      cancel_entity_creation(entity, event.player_index, {"space-exploration.clamp_must_be_on_grid"}, event)
      return
    end

    -- find spaceship at tile
    local direction
    if entity_name == SpaceshipClamp.name_spaceship_clamp_place then
      direction = (entity.direction == defines.direction.east or entity.direction == defines.direction.west ) and defines.direction.west or defines.direction.east
    else
      direction = (entity.direction == defines.direction.west or entity.direction == defines.direction.north ) and defines.direction.west or defines.direction.east
      entity.direction = direction
    end
    local surface = entity.surface

    local check_positions = {}
    if direction == defines.direction.west then
      table.insert(check_positions, util.vectors_add(entity.position, {x=0, y=-1})) -- top right over
      table.insert(check_positions, util.vectors_add(entity.position, {x=0, y=0})) -- bottom right behind
    else
      table.insert(check_positions, util.vectors_add(entity.position, {x=-1, y=-1})) -- top left over
      table.insert(check_positions, util.vectors_add(entity.position, {x=-1, y=0})) -- bottom left behind
    end

    local space_tiles = 0
    for _, pos in pairs(check_positions) do
      if tile_is_space(surface.get_tile(pos)) then
        space_tiles = space_tiles + 1
        Spaceship.flash_tile(surface, pos, {r=255,g=0,b=0, a = 0.25}, 10)
      end
    end

    if space_tiles >= 1 then
      SpaceshipClamp.delete_internal_power_pole(entity)
      SpaceshipClamp.delete_external_power_pole(entity)
      cancel_entity_creation(entity, event.player_index,  {"space-exploration.clamp_invalid_empty_space"}, event)
      return
    end

    local force_name = entity.force.name

    local keep
    if entity_name == SpaceshipClamp.name_spaceship_clamp_place then
      keep = entity.surface.create_entity{
        name = SpaceshipClamp.name_spaceship_clamp_keep,
        position = entity.position,
        force = entity.force,
        direction = direction
      }
      ---@cast keep -?
      entity.destroy()
    else
      keep = entity
    end
    keep.rotatable = false

    local spaceship_clamp = {
      force_name = force_name,
      unit_number = keep.unit_number,
      main = keep,
      surface_name = keep.surface.name
    }

    global.spaceship_clamps[spaceship_clamp.unit_number] = spaceship_clamp
    global.spaceship_clamps_by_surface[spaceship_clamp.surface_name] = global.spaceship_clamps_by_surface[spaceship_clamp.surface_name] or {}
    global.spaceship_clamps_by_surface[spaceship_clamp.surface_name][spaceship_clamp.unit_number] =  spaceship_clamp
    Log.debug("SpaceshipClamp: spaceship_clamp added")

    -- make the poles and connections
    SpaceshipClamp.poles_and_connection(spaceship_clamp)

    if entity_name == SpaceshipClamp.name_spaceship_clamp_place then
      local id = SpaceshipClamp.find_unique_clamp_id(direction, keep.surface, keep)
      local comb = keep.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
      if direction == defines.direction.west then
        comb.set_signal(1, {signal={type="virtual", name=mod_prefix.."anchor-using-left-clamp"}, count=id})
      else
        comb.set_signal(1, {signal={type="virtual", name=mod_prefix.."anchor-using-right-clamp"}, count=id})
      end
    end
    -- attempt to connect this clamp to the one next to it
    SpaceshipClamp.attempt_connect_clamp(keep)
  end
end
Event.addListener(defines.events.on_entity_cloned, SpaceshipClamp.on_entity_created)
Event.addListener(defines.events.on_built_entity, SpaceshipClamp.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, SpaceshipClamp.on_entity_created)
Event.addListener(defines.events.script_raised_built, SpaceshipClamp.on_entity_created)
Event.addListener(defines.events.script_raised_revive, SpaceshipClamp.on_entity_created)

--- Makes sure the internal and external poles exist and aer connected
---@param spaceship_clamp SpaceshipClampInfo
function SpaceshipClamp.poles_and_connection(spaceship_clamp)
  local internal = SpaceshipClamp.get_make_internal_power_pole(spaceship_clamp)
  local external = SpaceshipClamp.get_make_external_power_pole(spaceship_clamp)
  spaceship_clamp.internal_power_pole.connect_neighbour({
    wire = defines.wire_type.red,
    target_entity = spaceship_clamp.external_power_pole
  })
  spaceship_clamp.internal_power_pole.connect_neighbour({
    wire = defines.wire_type.green,
    target_entity = spaceship_clamp.external_power_pole
  })
  spaceship_clamp.internal_power_pole.connect_neighbour(spaceship_clamp.external_power_pole)
end

---@param spaceship_clamp SpaceshipClampInfo
---@param key string
function SpaceshipClamp.destroy_sub(spaceship_clamp, key)
  if spaceship_clamp[key] and spaceship_clamp[key].valid then
    spaceship_clamp[key].destroy()
    spaceship_clamp[key] = nil
  end
end

---@param spaceship_clamp SpaceshipClampInfo
function SpaceshipClamp.destroy(spaceship_clamp)
  if not spaceship_clamp then
    Log.debug("spaceship_clamp_destroy: not spaceship_clamp")
    return
  end

  spaceship_clamp.valid = false
  SpaceshipClamp.destroy_sub(spaceship_clamp, 'main')
  SpaceshipClamp.destroy_sub(spaceship_clamp, 'internal_power_pole')
  SpaceshipClamp.destroy_sub(spaceship_clamp, 'external_power_pole')

  global.spaceship_clamps[spaceship_clamp.unit_number] = nil
  global.spaceship_clamps_by_surface[spaceship_clamp.surface_name][spaceship_clamp.unit_number] = nil
end

---@param event EntityRemovalEvent Event data
function SpaceshipClamp.on_entity_removed(event)
  local entity = event.entity
  if entity and entity.valid then
    if entity.name == SpaceshipClamp.name_spaceship_clamp_keep then
      SpaceshipClamp.destroy(SpaceshipClamp.from_entity(entity))
    elseif entity.type == "entity-ghost" and entity.ghost_name == SpaceshipClamp.name_spaceship_clamp_keep then
      Log.debug("remove")
      SpaceshipClamp.delete_internal_power_pole(entity)
      SpaceshipClamp.delete_external_power_pole(entity)
    end
  end
end
Event.addListener(defines.events.on_entity_died, SpaceshipClamp.on_entity_removed)
Event.addListener(defines.events.on_robot_mined_entity, SpaceshipClamp.on_entity_removed)
Event.addListener(defines.events.on_player_mined_entity, SpaceshipClamp.on_entity_removed)
Event.addListener(defines.events.script_raised_destroy, SpaceshipClamp.on_entity_removed)

--- Attempts to connect a clamp to the other clamp it is anchored to
--- Also reconnects each clamps internal power poles in case the player
--- managed to disconnect them by accident (for example shift clicking the external power pole)
---@param entity LuaEntity
function SpaceshipClamp.attempt_connect_clamp(entity)
  local spaceship_clamp = SpaceshipClamp.from_entity(entity)
  SpaceshipClamp.poles_and_connection(spaceship_clamp)
  local offset = SpaceshipClamp.other_clamp_offsets[entity.direction]
  if not offset then return Log.debug('could not get offset for clamp external power pole because the direction of ' .. entity.direction .. ' does not match') end
  local other_clamp_position = util.vectors_add(spaceship_clamp.main.position, offset)
  local other_clamp_entity = spaceship_clamp.main.surface.find_entity(SpaceshipClamp.name_spaceship_clamp_keep, other_clamp_position)
  if not other_clamp_entity then return end
  local other_clamp = SpaceshipClamp.from_entity(other_clamp_entity)
  if other_clamp then
    SpaceshipClamp.poles_and_connection(other_clamp)
    local external_power_pole = spaceship_clamp.external_power_pole
    local other_external_power_pole = other_clamp.external_power_pole
    if external_power_pole and external_power_pole.valid and other_external_power_pole and other_external_power_pole.valid then
      external_power_pole.disconnect_neighbour(other_external_power_pole)
    end
    local internal_power_pole = spaceship_clamp.internal_power_pole
    local other_internal_power_pole = other_clamp.internal_power_pole
    if internal_power_pole and internal_power_pole.valid and other_internal_power_pole and other_internal_power_pole.valid then
      spaceship_clamp.internal_power_pole.connect_neighbour({
        wire = defines.wire_type.red,
        target_entity = other_clamp.internal_power_pole
      })
      spaceship_clamp.internal_power_pole.connect_neighbour({
        wire = defines.wire_type.green,
        target_entity = other_clamp.internal_power_pole
      })
      spaceship_clamp.internal_power_pole.connect_neighbour(other_clamp.internal_power_pole)
    end
  end
end

---@param spaceship_clamp SpaceshipClampInfo
---@return boolean
function SpaceshipClamp.is_clamp_enabled(spaceship_clamp)
  if not spaceship_clamp.main.valid then return false end
  local red_signal_count = spaceship_clamp.main.get_merged_signal(SpaceshipClamp.signal_for_disable)
  return red_signal_count <= 0
end

---@param spaceship_clamps IndexMap<SpaceshipClampInfo>
---@param destination_clamps IndexMap<SpaceshipClampInfo>
---@param using_id integer
---@param to_id integer
---@param using_direction defines.direction
---@param to_direction defines.direction
---@return LuaEntity matching_spaceship_clamp
---@return LuaEntity[] matching_destination_clamps
function SpaceshipClamp.find_matches(spaceship_clamps, destination_clamps, using_id, to_id, using_direction, to_direction)
  -- find a *single* clamp on the spaceship that matches the ID
  local matching_spaceship_clamp
  for _, spaceship_clamp in pairs(spaceship_clamps) do
    if spaceship_clamp.main.valid then
      if spaceship_clamp.main.direction == using_direction then
        local comb = spaceship_clamp.main.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
        local signal = comb.get_signal(1)
        if signal and signal.count == using_id then
          matching_spaceship_clamp = spaceship_clamp.main
        end
      end
    else
      SpaceshipClamp.destroy(spaceship_clamp)
    end
  end

  -- find *all* clamps at the destination that match the ID *and* are empty,
  -- empty clamps being defined as not having another clamp docked next to it
  local matching_destination_clamps = {}
  for _, destination_clamp in pairs(destination_clamps) do
    if destination_clamp.main.valid then
      if destination_clamp.main.direction == to_direction then
        local comb = destination_clamp.main.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
        local signal = comb.get_signal(1)
        if signal and signal.count == to_id then
          local offset = SpaceshipClamp.other_clamp_offsets[destination_clamp.main.direction]
          -- check for another clamp already docked
          local other_clamp_position = util.vectors_add(destination_clamp.main.position, offset)
          local other_clamp_entity = destination_clamp.main.surface.find_entity(SpaceshipClamp.name_spaceship_clamp_keep, other_clamp_position)
          local other_clamp
          if other_clamp_entity then other_clamp = SpaceshipClamp.from_entity(other_clamp_entity) end
          if not other_clamp then
            -- check for signal to switch clamp off.
            if SpaceshipClamp.is_clamp_enabled(destination_clamp) then
              table.insert(matching_destination_clamps, destination_clamp.main)
            end
          end
        end
      end
    else
      SpaceshipClamp.destroy(destination_clamp)
    end
  end

  return matching_spaceship_clamp, matching_destination_clamps
end

---@param spaceship SpaceshipType
function SpaceshipClamp.attempt_anchor_spaceship(spaceship)
  local using_left = spaceship.console.get_merged_signal(Spaceship.signal_for_anchor_using_left)
  local to_right = spaceship.console.get_merged_signal(Spaceship.signal_for_anchor_to_right)
  local using_right = spaceship.console.get_merged_signal(Spaceship.signal_for_anchor_using_right)
  local to_left = spaceship.console.get_merged_signal(Spaceship.signal_for_anchor_to_left)

  local try_anchor_using_left = using_left ~= 0 and to_right ~= 0
  local try_anchor_using_right = using_right ~= 0 and to_left ~= 0
  if not try_anchor_using_left and not try_anchor_using_right then return end

  local spaceship_surface = spaceship.console.surface
  local destination_surface = Zone.get_surface(Zone.from_zone_index(spaceship.destination.index))
  if not destination_surface then return end

  local spaceship_clamps = global.spaceship_clamps_by_surface[spaceship_surface.name]
  local destination_clamps = global.spaceship_clamps_by_surface[destination_surface.name]
  if not spaceship_clamps or not destination_clamps then return end

  if try_anchor_using_left then
    local matching_spaceship_clamp, matching_destination_clamps =
    SpaceshipClamp.find_matches(spaceship_clamps, destination_clamps, using_left, to_right, defines.direction.west, defines.direction.east)
    if matching_spaceship_clamp and next(matching_destination_clamps) then
      -- try to land based on the relative offsets
      local position = {
        x = -1 * matching_spaceship_clamp.position.x + 2,
        y = -1 * matching_spaceship_clamp.position.y
      }
      position = util.vectors_add(position, matching_destination_clamps[1].position)
      Spaceship.land_at_position(spaceship, position, true)
      return
    end
  end
  if try_anchor_using_right then
    local matching_spaceship_clamp, matching_destination_clamps =
    SpaceshipClamp.find_matches(spaceship_clamps, destination_clamps, using_right, to_left, defines.direction.east, defines.direction.west)
    if matching_spaceship_clamp and next(matching_destination_clamps) then
      -- try to land based on the relative offsets
      local position = {
        x = -1 * matching_spaceship_clamp.position.x - 2,
        y = -1 * matching_spaceship_clamp.position.y
      }
      position = util.vectors_add(position, matching_destination_clamps[1].position)
      Spaceship.land_at_position(spaceship, position, true)
      return
    end
  end
end

--- Finds an id value that is unused by any clamp on the given surface
---@param direction defines.direction direction of clamp
---@param surface LuaSurface surface on which to find the unique id
---@param exclude_clamp LuaEntity entity to exlude from search
function SpaceshipClamp.find_unique_clamp_id(direction, surface, exclude_clamp)
  local spaceship_clamps = global.spaceship_clamps_by_surface[surface.name]
  local used_ids = {}
  for _, spaceship_clamp in pairs(spaceship_clamps) do
    local entity = spaceship_clamp.main
    if entity.valid then
      if entity ~= exclude_clamp and entity.direction == direction then
        local value = 0
        local comb = entity.get_or_create_control_behavior()
        local signal = comb.get_signal(1)
        if signal then value = signal.count end
        used_ids[value] = value
      end
    else
      SpaceshipClamp.destroy(spaceship_clamp)
    end
  end
  local i = 1
  while used_ids[i] do
    i = i + 1
  end
  return i
end

--- Validates the type of a clamp signal
---@param spaceship_clamp_entity LuaEntity
function SpaceshipClamp.validate_clamp_signal(spaceship_clamp_entity)
  -- make sure it still has the correct signal.
  local value = 1
  local comb = spaceship_clamp_entity.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
  local signal = comb.get_signal(1)
  if signal then value = signal.count end
  if spaceship_clamp_entity.direction == defines.direction.west then
    comb.set_signal(1, {signal={type="virtual", name=mod_prefix.."anchor-using-left-clamp"}, count=value})
  else
    comb.set_signal(1, {signal={type="virtual", name=mod_prefix.."anchor-using-right-clamp"}, count=value})
  end
end

--- GUI closed so need to validate clamp signal
---@param event EventData.on_gui_closed Event data
function SpaceshipClamp.on_gui_closed(event)
  if event.entity and event.entity.valid and event.entity.name == SpaceshipClamp.name_spaceship_clamp_keep then
    SpaceshipClamp.validate_clamp_signal(event.entity)
  end
end
Event.addListener(defines.events.on_gui_closed, SpaceshipClamp.on_gui_closed)

--- Combinator settings pasted so need to valdiate clamp signal
---@param event EventData.on_entity_settings_pasted Event data
function SpaceshipClamp.on_entity_settings_pasted(event)
  if event.destination and event.destination.valid and event.destination.name == SpaceshipClamp.name_spaceship_clamp_keep then
    SpaceshipClamp.validate_clamp_signal(event.destination)
  end
end
Event.addListener(defines.events.on_entity_settings_pasted, SpaceshipClamp.on_entity_settings_pasted)

function SpaceshipClamp.on_init()
  ---@type IndexMap<SpaceshipClampInfo>
  global.spaceship_clamps = {}
  ---@type {[string]:SpaceshipClampInfo}
  global.spaceship_clamps_by_surface = {}
end
Event.addListener("on_init", SpaceshipClamp.on_init, true)

return SpaceshipClamp
