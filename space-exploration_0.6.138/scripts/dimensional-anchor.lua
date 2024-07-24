DAnchor = {
  name_structure = "se-dimensional-anchor",
  name_effects = "se-dimensional-anchor-fx",
  check_interval = 60,
  energy_per_tick = 1000000000 -- Match charge speed
}

---Handles creation of a dimensional anchor.
---@param event EntityCreationEvent Event data
function DAnchor.on_entity_created(event)
  local entity = event.created_entity or event.entity
  if not entity.valid or entity.name ~= DAnchor.name_structure then return end

  -- Ensure it's getting built in a star orbit
  local zone = Zone.from_surface(entity.surface)
  if not (zone and zone.parent and zone.parent.type == "star") then
    cancel_entity_creation(entity, event.player_index,
        {"space-exploration.dimensional_anchor_place_on_star"}, event)
    return
  end

  -- Ensure there's only one on this surface
  if entity.surface.count_entities_filtered{name = DAnchor.name_structure, limit = 2} > 1 then
    cancel_entity_creation(entity, event.player_index,
        {"space-exploration.dimensional_anchor_limit_1"}, event)
    return
  end

  global.dimensional_anchors[zone.index] = {
    zone_index = zone.index,
    structure = entity,
    effects = nil,
    active = false,
    low_power_icon = nil
  }

  -- Draw low-power icon
  global.dimensional_anchors[zone.index].low_power_icon = rendering.draw_sprite{
    sprite = "utility/recharge_icon",
    surface = entity.surface,
    target = entity,
    x_scale = 0.5,
    y_scale = 0.5,
  }
end
Event.addListener(defines.events.on_built_entity, DAnchor.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, DAnchor.on_entity_created)
Event.addListener(defines.events.script_raised_built, DAnchor.on_entity_created)
Event.addListener(defines.events.script_raised_revive, DAnchor.on_entity_created)

---Handles removal of a dimenksional anchor by destorying the effects entity if one exists, and
---removing it from `global.dimensional_anchors`.
---@param event EntityRemovalEvent Event data
function DAnchor.on_entity_removed(event)
  local entity = event.entity
  if not entity.valid or entity.name ~= DAnchor.name_structure then return end

  local zone = Zone.from_surface(entity.surface)
  if not zone then return end

  local anchor = global.dimensional_anchors[zone.index]
  if anchor and anchor.structure == entity then
    if anchor.effects and anchor.effects.valid then
      anchor.effects.destroy()
    end
    global.dimensional_anchors[zone.index] = nil
  end
end
Event.addListener(defines.events.on_player_mined_entity, DAnchor.on_entity_removed)
Event.addListener(defines.events.on_robot_mined_entity, DAnchor.on_entity_removed)
Event.addListener(defines.events.on_entity_died, DAnchor.on_entity_removed)
Event.addListener(defines.events.script_raised_destroy, DAnchor.on_entity_removed)

---Iterates over each anchor, ensuring it is powered, creating the effects entity if it is, or
---rendering the low-power icon if not.
function DAnchor.on_nth_tick_60()
  for zone_index, anchor in pairs(global.dimensional_anchors) do
    if anchor.structure.valid then
      if anchor.structure.energy > DAnchor.check_interval * DAnchor.energy_per_tick then
        anchor.structure.energy =
            anchor.structure.energy - DAnchor.check_interval * DAnchor.energy_per_tick
        if not anchor.active then
          anchor.active = true
          anchor.effects = anchor.structure.surface.create_entity{
            name = DAnchor.name_effects,
            position = anchor.structure.position,
            target = {x = anchor.structure.position.x, y = anchor.structure.position.y - 1},
            speed = 0
          }
          if rendering.is_valid(anchor.low_power_icon) then
            rendering.destroy(anchor.low_power_icon)
          end
        end
      else
        if anchor.effects and anchor.effects.valid then
          anchor.effects.destroy()
          anchor.effects = nil
        end
        if anchor.active then
          anchor.active = false
          anchor.low_power_icon = rendering.draw_sprite{
            sprite = "utility/recharge_icon",
            surface = anchor.structure.surface,
            target = anchor.structure,
            x_scale = 0.5,
            y_scale = 0.5,
          }
        end
      end
    else
      -- Cleanup leftover entities, delete entry from `global.dimensional_anchors`
      if anchor.effects and anchor.effects.valid then anchor.effects.destroy() end
      global.dimensional_anchors[zone_index] = nil
    end
  end
end
Event.addListener("on_nth_tick_60", DAnchor.on_nth_tick_60)

function DAnchor.on_init()
  global.dimensional_anchors = {}
end
Event.addListener("on_init", DAnchor.on_init, true)

return DAnchor
