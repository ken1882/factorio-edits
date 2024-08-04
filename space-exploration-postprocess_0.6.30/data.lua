-- Fake menu simulation background diagnostics message

local diagnostics = require("diagnostics")

local diagnostics_message = diagnostics.get_rich_text_message(mods)

local SPACES_PADDING = 320

local function pad_left(string_table)
  local padded_table = {}
  for _, value in pairs(string_table) do
    if type(value) == "string" then
      if string.ends(value, "\n") then
        table.insert(padded_table, value .. string.rep(" ", SPACES_PADDING))
      else
        table.insert(padded_table, value)
      end
    elseif type(value) == "table" then
      table.insert(padded_table, pad_left(value))
    end
  end
  return padded_table
end

if diagnostics_message then
  local padded_diagnostics_message = pad_left(diagnostics_message)
  local diagnostics_message_string = serpent.line(padded_diagnostics_message)
  log(diagnostics_message_string)
  local error_sim =
  {
    checkboard = false,
    save = "__base__/menu-simulations/menu-simulation-lab.zip",
    length = 1,
    init =
    [[
      error(]]..diagnostics_message_string..[[)
    ]]
  }
  data.raw["utility-constants"]["default"].main_menu_simulations = {error_sim}
  end
