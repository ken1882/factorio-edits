
local GuiCommon = {}

GuiCommon.icon_selector_name = mod_prefix .. "icon-selector"
GuiCommon.rename_textfield_name = mod_prefix .. "write-name"

GuiCommon.filter_flow_name = "filter-flow-name"
GuiCommon.filter_textfield_name = "filter-text-name"
GuiCommon.filter_clear_name = "filter-clear-name"

---@param parent LuaGuiElement
---@param prefilled_name string
---@return LuaGuiElement
---@return LuaGuiElement
function GuiCommon.create_rename_textfield(parent, prefilled_name)
  local rename_textfield = parent.add {
    type = "textfield",
    style = "se_textfield_maximum_stretchable",
    name = GuiCommon.rename_textfield_name,
    text = prefilled_name,
    clear_and_focus_on_right_click = true
  }
  rename_textfield.select_all()
  rename_textfield.focus()

  local icon_selector = parent.add {
    type = "choose-elem-button",
    elem_type = "signal",
    signal = {
      type = "virtual",
      name = mod_prefix .. "select-icon"
    },
    name = GuiCommon.icon_selector_name,
    style = "se_icon_selector_button"
  }

  return rename_textfield, icon_selector
end

---@param event EventData.on_gui_elem_changed Event data
function GuiCommon.icon_selector_handler(event)
  if not (event.element and event.element.valid and event.element.name == GuiCommon.icon_selector_name) then return end
  local element = event.element
  local root = element.parent

  if not root then return end

  local name_label = element.parent[GuiCommon.rename_textfield_name]
  if name_label then
    name_label.text = name_label.text .. GuiCommon.signal_to_rich_text(element.elem_value)
    name_label.focus()
  end
  element.elem_value = {
    type = "virtual",
    name = mod_prefix .. "select-icon"
  }
end
Event.addListener(defines.events.on_gui_elem_changed, GuiCommon.icon_selector_handler)

--[[
Converts a signal to a rich text icon.
The signal is chosen from a "choose-elem-button" UI element with "elem_type" set to "signal".
]]--
---@param signal string|SignalID
---@return string|SignalID
function GuiCommon.signal_to_rich_text(signal)
  if signal and signal.name then
    if signal.type == "item" then
      return "[img=item."..signal.name.."]"
    elseif signal.type == "fluid" then
      return "[img=fluid."..signal.name.."]"
    elseif signal.type == "virtual" then
      return "[img=virtual-signal."..signal.name.."]"
    end
  end
  return ""
end

---@param parent LuaGuiElement
---@param player LuaPlayer
---@param params {suffix?:string, dropdown_name:string, list:LocalisedString[], selected_index:uint, values:any[]}
---@return unknown
---@return unknown
function GuiCommon.create_filter(parent, player, params)
  params.suffix = params.suffix or ""
  local filter_container = parent.add{
    type = "flow",
    name = GuiCommon.filter_flow_name..params.suffix,
    direction = "horizontal"
  }
  local filter_field = filter_container.add{
    type = "textfield",
    name = GuiCommon.filter_textfield_name..params.suffix
  }
  filter_field.style.horizontally_stretchable  = true
  filter_field.style.width = 0
  local filter_button = filter_container.add{
    type = "sprite-button",
    name = GuiCommon.filter_clear_name..params.suffix,
    sprite = "se-search-close-white",
    hovered_sprite = "se-search-close-black",
    clicked_sprite = "se-search-close-black",
    tooltip = {"space-exploration.clear-filter"}
  }
  filter_button.style.left_margin = 5
  filter_button.style.width = 28
  filter_button.style.height = 28
  local filter_dropdown = parent.add{
    type = "drop-down",
    name = params.dropdown_name,
    items = params.list,
    selected_index = params.selected_index
  }
  filter_dropdown.style.horizontally_stretchable  = true
  player_set_dropdown_values(player, params.dropdown_name, params.values)

  return filter_container, filter_dropdown
end

return GuiCommon
