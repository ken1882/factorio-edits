-- Start of game crash diagnostics message

local diagnostics = require("diagnostics")

local function print_diagnostics()
  local diagnostics_message = diagnostics.get_rich_text_message(script.active_mods)
  if diagnostics_message then
    error(diagnostics_message)
  elseif not script.active_mods["space-exploration"] then
    error({"", "\n\n\n",
      "[font=default-large-bold]═══════════════════════[/font]\n",
      "[font=default-large-bold]═══════════════════════[/font]\n\n",
      "[img=utility/warning_icon][font=default-large-bold][color=red]", {"diagnostics.unknown-issue-1"}, "[/color][/font]\n",
      "[font=default-large-bold]", {"diagnostics.unknown-issue-2"}, "[/font]\n",
      "[font=default-bold][color=cyan]", serpent.line(script.active_mods), "[/color][/font]\n\n",
      "[font=default-large-bold]═══════════════════════[/font]\n",
      "[font=default-large-bold]═══════════════════════[/font]\n",
      "\n\n\n"})
  end
end

script.on_init(print_diagnostics)
script.on_configuration_changed(print_diagnostics)
