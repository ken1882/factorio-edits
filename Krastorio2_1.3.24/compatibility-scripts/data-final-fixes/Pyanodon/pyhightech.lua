if mods["pyhightech"] then
  -- Re-apply Krastorio science icons
  krastorio.icons.setItemIcon("utility-science-pack", kr_cards_icons_path .. "utility-tech-card.png")
  krastorio.icons.setItemIcon(
    krastorio.optimization_tech_card_name,
    kr_cards_icons_path .. "optimization-tech-card.png"
  )
end
