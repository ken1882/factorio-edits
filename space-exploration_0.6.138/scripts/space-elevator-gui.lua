local SpaceElevatorGUI = {}

SpaceElevatorGUI.name_space_elevator_gui_root = mod_prefix.."space-elevator"
SpaceElevatorGUI.cache_costs_strings = {}

--- get prototype list of wagon entities and their costs, then format them nicely
---@param primary SpaceElevatorInfo
---@return {parts_string: LocalisedString, energy_string: LocalisedString}
function SpaceElevatorGUI.get_format_wagon_list(primary)
  --get the prototypes
  local wagon_table = {}
  local wagon_prototypes = game.get_filtered_entity_prototypes({
    {filter = "type", type = {"locomotive", "cargo-wagon", "fluid-wagon", "artillery-wagon"}},
    {filter = "flag", flag = "hidden", invert = true, mode = "and"}
  })
  for name,prototype in pairs(wagon_prototypes) do
    table.insert(wagon_table, {name = name, inventory_size = SpaceElevator.get_inventory_size(name)})
  end
  --format the prototypes in a nice string
  local parts_string = ""
  local energy_string = ""
  local special_character = " " --invisible character which shows up in factorio as the same width as a number
  local longest_up = 0
  local longest_down = 0
  for _,wagon_info in pairs(wagon_table) do
    local up_costs = SpaceElevator.inventory_transfer_costs(primary, wagon_info.inventory_size) --primary transfer costs are upwards
    local down_costs = SpaceElevator.inventory_transfer_costs(primary.opposite_struct, wagon_info.inventory_size)
    local before_decimal_up = math.max(0,math.floor(math.log(math.abs(up_costs.energy_change), 10) + 1)) --energy costs have inconsistent widths. this aims to fix that
    longest_up = math.max(longest_up, before_decimal_up)
    local before_decimal_down = math.max(0,math.floor(math.log(math.abs(down_costs.energy_change), 10) + 1))
    longest_down = math.max(longest_up, before_decimal_down)
  end
  for _,wagon_info in pairs(wagon_table) do
    local up_costs = SpaceElevator.inventory_transfer_costs(primary, wagon_info.inventory_size)
    local down_costs = SpaceElevator.inventory_transfer_costs(primary.opposite_struct, wagon_info.inventory_size)
    local before_number_up = longest_up - math.max(0,math.floor(math.log(math.abs(up_costs.energy_change), 10) + 1))
    local before_number_down = longest_down - math.max(0,math.floor(math.log(math.abs(down_costs.energy_change), 10) + 1))
    local wagon_icon = "[img=entity/"..wagon_info.name.."] "
    local parts_costs = string.format("%.4f", up_costs.parts_cost) .. " ↑  " .. string.format("%.4f", down_costs.parts_cost) .. " ↓"
    local energy_costs = string.rep(special_character, before_number_up) .. "[color=255,100,100]-" .. string.format("%.2f", math.abs(up_costs.energy_change/1000000)) 
    .. "MJ[/color] ↑  " .. string.rep(special_character, before_number_down) .. "[color=100,255,100]+" .. string.format("%.2f", down_costs.energy_change/1000000) .. "MJ[/color] ↓"
    local parts_sub_string = wagon_icon .. " " .. parts_costs
    local energy_sub_string = wagon_icon .. " " .. energy_costs
    parts_string = parts_string .. "\n" .. parts_sub_string
    energy_string = energy_string .. "\n" .. energy_sub_string
  end
  local formatted_parts_string = {"space-exploration.space-elevator-parts-consumption-info", 
  string.format("%.4f",SpaceElevator.space_elevator_parts_per_second(primary) * 60),
  parts_string}
  local formatted_energy_string = {"space-exploration.space-elevator-energy-consumption-info",
  string.format("%.0f", SpaceElevator.energy_passive_draw/1000000).."MW",
  string.format("%.0f", SpaceElevator.energy_min/1000000).."MJ",
  energy_string}
  return {parts_string = formatted_parts_string, energy_string = formatted_energy_string}
end

---@param primary SpaceElevatorInfo
---@return {parts_string: LocalisedString, energy_string: LocalisedString}
function SpaceElevatorGUI.get_costs_strings(primary)
  local costs_strings = SpaceElevatorGUI.cache_costs_strings[primary.zone.index]
  if costs_strings then
    return costs_strings
  else
    costs_strings = SpaceElevatorGUI.get_format_wagon_list(primary)
    SpaceElevatorGUI.cache_costs_strings[primary.zone.index] = costs_strings
  end
  return costs_strings
end

--- Create the space elevator gui for a player
---@param player LuaPlayer
---@param space_elevator SpaceElevatorInfo
function SpaceElevatorGUI.gui_open(player, space_elevator)
  SpaceElevatorGUI.gui_close(player)
  if not space_elevator then Log.debug('SpaceElevatorGUI.gui_open space_elevator not found') return end
  local primary = SpaceElevator.struct_primary(space_elevator)
  
  local gui = player.gui.relative
  local playerdata = get_make_playerdata(player)
  
  local anchor = {gui=defines.relative_gui_type.assembling_machine_gui, position=defines.relative_gui_position.right}
  local container = gui.add{
    type = "frame",
    name = SpaceElevatorGUI.name_space_elevator_gui_root,
    style="space_platform_container",
    direction="vertical",
    anchor = anchor,
    -- use gui element tags to store a reference to what space elevator this gui is displaying/controls
    tags = {
      unit_number = space_elevator.unit_number
    }
  }
  container.style.vertically_stretchable = "stretch_and_expand"
  
  
  local title_flow = container.add{type = "flow", name = "elevator-title-flow", direction = "horizontal", style = "se_relative_titlebar_flow"}
  title_flow.add{type = "label", name = "elevator-title-label", style = "frame_title", caption = {"space-exploration.relative-window-settings"}, ignored_by_interaction = true}
  local title_empty = title_flow.add {
    type = "empty-widget",
    style = "se_titlebar_drag_handle",
    ignored_by_interaction = true,
  }
  local title_informatron = title_flow.add {
    type = "sprite-button",
    name = "goto_informatron_space_elevators",
    sprite = "virtual-signal/informatron",
    style = "frame_action_button",
    tooltip = {"space-exploration.informatron-open-help"},
    tags = {se_action = "goto-informatron", informatron_page = "space_elevators"}
  }
  
  local inner_frame = container.add{
    type = "frame",
    name = "inner_frame",
    style = "inside_shallow_frame",
    direction = "vertical",
  }
  
  --[[
    Contruction/maintenance info
    Station name
    Station name edit button
    ]]
  local subheader_frame = inner_frame.add{
    type = "frame",
    name = "name-flow",
    direction = "horizontal",
    style = "se_stretchable_subheader_frame",
  }
  SpaceElevatorGUI.make_change_name_button_flow(space_elevator, subheader_frame)
  
  local content_flow = inner_frame.add{
    type = "flow",
    direction = "vertical",
  }
  content_flow.style.padding = 12
  local bar, label
    
  local status = content_flow.add{ type="label", name="status", caption={"space-exploration.label_status", ""}}
  status.style.bottom_margin = 10
  
  local costs_strings = SpaceElevatorGUI.get_costs_strings(primary)
  
  bar = content_flow.add{ type="progressbar", name="parts_progress", size = 300, value=0, style="spaceship_progressbar_integrity"}
  bar.style.horizontally_stretchable = true
  bar.style.bar_width = 24
  bar.tooltip = costs_strings.parts_string
  local parts_flow = content_flow.add{type="flow", name="parts_flow", direction="horizontal", ignored_by_interaction = true,}
  parts_flow.style.top_margin = -26
  label = parts_flow.add{ type="label", name="parts", caption={"space-exploration.label_parts", ""}, ignored_by_interaction = true,}
  label.style.left_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {1,1,1}
  label.style.bottom_margin = 4
  local spacer = parts_flow.add{type="flow", name="parts_flow", direction="horizontal", ignored_by_interaction = true,}
  spacer.style.horizontally_stretchable = true
  label = parts_flow.add{ type="label", name="parts_per_minute", caption={"space-exploration.label_parts_per_minute", ""}, ignored_by_interaction = true,}
  label.style.right_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {1,1,1}
  label.style.bottom_margin = 4

  bar = content_flow.add{ type="progressbar", name="energy_progress", size = 300, value=0, style="spaceship_progressbar_energy"}
  bar.style.horizontally_stretchable  = true
  bar.style.bar_width = 24
  bar.tooltip = costs_strings.energy_string
  label = content_flow.add{ type="label", name="energy", caption={"space-exploration.label_energy", ""}, ignored_by_interaction = true,}
  label.style.top_margin = -26
  label.style.left_margin = 5
  label.style.font = "default-bold"
  label.style.font_color = {1,1,1}
  label.style.bottom_margin = 14

  local button_flow = content_flow.add { type="flow", name="button_flow"}
  local view_opposite_button = button_flow.add{ type="button", name="view_opposite", caption = {"space-exploration.space-elevator-view-opposite"}}
  view_opposite_button.style.horizontally_stretchable = true
  local travel_button = button_flow.add {type="button", name="travel", caption = {"space-exploration.space-elevator-travel"}}
  travel_button.style.horizontally_stretchable = true

  if settings.get_player_settings(player)["se-show-zone-preview"].value then
    --inner_frame.add{ type="label", name="destination-location-preview-label", caption={"space-exploration.destination_preview"}}
    local preview_frame = container.add{type="frame", name="destination-location-preview-frame", style="inside_shallow_frame"}
    preview_frame.style.horizontally_stretchable = true
    preview_frame.style.vertically_stretchable = true
    --[[preview_frame.style.top_margin = 10
    preview_frame.style.left_margin = -10
    preview_frame.style.bottom_margin = -10
    preview_frame.style.right_margin = -10]]
    preview_frame.style.top_margin = 12
    preview_frame.style.minimal_height = 200
    local camera = preview_frame.add{
      type="camera",
      name="preview_camera",
      position=space_elevator.opposite_struct.main.position,
      zoom=0.25,
      surface_index=space_elevator.opposite_struct.surface.index,
    }
    camera.style.vertically_stretchable = true
    camera.style.horizontally_stretchable = true
  end


  SpaceElevatorGUI.gui_update(player)
end


---@param player LuaPlayer
function SpaceElevatorGUI.gui_update(player)
  local root = player.gui.relative[SpaceElevatorGUI.name_space_elevator_gui_root]
  if root then
    local struct = SpaceElevator.from_unit_number(
      root and root.tags and root.tags.unit_number)
    if struct then
      if not (struct.main and struct.main.valid) then
        SpaceElevator.destroy(struct)
      else
        local inner_frame = root.inner_frame
        -- Update the things
        local primary = SpaceElevator.struct_primary(struct)
        local status = util.find_first_descendant_by_name(inner_frame, "status")

        if primary.built then
          if struct.main.active then
            status.caption = {"space-exploration.space-elevator-status-maintenance-ongoing"}
          else
            status.caption = {"space-exploration.space-elevator-status-maintenance-paused"}
          end
        else
          status.caption = {"space-exploration.space-elevator-status-under-construction"}
        end

        local parts_needed = SpaceElevator.parts_per_radius * SpaceElevator.struct_radius(struct)
        --local str_parts = string.format("%.0f", primary.parts)
        local str_parts = primary.parts <= 0 and "0" or string.format("%.0f", primary.parts)
        local str_parts_needed = string.format("%.0f", parts_needed)

        local parts = util.find_first_descendant_by_name(inner_frame, "parts")
        parts.caption = {"space-exploration.label_parts", {"space-exploration.simple-a-b-divide",
          string.format("%.0f", str_parts),
          string.format("%.0f", str_parts_needed)}}
        local parts_costs = util.find_first_descendant_by_name(inner_frame, "parts_per_minute")
        parts_costs.caption = {"space-exploration.label_parts_per_minute", 
          string.format("%.4f",SpaceElevator.space_elevator_parts_per_second(primary) * 60)}
        local parts_progress = util.find_first_descendant_by_name(inner_frame, "parts_progress")
        parts_progress.value = primary.parts/parts_needed
        parts_progress.style.color = {
          r=1-math.max(0, math.min(1, primary.parts/parts_needed)),
          g=0.3 * math.max(0, math.min(1, primary.parts/parts_needed)),
          b=math.max(0, math.min(1, primary.parts/parts_needed))}

        local energy = util.find_first_descendant_by_name(inner_frame, "energy")
        local report_energy = primary.total_energy/1000000
          --report_energy = math.min(SpaceElevator.energy_buffer, primary.total_energy or 0)/1000000
        energy.caption = {"space-exploration.label_energy", {"space-exploration.simple-a-b-divide",
          string.format("%.0f", report_energy).."MJ",
          string.format("%.0f", SpaceElevator.energy_buffer/1000000).."MJ"}}

        local energy_progress = util.find_first_descendant_by_name(inner_frame, "energy_progress")
        energy_progress.value = math.min(SpaceElevator.energy_buffer, primary.total_energy or 0)/(SpaceElevator.energy_buffer)
        if primary.total_energy >= SpaceElevator.energy_buffer then
          energy_progress.style.color = {r=0, g=200/255, b=0}
        elseif primary.total_energy > SpaceElevator.energy_min then
          energy_progress.style.color = {r=1, g=0.6, b=0}
        else
          energy_progress.style.color = {r=1, g=0, b=0}
        end
      end
    end
  end
end

---@param struct SpaceElevatorInfo
---@param subheader_frame LuaGuiElement
function SpaceElevatorGUI.make_change_name_button_flow(struct, subheader_frame)
  struct = SpaceElevator.struct_primary(struct)
  subheader_frame.clear()
  local name_label = subheader_frame.add {
    type = "label",
    name = "show-name",
    caption = struct.name,
    style = "subheader_caption_label",
  }
  local rename_button = subheader_frame.add {
    type = "sprite-button",
    name = "rename",
    sprite = "utility/rename_icon_normal",
    tooltip = {
      "space-exploration.rename-something", {"entity-name." .. SpaceElevator.name_space_elevator}
    },
    style = "mini_button_aligned_to_text_vertically_when_centered"
  }
end

---@param struct SpaceElevatorInfo
---@param subheader_frame LuaGuiElement
function SpaceElevatorGUI.make_change_name_confirm_flow(struct, subheader_frame)
  struct = SpaceElevator.struct_primary(struct)
  subheader_frame.clear()
  GuiCommon.create_rename_textfield(subheader_frame, struct.name)
  local rename_button = subheader_frame.add {
    type = "sprite-button",
    name = "rename-confirm",
    sprite = "utility/enter",
    tooltip = {"gui-train-rename.perform-change"},
    style = "item_and_count_select_confirm"
  }
end

---@param event EventData.on_gui_click|EventData.on_gui_confirmed Event data
function SpaceElevatorGUI.on_gui_click(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  local root = gui_element_or_parent(element, SpaceElevatorGUI.name_space_elevator_gui_root)
  if not (root and root.tags) then return end
  local space_elevator = SpaceElevator.from_unit_number(root.tags.unit_number)
  if not space_elevator then return end

  if element.name == "rename" then
    local subheader_frame = element.parent
    SpaceElevatorGUI.make_change_name_confirm_flow(space_elevator, subheader_frame)
  elseif element.name == "rename-confirm" or (element.name == GuiCommon.rename_textfield_name and not event.button) then -- don't confirm by clicking the textbox
    local subheader_frame = element.parent
    local new_name = string.trim(element.parent[GuiCommon.rename_textfield_name].text)
    local primary = SpaceElevator.struct_primary(space_elevator)
    if new_name ~= "" and new_name ~= primary.name then
      -- do change name stuff
      SpaceElevator.rename(primary, new_name)
    end
    SpaceElevatorGUI.make_change_name_button_flow(space_elevator, subheader_frame)
  elseif element.name == "view_opposite" then
    if RemoteView.is_unlocked(player) then
      local playerdata = get_make_playerdata(player)
      local player_zone = Zone.from_surface(player.surface)
      -- if the player is not already in nav mode, put them in nav mode on their current surface to make the history nice
      RemoteView.start(player)
      RemoteView.start(player, space_elevator.opposite_struct.zone)
      -- only change the player's position to that of the space elevator if its on a different surface
      -- this lets the player keep updating the position of the space elevator as long as they stay in nav
      -- view on the targeted surface
      player.teleport(space_elevator.opposite_struct.main.position)
      player.opened = nil
      RemoteViewGUI.show_entity_back_button(player, space_elevator.main)
    else
      player.print({"space-exploration.satellite-required"})
    end
  elseif element.name == "travel" and space_elevator.main and space_elevator.main.valid then
    local distance_x = math.abs(player.position.x - space_elevator.main.position.x)
    local distance_y = math.abs(player.position.y - space_elevator.main.position.y)
    local distance = math.max(distance_x, distance_y) -- box not radius
    if RemoteView.is_active(player) then
      player.print({"space-exploration.space-elevator-travel-failed-remote-view"})
    elseif distance < SpaceElevator.player_teleport_distance and space_elevator.opposite_struct then
      local costs = SpaceElevator.player_transfer_costs(space_elevator, player)
      local primary = SpaceElevator.struct_primary(space_elevator)
      if not primary.built then
        return player.print({"space-exploration.space-elevator-travel-failed-built"})
      end
      if costs.parts_cost > primary.parts then
        return player.print({"space-exploration.space-elevator-travel-failed-parts"})
      end
      if costs.energy_change > primary.total_energy - SpaceElevator.energy_min then
        return player.print({"space-exploration.space-elevator-travel-failed-energy"})
      end
      player.teleport(player.position, space_elevator.opposite_struct.surface)
      primary.parts = primary.parts - costs.parts_cost
      primary.lua_energy = primary.lua_energy + costs.energy_change
      space_elevator.opposite_struct.surface.create_entity{
        name = SpaceElevator.name_sound_train_up,
        position = player.position
      }
    else
      player.print({"space-exploration.space-elevator-travel-failed-too-far", string.format("%.2f", distance), SpaceElevator.player_teleport_distance})
    end
  end
end
Event.addListener(defines.events.on_gui_click, SpaceElevatorGUI.on_gui_click)
Event.addListener(defines.events.on_gui_confirmed, SpaceElevatorGUI.on_gui_click)

---@param event EventData.on_gui_checked_state_changed Event data
function SpaceElevatorGUI.on_gui_checked_state_changed(event)
  if not (event.element and event.element.valid) then return end
  local element = event.element
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  local root = gui_element_or_parent(element, SpaceElevatorGUI.name_space_elevator_gui_root)
  if not (root and root.tags) then return end
  local space_elevator = SpaceElevator.from_unit_number(root.tags.unit_number)
  if not space_elevator then return end
end
Event.addListener(defines.events.on_gui_checked_state_changed, SpaceElevatorGUI.on_gui_checked_state_changed)

---@param struct NthTickEventData
function SpaceElevatorGUI.on_nth_tick_30(struct)
  for _, player in pairs(game.connected_players) do
    SpaceElevatorGUI.gui_update(player)
  end
end
Event.addListener("on_nth_tick_30", SpaceElevatorGUI.on_nth_tick_30)

--- Close the space elevator gui for a player
---@param player LuaPlayer
function SpaceElevatorGUI.gui_close (player)
  if player.gui.relative[SpaceElevatorGUI.name_space_elevator_gui_root] then
    player.gui.relative[SpaceElevatorGUI.name_space_elevator_gui_root].destroy()
  end
end

--- Respond to the main entity GUI being closed by destroying the relative GUI
---@param event EventData.on_gui_closed Event data
function SpaceElevatorGUI.on_gui_closed(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and event.entity and event.entity.name == SpaceElevator.name_space_elevator then
    SpaceElevatorGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_closed, SpaceElevatorGUI.on_gui_closed)

--- Opens the space elevator gui when a space elevator is clicked
--- Closes the space elevator gui when another gui is opened
---@param event EventData.on_gui_opened Event data
function SpaceElevatorGUI.on_gui_opened(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if event.entity and event.entity.valid and event.entity.name == SpaceElevator.name_space_elevator then
    if RemoteView.is_unlocked(player) then
      SpaceElevatorGUI.gui_open(player, SpaceElevator.from_entity(event.entity))
    else
      player.print({"space-exploration.remote-view-requires-satellite"})
    end
  else
    SpaceElevatorGUI.gui_close(player)
  end
end
Event.addListener(defines.events.on_gui_opened, SpaceElevatorGUI.on_gui_opened)

return SpaceElevatorGUI
