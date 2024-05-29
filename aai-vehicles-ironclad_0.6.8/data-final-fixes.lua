-- Damage upgrades
for _, tech in pairs(data.raw.technology) do
  if tech.effects then
    local saved = nil
    for _, effect in pairs(tech.effects) do
      if effect.type == "gun-speed" and effect.ammo_category == "rocket" then
        local c = table.deepcopy(effect)
        c.ammo_category = "mortar-bomb"
        table.insert(tech.effects, c)
      end
      if effect.type == "ammo-damage" and effect.ammo_category == "landmine" then
        if not saved then
          local c = table.deepcopy(effect)
          c.ammo_category = "mortar-bomb"
          table.insert(tech.effects, c)
          saved = c
        else
          saved.modifier = math.max(saved.modifier, effect.modifier)
        end
      end
    end
  end
end

-- Cannon range (match higher shell range)
-- local max_range = 30;
-- for _, ammo in pairs(data.raw.ammo) do
--   if ammo.ammo_type.category == "cannon-shell"
--     and ammo.ammo_type.action and ammo.ammo_type.action.action_delivery and ammo.ammo_type.action.action_delivery.max_range then
--     max_range = math.max(max_range, ammo.ammo_type.action.action_delivery.max_range)
--   end
-- end
-- data.raw.gun["ironclad-cannon"].attack_parameters.range = max_range;
