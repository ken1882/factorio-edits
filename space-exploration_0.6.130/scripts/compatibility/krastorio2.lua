local Krastorio2 = {}

---@param entity LuaEntity
function Krastorio2.notify_spaceship_slowdown(entity)
  local count = entity.surface.count_tiles_filtered{area = entity.bounding_box, name = "se-spaceship-floor", limit=1}

  if count > 0 then
    entity.surface.create_entity{
      type = "flying-text",
      name = "flying-text",
      position = entity.position,
      text = {"message.se-entity-spaceship-slowdown", entity.localised_name},
      color = {r = 1},
    }
  end
end

-- Runs when the SE migration code runs Migrate.v0_5_095
function Krastorio2.disable_spaceship_victory_tech_on_migrate()
  if script.active_mods["Krastorio2"] then
    -- Check each force to see if we need to disable the technology.
    for _, force_data in pairs(game.forces) do
      -- Only need to disable if the focre does not have an Activated Transceiver.
      -- In this case we cannot know if the force had a previously Activated Transceiver that was destroyed.
      if force_data.get_entity_count("kr-activated-intergalactic-transceiver") == 0 then
        force_data.technologies["se-spaceship-victory"].enabled = false
      end
    end
  end
end

function Krastorio2.disable_spaceship_victory_tech_on_config_change()
  for _, force_data in pairs(game.forces) do
    if force_data.get_entity_count("kr-activated-intergalactic-transceiver") == 0 then
      force_data.technologies["se-spaceship-victory"].enabled = false
    end
  end
end

-- Runs when the SE migration code runs Migrate.v0_6_123
-- We now have a trigger tech instead of enabling the tech when the K2 transciever activates.
function Krastorio2.enable_spaceship_victory_tech_on_migrate()
  if script.active_mods["Krastorio2"] then
    -- Check each force to see if we need to make changes
    for force, force_data in pairs(game.forces) do
      -- Make sure the victory tech is enabled
      force_data.technologies["se-spaceship-victory"].enabled = true

      -- If the victory tech is already researched, research the trigger tech
      if force_data.technologies["se-spaceship-victory"].researched then
        force_data.technologies["se-kr-transceiver-trigger"].researched = true
      end

      -- If the vicotry tech is not researched, we need to check to see if the force already has an activated transceiver
      for _, zone in pairs(global.zone_index) do
        local surface = Zone.get_surface(zone)
        if surface then
          for _, entity in pairs(surface.find_entities_filtered{name="kr-activated-intergalactic-transceiver", force=force}) do
            found = true
            break
          end
        end
        if found then break end
      end

      if found then
        -- Notify player
        ---@type ForceMessageTickTask
        local tick_task = new_tick_task("force-message")
        tick_task.force_name = force_data.name
        tick_task.message = {"space-exploration.kr_transceiver_activated"}
        tick_task.delay_until = game.tick + 300 --5 seconds
        -- Research the trigger tech
        force_data.technologies["se-kr-transceiver-trigger"].researched = true
      end
    end
  end
end

function Krastorio2.enable_spaceship_victory_tech_on_config_change()
  for _, force_data in pairs(game.forces) do
    force_data.technologies["se-spaceship-victory"].enabled = true
  end
end

function Krastorio2.on_resource_setting_load()
  if not script.active_mods["Krastorio2"] then return end
  Universe.add_resource_word_rule("imersite", {forbid_space=true,forbid_homeworld=true})

  local mineral_water_control = {
    allowed_for_zone = {["homeworld"] = true},
    resource = "mineral-water",
    tags_required_for_presence = {"water_low","water_med","water_high","water_max"},
    tags_required_for_primary = {"water_high","water_max"},
    yeild_affected_by = {water = 1}
  }
  Universe.add_resource_setting_override(mineral_water_control)
end
Event.addListener("on_resource_setting_load", Krastorio2.on_resource_setting_load, true)

function Krastorio2.on_homesystem_make()
  if not script.active_mods["Krastorio2"] then return end
  UniverseHomesystem.add_guaranteed_special_type(
    "imersite"
   ,"imersite"
   ,"planet-or-moon"
   ,function(requirement, homeworld, other_planets, other_asteroid_belts)
      Log.debug_log("make_validate_homesystem_mk2 - homesystem does not have a imersite body", "universe")
      local planet2
      if next(other_planets) then
        planet2 = other_planets[1]
        Log.debug_log("make_validate_homesystem_mk2 - Selecting existing planet for imersite moon: " .. planet2.name, "universe")
      else
        Log.debug_log("make_validate_homesystem_mk2 - No generic planet available for imersite moon, add it to a random planet in the system", "universe")
        local planet_names = {}
        for _, zone in pairs(homeworld.parent.children) do
          if    zone.type == "planet"
            and not zone.is_homeworld
          then
            table.insert(planet_names, zone.name)
          end
        end
        Universe.shuffle(planet_names)
        local planet_name = planet_names[1]
        for _, zone in pairs(homeworld.parent.children) do
          if zone.name == planet_name then
            planet2 = zone
          end
        end
      end
      UniverseHomesystem.add_special_moon_from_unassigned(planet2, "imersite")
      return planet2.children[1]
    end
  )
end
Event.addListener("on_homesystem_make", Krastorio2.on_homesystem_make, true)

function Krastorio2.disable_transceiver_win()
  if remote.interfaces["kr-intergalactic-transceiver"] and remote.interfaces["kr-intergalactic-transceiver"]["set_no_victory"] then
    remote.call("kr-intergalactic-transceiver", "set_no_victory", true)
  end
end

---@param event ConfigurationChangedData
function Krastorio2.on_configuration_changed(event)
  if event.mod_changes then
    local oldK2Version
    local newK2Version

    if event.mod_changes["Krastorio2"] then
      oldK2Version = event.mod_changes["Krastorio2"].old_version
      newK2Version = event.mod_changes["Krastorio2"].new_version
    end

    if oldK2Version or newK2Version then
      -- Adding K2 to SE
      if oldK2Version == nil then
        Krastorio2.disable_transceiver_win()
      end
      -- Removing K2 from SE
      if newK2Version == nil then
        Krastorio2.enable_spaceship_victory_tech_on_config_change()
      end
    end
  end
end
Event.addListener("on_configuration_changed",Krastorio2.on_configuration_changed, true)

function Krastorio2.on_init()
  -- Creating a new game / On adding SE to an existing game
  if script.active_mods["Krastorio2"] then
    Krastorio2.disable_transceiver_win()
  end
end
Event.addListener("on_init",Krastorio2.on_init, true)

---@param event EntityCreationEvent Event data
function Krastorio2.on_entity_created(event)
  local entity = event.entity or event.created_entity
  if not entity.valid then return end

  if entity.name == "kr-activated-intergalactic-transceiver" then
    -- Only trigger this once (in a regular game where someone hasn't used commands to unresearch the tech)
    if not entity.force.technologies["se-kr-transceiver-trigger"].researched then
      -- Notify player
      ---@type ForceMessageTickTask
      local tick_task = new_tick_task("force-message")
      tick_task.force_name = entity.force.name
      tick_task.message = {"space-exploration.kr_transceiver_activated"}
      tick_task.delay_until = game.tick + 300 --5 seconds
      -- Research the trigger tech
      entity.force.technologies["se-kr-transceiver-trigger"].researched = true
    end
  elseif entity.name == "kr-antimatter-reactor" then
    Krastorio2.notify_spaceship_slowdown(entity)
  end
end
Event.addListener(defines.events.on_built_entity, Krastorio2.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Krastorio2.on_entity_created)
Event.addListener(defines.events.script_raised_built, Krastorio2.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Krastorio2.on_entity_created)
return Krastorio2
