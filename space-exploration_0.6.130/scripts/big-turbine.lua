local BigTurbine = {}

BigTurbine.name_big_turbine = mod_prefix.."big-turbine"
BigTurbine.name_prefix_big_turbine_generator = mod_prefix.."big-turbine-generator-"
BigTurbine.name_big_turbine_tank = mod_prefix.."big-turbine-tank"
BigTurbine.big_turbine_tank_offset = 4.5

---@param event EntityCreationEvent Event data
function BigTurbine.on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if not entity then return end
  if entity.name == BigTurbine.name_big_turbine then
    local direction_vector = Util.vector_multiply(Util.direction_to_vector(entity.direction), -1)
    local tank_position_offset = Util.vector_multiply(direction_vector, BigTurbine.big_turbine_tank_offset)
    local tank_position = Util.vectors_add(entity.position, tank_position_offset)

    local generator_name
    if entity.direction == defines.direction.north or entity.direction == defines.direction.west then
      generator_name = BigTurbine.name_prefix_big_turbine_generator .. "NW"
    else
      generator_name = BigTurbine.name_prefix_big_turbine_generator .. "SE"
    end
    local generator = entity.surface.create_entity{
      name = generator_name,
      position = entity.position,
      direction = entity.direction,
      force = entity.force
    }
    ---@cast generator -?
    generator.destructible = false
    local tank = entity.surface.create_entity{
      name = BigTurbine.name_big_turbine_tank,
      position = tank_position,
      direction = entity.direction,
      force = entity.force
    }
    ---@cast tank -?
    if tank then
      tank.destructible = false
    else
      game.print("big-turbine-tank error")
    end
  end
end
Event.addListener(defines.events.on_built_entity, BigTurbine.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, BigTurbine.on_entity_created)
Event.addListener(defines.events.script_raised_built, BigTurbine.on_entity_created)
Event.addListener(defines.events.script_raised_revive, BigTurbine.on_entity_created)

---@param furnace LuaEntity
---@return LuaEntity?
function BigTurbine.find_generator(furnace)
  local list = furnace.surface.find_entities_filtered({type = 'generator', area = furnace.bounding_box})
  for _, generator in pairs(list) do
    if generator and string.starts(generator.name, BigTurbine.name_prefix_big_turbine_generator) then
      return generator
    end
  end
end

---@param event EntityRemovalEvent Event data
function BigTurbine.on_removed_entity(event)
  if event.entity and event.entity.valid and event.entity.surface
    and event.entity.name == BigTurbine.name_big_turbine then
    local entity = event.entity

    local direction_vector = Util.vector_multiply(Util.direction_to_vector(entity.direction), -1)
    local tank_position_offset = Util.vector_multiply(direction_vector, BigTurbine.big_turbine_tank_offset)
    local tank_position = Util.vectors_add(entity.position, tank_position_offset)

    local generator = BigTurbine.find_generator(entity)
    if generator then generator.destroy() end

    local tank = entity.surface.find_entity(BigTurbine.name_big_turbine_tank, tank_position)
    if tank then tank.destroy() end
  end
end
Event.addListener(defines.events.on_entity_died, BigTurbine.on_removed_entity)
Event.addListener(defines.events.on_robot_mined_entity, BigTurbine.on_removed_entity)
Event.addListener(defines.events.on_player_mined_entity, BigTurbine.on_removed_entity)
Event.addListener(defines.events.script_raised_destroy, BigTurbine.on_removed_entity)

---@param event EventData.on_player_rotated_entity Event data
function BigTurbine.on_player_rotated_entity(event)
  if event.entity and event.entity.valid and event.entity.surface
   and event.entity.name == BigTurbine.name_big_turbine then
      local entity = event.entity

      local direction_vector = Util.vector_multiply(Util.direction_to_vector(entity.direction), -1)
      local tank_position_offset = Util.vector_multiply(direction_vector, BigTurbine.big_turbine_tank_offset)
      local tank_position = Util.vectors_add(entity.position, tank_position_offset)

      local tank = entity.surface.find_entity(BigTurbine.name_big_turbine_tank, tank_position)
      if tank then
          local direction_vector = Util.direction_to_vector(entity.direction)
          local tank_position_offset = Util.vector_multiply(direction_vector, BigTurbine.big_turbine_tank_offset)
          local tank_position = Util.vectors_add(entity.position, tank_position_offset)
          tank.teleport(tank_position)
          tank.rotate()
          tank.rotate()
      end

  end
end
Event.addListener(defines.events.on_player_rotated_entity, BigTurbine.on_player_rotated_entity)

---@param surface LuaSurface
function BigTurbine.reset_surface(surface)
  for _, entity in pairs(surface.find_entities_filtered{name = BigTurbine.name_big_turbine_tank }) do
    entity.direction = entity.direction
  end
end

return BigTurbine
