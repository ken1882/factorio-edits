if mods["Krastorio2"] then
  if data.raw["string-setting"]["kr-stack-size"] then
    data.raw["string-setting"]["kr-stack-size"].default_value = "No changes"
  end
  if data.raw["bool-setting"]["kr-main-menu-override-simulations"] then
    data.raw["bool-setting"]["kr-main-menu-override-simulations"] .default_value = false
  end
end
