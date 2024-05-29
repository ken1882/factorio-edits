local name_enter_vehicle_event = "enter-vehicle"
local name_ironclad = "ironclad"
local enter_vehicle_radius = 3.5
local exit_vehicle_radius = 3

-- When the button is pressed decide the action, record it, and perform it.
-- Apply a short term lock.
-- If the default behaviour undoes the chosen effect, then set it back again.

function is_ironclad(name)
  return string.find(name, name_ironclad, 1, true)
end

function vehicle_exit(player, position)
  local character = player.character
  if character.vehicle.get_driver() == character then
    character.vehicle.set_driver(nil)
  else
    character.vehicle.set_passenger(nil)
  end
  character.teleport(position)
end

function vehicle_enter(player, vehicle)
  local character = player.character
  if not vehicle.get_driver() then
    vehicle.set_driver(character)
  elseif not vehicle.get_passenger() then
    vehicle.set_passenger(character)
  end
end

function on_enter_vehicle_keypress (event)
  local player = game.players[event.player_index]
  local character = player.character
  if not character then return end

  global.disable_this_tick = global.disable_this_tick or {}
  if global.disable_this_tick[player.index] and global.disable_this_tick[player.index] == event.tick then
    return
  end

  global.driving_state_locks = global.driving_state_locks or {}
  if character.vehicle and is_ironclad(character.vehicle.name) then
    local position = character.surface.find_non_colliding_position(character.name, character.position, enter_vehicle_radius, 0.5, false)
    if position then
      global.driving_state_locks[player.index] = {valid_time = game.tick + 1, position = position }
      vehicle_exit(player, position)
    end
  else
    local vehicles = character.surface.find_entities_filtered{
      type = "car",
      position = character.position,
      radius = enter_vehicle_radius
    }
    local ironclads = {}
    for _, vehicle in pairs(vehicles) do
      if is_ironclad(vehicle.name) then
        table.insert(ironclads, vehicle)
      end
    end
    if ironclads[1] then
      global.driving_state_locks[player.index] = {valid_time = game.tick + 1, vehicle = ironclads[1] }
      vehicle_enter(player, ironclads[1])
    end
  end
end
script.on_event(name_enter_vehicle_event, on_enter_vehicle_keypress)

function on_player_driving_changed_state (event)
  local player = game.players[event.player_index]
  local character = player.character
  if not character then return end

  global.disable_this_tick = global.disable_this_tick or {}
  if global.disable_this_tick[player.index] and global.disable_this_tick[player.index] == event.tick then
    return
  end

  global.driving_state_locks = global.driving_state_locks or {}
  if global.driving_state_locks[player.index] then
    if global.driving_state_locks[player.index].valid_time >= game.tick then
      local lock = global.driving_state_locks[player.index]
      if lock.vehicle then
        if not lock.vehicle.valid then
          global.driving_state_locks[player.index] = nil
        else
          if not character.vehicle then
            vehicle_enter(player, lock.vehicle)
          elseif character.vehicle ~= lock.vehicle then
            if character.vehicle.get_driver() == character then
              character.vehicle.set_driver(nil)
            else
              character.vehicle.set_passenger(nil)
            end
            vehicle_enter(player, lock.vehicle)
          end
        end
      else
        if player.vehicle then
          vehicle_exit(player, lock.position)
        end
      end
    else
      global.driving_state_locks[player.index] = nil
    end
  end
end
script.on_event(defines.events.on_player_driving_changed_state, on_player_driving_changed_state)

function disable_this_tick(player_index)
  global.disable_this_tick = global.disable_this_tick or {}
  global.disable_this_tick[player_index] = game.tick
end

function new_ironclad(entity)
  if not entity then return end
  if is_ironclad(entity.name) then
    rendering.draw_animation{
      animation = "ironclad-ripple-animation",
      render_layer = "water-tile",
      surface = entity.surface,
      target = entity,
      target_offset = {0, 0.3},
      animation_speed = 0.8,
      x_scale = 0.5,
      y_scale = 0.5
    }
  end
end

function on_built_entity(event)
  new_ironclad(event.created_entity)
end
script.on_event(defines.events.on_built_entity, on_built_entity)

remote.add_interface(
    "aai-vehicles-ironclad",
    {
        -- sent by aai-programmable-structures
        on_entity_deployed = function(event) new_ironclad(event.entity) end,

        -- sent by aai-programmable-vehicles -- replaced by equivalent
        on_entity_replaced = function(event) new_ironclad(event.new_entity) end,

        disable_this_tick = disable_this_tick,
    }
)
