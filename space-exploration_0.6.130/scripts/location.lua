Location = {}

---@param location_reference LocationReference
---@return LocationReference?
function Location.from_reference(location_reference)
  if not location_reference then return nil end
  if location_reference.type == "zone" then
    return {
      type = location_reference.type,
      zone = Zone.from_zone_index(location_reference.index),
      position = location_reference.position,
      name = location_reference.name
    }
  end
  if location_reference.type == "spaceship" then
    local position = location_reference.position
    local spaceship = Spaceship.from_index(location_reference.index)
    if not spaceship then return nil end
    local position = location_reference.position
    if position and spaceship.console and spaceship.console.valid then
      position = Util.vectors_add(location_reference.position, spaceship.console.position)
    end
    return {
      type = location_reference.type,
      zone = spaceship,
      position = position,
      name = location_reference.name
    }
  end
  if location_reference.type == "system" then
    return {
      type = location_reference.type,
      zone = Zone.from_zone_index(location_reference.index),
      position = location_reference.position,
      name = location_reference.name,
    }
  end
  if location_reference.type == "interstellar" then
    return {
      type = location_reference.type,
      position = location_reference.position,
      name = location_reference.name,
    }
  end
end

---@param location_reference LocationReference
---@return LocalisedString
function Location.to_localised_string(location_reference)
  if not location_reference then return nil end
  local base
  if location_reference.type == "interstellar" then
    base = {"space-exploration.interstellar-map"}
  else
    local location = Location.from_reference(location_reference)
    if not location then return nil end
    if location.type == "system" then
      base = { "space-exploration.solar-system", location.zone.name }
    else
      base = location.zone.name
    end
  end
  if location_reference.name and location_reference.name ~= "" then
    return { "space-exploration.remote-view-history-item_named", base, location_reference.name }
  end
  return base
end

-- zone, spaceship, or starmap
---@param player? LuaPlayer
---@return LocationReference?
function Location.new_reference_from_player(player)
  if not player then return nil end
  local zone = Zone.from_surface(player.surface)
  if zone then
    return Location.make_reference(zone, player.position)
  end
  -- maybe starmap
  local playerdata = get_make_playerdata(player)
  if playerdata.remote_view_active_map then
    if playerdata.remote_view_active_map.type == "interstellar" then
      return {
        type = "interstellar",
        position = player.position
      }
    elseif playerdata.remote_view_active_map.type == "system" then
      zone = MapView.get_current_system(player)
      return {
        type = "system",
        index = zone.index,
        position = player.position
      }
    end
  end
end

-- zone or spaceship,
---@param zone AnyZoneType|SpaceshipType
---@param position MapPosition
---@param name? string
---@return LocationReference?
function Location.make_reference(zone, position, name)
  if not zone then return nil end
  local location_reference = {index = zone.index, position = position, name = name}
  if zone.type == "spaceship" then
    ---@cast zone SpaceshipType
    location_reference.type = "spaceship"
    if position and zone.console and zone.console.valid then
      location_reference.position = Util.vectors_delta(zone.console.position, position)
    end
  else
    ---@cast zone -SpaceshipType
    location_reference.type = "zone"
  end
  return location_reference
end

---@param location_reference LocationReference
---@param zone AnyZoneType|SpaceshipType
---@param position MapPosition
---@return LocationReference?
function Location.update_reference_position(location_reference, zone, position)
  if not location_reference then
    location_reference = {}
  end
  if not zone then return nil end
  location_reference.index = zone.index
  location_reference.position = position
  if zone.type == "spaceship" then
    ---@cast zone SpaceshipType
    location_reference.type = "spaceship"
    if position and zone.console and zone.console.valid then
      location_reference.position = Util.vectors_delta(zone.console.position, position)
    end
  else
    ---@cast zone -SpaceshipType
    location_reference.type = "zone"
  end
  return location_reference
end

---@param location_reference LocationReference
---@param name string
---@return LocationReference
function Location.update_reference_name(location_reference, name)
  if not location_reference then
    location_reference = {}
  end
  location_reference.name = name
  return location_reference
end

---@param player LuaPlayer
---@param location_reference LocationReference
---@param freeze_history boolean
function Location.goto_reference(player, location_reference, freeze_history)
  local location = Location.from_reference(location_reference) -- expand zone or spaceship connection
  if not location then return end
  if location_reference.type == "zone" or location_reference.type == "spaceship" then
    RemoteView.start(player, location.zone, location.position, location.name, freeze_history)
  elseif location_reference.type == "interstellar" then
    MapView.start_interstellar_map(player, freeze_history)
    if location_reference.position then
      player.teleport(location_reference.position)
    end
  elseif location_reference.type == "system" then
    MapView.start_system_map(player, location.zone, freeze_history)
    player.teleport(location_reference.position)
  end
end

return Location
