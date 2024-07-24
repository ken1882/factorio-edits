local CondenserTurbine = {}

CondenserTurbine.name_condenser_turbine = mod_prefix.."condenser-turbine"
CondenserTurbine.name_condenser_turbine_generator = mod_prefix.."condenser-turbine-generator"
CondenserTurbine.name_condenser_turbine_tank = mod_prefix.."condenser-turbine-tank"
CondenserTurbine.condenser_turbine_tank_offset = 2

---@param event EntityCreationEvent Event data
function CondenserTurbine.on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.name == CondenserTurbine.name_condenser_turbine then
     local direction_vector = Util.vector_multiply(Util.direction_to_vector(entity.direction), -1)
    local tank_position_offset = Util.vector_multiply(direction_vector, CondenserTurbine.condenser_turbine_tank_offset)
    local tank_position = Util.vectors_add(entity.position, tank_position_offset)

    local generator = entity.surface.create_entity{
      name = CondenserTurbine.name_condenser_turbine_generator,
      position = entity.position,
      direction = entity.direction,
      force = entity.force
    }
    ---@cast generator -?
    generator.destructible = false
    local tank = entity.surface.create_entity{
      name = CondenserTurbine.name_condenser_turbine_tank,
      position = tank_position,
      direction = entity.direction,
      force = entity.force
    }
    ---@cast tank -?
    if tank then
      tank.destructible = false
    else
      game.print("condenser-turbine-tank error")
    end
  end
end
Event.addListener(defines.events.on_built_entity, CondenserTurbine.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, CondenserTurbine.on_entity_created)
Event.addListener(defines.events.script_raised_built, CondenserTurbine.on_entity_created)
Event.addListener(defines.events.script_raised_revive, CondenserTurbine.on_entity_created)


---@param event EntityRemovalEvent Event data
function CondenserTurbine.on_removed_entity(event)
  if event.entity and event.entity.valid and event.entity.surface
   and event.entity.name == CondenserTurbine.name_condenser_turbine then
    local entity = event.entity

    local direction_vector = Util.vector_multiply(Util.direction_to_vector(entity.direction), -1)
    local tank_position_offset = Util.vector_multiply(direction_vector, CondenserTurbine.condenser_turbine_tank_offset)
    local tank_position = Util.vectors_add(entity.position, tank_position_offset)

    local list = entity.surface.find_entities_filtered ({type = 'generator', area = entity.bounding_box})
    for _, generator in pairs (list) do
      if generator and string.starts (generator.name, CondenserTurbine.name_condenser_turbine_generator) then
        generator.destroy() 
      end
    end

    local tank = entity.surface.find_entity(CondenserTurbine.name_condenser_turbine_tank, tank_position)
    if tank then tank.destroy() end

  end
end
Event.addListener(defines.events.on_entity_died, CondenserTurbine.on_removed_entity)
Event.addListener(defines.events.on_robot_mined_entity, CondenserTurbine.on_removed_entity)
Event.addListener(defines.events.on_player_mined_entity, CondenserTurbine.on_removed_entity)
Event.addListener(defines.events.script_raised_destroy, CondenserTurbine.on_removed_entity)

---@param event EventData.on_player_rotated_entity Event data
function CondenserTurbine.on_player_rotated_entity(event)
  if event.entity and event.entity.valid and event.entity.surface
   and event.entity.name == CondenserTurbine.name_condenser_turbine then
      local entity = event.entity

      local direction_vector = Util.vector_multiply(Util.direction_to_vector(entity.direction), -1)
      local tank_position_offset = Util.vector_multiply(direction_vector, CondenserTurbine.condenser_turbine_tank_offset)
      local tank_position = Util.vectors_add(entity.position, tank_position_offset)

      local tank = entity.surface.find_entity(CondenserTurbine.name_condenser_turbine_tank, tank_position)
      if tank then
          local direction_vector = Util.direction_to_vector(entity.direction)
          local tank_position_offset = Util.vector_multiply(direction_vector, CondenserTurbine.condenser_turbine_tank_offset)
          local tank_position = Util.vectors_add(entity.position, tank_position_offset)
          tank.teleport(tank_position)
          tank.rotate()
          tank.rotate()
      end

  end
end
Event.addListener(defines.events.on_player_rotated_entity, CondenserTurbine.on_player_rotated_entity)

--- Ensures that all turbines in an area on a surface are valid
---@param surface LuaSurface
---@param area BoundingBox
function CondenserTurbine.reset_surface(surface, area)
  for _, entity in pairs(surface.find_entities_filtered{
    name = CondenserTurbine.name_condenser_turbine_tank,
    area = area
  }) do
    entity.direction = entity.direction
  end
end

return CondenserTurbine
