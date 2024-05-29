local Blueprint = {}
-- Description:
-- * Detects when a blueprint is created, selected from inventory, selected from a blueprint book
--     in inventory, a cut or copy selection is made, or a paste selection from the clipboard is made.
-- * If the blueprint contains a Spaceship Clamp entity, this mod sets the blueprint grid snapping
--     parameters so that at least one clamp will always be placed on the rail grid.
-- * If this results in a different clamp being placed off the rail grid, a warning message is printed.
--[[
TODO:
Make sure clamp snap offset doesn't conflict with actual rail entities.
Settings should be per-player.
]]

-- Clamp snapping based on code by robot256
---@param bp LuaItemStack
---@param player LuaPlayer
function Blueprint.update_blueprint(bp, player)
  if not player then Log.debug("no player", {"blueprint"}) end
  if not (bp and player) then return end
  -- This shouldn't be needed, the main code should have better cleanup for output ghosts.
  local remove_console_output = false -- settings.get_player_settings(player)["se-blueprint-remote-console-output"].value
  local snap_clamps = settings.get_player_settings(player)["se-blueprint-snap-clamps"].value
  if not (remove_console_output or snap_clamps) then return end

  -- Search for spaceship clamps and spaceship console outputs
  local entities = bp.get_blueprint_entities()
  if entities and next(entities) then
    local offset
    for i,e in pairs(entities) do
      if remove_console_output and (e.name == "se-struct-generic-output" or e.name == "se-spaceship-console-output") then
        entities[i] = nil
      end
      if snap_clamps and (not offset and e.name == "se-spaceship-clamp") then
        -- Origin is upper left corner of the clamp
        offset = {x = (e.position.x - 1) % 2, y = (e.position.y - 1) % 2}
      end
    end

    -- Check if we found any clamps
    if offset then

      -- If an absolute grid is set the origin can have a strange auto-genearted offset.
      -- try to put it near the middle so a large blueprint can be rotated and placed easily.
      local min_x, max_x, min_y, max_y
      for i, e in pairs(entities) do
        if min_x == nil or min_x > e.position.x then min_x = e.position.x end
        if max_x == nil or max_x < e.position.x then max_x = e.position.x end
        if min_y == nil or min_y > e.position.y then min_y = e.position.y end
        if max_y == nil or max_y < e.position.y then max_y = e.position.y end
      end

      local tiles = bp.get_blueprint_tiles()
      if tiles then
        for _, t in pairs(tiles) do
          if min_x == nil or min_x > t.position.x then min_x = t.position.x end
          if max_x == nil or max_x < t.position.x then max_x = t.position.x end
          if min_y == nil or min_y > t.position.y then min_y = t.position.y end
          if max_y == nil or max_y < t.position.y then max_y = t.position.y end
        end
      end

      local middle = {x = math.floor((min_x + max_x) / 4) * 2, y = math.floor((min_y + max_y) / 4) * 2}
      local origin = util.vectors_add(middle, offset)

      if origin.x ~= 0 or origin.y ~= 0 then
        if is_debug_mode then Log.debug("Moving blueprint offset by {"..origin.x..", "..origin.y.."} tiles.", {"blueprint"}) end

        -- Shift entities so the offset is at 0,0
        local grid_violated = false
        for _, e in pairs(entities) do
          e.position.x = e.position.x - origin.x
          e.position.y = e.position.y - origin.y
          -- Check that every clamp ends up on the rail grid after shifting the first clamp to offset
          if e.name == "se-spaceship-clamp" then
            if (e.position.x % 2 == 0) or (e.position.y % 2 == 0) then
              grid_violated = true
            end
          end
        end
        bp.set_blueprint_entities(entities)

        if grid_violated then
          Log.debug("WARNING: This blueprint has clamps aligned to different grids.", {"blueprint"})
        end

        -- Also shift blueprint tiles
        if tiles and next(tiles) then
          for _,t in pairs(tiles) do
            t.position.x = t.position.x - origin.x
            t.position.y = t.position.y - origin.y
          end
          bp.set_blueprint_tiles(tiles)
        end

      else
        if is_debug_mode then Log.debug("Origin already set correctly", {"blueprint"}) end
      end

      -- Set the snap parameters if they are incorrect
      -- If player already set snap parameters, any even numbers are okay
      local grid = bp.blueprint_snap_to_grid
      local relative = bp.blueprint_position_relative_to_grid

      if not grid or grid.x % 2 == 1 or grid.y % 2 == 1 then
        if is_debug_mode then Log.debug("Forcing blueprint grid to 2,2", {"blueprint"}) end
        bp.blueprint_snap_to_grid = {x=2, y=2}
      elseif is_debug_mode then
        Log.debug("Grid already set correctly", {"blueprint"})
      end

      if (not relative) or relative.x % 2 == 1 or relative.y % 2 == 1 then
        if is_debug_mode then Log.debug("Forcing blueprint relative offset to 0,0", {"blueprint"}) end
        bp.blueprint_position_relative_to_grid = {x = 0, y = 0}
      elseif is_debug_mode then
        Log.debug("Relative offset already set correctly", {"blueprint"})
      end

      bp.blueprint_absolute_snapping = true
      if is_debug_mode then Log.debug("Finished making blueprint snap to Spaceship Clamp.", {"blueprint"}) end

    else
      if is_debug_mode then Log.debug("No Spaceship Clamp found in Blueprint.", {"blueprint"}) end
    end

  elseif snap_clamps then
    if is_debug_mode then Log.debug("Blueprint is empty.", {"blueprint"}) end
  end
end


-- Event triggers when player selects an area with the blueprint tool, before the blueprint GUI opens

---@param event EventData.on_player_setup_blueprint Event data
function Blueprint.on_player_setup_blueprint(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  local item = player.blueprint_to_setup

  if item and item.valid_for_read then
    if is_debug_mode then Log.debug("on_player_setup_blueprint is processing player.blueprint_to_setup", {"blueprint"}) end
    Blueprint.update_blueprint(item, game.get_player(event.player_index))
  end
end
Event.addListener(defines.events.on_player_setup_blueprint, Blueprint.on_player_setup_blueprint)

-- Event triggers when player closes the blueprint GUI for any reason (including if no change was made)
-- Does NOT trigger when a blueprint is modified within the blueprint library, or within a blueprint book in inventory.
---@param event EventData.on_gui_closed Event data
function Blueprint.on_gui_closed(event)
  local item = event.item

  if item and item.valid_for_read and item.is_blueprint then
    if is_debug_mode then Log.debug("on_gui_closed is processing event.item", {"blueprint"}) end
    Blueprint.update_blueprint(item, game.get_player(event.player_index))
  end
end
Event.addListener(defines.events.on_gui_closed, Blueprint.on_gui_closed)

-- Event triggers when player confirms blueprint creation, after selecting copy/cut/paste tools,
--   after selecting a blueprint or book out of inventory, or after changing the active blueprint
--   in a book selected from inventory.
-- Does NOT trigger when a blueprint or book is selected from the blueprint library.
---@param event EventData.on_player_cursor_stack_changed Event data
function Blueprint.on_player_cursor_stack_changed(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  local item = player.cursor_stack

  -- Need to use "valid_for_read" because "valid" returns true for empty LuaItemStack in cursor
  if item and item.valid_for_read then
    if item.is_blueprint then
      if is_debug_mode then Log.debug("on_player_cursor_stack_changed is processing player.cursor_stack", {"blueprint"}) end
      Blueprint.update_blueprint(item, game.get_player(event.player_index))
    elseif item.is_blueprint_book then
      local active_index = item.active_index
      if active_index then
        if is_debug_mode then Log.debug("on_player_cursor_stack_changed is processing blueprint book in cursor", {"blueprint"}) end
        local book_inventory = item.get_inventory(defines.inventory.item_main)
        if is_debug_mode then Log.debug("on_player_cursor_stack_changed is looking for stack #"..active_index.." in array of "..#book_inventory.." items", {"blueprint"}) end
        if active_index <= #book_inventory then
          local blueprint = book_inventory[active_index]
          if blueprint and blueprint.valid_for_read and blueprint.is_blueprint then
            if is_debug_mode then Log.debug("on_player_cursor_stack_changed is processing player.cursor_stack["..active_index.."]", {"blueprint"}) end
            Blueprint.update_blueprint(blueprint, game.get_player(event.player_index))
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_player_cursor_stack_changed, Blueprint.on_player_cursor_stack_changed)

-- Ruin.replace_in_blueprint({name="filename", blueprint="...", entities={["in_name"]="out-name"}, tiles={["in_name"]="out-name"}})
---@param data {name:string, blueprint: string, entities?:{name:string, new_name?:string, shift?:MapPosition}[], tiles?:{[string]:string}}
function Blueprint.replace_in_blueprint(data)
  local file_name = "space-exploration.replace_in_blueprint."..data.name..".lua"
  local blueprint_string = data.blueprint

  local container = game.get_surface(1).create_entity{name = "iron-chest", position = {0,0}}
  ---@cast container -?
  container.insert{name="blueprint", count = 1}
  local inv = container.get_inventory(defines.inventory.chest)
  local blueprint = inv[1]
  blueprint.import_stack(blueprint_string)

  local entities = blueprint.get_blueprint_entities()
  for _, entity in pairs(entities or {}) do
    for _, change in pairs(data.entities or {}) do
      if entity.name == change.name then
        if change.new_name then
          entity.name = change.new_name
        end
        if change.shift then
          entity.position.x = entity.position.x + change.shift[1] or change.shift.x
          entity.position.y = entity.position.y + change.shift[2] or change.shift.y
        end
      end
    end
  end
  blueprint.set_blueprint_entities(entities)

  local tiles = blueprint.get_blueprint_tiles()
  for _, tile in pairs(tiles or {}) do
    for k, v in pairs(data.tiles or {}) do
      if tile.name == k then tile.name = v end
    end
  end
  blueprint.set_blueprint_tiles(tiles)

  local out_string = blueprint.export_stack()

  container.destroy()

  game.write_file(file_name, out_string, false)
end

return Blueprint
