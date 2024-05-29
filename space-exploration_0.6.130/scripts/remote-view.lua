local RemoteView = {}
--[[
Navigation View.
Remote view is the system that detaches the player from the character.
It displays a small you-are-here window on the top left with a buttons to:
  Open the zone list
  Open starmap
  Open system view
  Return to your body
]]--

-- constants
RemoteView.name_shortcut = mod_prefix .. "remote-view"
RemoteView.name_event = mod_prefix .. "remote-view"
RemoteView.name_pins_event = mod_prefix .. "remote-view-pins"
RemoteView.name_event_previous = mod_prefix .. "remote-view-previous"
RemoteView.name_event_next = mod_prefix .. "remote-view-next"
--RemoteView.name_permissions_group = mod_prefix.."remote-view"
RemoteView.name_button_overhead_satellite = mod_prefix .. "overhead_satellite"
RemoteView.name_setting_overhead_satellite = mod_prefix .. "show-overhead-button-satellite-mode"

-- for the default inventory filters
RemoteView.name_prefix_targeter = mod_prefix.."delivery-cannon-artillery-targeter-"
RemoteView.name_delivery_cannon_targeter = mod_prefix.."delivery-cannon-targeter"
RemoteView.name_energy_transmitter_targeter = mod_prefix.."energy-transmitter-targeter"
RemoteView.name_capsule_targeter = mod_prefix.."space-capsule-targeter"
RemoteView.name_train_targeter = mod_prefix.."train-gui-targeter"

RemoteView.name_satellite_light = mod_prefix .. "satellite-light"

RemoteView.name_permission_group = "satellite"
RemoteView.name_permission_group_suffix = "_satellite"

RemoteView.max_history = 16
RemoteView.nb_satellites_to_unlock_intersurface = 2

RemoteView.satellite_block_actions = {
  defines.input_action.begin_mining_terrain,
  defines.input_action.change_riding_state,
  defines.input_action.change_shooting_state,
  defines.input_action.cursor_split,
  defines.input_action.drop_item,
  defines.input_action.fast_entity_split,
  defines.input_action.fast_entity_transfer,
  defines.input_action.inventory_split,
  defines.input_action.inventory_transfer,
  defines.input_action.map_editor_action,
  defines.input_action.open_equipment,
  defines.input_action.place_equipment,
  defines.input_action.set_car_weapons_control,
  defines.input_action.stack_split,
  defines.input_action.stack_transfer,
  defines.input_action.start_repair,
  defines.input_action.take_equipment,
  defines.input_action.toggle_driving,
  defines.input_action.toggle_map_editor,
}

RemoteView.on_remote_view_started = script.generate_event_name()
RemoteView.on_remote_view_stopped = script.generate_event_name()

function RemoteView.get_only_in_cursor_flag(item_name)
  if not RemoteView.only_in_cursor_flag then
    RemoteView.only_in_cursor_flag = {}
  end
  if not RemoteView.only_in_cursor_flag[item_name] then
    RemoteView.only_in_cursor_flag[item_name] = game.item_prototypes[item_name].has_flag("only-in-cursor")
  end
  return RemoteView.only_in_cursor_flag[item_name]
end

---Gets the allowed stack size of the given item stack for remote view.
---@param stack LuaItemStack|LuaItemPrototype Item stack to evaluate
---@return uint
function RemoteView.get_stack_limit(stack) -- must be lua item stack, not simple stack
  local name = stack.name
  local type = stack.type

  if RemoteView.get_only_in_cursor_flag(name) then
    -- Copy tool, cut tool, and others
    return stack.count
  end
  if type == "blueprint"
    or type == "blueprint-book"
    or type == "deconstruction-item"
    or type == "selection-tool"
    or type == "upgrade-item" then
      return stack.count
  end
  if (type == "capsule" and stack.prototype.capsule_action.type == "artillery-remote")
    --or name == "ion-cannon-targeter" -- still bugged
    or type == "spidertron-remote" -- allow all spidertron remotes (not just the vanilla one named spidertron-remote) by using type
    or name == "er:screenshot-camera" then -- Eradicator's Screenshot Maker
      return stack.count
  end
  if name == "red-wire"
    or name == "green-wire"
    or name == "copper-cable" then
      return 2
  end
  if string.starts(name, RemoteView.name_prefix_targeter) or name == RemoteView.name_delivery_cannon_targeter or name == RemoteView.name_energy_transmitter_targeter or name == RemoteView.name_capsule_targeter or name == RemoteView.name_train_targeter then
    return 1
  end
  return 0
end

---Gets the allowed number of an item stack in the remote view inventory.
---@param stack LuaItemStack Item stack to evaluate
---@return number
function RemoteView.get_inventory_limit(stack)
  local name = stack.name
  local type = stack.type

  if type == "capsule" and stack.prototype.capsule_action.type == "artillery-remote" then
    return 1
  end
  if string.starts(name, RemoteView.name_prefix_targeter) or name == RemoteView.name_delivery_cannon_targeter or name == RemoteView.name_energy_transmitter_targeter or name == RemoteView.name_capsule_targeter or name == RemoteView.name_train_targeter then
    return 1
  end
  if type == "spidertron-remote" then
    return 30
  end
  if name == "red-wire"
    or name == "green-wire"
    or name == "copper-cable" then
      return 2
  end
  return math.huge
end

---@param player LuaPlayer
---@param stack LuaItemStack
---@param drop_count uint
---@param drop_to_ground boolean
function RemoteView.drop_stack(player, stack, drop_count, drop_to_ground)
  if player and player.connected and RemoteView.is_active(player) then
    local entity = player.opened_gui_type == defines.gui_type.entity and player.opened or player.selected
    stack.count = drop_count
    if entity then
      local inserted = entity.insert(stack)
      if inserted < drop_count and drop_to_ground == true then
        stack.count = drop_count-inserted
        player.surface.spill_item_stack(
          entity.position,
          stack,
          false, -- lootable
          player.force, -- deconstruct by force
          false) -- allow belts
      end
    elseif drop_to_ground then
      local limit = RemoteView.get_stack_limit(stack)
      if limit == 0 then
        player.surface.spill_item_stack(
          player.position,
          stack,
          false, -- lootable
          player.force, -- deconstruct by force
          false) -- allow belts
      end
    end
  end
end

---@param event EventData.on_player_crafted_item Event data
function RemoteView.on_player_crafted_item(event)
  if not(event.item_stack and event.item_stack.valid_for_read) then return end
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and player.connected and RemoteView.is_active(player) then
    local limit = RemoteView.get_stack_limit(event.item_stack)
    if limit > 0 then
      player.clear_cursor()
      player.cursor_stack.set_stack(event.item_stack)
      if event.item_stack.count > limit then
        RemoteView.drop_stack(player, event.item_stack, event.item_stack.count - limit, false)
      end
    else
      player.cursor_ghost = event.item_stack.prototype
    end
    event.item_stack.count = 0 -- Do not actually craft anything, we've already put it in the cursor
  end
end
Event.addListener(defines.events.on_player_crafted_item, RemoteView.on_player_crafted_item)

---Handles a player using the pipette hotkey while in remote view.
---@param event EventData.on_player_pipette Event data
function RemoteView.on_player_pipette(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and RemoteView.is_active(player) then
    -- Get _actual_ player cursor contents in case modified by another mod (factorio-mods#178)
    local cursor_item = player.cursor_stack and player.cursor_stack.valid_for_read and player.cursor_stack.name
    player.cursor_stack.clear() -- Because of "cheat mode", Factorio's pipette has put a full stack of real items in the cursor. Just delete them without putting them in inventory.
    player.cursor_ghost = cursor_item or event.item
  end
end
Event.addListener(defines.events.on_player_pipette, RemoteView.on_player_pipette)

---@param event EventData.on_player_cursor_stack_changed Event data
function RemoteView.on_player_cursor_stack_changed(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and player.connected and RemoteView.is_active(player) then
    local stack = player.cursor_stack
    if stack and stack.valid_for_read then
      local limit = RemoteView.get_stack_limit(stack)
      if limit > 0 then
        if stack.count > limit then
          if stack.name == "red-wire"
            or stack.name == "green-wire"
            or stack.name == "copper-cable" then
            --wire shortcuts mod messes things up
          else
            RemoteView.drop_stack(player, stack, stack.count - limit, true)
          end
        end
        stack.count = limit
      else
        RemoteView.drop_stack(player, stack, stack.count, true)
        player.cursor_ghost = stack.prototype
        player.cursor_stack.clear()
      end
    end
  end
end
Event.addListener(defines.events.on_player_cursor_stack_changed, RemoteView.on_player_cursor_stack_changed)

---@param event EventData.on_player_main_inventory_changed Event data
function RemoteView.on_player_main_inventory_changed(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and player.connected and RemoteView.is_active(player) then
    local inv = player.get_main_inventory()
    local item_counts = {}
    for i = 1, #inv do
      local stack = inv[i]
      if stack and stack.valid_for_read then
        item_counts[stack.name] = (item_counts[stack.name] or 0) + stack.count
        local stack_limit = RemoteView.get_stack_limit(stack)
        local inventory_limit = RemoteView.get_inventory_limit(stack)
        if stack_limit > 0 and item_counts[stack.name] <= inventory_limit then
          stack.count = stack_limit
        else
          RemoteView.drop_stack(player, stack, stack.count, true)
          stack.count = 0
        end
      end
    end
  end
end
Event.addListener(defines.events.on_player_main_inventory_changed, RemoteView.on_player_main_inventory_changed)

---@param group_from LuaPermissionGroup
---@param group_to LuaPermissionGroup
function RemoteView.apply_permission_group_permissions(group_from, group_to)
  for _, action in pairs(defines.input_action) do
    group_to.set_allows_action(action, group_from.allows_action(action) )
  end
end

---@param player LuaPlayer
---@return LuaPermissionGroup?
function RemoteView.player_set_satellite_permissions(player)
  local playerdata = get_make_playerdata(player)
  local permission_group = nil
  if player.permission_group then
    if player.permission_group.name == RemoteView.name_permission_group then
      return player.permission_group -- already in default satellite group
    elseif string.find(player.permission_group.name, RemoteView.name_permission_group_suffix, 1, true) then
      return player.permission_group -- already in special satellite group
    end
    -- make a new group from the existing group
    permission_group = game.permissions.get_group(player.permission_group.name..RemoteView.name_permission_group_suffix)
    if not permission_group then
      permission_group = game.permissions.create_group(player.permission_group.name..RemoteView.name_permission_group_suffix)
      ---@cast permission_group -?
    end
    RemoteView.apply_permission_group_permissions(player.permission_group, permission_group)
  end

  -- get the default group
  if not permission_group then
    permission_group = game.permissions.get_group(RemoteView.name_permission_group)
  end

  -- make the default group
  if not permission_group then
    permission_group = game.permissions.create_group(RemoteView.name_permission_group)
  end

  for _, action in pairs(RemoteView.satellite_block_actions) do
    permission_group.set_allows_action(action, false)
  end

  return permission_group
end

---@param player LuaPlayer
function RemoteView.persist_inventory(player)
  local playerdata = get_make_playerdata(player)
  local inventory = player.get_main_inventory()
  if not inventory then return end

  player.clear_cursor() -- Put cursor back into inventory before persisting it

  local inventory_size = #inventory

  playerdata.navsat_inventory = playerdata.navsat_inventory or game.create_inventory(inventory_size)
  playerdata.navsat_inventory_filters = playerdata.navsat_inventory_filters or {}

  if inventory_size > #playerdata.navsat_inventory then
    playerdata.navsat_inventory.resize(inventory_size)
  end

  for i = 1, inventory_size do
    playerdata.navsat_inventory[i].transfer_stack(inventory[i])
    playerdata.navsat_inventory_filters[i] = inventory.get_filter(i)
  end
end

---@param playerdata PlayerData
---@param item_name string
---@param filter_only? boolean
local function navsat_inventory_insert_if_valid(playerdata, item_name, filter_only)
  if game.item_prototypes[item_name].valid then
    table.insert(playerdata.navsat_inventory_filters, item_name)
    if not filter_only then
      local count = RemoteView.get_stack_limit(game.item_prototypes[item_name])
      playerdata.navsat_inventory.insert{name=item_name, count=count}
    end
  end
end

---@param player LuaPlayer
function RemoteView.restore_inventory(player)
  local playerdata = get_make_playerdata(player)
  local inventory = player.get_main_inventory()
  if not inventory then return end

  -- First time opening navsat
  if not playerdata.navsat_inventory or not playerdata.navsat_inventory_filters then
    playerdata.navsat_inventory = game.create_inventory(#inventory)
    playerdata.navsat_inventory_filters = {}
    if not script.active_mods["WireShortcuts"] then
      navsat_inventory_insert_if_valid(playerdata, "red-wire")
      navsat_inventory_insert_if_valid(playerdata, "green-wire")
      navsat_inventory_insert_if_valid(playerdata, "copper-cable")
    end
    navsat_inventory_insert_if_valid(playerdata, "artillery-targeting-remote", true)
    -- search for all weapon delivery cannon artillery remotes since they should be easily usable in nav view as well
    -- using a stack-size=1 filter makes this search faster but is not necessary for correctness
    local item_prototypes = game.get_filtered_item_prototypes{{ filter="stack-size", comparison="=", value="1", mode="and"}}
    for name, _ in pairs(item_prototypes) do
      if string.starts(name, RemoteView.name_prefix_targeter) then
        navsat_inventory_insert_if_valid(playerdata, name, true)
      end
    end
    navsat_inventory_insert_if_valid(playerdata, "spidertron-remote", true)
  end

  for i = 1, util.min(#inventory, #playerdata.navsat_inventory) do
    inventory[i].transfer_stack(playerdata.navsat_inventory[i])
    inventory.set_filter(i, playerdata.navsat_inventory_filters[i])
  end
end

---@param tick_task RestoreInventoryOnCutsceneExitTickTask
function RemoteView.restore_inventory_on_cutscene_exit(tick_task)
  local player = game.get_player(tick_task.player_index)
  local playerdata = get_make_playerdata(player)
  if playerdata.remote_view_active and player.controller_type == defines.controllers.god then
    -- Cutscene has ended and we are in remote view, restore inventory
    RemoteView.restore_inventory(player)
  end
end

-- This just calls restore_inventory_on_cutscene_exit on the next tick.
-- We can't do it when on_cutscene_waypoint_reached is fired because the player will still be in the cutscene controller for 1 more tick.
---@param event EventData.on_cutscene_cancelled|EventData.on_cutscene_waypoint_reached Event data
function RemoteView.check_cutscene_end_next_tick(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  local playerdata = get_make_playerdata(player)
  if playerdata.remote_view_active then
    local tick_task = new_tick_task("restore-inventory-on-cutscene-exit") --[[@as RestoreInventoryOnCutsceneExitTickTask]]
    tick_task.player_index = event.player_index
    tick_task.delay_until = event.tick + 1
  end
end
Event.addListener(defines.events.on_cutscene_cancelled, RemoteView.check_cutscene_end_next_tick)
Event.addListener(defines.events.on_cutscene_waypoint_reached, RemoteView.check_cutscene_end_next_tick)

---@param player LuaPlayer
function RemoteView.stop(player)
  -- Abort if player is in a cutscene; fix for factorio-mods#182
  if player.controller_type == defines.controllers.cutscene then
    player.print({"space-exploration.remote-view-stop-in-cutscene"})
    return
  end

  local playerdata = get_make_playerdata(player)
  if playerdata.saved_cheat_mode ~= nil then
    player.cheat_mode = playerdata.saved_cheat_mode
    playerdata.saved_cheat_mode = nil
  else
    player.cheat_mode = false
  end
  -- exit remote view
  if playerdata.remote_view_active then
    local player_index = player.index

    RemoteView.destroy_light(player_index)
    playerdata.remote_view_active = nil
    playerdata.remote_view_activity = nil

    RemoteView.persist_inventory(player)

    local location_reference = Location.make_reference(Zone.from_surface(player.surface), player.position, nil)
    RemoteView.add_history(player, location_reference, true)

    RemoteViewGUI.close(player)
    MapView.stop_map(player)

    if playerdata.pre_nav_permission_group and playerdata.pre_nav_permission_group.valid and playerdata.pre_nav_permission_group.name ~= RemoteView.name_permission_group then
      player.permission_group = playerdata.pre_nav_permission_group
    else
      player.permission_group = nil
    end
    playerdata.pre_nav_permission_group = nil
    if playerdata.character and playerdata.character.valid then
      local player_opened = player.opened
      if playerdata.spectator_of and playerdata.spectator_of.valid then
        player.set_controller{type = defines.controllers.ghost}
      elseif playerdata.anchor_scouting_for_spaceship_index then
        player.set_controller{type = defines.controllers.ghost}
        playerdata.character.color = player.color
      else
        player.teleport(playerdata.character.position, playerdata.character.surface)
        if playerdata.character.player == nil then -- Avoid crash if someone else (e.g. admin) took control of the character
          player.set_controller{type=defines.controllers.character, character=playerdata.character}
        end
      end
      if player_opened and player_opened.valid then
        player.opened = player_opened
      end
    elseif not player.character then
      Respawn.die(player)
    end

    -- Raise event _after_ controller has been changed.
    script.raise_event(RemoteView.on_remote_view_stopped, {player_index = player_index})

    if player.auto_sort_main_inventory then
      local inventory = player.get_main_inventory()
      if inventory then
        inventory.sort_and_merge()
      end
    end
  end
  if player and player.character and player.character.vehicle and player.character.vehicle.name == Capsule.name_space_capsule_vehicle then
    Capsule.on_player_driving_changed_state({player_index = player.index})
  end
end

---Adds a given location reference to player's navigation history.
---@param player LuaPlayer Player
---@param location_reference? LocationReference Location reference
---@param force_to_end? boolean
function RemoteView.add_history(player, location_reference, force_to_end)
  if not location_reference then return end

  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then
    playerdata.location_history = {}
    playerdata.location_history.references = {location_reference}
    playerdata.location_history.current_pointer = 1
  else
    -- if back in history, clear any skipped forward
    if not force_to_end then
      for i = playerdata.location_history.current_pointer + 1, #playerdata.location_history.references do
        playerdata.location_history.references[i] = nil
      end
    end

     -- don't add duplicate
    if next(playerdata.location_history.references) then
      local last_ref = playerdata.location_history.references[#playerdata.location_history.references]
      --Log.debug(serpent.block(last_ref))
      --Log.debug(serpent.block(location_reference))
      if last_ref.type == location_reference.type and last_ref.index == location_reference.index then
        -- same zone, maybe have a setting to not have multiple history events on the same zone.
        if last_ref.position == nil or last_ref.name == nil then
          -- replace the postionless location
          playerdata.location_history.references[#playerdata.location_history.references] = location_reference
        elseif location_reference.position and Util.vectors_delta_length(last_ref.position, location_reference.position) > 1 then
          -- add different position
          table.insert(playerdata.location_history.references, location_reference)
        end
      else -- different zone, always add
        table.insert(playerdata.location_history.references, location_reference)
      end
    else
      table.insert(playerdata.location_history.references, location_reference)
    end

    -- fit in max history
    while #playerdata.location_history.references > RemoteView.max_history do
      table.remove(playerdata.location_history.references, 1)
    end

    -- update pointer
    playerdata.location_history.current_pointer = #playerdata.location_history.references --[[@as uint]]
  end
end

--[[
Makes the data valid.
Deletes histories to deleted surfaces/spaceships
]]
---@param player LuaPlayer
function RemoteView.make_history_valid(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.location_history then
    local old_history = playerdata.location_history
    playerdata.location_history = nil
    for _, location_reference in pairs(old_history.references) do
      if Location.from_reference(location_reference) then
        RemoteView.add_history(player, location_reference, true)
      end
    end
  end
end

---@param player LuaPlayer
function RemoteView.history_goto_next(player)
  local location_reference = RemoteView.history_next(player)
  if location_reference then
    local playerdata = get_make_playerdata(player)
    playerdata.location_history.current_pointer = playerdata.location_history.current_pointer + 1
    Location.goto_reference(player, location_reference, true)
  end
end

---@param player LuaPlayer
---@return LocationReference?
function RemoteView.history_next(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then return end
  return playerdata.location_history.references[playerdata.location_history.current_pointer + 1]
end

---@param player LuaPlayer
function RemoteView.history_goto_previous(player)
  local location_reference = RemoteView.history_previous(player)
  if location_reference then
    local playerdata = get_make_playerdata(player)
    playerdata.location_history.current_pointer = playerdata.location_history.current_pointer - 1
    Location.goto_reference(player, location_reference, true)
  end
end

---@param player LuaPlayer
---@return LocationReference?
function RemoteView.history_previous(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then return end
  return playerdata.location_history.references[playerdata.location_history.current_pointer - 1]
end

---@param player LuaPlayer
function RemoteView.history_delete_all(player)
  local playerdata = get_make_playerdata(player)
  if not playerdata.location_history then return end
  local current_history = nil
  if playerdata.location_history.current_pointer > 0 and playerdata.location_history.references then
    current_history = playerdata.location_history.references[playerdata.location_history.current_pointer]
  end
  playerdata.location_history.current_pointer = 0
  for key, value in pairs(playerdata.location_history.references) do
    playerdata.location_history.references[key] = nil
  end
  if current_history then
    playerdata.location_history.current_pointer = 1
    table.insert(playerdata.location_history.references, current_history)
  end
end

---@param player LuaPlayer
function RemoteView.history_goto_last(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.location_history.references and playerdata.location_history.references then
    local location_reference = playerdata.location_history.references[#playerdata.location_history.references]
    if location_reference then
      Location.goto_reference(player, location_reference, true)
    end
  end
end

---@param force_name string
---@return boolean
function RemoteView.is_unlocked_force(force_name)
  return global.debug_view_all_zones or (global.forces[force_name] and global.forces[force_name].satellites_launched >= 1)
end

---@param player LuaPlayer
---@return boolean
function RemoteView.is_unlocked(player)
  return RemoteView.is_unlocked_force(player.force.name)
end

---@param player LuaPlayer
---@return LocalisedString
function RemoteView.unlock_requirement_string(player)
  if is_player_force(player.force.name) then
    return {"space-exploration.remote-view-requires-satellite"}
  else
    return {"space-exploration.cannot-use-with-force"}
  end
end

---@param force_name string
---@return boolean
function RemoteView.is_intersurface_unlocked_force(force_name)
  return global.debug_view_all_zones or (global.forces[force_name] and global.forces[force_name].satellites_launched >= RemoteView.nb_satellites_to_unlock_intersurface)
end

---@param player LuaPlayer
---@return boolean
function RemoteView.is_intersurface_unlocked(player)
  return RemoteView.is_intersurface_unlocked_force(player.force.name)
end

---@param player LuaPlayer
---@return LocalisedString
function RemoteView.intersurface_unlock_requirement_string(player)
  if is_player_force(player.force.name) then
    return {"space-exploration.remote-view-intersurface-requires-satellite", RemoteView.nb_satellites_to_unlock_intersurface - global.forces[player.force.name].satellites_launched}
  else
    return {"space-exploration.cannot-use-with-force"}
  end
end

---@param force_name string
---@param err_str string
---@return LocalisedString
function RemoteView.intersurface_unlock_requirement_string_2(force_name, err_str)
  err_str = err_str or "space-exploration.remote-view-intersurface-requires-satellite"
  return {err_str, RemoteView.nb_satellites_to_unlock_intersurface - global.forces[force_name].satellites_launched}
end

---Starts remote view for a given player.
---@param player LuaPlayer Player
---@param zone? AnyZoneType|SpaceshipType Zone to open
---@param position? MapPosition Position to go to, if any
---@param location_name? string Player-given location name, if any
---@param freeze_history? boolean Determines whether entry is added to history
function RemoteView.start(player, zone, position, location_name, freeze_history)
  -- Dont let the player enter nav view in the editor because it breaks
  if player.controller_type == defines.controllers.editor then
    return player.print({"space-exploration.cannot-open-nav-view-in-editor"})
  end

  if not is_player_force(player.force.name) then
    return player.print({"space-exploration.cannot-use-with-force"})
  end

  if not RemoteView.is_unlocked(player) then
    return player.print({"space-exploration.remote-view-requires-satellite"})
  end

  if zone and zone.surface_index ~= player.surface.index then
    if not RemoteView.is_intersurface_unlocked(player) then
      return player.print(RemoteView.intersurface_unlock_requirement_string(player))
    end
  end

  Spaceship.stop_anchor_scouting(player)

  local playerdata = get_make_playerdata(player)
  local character = player.character

  -- Enter remote view
  if not playerdata.remote_view_active then
    playerdata.remote_view_active = true

    script.raise_event(RemoteView.on_remote_view_started, {player_index = player.index})

    RemoteView.create_light(player.index)

    if player.permission_group then
      playerdata.pre_nav_permission_group = game.permissions.get_group(player.permission_group.name)
    end

    if player.character then
      playerdata.saved_cheat_mode = player.cheat_mode
    end

    local player_opened = player.opened
    player.set_controller{type = defines.controllers.god}
    player.opened = player_opened
    player.cheat_mode = true

    RemoteView.restore_inventory(player)
  end

  player.permission_group = RemoteView.player_set_satellite_permissions(player)

  if character then
    playerdata.character = character
    playerdata.character.color = player.color
    -- stop the character from continuing input action (running to doom)
    character.walking_state = {walking = false, direction = defines.direction.south}
    character.riding_state = {acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight}
    character.shooting_state = {state = defines.shooting.not_shooting, position = character.position}
    character.mining_state = {mining = false}
    character.picking_state = false
    character.repair_state = {repairing = false, position = character.position}
  end

  zone = zone or Zone.from_surface(player.surface)

  -- If in a vault, get the zone it belongs to
  if not zone then
    local vault = Ancient.vault_from_surface(player.surface)
    if vault then
      zone = Zone.from_zone_index(vault.zone_index)
    end
  end

  -- This probably should be changed for MP with multiple forces, as some may not know about Nauvis
  if (not zone) and not playerdata.remote_view_active_map then
    zone = Zone.get_default()
  end

  if zone then
    if not freeze_history then
      local location_reference = Location.make_reference(zone, position, location_name) --[[@as LocationReference]]
      RemoteView.add_history(player, location_reference)
    end

    playerdata.remote_view_current_zone = zone
    playerdata.remote_view_active_map = nil

    if zone.type == "spaceship" then
      ---@cast zone SpaceshipType
      local spaceship = zone
      local surface = Spaceship.get_current_surface(zone)
      if player.surface ~= surface then
        if position then
          player.teleport(position, surface)
        elseif spaceship.console and spaceship.console.valid then
          player.teleport(spaceship.console.position, spaceship.console.surface)
        else
          if spaceship.known_tiles_average_x and spaceship.known_tiles_average_y then
            player.teleport({spaceship.known_tiles_average_x,spaceship.known_tiles_average_y}, surface)
          else
            player.teleport({0,0}, surface)
          end
        end
      elseif position then
        player.teleport(position)
      end
    else
      ---@cast zone -SpaceshipType
      local surface = Zone.get_make_surface(zone)
      if not playerdata.surface_positions or not playerdata.surface_positions[surface.index] then
        player.force.chart(surface, util.position_to_area({x = 0, y = 0}, 256))
      elseif not position then
        position = playerdata.surface_positions[zone.surface_index]
      end
      if not position then
        position = {x = 0, y = 0}
      end
      player.teleport(position, surface)
      Zone.apply_markers(zone) -- in case the surface exists
    end
  else
    playerdata.remote_view_current_zone = nil
    playerdata.remote_view_active_map = nil
  end

  RemoteViewGUI.open(player)
end

---@param player LuaPlayer
---@param zone AnyZoneType
---@param position MapPosition
---@param zoom? number
function RemoteView.start_no_map(player, zone, position, zoom)
  RemoteView.start(player, zone, position)
  player.close_map()
  if zoom then player.zoom = zoom end
end

---@param player LuaPlayer
---@return boolean
function RemoteView.is_active (player)
  return get_make_playerdata(player).remote_view_active == true
end

---@param player LuaPlayer
function RemoteView.toggle (player)
  if RemoteView.is_active(player) then
    RemoteView.stop(player)
  else
    RemoteView.start(player)
  end
end

---Handles clicks for remote view.
---@param event EventData.on_gui_click Event data
function RemoteView.on_gui_click(event)
  if not (event.element and event.element.valid) then return end

  local element = event.element
  local player = game.get_player(event.player_index)
  ---@cast player -? 

  if element.name == RemoteView.name_button_overhead_satellite then
    RemoteView.toggle(player) return
  elseif element.tags and element.tags.se_action == "go_to_entity_and_select" then
    local surface = game.get_surface(element.tags.surface_index --[[@as uint]])
    if surface then
      local zone = Zone.from_surface(surface)
      if zone then
        player.clear_cursor()
        local entity = surface.find_entity(
          element.tags.name --[[@as string]],
          element.tags.position --[[@as MapPosition]]
        )
        RemoteView.start(player, zone, element.tags.position)
        if entity then player.opened = entity end
      else
        RemoteView.stop(player)
      end
    end
  end
end
Event.addListener(defines.events.on_gui_click, RemoteView.on_gui_click)

---@param event EventData.on_lua_shortcut Event data
function RemoteView.on_lua_shortcut(event)
    if event.prototype_name == RemoteView.name_shortcut then
      RemoteView.toggle(game.get_player(event.player_index))
    end
end
Event.addListener(defines.events.on_lua_shortcut, RemoteView.on_lua_shortcut)

---Handles the nav-sat, go-to-next, and go-to-previous keyboard shortcuts.
---@param event EventData.CustomInputEvent Event data
function RemoteView.on_remote_view_keypress(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if event.input_name == RemoteView.name_event then
    -- Check if player is in map mode (or zoomed-in map mode)
    if player.render_mode > 1 then
      -- Teleport if already in nav-mode or anchor scouting
      if player.controller_type == defines.controllers.ghost
        or player.controller_type == defines.controllers.god
      then
        player.teleport(event.cursor_position, player.surface)
        player.close_map()
      else
        RemoteView.start_no_map(player, Zone.from_surface(player.surface), event.cursor_position)
      end
    else
      RemoteView.toggle(player)
    end
  elseif event.input_name == RemoteView.name_event_next then
    RemoteView.history_goto_next(player)
  elseif event.input_name == RemoteView.name_event_previous then
    RemoteView.history_goto_previous(player)
  end
end
Event.addListener(RemoteView.name_event, RemoteView.on_remote_view_keypress)
Event.addListener(RemoteView.name_event_next, RemoteView.on_remote_view_keypress)
Event.addListener(RemoteView.name_event_previous, RemoteView.on_remote_view_keypress)


---@param event EventData.CustomInputEvent Event data
function RemoteView.on_remote_view_pins_keypress(event)
  if event.player_index
    and game.get_player(event.player_index)
    and game.get_player(event.player_index).connected
  then
    Pin.window_toggle(game.get_player(event.player_index))
  end
end
Event.addListener(RemoteView.name_pins_event, RemoteView.on_remote_view_pins_keypress)

---@param event EventData.on_player_clicked_gps_tag Event data
function RemoteView.on_player_clicked_gps_tag(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if not player then return end
  local surface = game.get_surface(event.surface)
  if surface then
    local zone = Zone.from_surface(surface)
    if not zone then
      if event.surface ~= player.surface.name then
        return player.print({"space-exploration.gps_no_zone"})
      end
    else
      if not RemoteView.is_unlocked(player) then
        if event.surface ~= player.surface.name then
          return player.print({"space-exploration.gps_requires_satellite"})
        else
          -- default to map shift with no message
        end
      else
        if Zone.is_visible_to_force(zone, player.force.name) then
          local playerdata = get_make_playerdata(player)
          RemoteView.start_no_map(player, zone, event.position, 0.3)
        else
          player.print({"space-exploration.gps_undiscovered"})
        end
      end
    end
  else
    player.print({"space-exploration.gps_invalid"})
  end
end
Event.addListener(defines.events.on_player_clicked_gps_tag, RemoteView.on_player_clicked_gps_tag)

---@param player_index uint
function RemoteView.update_overhead_button(player_index)
  local player = game.get_player(player_index)
  local button_flow = mod_gui.get_button_flow(player)
  if button_flow then
    if settings.get_player_settings(player)[RemoteView.name_setting_overhead_satellite].value == true then
      if not button_flow[RemoteView.name_button_overhead_satellite] then
        button_flow.add{type="sprite-button", name=RemoteView.name_button_overhead_satellite, sprite="virtual-signal/"..mod_prefix.."remote-view"}
      end
      if RemoteView.is_unlocked(player) then
        button_flow[RemoteView.name_button_overhead_satellite].enabled = true
        button_flow[RemoteView.name_button_overhead_satellite].tooltip = {"space-exploration.remote-view"}
      else
        button_flow[RemoteView.name_button_overhead_satellite].enabled = false
        button_flow[RemoteView.name_button_overhead_satellite].tooltip = RemoteView.unlock_requirement_string(player)
      end
    else
      if button_flow[RemoteView.name_button_overhead_satellite] then
        button_flow[RemoteView.name_button_overhead_satellite].destroy()
      end
    end
  end
end

--destroys remote view satellite light
---@param player_index uint player.index for player the light is attached to
function RemoteView.destroy_light(player_index)
  local player_in_remote_view = global.connected_players_in_remote_view[player_index]
  if rendering.is_valid(player_in_remote_view.satellite_light) then
    rendering.destroy(player_in_remote_view.satellite_light)
  end
  global.connected_players_in_remote_view[player_index] = nil
end

--create satellite light for remote view players
---@param player_index uint player.index to attach the light to
function RemoteView.create_light(player_index)
  local player = game.get_player(player_index)
  local satellite_light = rendering.draw_light{
    sprite = RemoteView.name_satellite_light,
    surface = player.surface,
    target = player.position,
    scale = 4,
    players = {player}
  }
  global.connected_players_in_remote_view[player_index] = {
    player=player,
    satellite_light=satellite_light
  }
end

--move light to follow player
---@param event EventData.on_tick Event data
function RemoteView.on_tick(event)
  for player_index, player_in_remote_view in pairs(global.connected_players_in_remote_view) do
    if rendering.is_valid(player_in_remote_view.satellite_light) then
      rendering.set_target(player_in_remote_view.satellite_light, player_in_remote_view.player.position)
    else
      RemoteView.create_light(player_index)
    end
  end
end
Event.addListener(defines.events.on_tick, RemoteView.on_tick)

--recreate light when player switches surfaces
---@param event EventData.on_player_changed_surface Event data
function RemoteView.on_player_changed_surface(event)
  if global.connected_players_in_remote_view[event.player_index] then
    RemoteView.destroy_light(event.player_index)
    RemoteView.create_light(event.player_index)
  end
end
Event.addListener(defines.events.on_player_changed_surface, RemoteView.on_player_changed_surface)

---@param event EventData.on_runtime_mod_setting_changed Event data
function RemoteView.on_runtime_mod_setting_changed(event)
  if event.player_index and event.setting == RemoteView.name_setting_overhead_satellite then
    RemoteView.update_overhead_button(event.player_index)
  end
end
Event.addListener(defines.events.on_runtime_mod_setting_changed, RemoteView.on_runtime_mod_setting_changed)

function RemoteView.on_configuration_changed()
  for _, player in pairs(game.connected_players) do
    RemoteView.update_overhead_button(player.index)
  end
end
Event.addListener("on_configuration_changed", RemoteView.on_configuration_changed, true)

---@param event EventData.on_player_changed_force Event data
function RemoteView.on_player_changed_force(event)
  RemoteView.update_overhead_button(event.player_index)
end
Event.addListener(defines.events.on_player_changed_force, RemoteView.on_player_changed_force)

--create `global.connected_players_in_remote_view` table
function RemoteView.on_init()
  ---Table of all connected players with remote view active, indexed by player.index
  ---@type PlayerInRemoteView[]
  global.connected_players_in_remote_view = {}
end
Event.addListener("on_init", RemoteView.on_init, true)

return RemoteView
