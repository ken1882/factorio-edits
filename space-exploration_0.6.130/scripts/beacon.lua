local Beacon = {}

-- Note: supply_area_distance -- extends from edge of collision box
Beacon.affected_types = {"assembling-machine", "furnace", "lab", "mining-drill", "rocket-silo"}
Beacon.affected_types_lookup = core_util.list_to_map(Beacon.affected_types)

---Gets a table of beacon supply area distances indexed by their prototype names.
---@return table<string, double>
function Beacon.get_beacon_supply_area_distances()
  if not Beacon.list_beacon_prototypes then
    local beacon_prototypes = game.get_filtered_entity_prototypes{{filter="type", type="beacon"}}

    local mapping = {}
    for name, prototype in pairs(beacon_prototypes) do
      mapping[name] = prototype.supply_area_distance
    end

    ---Table of beacon supply area distances, indexed by prototype name
    ---@type table<string, double>
    Beacon.list_beacon_prototypes = mapping
  end

  return Beacon.list_beacon_prototypes
end

---@param entity LuaEntity
---@return uint
function Beacon.count_affecting_beacons(entity)
  local count = 0

  for name, supply_area_distance in pairs(Beacon.get_beacon_supply_area_distances()) do
    local area = util.area_extend(entity.bounding_box, supply_area_distance)
    count = count + entity.surface.count_entities_filtered{type="beacon", name=name, area=area}
  end

  return count
end

---@param entity LuaEntity
function Beacon.set_overload_state(entity)
  if entity.active then
    entity.active = false
    entity.surface.create_entity{
        name = "flying-text",
        position = entity.position,
        text = {"space-exploration.beacon-overload"}
    }
    global.beacon_overloaded_entities[entity.unit_number] = entity

    local shape_id = global.beacon_overloaded_shapes[entity.unit_number]
    if shape_id and rendering.is_valid(shape_id) then rendering.destroy(shape_id) end -- shouldn't happen but best to check if other mods broke something
    shape_id = rendering.draw_sprite{
      sprite = "virtual-signal/"..mod_prefix.."beacon-overload",
      surface = entity.surface,
      target = entity,
      x_scale = 1,
      y_scale = 1,
      target_offset = entity.prototype.alert_icon_shift
    }
    global.beacon_overloaded_shapes[entity.unit_number] = shape_id
  end

  -- Regardless of whether entity is active, issue a beacon overload alert to all
  -- players on the entity's force. Alert is only issued if the reason for inactivation
  -- was beacon overload
  if global.beacon_overloaded_entities[entity.unit_number] then
    for _, player in pairs(entity.force.players) do
      player.add_custom_alert(entity,
        {type="virtual", name=mod_prefix.."beacon-overload"},
        {"space-exploration.beacon-overload-alert", "[img=virtual-signal/" .. mod_prefix .. "beacon-overload]", "[img=entity/" .. entity.name .. "]"},
        true)
    end
  end
end

---@param entity LuaEntity
function Beacon.unset_overload_state(entity)
  if not entity.active then
    -- Before reactivating entity, make sure it is present in the overloaded entities list
    -- Otherwise it was probably deactivated for a different reason altogether and should
    -- not be reactivated by this function
    if global.beacon_overloaded_entities[entity.unit_number] then
      entity.active = true
      entity.surface.create_entity{
         name = "flying-text",
         position = entity.position,
         text = {"space-exploration.beacon-overload-ended"}
      }
      global.beacon_overloaded_entities[entity.unit_number] = nil

      for interface, functions in pairs(remote.interfaces) do -- allow other mods to deactivate after
        if interface ~= "space-exploration" and functions["on_entity_activated"] then
          remote.call(interface, "on_entity_activated", {entity=entity, mod="space-exploration"})
        end
      end
    end

    -- Remove associated overload shapes if they exist.
    if global.beacon_overloaded_shapes[entity.unit_number] then
      local shape_id = global.beacon_overloaded_shapes[entity.unit_number]
      if rendering.is_valid(shape_id) then rendering.destroy(shape_id) end
      global.beacon_overloaded_shapes[entity.unit_number] = nil
    end
  end
end

-- make sure not affected by more than 1 beacon
---@param entity LuaEntity
---@param ignore_count? uint
function Beacon.validate_entity(entity, ignore_count)
  if (not entity.prototype.allowed_effects) or table_size(entity.prototype.allowed_effects) == 0
    or (not entity.prototype.module_inventory_size) or entity.prototype.module_inventory_size == 0 then return end

  local ignore_count = ignore_count or 0
  local beacons = Beacon.count_affecting_beacons(entity)

  if beacons > 1 + ignore_count then
    Beacon.set_overload_state(entity)
  else
    -- TODO: add hook here so other things can cancel
    Beacon.unset_overload_state(entity)
  end
end

---@param entity LuaEntity
---@param is_deconstructing? boolean
function Beacon.validate_beacon(entity, is_deconstructing)
  local prototype = entity.prototype
  local area = util.area_extend(entity.bounding_box, prototype.supply_area_distance)
  local structures = entity.surface.find_entities_filtered{type = Beacon.affected_types, area = area}
  local ignore_count = is_deconstructing and 1 or 0

  for _, structure in pairs(structures) do
    Beacon.validate_entity(structure, ignore_count)
  end
end

---@param event EntityCreationEvent Event data
function Beacon.on_entity_created(event)
  local entity = event.entity or event.created_entity
  if not entity.valid then return end

  if entity.type == "beacon" then
    Beacon.validate_beacon(entity)
  elseif Beacon.affected_types_lookup[entity.type] then
    Beacon.validate_entity(entity)
  end
end
Event.addListener(defines.events.on_built_entity, Beacon.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Beacon.on_entity_created)
Event.addListener(defines.events.script_raised_built, Beacon.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Beacon.on_entity_created)

--if entity is disabled due to beacon overload, enable before checking for clones overload
---@param event EventData.on_entity_cloned Event data
function Beacon.on_entity_cloned(event)
  local entity = event.source
  if not entity.valid then return end

  if entity.type == "beacon" then
    Beacon.validate_beacon(event.destination)
  elseif Beacon.affected_types_lookup[entity.type] then
    if event.destination.valid then
      if global.beacon_overloaded_entities[entity.unit_number] then
        event.destination.active = true
      end
      Beacon.validate_entity(event.destination)
    end
  end
end
Event.addListener(defines.events.on_entity_cloned, Beacon.on_entity_cloned)

---@param event EntityRemovalEvent Event data
function Beacon.on_entity_removed(event)
  if event.entity and event.entity.valid then
    if event.entity.type == "beacon" then
      -- do validation but counting 1 beacon fewer
      Beacon.validate_beacon(event.entity, true)
    end
  end
end

Event.addListener(defines.events.on_player_mined_entity, Beacon.on_entity_removed)
Event.addListener(defines.events.on_robot_mined_entity, Beacon.on_entity_removed)
Event.addListener(defines.events.on_entity_died, Beacon.on_entity_removed)
Event.addListener(defines.events.script_raised_destroy, Beacon.on_entity_removed)

-- Cleanup function to be run every 10 seconds, re-evaluating overload status
-- to determine if it's still appropriate, removing references to no-longer-valid
-- entities, and re-issuing alerts if necessary
function Beacon.validate_overloaded_entities()
  for entity_number, entity in pairs(global.beacon_overloaded_entities) do
    if entity.valid then
      -- If entity is still valid, re-evaluate whether it is still correctly in overload
      -- in case the causative beacon was removed without firing an event
      Beacon.validate_entity(entity)
    else
      -- Remove references to these entities as they no longer exist
      global.beacon_overloaded_entities[entity_number] = nil
      global.beacon_overloaded_shapes[entity_number] = nil
    end
  end
end
Event.addListener("on_nth_tick_600", Beacon.validate_overloaded_entities)

function Beacon.on_init()
  ---@type IndexMap<LuaEntity> Maps entity unit_number to entity when entity is in a beacon overload state
  global.beacon_overloaded_entities = {}
  ---@type IndexMap<uint> Maps entity unit_number to render ID for the beacon overload icon
  global.beacon_overloaded_shapes = {}
end
Event.addListener("on_init", Beacon.on_init, true)

return Beacon
