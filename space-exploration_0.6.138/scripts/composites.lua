local Composites = {}

---Handles creation of composite pylon entities.
---@param event EntityCreationEvent Event data
function Composites.on_entity_created(event)
  local entity = event.created_entity or event.entity
  if not entity.valid then return end

  local entity_name = entity.name

  if entity_name == "se-pylon-construction" then
    local surface = entity.surface
    local position = entity.position

    -- Create roboport
    local roboport = surface.find_entity("se-pylon-construction-roboport", position)
    if not roboport then
      roboport = surface.create_entity{
        name = "se-pylon-construction-roboport",
        position = position,
        direction = entity.direction,
        force = entity.force
      }
      ---@cast roboport -?
      roboport.destructible = false
    end
  elseif entity_name == "se-pylon-construction-radar" then
    local surface = entity.surface
    local position = entity.position
    local direction = entity.direction
    local force = entity.force

    -- Create roboport
    local roboport = surface.find_entity("se-pylon-construction-radar-roboport", position)
    if not roboport then
      roboport = surface.create_entity{
        name = "se-pylon-construction-radar-roboport",
        position = position,
        direction = direction,
        force = force
      }
      ---@cast roboport -?
      roboport.destructible = false
    end

    -- Create radar
    local radar = surface.find_entity("se-pylon-construction-radar-radar", position)
    if not radar then
      radar = surface.create_entity{
        name = "se-pylon-construction-radar-radar",
        position = position,
        direction = direction,
        force = force
      }
      ---@cast radar -?
      radar.destructible = false
    end
  end
end
Event.addListener(defines.events.on_built_entity, Composites.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Composites.on_entity_created)
Event.addListener(defines.events.script_raised_built, Composites.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Composites.on_entity_created)

---Handles removal of a pylon composite entity.
---@param event EntityRemovalEvent Event data
function Composites.on_removed_entity(event)
  local entity = event.entity
  if not entity.valid then return end

  local entity_name = entity.name

  if entity_name == "se-pylon-construction" then
    local roboport = entity.surface.find_entity("se-pylon-construction-roboport", entity.position)
    if roboport then roboport.destroy() end
  elseif entity_name == "se-pylon-construction-radar" then
    local surface = entity.surface
    local position = entity.position

    -- Destroy roboport
    local roboport = surface.find_entity("se-pylon-construction-radar-roboport", position)
    if roboport then roboport.destroy() end

    -- Destroy radar
    local radar = surface.find_entity("se-pylon-construction-radar-radar", position)
    if radar then radar.destroy() end
  end
end
Event.addListener(defines.events.on_entity_died, Composites.on_removed_entity)
Event.addListener(defines.events.on_robot_mined_entity, Composites.on_removed_entity)
Event.addListener(defines.events.on_player_mined_entity, Composites.on_removed_entity)
Event.addListener(defines.events.script_raised_destroy, Composites.on_removed_entity)

return Composites
