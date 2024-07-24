local Migrate = {}

-------------------------------------------------------
-- MOD SPECIFIC PARAMETERS
-- If you're copying this file to another mod, 
-- make sure to modify the constants and methods below.
-------------------------------------------------------

local function added_to_existing_game()
  local tick_task = new_tick_task("game-message") --[[@as GameMessageTickTask]]
  tick_task.message = {"space-exploration.warn_added_to_existing_game"}
  tick_task.delay_until = game.tick + 180 --3s
end

-- ignore_techs don't cause their children to get locked.
-- Mainly used for newly added techs.
local ignore_techs = {
  mod_prefix.."rocket-science-pack",
  mod_prefix.."space-belt",
  mod_prefix.."space-pipe",
  mod_prefix.."pyroflux-smelting",
  mod_prefix.."condenser-turbine",
  "utility-science-pack",
  "production-science-pack",
  "space-science-pack",
  mod_prefix.."space-biochemical-laboratory",
}
Migrate.ignore_techs = {}
for _, tech in pairs(ignore_techs) do
  Migrate.ignore_techs[tech] = tech
end

-- chainbreak_techs are not locked by their prerequisites and don't propagate a tech locking chain
-- mainly used if a section of the tech tree has moved
local chainbreak_techs = {
  "utility-science-pack",
  "production-science-pack",
  mod_prefix.."space-solar-panel",
  mod_prefix.."space-data-card",
  mod_prefix.."space-radiator-1",
}
Migrate.chainbreak_techs = {}
for _, tech in pairs(chainbreak_techs) do
  Migrate.chainbreak_techs[tech] = tech
end

-- dont_lock_techs can't be locked by their prerequisites being locked.
local dont_lock_techs = {
  mod_prefix.."naquium-cube",
  mod_prefix.."naquium-tessaract",
  mod_prefix.."naquium-processor",
  mod_prefix.."space-accumulator-2",
  mod_prefix.."wide-beacon-2",
  mod_prefix.."antimatter-production",
  mod_prefix.."antimatter-reactor",
  mod_prefix.."space-solar-panel-3",
  mod_prefix.. "space-probe",
  mod_prefix.. "dimensional-anchor",
  mod_prefix.. "long-range-star-mapping",
  mod_prefix.. "factory-spaceship-1",
  mod_prefix.. "factory-spaceship-2",
  mod_prefix.. "factory-spaceship-3",
  mod_prefix.. "factory-spaceship-4",
  mod_prefix.. "factory-spaceship-5",
  mod_prefix.. "lifesupport-equipment-4",
  mod_prefix.. "bioscrubber",
  "energy-shield-mk6-equipment",
  mod_prefix.. "spaceship-victory",
  mod_prefix.. "antimatter-engine",
  mod_prefix.. "fluid-burner-generator",
}
Migrate.dont_lock_techs = {}
for _, tech in pairs(dont_lock_techs) do
  Migrate.dont_lock_techs[tech] = tech
end

function Migrate.always_do_migrations()
  if not global.universe_scale then
    global.universe_scale =  (#global.universe.stars + #global.universe.space_zones) ^ 0.5 * Universe.stellar_average_separation
    Universe.separate_stellar_position()
    for _, zone in pairs(global.zone_index) do
      if zone.type == "planet" then
        Universe.planet_gravity_well_distribute(zone)
      end
    end
  end

  -- general cleaning
  for _, zone in pairs(global.zone_index) do
    if zone.is_homeworld or zone.name == "Nauvis" then
      zone.tags = nil
    end
    if zone.tags then
      if zone.tags.moisture and zone.tags.moisture == "moisture_very_low" then
        -- was incorrect in universe.raw, if surface is genrated it is incorrect but don't change the terrain if already settled
        zone.tags.moisture = "moisture_low"
        Zone.delete_surface(zone) -- remove if unsettled
        log("Changed moisture tag from moisture_very_low to moisture_low.")
      end
    end
    Zone.set_solar_and_daytime(zone)
  end

  for _, player in pairs(game.players) do
    if player.character and player.permission_group and player.permission_group.name == RemoteView.name_permission_group then
      player.permission_group = nil
    end
  end

  for _, name in pairs({"se-remote-view", "se-remote-view_satellite"}) do
    local group = game.permissions.get_group(name)
    if group then group.destroy() end
  end

  for registration_number, resource_set in pairs(global.core_seams_by_registration_number) do
    if not resource_set.resource.valid then
      CoreMiner.remove_seam(resource_set)
    end
  end

  Migrate.fill_tech_gaps(true)

  Ancient.update_unlocks()
end

---@param allow_whitelists boolean
function Migrate.fill_tech_gaps(allow_whitelists)
  local tech_children = {}
  for _, technology in pairs(game.technology_prototypes) do
    for _, prerequisite in pairs(technology.prerequisites) do
      tech_children[prerequisite.name] = tech_children[prerequisite.name] or {}
      table.insert(tech_children[prerequisite.name], technology.name)
    end
  end

  --first pass
  for _, force in pairs(game.forces) do
    if force.name ~= "enemy"
      and force.name ~= "neutral"
      and force.name ~= "capture"
      and force.name ~= "ignore"
      and force.name ~= "friendly"
      and force.name ~= "conquest" then

        if force.technologies[mod_prefix.."deep-space-science-pack-1"].researched then
          force.technologies[mod_prefix.."deep-catalogue-1"].researched = true
        end

        if force.technologies[mod_prefix.."space-assembling"].researched then
          force.technologies[mod_prefix.."space-belt"].researched = true
          force.technologies[mod_prefix.."space-pipe"].researched = true
        end

        if force.technologies[mod_prefix.."space-supercomputer-1"].researched then
          force.technologies[mod_prefix.."space-data-card"].researched = true
        end

        if force.technologies["uranium-processing"].researched then
          force.technologies[mod_prefix.."centrifuge"].researched = true
        end

        if force.technologies["nuclear-power"].researched then
          force.technologies["steam-turbine"].researched = true
        end

        local techs_done = {}
        local rocket_science = force.technologies[mod_prefix.."rocket-science-pack"]
        Migrate.fill_tech_gaps_rec(tech_children, techs_done, rocket_science, false, allow_whitelists)
    end
  end
end

---@param tech_children {[string]:string[]}
---@param techs_done Flags
---@param tech LuaTechnology
---@param lock boolean
---@param allow_whitelists boolean
function Migrate.fill_tech_gaps_rec(tech_children, techs_done, tech, lock, allow_whitelists)
  local change = false
  if allow_whitelists and Migrate.chainbreak_techs[tech.name] then
    -- break the lock chain
    lock = false
  end
  if not(tech.researched or tech.level > 1) then
    if (not allow_whitelists) or (not Migrate.dont_lock_techs[tech.name]) and (not Migrate.ignore_techs[tech.name]) then
      lock = true
    end
  end
  if lock then
    if tech.researched then
      change = true
    end
    if not (allow_whitelists and Migrate.dont_lock_techs[tech.name]) then
      if tech.researched then
        tech.researched = false
        Log.debug({"", "Unresearch ", "technology-name."..tech.name})
      end
    end
  end
  if tech_children[tech.name] and (change or not techs_done[tech.name]) then
    for _, child_name in pairs(tech_children[tech.name]) do
      Migrate.fill_tech_gaps_rec(tech_children, techs_done, tech.force.technologies[child_name], lock, allow_whitelists)
    end
  end
  techs_done[tech.name] = true
end

-- Find dummy recipes, reset the recipes, spill removed items
local function replace_dummy_recipes(entity_names)
  for _, surface in pairs(game.surfaces) do
    local machines = surface.find_entities_filtered({name=entity_names})
    for _, machine in pairs(machines) do
      local recipe = machine.get_recipe()
      if recipe and string.starts(recipe.name, Shared.dummy_migration_recipe_prefix) then
        local original_recipe_name = recipe.name:sub(string.len(Shared.dummy_migration_recipe_prefix)+1)
        local removed_items = machine.set_recipe(original_recipe_name)
        for item_name, count in pairs(removed_items) do
          surface.spill_item_stack(machine.position, {name=item_name, count=count}, true, machine.force, false)
        end
      end
    end
  end
end

---------------------------------------------------------------
-- Mod-specific parameters end here, migration code starts here
---------------------------------------------------------------


--Converts the default version string to one that can be lexographically compared using string comparisons
---@param ver string String in a version format of 'xxx.xxx.xxx' where each xxx is in the range 0-65535
---@return string version Version number with leading padded 0's for use in string comparisons
function Migrate.version_to_comparable_string(ver)
  return string.format("%05d.%05d.%05d", string.match(ver, "^(%d+)%.(%d+)%.(%d+)$"))
end

--Converts the lexographically coaprable version string to default, human readable format
---@param ver string String in a version format of 'xxxxx.xxxxx.xxxxx' where each xxxxx is a number with potential leading 0's
---@return string version Version number with leading 0's stripped
function Migrate.comparable_string_to_version(ver)
  return (string.gsub(ver, "^0*(%d-%d).0*(%d-%d).0*(%d-%d)$", "%1.%2.%3"))
end

---@param event ConfigurationChangedData
function Migrate.do_migrations(event)
  local mod_name = script.mod_name

  --check if we changed versions
  local mod_changes = event.mod_changes[mod_name]
  if mod_changes and mod_changes.old_version ~= mod_changes.new_version then
    if mod_changes.old_version == nil then
      added_to_existing_game()
      return
    end
    local old_ver_string = Migrate.version_to_comparable_string(mod_changes.old_version)
    local versions_to_migrate = {} --array of lexographically comparible migration version strings that need running
    local migrations = {} --migration version to migration function map
    --look for needed migrations
    for migrate_version, migration in pairs(Migrate.migrations) do
      local migrate_ver_string = Migrate.version_to_comparable_string(migrate_version)
      if migrate_ver_string > old_ver_string then
        table.insert(versions_to_migrate, migrate_ver_string)
        migrations[migrate_ver_string] = migration
      end
    end
    --ensure migrations run in the correct order
    table.sort(versions_to_migrate)
    --do migrations
    for _, version_to_migrate in pairs(versions_to_migrate) do
      log(mod_name.." Running migration script for version "..Migrate.comparable_string_to_version(version_to_migrate))
      migrations[version_to_migrate](event)
    end
    --do any test migrations
    for migration_name, migration in pairs(Migrate.test_migrations) do
      if not is_debug_mode then
        --there should never be any test migrations if not in debug mode
        local msg = "[color=red]WARNING:[/color] Test migration scripts exist while not in debug mode. These should be moved to live migrations with version labels prior to live release."
        log(msg)
        game.print(msg)
      end
      local msg = mod_name.." Running test migration: "..migration_name
      log(msg)
      game.print(msg)
      migration(event)
    end
  end
end

Migrate.migrations = {
  ["0.1.38"] = function()
    ---@class PlanetType
    ---@field package core_miners any DEPRECIATED
    ---@class MoonType
    ---@field package core_miners any DEPRECIATED
    local function v0_1_38_zone(zone)
      zone.core_miners = nil
      local surface = Zone.get_make_surface(zone)
      for _, miner in pairs(surface.find_entities_filtered{name = mod_prefix.."core-miner"}) do
        CoreMiner.on_entity_created({entity = miner})
      end
    end
    if global.universe then

      for _, star in pairs(global.universe.stars) do
        for _, planet in pairs(star.children) do
          if planet.core_miners then
            v0_1_38_zone(planet)
          end
          if planet.children then -- could be an asteroid-belt
            for _, moon in pairs(planet.children) do
              if moon.core_miners then
                v0_1_38_zone(moon)
              end
            end
          end
        end
      end
    end

  end,

  ["0.1.65"] = function()
    if global.universe then
      for _, zone in pairs(global.zone_index) do
        if zone.controls and zone.controls["enemy"] then
          zone.controls["enemy-base"] = zone.controls["enemy"]
          zone.controls["enemy"] = nil
          if zone.name ~= "Nauvis" then
            local surface = Zone.get_surface(zone)
            if surface then
              local map_gen_settings = surface.map_gen_settings
              map_gen_settings.autoplace_controls["enemy-base"].size = zone.controls["enemy-base"].size
              map_gen_settings.autoplace_controls["enemy-base"].frequency = zone.controls["enemy-base"].frequency
              surface.map_gen_settings = map_gen_settings
              if zone.controls["enemy-base"].size == 0  then
                local enemies = surface.find_entities_filtered{force={"enemy"}}
                for _, enemy in pairs(enemies) do
                  enemy.destroy()
                end
              end
            end
          end
        end
      end
    end

  end,

  ["0.1.86"] = function()
    if global.universe then
      for _, zone in pairs(global.zone_index) do
        if Zone.is_solid(zone) then
          ---@cast zone PlanetType|MoonType
          -- nauvis is 25000
          if zone.inflated and not zone.ticks_per_day then
            zone.ticks_per_day = 25000 -- nauvis
            if zone.name ~= "Nauvis" then
              if math.random() < 0.5 then
                zone.ticks_per_day = 60*60 + math.random(60*60*59) -- 1 - 60 minutes
              else
                zone.ticks_per_day = 60*60 + math.random(60*60*19) -- 1 - 20 minutes
              end
              local surface = Zone.get_surface(zone)
              if surface then
                surface.ticks_per_day = zone.ticks_per_day
              end
            end
          end
        end
      end
    end
  end,

  ["0.1.89"] = function()
    --global.rocket_landing_pads = global.rocket_landing_pads or {}
    for _, struct in pairs(global.rocket_landing_pads) do
      Landingpad.rename(struct, struct.name)
    end
  end,

  ["0.1.96"] = function()
    if global.universe then
      for _, zone in pairs(global.zone_index) do
        if Zone.is_space(zone) then
          ---@cast zone -PlanetType, -MoonType
          local surface = Zone.get_surface(zone)
          if surface then
            local entities = surface.find_entities_filtered{type="offshore-pump"}
            for _, entity in pairs(entities) do
              entity.destroy()
            end
          end
        end
      end
    end
  end,

  ["0.1.101"] = function()
    if global.meteor_zones then
      for _, zone in pairs(global.meteor_zones) do
        if zone.meteor_defences then
          for _, defence in pairs(zone.meteor_defences) do
            if defence.charger and defence.charger.valid then
              defence.container = defence.charger.surface.find_entity(Meteor.name_meteor_defence_container, defence.charger.position)
              if defence.container then
                defence.container.active = false
                defence.container.insert({name=Meteor.name_meteor_defence_ammo, count=10})
              end
            end
          end
        end
        if zone.meteor_point_defences then
          for _, defence in pairs(zone.meteor_point_defences) do
            if defence.charger and defence.charger.valid then
              defence.container = defence.charger.surface.find_entity(Meteor.name_meteor_point_defence_container, defence.charger.position)
              if defence.container then
                defence.container.active = false
                defence.container.insert({name=Meteor.name_meteor_point_defence_ammo, count=20})
              end
            end
          end
        end
      end
    end
  end,

  ["0.1.126"] = function()
    for _, surface in pairs(game.surfaces) do
      local zone = Zone.from_surface(surface)
      if zone then
        if zone.type == "spaceship" then
          ---@cast zone SpaceshipType
          local map_gen_settings = surface.map_gen_settings
          map_gen_settings.autoplace_settings={
            ["decorative"]={
              treat_missing_as_default=false,
              settings={
              }
            },
            ["entity"]={
              treat_missing_as_default=false,
              settings={
              }
            },
            ["tile"]={
              treat_missing_as_default=false,
              settings={
                ["se-space"]={}
              }
            }
          }
          surface.map_gen_settings = map_gen_settings
        elseif Zone.is_space(zone) then
          ---@cast zone -SpaceshipType
          ---@cast zone -PlanetType, -MoonType
          local map_gen_settings = surface.map_gen_settings
          map_gen_settings.autoplace_settings={
            ["decorative"]={
              treat_missing_as_default=false,
              settings={
                ---@diagnostic disable:missing-fields
                ["se-crater3-huge"] ={},
                ["se-crater1-large-rare"] ={},
                ["se-crater1-large"] ={},
                ["se-crater2-medium"] ={},
                ["se-crater4-small"] ={},
                ["se-sand-decal-space"] ={},
                ["se-stone-decal-space"] ={},
                ["se-rock-medium-asteroid"] ={},
                ["se-rock-small-asteroid"] ={},
                ["se-rock-tiny-asteroid"] ={},
                ["se-sand-rock-medium-asteroid"] ={},
                ["se-sand-rock-small-asteroid"] ={}
                ---@diagnostic enable:missing-fields
              }
            },
            --[[["entity"]={
              treat_missing_as_default=false,
              settings={
                ["se-rock-huge-asteroid"] ={},
                ["se-rock-big-asteroid"] ={},
                ["se-sand-rock-big-asteroid"] ={},
                ["se-rock-huge-space"] ={},
                ["se-rock-big-space"] ={},
              }
            },]]--
            ["tile"]={
              treat_missing_as_default=false,
              settings={
                ["se-asteroid"]={},
                ["se-space"]={}
              }
            },
          }
          surface.map_gen_settings = map_gen_settings
        else
          local map_gen_settings = surface.map_gen_settings
          local penalty = -100000
          ---@diagnostic disable:assign-type-mismatch
          map_gen_settings.property_expression_names["decorative:se-crater3-huge:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-crater1-large-rare:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-crater1-large:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-crater2-medium:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-crater4-small:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-sand-decal-space:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-stone-decal-space:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-rock-medium-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-rock-small-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-rock-tiny-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-sand-rock-medium-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["decorative:se-sand-rock-small-asteroid:probability"] = penalty

          map_gen_settings.property_expression_names["entity:se-rock-huge-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["entity:se-rock-big-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["entity:se-sand-rock-big-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["entity:se-rock-huge-space:probability"] = penalty
          map_gen_settings.property_expression_names["entity:se-rock-big-space:probability"] = penalty

          map_gen_settings.property_expression_names["tile:se-asteroid:probability"] = penalty
          map_gen_settings.property_expression_names["tile:se-space:probability"] = penalty
          ---@diagnostic enable:assign-type-mismatch
          surface.map_gen_settings = map_gen_settings
        end
      end
    end
  end,

  ["0.1.130"] = function()
    for _, surface in pairs(game.surfaces) do
      local zone = Zone.from_surface(surface)
      if zone and zone.type == "orbit" and zone.parent and zone.parent.type == "star" then
        surface.daytime = 0 -- that's why we're here
      end
    end
  end,

  ["0.3.1"] = function()
    SystemForces.setup_system_forces()

    for _, surface in pairs(game.surfaces) do
      surface.solar_power_multiplier = surface.solar_power_multiplier / 2
    end

    for _, zone in pairs(global.zone_index) do
      zone.inflated = nil
      if zone.name == "Nauvis" then
        zone.is_homeworld = true
      end
      if zone.resources and zone.resources[1] then
        zone.primary_resource = zone.resources[1]
        zone.resources = nil
      end
      if zone.surface_index then
        Zone.delete_surface(zone) -- only works on valid ones
      end
      Universe.inflate_climate_controls(zone)
      Zone.set_solar_and_daytime(zone)
    end
    Zone.rebuild_surface_index()

    -- assign glyps and vaults
    for force_name, forcedata in pairs(global.forces) do
      forcedata.zone_priorities = forcedata.zone_priorities or {}
      for _, zone in pairs(global.zone_index) do
        if zone.is_homeworld then
          forcedata.zone_priorities[zone.index] = forcedata.zone_priorities[zone.index] or 1
        end
      end

      local delay = 100
      for zone_index, discovery_data in pairs(forcedata.zones_discovered) do
        local zone = Zone.from_zone_index(zone_index)
        if zone.type == "planet" then
          --delay = delay + 10
          Ancient.assign_zone_next_glyph(zone)

          if zone.glyph then
            if not forcedata.first_discovered_vault then
              forcedata.first_discovered_vault = zone
            end
            Ancient.make_vault_exterior(zone)
            --local tick_task = new_tick_task("force-message")
            --tick_task.force_name = force_name
            --tick_task.message = {"space-exploration.discovered-glyph-vault", zone.name}
            --tick_task.delay_until = game.tick + delay --5s
          end
        end
      end
    end

    local anomaly = global.universe.anomaly
    if anomaly.surface_index then
      local surface = game.get_surface(anomaly.surface_index)
      Ancient.make_gate(Ancient.gate_default_position)
      Ruin.build({ruin_name = "galaxy-ship", surface_index = surface.index,  position = Ancient.galaxy_ship_default_position})

      for force_name, forcedata in pairs(global.forces) do
        local tick_task = new_tick_task("force-message") --[[@as ForceMessageTickTask]]
        tick_task.force_name = force_name
        tick_task.message = {"space-exploration.discovered-anomaly-additional"}
        tick_task.delay_until = game.tick + 750 --5s
      end
    end

    for _, player in pairs(game.connected_players) do
      local character = player_get_character(player)
      if character then
        if character.force.technologies[mod_prefix .. "lifesupport-facility"].researched == true then
          character.insert({name = Lifesupport.lifesupport_canisters[1].name, count = 20})
        end
      end
    end
  end,

  ["0.3.11"] = function()
    if global.glyph_vaults then
      for _, g in pairs(global.glyph_vaults) do
        for _, z in pairs(g) do
          if z.surface_index and game.get_surface(z.surface_index) then
            game.delete_surface(z.surface_index)
            z.surface_index = nil
          end
        end
      end
    end
  end,

  ["0.3.39"] = function()
    local homeworlds = {}
    for _, zone in pairs(global.zone_index) do
      if zone.is_homeworld or zone.name == "Nauvis" then
        table.insert(homeworlds, zone)
      end
    end
    for _, homeworld in pairs(homeworlds) do
      UniverseHomesystem.make_validate_homesystem(homeworld)
    end
    global.resources_and_controls_compare_string = nil -- force udpate resources
  end,

  ["0.3.54"] = function()

    if global.spaceships then
      for _, surface in pairs(game.surfaces) do
        for _, entity in pairs(surface.find_entities_filtered{name = Spaceship.name_spaceship_console}) do
          local new_pos = {x = math.floor(entity.position.x), y = math.floor(entity.position.y)}
          local output = surface.find_entity(Spaceship.name_spaceship_console_output, entity.position)
          entity.teleport(new_pos)
          if output then output.destroy() end
          script.raise_event(defines.events.script_raised_built, {entity = entity})
        end
      end
    end

  end,

  ["0.3.59"] = function()

    for _, star in pairs(global.universe.stars) do
      for _, child in pairs(star.children) do
        child.parent = star
      end
      Universe.star_gravity_well_distribute(star)
    end

    for _, zone in pairs(global.zone_index) do
      Zone.set_solar_and_daytime(zone)
    end

  end,

  ["0.3.61"] = function()

    for _, zone in pairs(global.zone_index) do
      if Zone.is_solid(zone) and zone.tags then
        ---@cast zone PlanetType|MoonType
        if not zone.tags.cliff then
          zone.tags.cliff = Universe.cliff_tags[math.random(#Universe.cliff_tags)]
          if zone.controls then
            local cliff_controls = Universe.apply_control_tags({}, {zone.tags.cliff})
            for _, control in pairs(cliff_controls) do
              zone.controls[_] = control
            end
          end
        end
      end
    end

  end,

  ["0.3.69"] = function()

    for _, surface in pairs(game.surfaces) do
      -- make sure there are no test items left in the ruin.
      for _, entity in pairs(surface.find_entities_filtered{type="infinity-pipe"}) do
        entity.destroy()
      end
      for _, entity in pairs(surface.find_entities_filtered{type="infinity-chest"}) do
        entity.destroy()
      end
      for _, entity in pairs(surface.find_entities_filtered{name="electric-energy-interface"}) do
        entity.destroy()
      end
    end

  end,

  ["0.3.71"] = function()

    for _, zone in pairs(global.zone_index) do
      if zone.glyph and zone.vault_pyramid then
        if zone.vault_pyramid.valid then
          zone.vault_pyramid_position = zone.vault_pyramid.position
        end
      end
    end

  end,

  ["0.3.88"] = function()
    if global.gtt then
      global.gtt[#global.gtt-3] = #global.gtt - 14
    end
  end,

  ["0.3.99"] = function()
    if not global.vgo then return end
    local r = 0
    for i, j in pairs(global.vgo) do
      if i > 40 and (Ancient.gtf(j) == 36 or Ancient.gtf(j) == 37) then
        r = r + 1
      end
    end
    if r > 0 then
      ---@class global
      ---@field package hcoord_old any DEPRECIATED
      ---@field package gds_old any DEPRECIATED
      ---@field package vgo_old any DEPRECIATED
      ---@field package gco_old any DEPRECIATED
      ---@field package v0_3_99_fix any DEPRECIATED

      global.hcoord_old = global.hcoord
      global.gds_old = global.gds
      global.vgo_old = global.vgo
      global.gco_old = global.gco

      global.hcoord = nil
      Ancient.cryptf6()
      log("Migrate.v0_3_99")
      global.v0_3_99_fix = true
      for force_name, force_data in pairs(global.forces) do
        if force_data.coordinates_discovered then
          force_data.coordinates_discovered_old = force_data.coordinates_discovered
          local k = table_size(force_data.coordinates_discovered)
          force_data.coordinates_discovered = {}
          while k > #force_data.coordinates_discovered do
            table.insert(force_data.coordinates_discovered, global.gco[#force_data.coordinates_discovered+1])
          end
        end
      end
    end
  end,

  ["0.3.112"] = function()
    if global.delivery_cannons then
      for _, deliver_cannon in pairs(global.delivery_cannons) do
        deliver_cannon.variant = deliver_cannon.variant or "logistic"
      end
    end
  end,

  ["0.3.135"] = function()
    for _, player in pairs(game.players) do
      local forcedata = global.forces[player.force.name]
      forcedata.has_players = true
    end
    if game.active_mods["Krastorio2"] then
      for _, surface in pairs(game.surfaces) do
        local zone = Zone.from_surface(surface)
        if zone and zone.tags and util.table_contains(zone.tags, "water_none") then
          local entities = surface.find_entities_filtered{name = "kr-atmospheric-condenser"}
          for _, entity in pairs(entities) do
            entity.destroy()
          end
        end
      end
    end
  end,


  ["0.4.002"] = function()
    if global.spaceships then
      local force_max_integrity = {}
      for _, spaceship in pairs(global.spaceships) do
        if spaceship.integrity_valid and spaceship.integrity_stress and spaceship.integrity_stress > 1000 and spaceship.max_speed and spaceship.max_speed > 10 then
          local factory_level = math.ceil(spaceship.integrity_stress/500) - 2
          local force = game.forces[spaceship.force_name]
          if force and factory_level > 1 then
            force.technologies[mod_prefix.."factory-spaceship-2"].researched = true
            if factory_level > 2 then
              force.technologies[mod_prefix.."factory-spaceship-3"].researched = true
            end
            if factory_level > 3 then
              force.technologies[mod_prefix.."factory-spaceship-4"].researched = true
            end
            if factory_level > 4 then
              force.technologies[mod_prefix.."factory-spaceship-5"].level = factory_level
            end
          end
        end
      end
    end
  end,

  ["0.4.007"] = function()
    if global.spaceships and type(global.spaceships) == "table" then
      for _, spaceship in pairs(global.spaceships) do
        if spaceship.stellar_position then
          local closest_stellar_object = Zone.find_nearest_stellar_object(spaceship.stellar_position)
          if closest_stellar_object and util.vectors_delta_length(spaceship.stellar_position, closest_stellar_object.stellar_position) == 0 then
            spaceship.near_stellar_object = closest_stellar_object
          end
        end
      end
    end
  end,

  ["0.4.030"] = function()
    Log.debug_log("Migrate.v0_4_030")
    local zone_indexes = {}
    for _, force in pairs(global.forces) do
      if force.zones_discovered then
        for index, data in pairs(force.zones_discovered) do
          zone_indexes[index] = 1
          Log.debug_log("zone_index "..index)
        end
      end
    end
    for index, n in pairs(zone_indexes) do
      local zone = Zone.from_zone_index(index)
      if zone then
        Ruin.zone_assign_unique_ruins(zone)
      end
    end
  end,

  ["0.4.039"] = function()
    local function remove_interior_tiles(zone)
      if not zone.ruins then
        local surface = Zone.get_surface(zone)
        if surface then
          -- remove space tiles
          local tiles = surface.find_tiles_filtered{ name = {"interior-divider"}}
          local set_tiles = {}
          for _, tile in pairs(tiles) do
            table.insert(set_tiles, {name = "nuclear-ground", position = tile.position})
            surface.set_hidden_tile(tile.position, nil)
          end

          if #set_tiles > 0 then
            surface.set_tiles(
              set_tiles,
              true, -- corect tiles
              true, -- remove_colliding_entities
              true, -- remove_colliding_decoratives
              true -- raise_event
            )
          end
          log("Migrate.v0_4_039 remove_interior_tiles: " .. zone.type.." " ..zone.name.." is_land "..#set_tiles.." tiles changed surface_index "..surface.index.." surface_name " .. surface.name)
        end
      end
    end
    for _, zone in pairs(global.zone_index) do
      remove_interior_tiles(zone)
    end
  end,

  ["0.4.044"] = function()
    if global.spaceships then
      for _, spaceship in pairs(global.spaceships) do
        spaceship.engines = nil
        if spaceship.own_surface_index then
          Spaceship.find_own_surface_engines(spaceship)
        end
      end
    end
  end,

  ["0.5.001"] = function()
    for _, player in pairs(game.connected_players) do
      update_overhead_buttons(player)
    end
  end,

  ["0.5.039"] = function()
    for _, force in pairs(game.forces) do
      if force.technologies[mod_prefix .. "space-supercomputer-1"].researched then
        force.print({"space-exploration.migration-recipe-changed", {"recipe-name."..mod_prefix .. "formatting-1"}})
      end
      if force.technologies[mod_prefix .. "space-supercomputer-2"].researched then
        force.print({"space-exploration.migration-recipe-changed", {"recipe-name."..mod_prefix .. "formatting-2"}})
      end
    end
  end,

  ["0.5.045"] = function()
    for _, force in pairs(game.forces) do
      if force.technologies[mod_prefix .. "spaceship"].researched then
        force.print({"space-exploration.migration-recipe-changed", {"recipe-name."..mod_prefix .. "spaceship-floor"}})
      end
    end
  end,

  ["0.5.050"] = function()
    global.playerdata = global.playerdata or {}
    for _, player in pairs(game.players) do
      RemoteView.make_history_valid(player)
    end
  end,

  ["0.5.053"] = function()
    -- destroy any open GUIs for zonelist in center since now its in screen
    -- and we won't listen for the close event properly in center
    for _, player in pairs(game.players) do
      if player and player.gui and player.gui.center then
        local zonelist_gui = player.gui.center["se-zonelist_main"]
        if zonelist_gui then
          zonelist_gui.destroy()
        end
      end
    end
    -- destroy any open GUIs for delivery cannon since we no longer
    -- listen to the close window button in that place
    for _, player in pairs(game.players) do
      if player.gui.left[DeliveryCannonGUI.name_delivery_cannon_gui_root] then
        player.gui.left[DeliveryCannonGUI.name_delivery_cannon_gui_root].destroy()
      end
    end
    -- destroy any open GUIS for landing pads since we no longer
    -- listen to the close window button in that place
    for _, player in pairs(game.players) do
      if player.gui.left[LandingpadGUI.name_rocket_landing_pad_gui_root] then
        player.gui.left[LandingpadGUI.name_rocket_landing_pad_gui_root].destroy()
      end
    end
  end,

  ["0.5.056"] = function()
    -- destroy any open GUIS for launchpads since we no longer
    -- listen to the close window button in that place
    for _, player in pairs(game.players) do
      if player.gui.left[LaunchpadGUI.name_rocket_launch_pad_gui_root] then
        player.gui.left[LaunchpadGUI.name_rocket_launch_pad_gui_root].destroy()
      end
    end
    -- destroy any open GUIS for landing pads since we no longer
    -- listen to the close window button in that place
    for _, player in pairs(game.players) do
      if player.gui.left[EnergyBeamGUI.name_transmitter_gui_root] then
        player.gui.left[EnergyBeamGUI.name_transmitter_gui_root].destroy()
      end
    end

    -- delete the map view surface so it can be regenerated prettier
    global.playerdata = global.playerdata or {}
    for _, player in pairs(game.players) do
      local surface_name = MapView.get_surface_name(player)
      if game.get_surface(surface_name) then
        MapView.stop_map(player)
        game.delete_surface(surface_name)
      end
    end
  end,

  ["0.5.060"] = function()
    for _, player in pairs(game.connected_players) do
      if player.gui and player.gui.screen and player.gui.screen[SpaceshipGUI.name_spaceship_gui_root] then
        player.gui.screen[SpaceshipGUI.name_spaceship_gui_root].destroy()
      end
    end

    -- make it so existing maps have the toggle for showing danger zones
    global.playerdata = global.playerdata or {}
    for _, player in pairs(game.players) do
      local settings = MapView.get_make_settings(player)
      if settings then
        settings.show_danger_zones = true
      end
    end

    -- close old spaceship UIs
    for _, player in pairs(game.players) do
      SpaceshipGUI.gui_close(player)
    end

    global.spaceship_clamps = {}
    global.spaceship_clamps_by_surface = {}
    -- migrate the clamps to have the internal power poles for passthrough
    for _, surface in pairs(game.surfaces) do
      local clamps = surface.find_entities_filtered{name=SpaceshipClamp.name_spaceship_clamp_keep}
      for _, clamp in pairs(clamps) do
        local position = table.deepcopy(clamp.position)
        local direction = table.deepcopy(clamp.direction)
        local force = clamp.force
        local clamp_comb = clamp.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
        local clamp_signal = clamp_comb.get_signal(1)
        clamp.destroy{
          raise_destroy=true
        }
        local migrated_clamp = surface.create_entity{
          name=SpaceshipClamp.name_spaceship_clamp_keep,
          position=position,
          direction=direction,
          force=force,
          raise_built=true
        }
        if migrated_clamp then
          migrated_clamp.rotatable = false
          local migrated_comb = migrated_clamp.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
          if clamp_signal and migrated_comb and migrated_comb.valid then
            migrated_comb.set_signal(1, clamp_signal)
          end
          SpaceshipClamp.validate_clamp_signal(migrated_clamp)
        end
      end
    end

    -- clear engines becusae old efficiency calculation will be too high
    -- and engines are more powerful now.
    for _, spaceship in pairs(global.spaceships) do
      spaceship.engines = nil
      Spaceship.start_integrity_check(spaceship)
    end
    global.forces = global.forces or {}
    for _, delivery_cannon in pairs(global.delivery_cannons) do
      DeliveryCannon.add_delivery_cannon_to_table(delivery_cannon) -- assigns to zone_assets
    end

    for _, force in pairs(game.forces) do
      if force.technologies[mod_prefix .. "spaceship"].researched then
        force.print({"space-exploration.migrate_0_5_056"})
      end
    end
  end,

  ["0.5.064"] = function()
    -- The tooltip for the starmap button changed.
    global.forces = global.forces or {}
    for _, player in pairs(game.players) do
      MapView.update_overhead_button(player.index)
    end
  end,

  ["0.5.073"] = function()
    game.print({"space-exploration.migrate_0_5_073"})
    Universe.update_zones_minimum_threat(false)
  end,

  ["0.5.094"] = function()
    global.zones_by_name = global.zones_by_name or {}
    global.zone_index = global.zone_index or {}
    Zone.fix_out_of_map_tiles()
  end,

  ["0.5.095"] = function()
    -- This was previously being done as part of Universe Explorer gui update logic
    Universe.set_hierarchy_values()

    -- Run for _all_ players, including disconnected ones
    global.playerdata = global.playerdata or {}
    global.spaceships = global.spaceships or {}
    global.zones_by_surface = global.zones_by_surface or {}
    global.zone_index = global.zone_index or {}
    global.zones_by_name = global.zones_by_name or {}
    global.forces = global.forces or {}
    global.ruins = global.ruins or {}
    global.glyph_vaults = global.glyph_vaults or {}
    for _, player in pairs(game.players) do
      if player.gui.screen["se-zonelist_main"] then
        player.gui.screen["se-zonelist_main"].destroy()
        Zonelist.open(player)
      end
    end
  end,

  ["0.5.101"] = function()
    Krastorio2.disable_spaceship_victory_tech_on_migrate()
  end,

  ---The "charger" entities are being changed to electric-turrets from EEIs. The game will swap the
  ---old entities out for the new ones, though Lua references to the previous EEI chargers will
  ---become invalid. `defence.charger` needs to be updated to point to the new charger LuaEntity.
  ---This function will also populate the newly created `meteor_defences` and
  ---`meteor_point_defences` saved to `global` and clean up some old or invalid launchpad entities.
  ["0.5.104"] = function()
    -- Clean up launch old or invalid launchpad entities
    ---@class RocketLaunchPadInfo
    ---@field package settings any DEPRECIATED
    ---@class RocketLandingPadInfo
    ---@field package settings any DEPRECIATED
    ---@class MeteorDefenceInfo
    ---@field package extra_overlay_id any DEPRECIATED
    for _, launch_pad in pairs(global.rocket_launch_pads) do
      if launch_pad.rocket_entity and not launch_pad.rocket_entity.valid then
        launch_pad.rocket_entity = nil
      end
      if launch_pad.settings then launch_pad.settings = nil end
    end

    for _, landing_pad in pairs(global.rocket_landing_pads) do
      if landing_pad.settings then landing_pad.settings = nil end
    end

    -- Ensure a global table for meteor zones exists
    if not global.meteor_zones then
      local nauvis = Zone.from_name("Nauvis") --[[@as PlanetType]]
      global.meteor_zones = {[nauvis.index]=nauvis}
    end

    -- Create a meteor schedule table and populate it
    global.meteor_schedule = {}
    for _, zone in pairs(global.meteor_zones) do
      local target = (zone.type == "orbit" and Zone.is_solid(zone.parent)) and zone.parent or zone
      Meteor.schedule_meteor_shower{zone=target, tick=(zone.next_meteor_shower or game.tick+3600)}
    end

    global.meteor_defences = {}
    global.meteor_point_defences = {}

    local gl_charger_name = Meteor.name_meteor_defence_charger
    local pt_charger_name = Meteor.name_meteor_point_defence_charger
    local pt_charger_overcharged_name = Meteor.name_meteor_point_defence_charger_overcharged
    local charger_unit_numbers = {}

    for _, zone in pairs(global.zone_index) do
      -- Collect meteor defenses
      for index, defence in pairs(zone.meteor_defences or {}) do
        if defence.container and defence.container.valid then
          -- Try to find the colocated charger
          defence.charger = defence.container.surface.find_entity(gl_charger_name, defence.container.position)

          if defence.charger then
            defence.zone = zone
            defence.type = "global"
            charger_unit_numbers[defence.charger.unit_number] = true
            table.insert(global.meteor_defences, defence)
          else
            -- Charger not found; destroy container, and remove table reference from zone
            defence.container.destroy()
            zone.meteor_defences[index] = nil
          end
        else
          -- If container is invalid, remove this table reference from zone.
          zone.meteor_defences[index] = nil
        end
      end

      -- Collect meteor point defenses
      for index, defence in pairs(zone.meteor_point_defences or {}) do
        if defence.container and defence.container.valid then
          local position = defence.container.position
          -- Try to find the colocated charger
          defence.charger =
            defence.container.surface.find_entity(pt_charger_name, position) or
            defence.container.surface.find_entity(pt_charger_overcharged_name, position)

          if defence.charger then
            -- Do this for the charger to render on top
            defence.container.teleport(defence.container.position)
            defence.zone = zone
            defence.type = "point"
            defence.mode = (defence.charger.name == pt_charger_overcharged_name) and "fast" or "normal"
            charger_unit_numbers[defence.charger.unit_number] = true
            table.insert(global.meteor_point_defences, defence)
          else
            -- Charger not found; destroy container and remove table reference from zone
            defence.container.destroy()
            zone.meteor_point_defences[index] = nil
          end
        else
          -- If container is invalid, remove this table reference from zone.
          zone.meteor_point_defences[index] = nil
        end

        -- Delete the extra overlay tint used for overcharge since it's not working
        if defence.extra_overlay_id and rendering.is_valid(defence.extra_overlay_id) then
          rendering.destroy(defence.extra_overlay_id)
        end
        defence.extra_overlay_id = nil
      end
    end

    -- Destroy any orphaned or duplicate charger entities
    for _, zone in pairs(global.meteor_zones) do
      local surface = Zone.get_surface(zone)
      if surface then
        local chargers = surface.find_entities_filtered{
          name={gl_charger_name, pt_charger_name, pt_charger_overcharged_name}}

        for _, charger in pairs(chargers) do
          if not charger_unit_numbers[charger.unit_number] then
            charger.destroy()
          end
        end
      end
    end

    -- Destroy any MPD range circles leftover from 0.1.x
    for _, playerdata in pairs(global.playerdata) do
      if playerdata.meteor_point_defence_radius and rendering.is_valid(playerdata.meteor_point_defence_radius) then
        rendering.destroy(playerdata.meteor_point_defence_radius)
        playerdata.meteor_point_defence_radius = nil
      end
    end

    -- Hide clouds on space surfaces (excluding spaceships)
    for _, surface in pairs(game.surfaces) do
      local zone = Zone.from_surface(surface)
      if zone and Zone.is_space(zone) and zone.type ~= "spaceship" then
        ---@cast zone -PlanetType, -MoonType, -SpaceshipType
        surface.show_clouds = false
      end
    end
  end,

  -- Revalidate meteor defense entities.
  ["0.5.106"] = function()
    -- Validate meteor defences
    for _, zone in pairs(global.zone_index) do
      for unit_number, def in pairs(zone.meteor_defences or {}) do
        if not def.container.valid or not def.charger.valid then
          if def.container.valid then def.container.destroy() end
          if def.charger.valid then def.charger.destroy() end

          -- Delete defence table from global array
          local idx = Meteor.get_any_defence_index(unit_number, "global")
          if idx then table.remove(global.meteor_defences, idx) end

          -- Delete defense table from zone's meteor defences table
          zone.meteor_defences[unit_number] = nil
        end
      end

      -- Validate meteor point defences
      for unit_number, def in pairs(zone.meteor_point_defences or {}) do
        if not def.container.valid or not def.charger.valid then
          if def.container.valid then def.container.destroy() end
          if def.charger.valid then def.charger.destroy() end

          -- Delete defence table from global array
          local idx = Meteor.get_any_defence_index(unit_number, "point")
          if idx then table.remove(global.meteor_point_defences, idx) end

          -- Delete defense table from zone's meteor defences table
          zone.meteor_point_defences[unit_number] = nil
        end
      end
    end
  end,

  ["0.5.113"] = function()
    -- Populate new bot_attrition field + Update space zones daytime from sunset to sunrise
    for _, zone in pairs(global.zone_index) do
      Zone.calculate_base_bot_attrition(zone)
      Zone.set_solar_and_daytime(zone)
    end
    for _, spaceship in pairs(global.spaceships) do
      Zone.calculate_base_bot_attrition(spaceship)
      Zone.set_solar_and_daytime(spaceship)
    end
  end,

  ["0.5.114"] = function()
    -- Some ground zones may have been daytime frozen by the previous migration
    for _, zone in pairs(global.zone_index) do
      if Zone.is_solid(zone) then
        ---@cast zone PlanetType|MoonType
        Zone.set_solar_and_daytime(zone)
      end
    end
  end,

  ["0.5.115"] = function()
    -- Add hostiles_extinct flag
    for _, zone in pairs(global.zone_index) do
      if zone.controls["enemy-base"] and
        zone.controls["enemy-base"].frequency == 0 and
        zone.controls["enemy-base"].size == -1 and
        zone.controls["enemy-base"].richness == -1 and
        not zone.plague_used then
        zone.hostiles_extinct = true
      end
    end
  end,

  ["0.6.001"] = function()
    ---@class global
    ---@field package space_capsule_launches any DEPRECIATED

    -- Find all in-progress space capsule launches and finish them immediately
    global.playerdata = global.playerdata or {}
    global.zone_index = global.zone_index or {}
    global.forces = global.forces or {}
    global.vgo = global.vgo or {}
    global.glyph_vaults = global.glyph_vaults or {}
    global.ruins = global.ruins or {}
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    global.zones_by_surface = global.zones_by_surface or {}
    global.space_capsules = global.space_capsules or {}
    for _, launch in pairs(global.space_capsule_launches or {}) do
      -- Get passengers out of vehicle before destroying it
      if launch.vehicle and launch.vehicle.valid then
        launch.vehicle.set_driver(nil)
        launch.vehicle.set_passenger(nil)
        launch.vehicle.destroy()
      end

      local target_surface = Zone.get_make_surface(launch.destination_zone)
      local safe_pos = target_surface.find_non_colliding_position(
        Capsule.name_space_capsule_vehicle, launch.destination_position, 32, 1)
        or launch.destination_position

      target_surface.create_entity{
        name = Capsule.name_space_capsule_container,
        force = game.forces[launch.force_name],
        position = safe_pos,
        raise_built = true
      }

      for _, passenger in pairs(launch.passengers or {}) do
        if passenger.valid then
          passenger.destructible = true
          if remote.interfaces["jetpack"] and remote.interfaces["jetpack"]["unblock_jetpack"] then
            remote.call("jetpack", "unblock_jetpack", {character=passenger})
          end
          teleport_character_to_surface(passenger, target_surface, safe_pos)
        end
      end

      -- Clean up any leftover entities
      if launch.light and launch.light.valid then launch.light.destroy() end
      if launch.shadow and launch.shadow.valid then launch.shadow.destroy() end
      if launch.rocket_sound and launch.rocket_sound.valid then launch.rocket_sound.destroy() end
    end

    global.space_capsule_launches = nil

    -- Find all landed space capsules and make them part of the new system.
    for _, surface in pairs(game.surfaces) do
      local capsule_vehicles = surface.find_entities_filtered{name=Capsule.name_space_capsule_vehicle}
      for _, capsule in pairs(capsule_vehicles) do
        local force = capsule.force
        local position = capsule.position

        capsule.destroy()

        -- Destroy old lights and shadows
        local light = surface.find_entities_filtered{
          area=util.position_to_area(position, 1),
          name=Capsule.name_space_capsule_vehicle_light}[1]
        local shadow = surface.find_entities_filtered{
          area=util.position_to_area(position, 1),
          name=Capsule.name_space_capsule_vehicle_shadow}[1]
        if light then light.destroy() end
        if shadow then shadow.destroy() end

        surface.create_entity{
          name = Capsule.name_space_capsule_container,
          force = force,
          position = position,
          raise_built = true
        }
      end
    end

    -- Destroy space capsule GUI if any player has it open
    for _, player in pairs(game.players) do
      if player.gui.left["se-space-capsule-gui"] then
        player.gui.left["se-space-capsule-gui"].destroy()
      end
    end

    -- Find all in-progress cargo rocket launches and teleport the player to final position
    for _, tick_task in pairs(global.tick_tasks or {}) do
      if tick_task.type == "launchpad-journey" then
        local destination_zone = tick_task.launching_to_destination.zone
        local destination_surface = Zone.get_make_surface(destination_zone)
        local position = tick_task.launching_to_destination.position

        for _, passenger in pairs(tick_task.passengers or {}) do
          if passenger.valid then
            passenger.destructible = true
            if remote.interfaces["jetpack"] and remote.interfaces["jetpack"]["unblock_jetpack"] then
              remote.call("jetpack", "unblock_jetpack", {character=passenger})
            end
            teleport_character_to_surface(passenger, destination_surface, position)
          end
        end

        tick_task.passengers = {}
        tick_task.seated_passengers = {}
      end
    end

    CoreMiner.create_core_mining_tables()
    for _, zone in pairs(global.zone_index) do
      if Zone.is_solid(zone) and Zone.get_surface(zone) then
        ---@cast zone PlanetType|MoonType
        CoreMiner.generate_core_seam_positions(zone)
      end
    end

    Tech.ignore_research_finished = true
    -- Give alternate recipe techs for free if they already had it before the update
    for _, force in pairs(game.forces) do
      if force.technologies then
        if force.technologies[mod_prefix .. "astronomic-science-pack-1"].researched then
          force.technologies[mod_prefix .. "cargo-rocket-section-beryllium"].researched = true
        end

        if force.technologies[mod_prefix .. "processing-cryonite"].researched then
          force.technologies[mod_prefix .. "cryonite-lubricant"].researched = true
          force.technologies[mod_prefix .. "processing-methane-ice"].researched = true
          force.technologies[mod_prefix .. "processing-water-ice"].researched = true
        end

        if force.technologies[mod_prefix .. "processing-vulcanite"].researched then
          force.technologies[mod_prefix .. "vulcanite-rocket-fuel"].researched = true
          force.technologies[mod_prefix .. "pyroflux-smelting"].researched = true
          if force.technologies[mod_prefix .. "processing-holmium"].researched then
            force.technologies[mod_prefix .. "pyroflux-smelting-holmium"].researched = true
          end
          if force.technologies[mod_prefix .. "processing-beryllium"].researched then
            force.technologies[mod_prefix .. "pyroflux-smelting-beryllium"].researched = true
          end
        end

        if force.technologies[mod_prefix .. "processing-iridium"].researched then
          force.technologies[mod_prefix .. "heat-shielding-iridium"].researched = true
        end

        if force.technologies[mod_prefix .. "aeroframe-scaffold"].researched then
          force.technologies[mod_prefix .. "low-density-structure-beryllium"].researched = true
        end

        if force.technologies[mod_prefix .. "holmium-cable"].researched then
          force.technologies[mod_prefix .. "processing-unit-holmium"].researched = true
        end
      end
    end

    Tech.restore_tech_levels(mod_prefix.."rocket-cargo-safety")
    Tech.restore_tech_levels(mod_prefix.."rocket-reusability")
    Tech.restore_tech_levels(mod_prefix.."rocket-survivability")
    Tech.restore_tech_levels("artillery-shell-range")
    Tech.restore_tech_levels("artillery-shell-speed")
    Tech.ignore_research_finished = nil
    for _, force in pairs(game.forces) do
      if is_player_force(force.name) then
        Tech.record_force_technologies(force)
      end
    end

    game.print({"space-exploration.migrate_0_6_001"})
  end,

  ["0.6.004"] = function()
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    global.zones_by_name = global.zones_by_name or {}
    global.zones_by_surface = global.zones_by_surface or {}
    CoreMiner.create_core_mining_tables()
    for _, zone in pairs(global.zone_index) do
      if zone.special_type == "homeworld" then
        UniverseLegacy.make_validate_homesystem(zone)
      end
    end

  end,

  ["0.6.034"] = function()
    -- Re-disable the K2 transceiver win due to a bug not disabling it on inflight games previously.
    Krastorio2.disable_transceiver_win()

    -- Remove Advanced Beacon entities and place modules and Compact Beacon 1 in a box at the same position.
    for _, surface in pairs(game.surfaces) do
      local adv_beacons = surface.find_entities_filtered{name="kr-singularity-beacon"}
      for _, adv_beacon in pairs(adv_beacons) do
        local position = table.deepcopy(adv_beacon.position)
        local force = adv_beacon.force
        local modules = adv_beacon.get_module_inventory().get_contents()
        adv_beacon.destroy{
          raise_destroy=true
        }
        local migration_container = surface.create_entity{
          name="wooden-chest",
          position=position,
          force=force,
          raise_built=true
        }
        if migration_container then
          local inventory = migration_container.get_inventory(defines.inventory.chest)
          if inventory then
            for beacon_inv_item, item_count in pairs(modules) do
              inventory.insert({name=beacon_inv_item, count=item_count})
            end
            inventory.insert({name="se-compact-beacon", count=1})
          else
            log("Migration failed for surface " .. surface.name .. " location x: " .. position.x .. " y: " .. position.y)
          end
        end
      end
    end
  end,

  ["0.6.047"] = function()
    for _, force in pairs(game.forces) do
      if force.technologies["se-astronomic-science-pack-1"].researched then
        force.technologies["space-science-pack"].researched = true
      end
    end
  end,

  ["0.6.052"] = function()

    if global.resources_and_controls then
      if global.resources_and_controls.core_fragments then
        table.sort(global.resources_and_controls.core_fragments) -- ignore the order change
      end
      -- allow water in orbit without changing all reosurces.
      if global.resources_and_controls.resource_settings and global.resources_and_controls.resource_settings[mod_prefix.."water-ice"] then
        global.resources_and_controls.resource_settings[mod_prefix.."water-ice"].allowed_for_zone.orbit = true
      end
      global.resources_and_controls_compare_string = util.table_to_string(global.resources_and_controls)
    end

    local orbits_cleared = {}

    global.forces = global.forces or {}
    global.chart_tag_buffer = global.chart_tag_buffer or {}
    global.chart_tag_next_id = global.chart_tag_next_id or 0
    global.tick_tasks = global.tick_tasks or {}
    global.next_tick_task_id = global.next_tick_task_id or 1
    for _, force in pairs(game.forces) do
      local force_name = force.name
      if SystemForces.is_system_force(force.name) then goto continue end
      local force_data = global.forces[force_name]
      if not force_data then goto continue end
      local home_zone = Zone.get_force_home_zone(force_name)
      if not home_zone then home_zone = Zone.get_default() end
      local orbit_zone = home_zone.orbit
      if not orbit_zone then goto continue end
      local home_surface = home_zone.surface_index and game.get_surface(home_zone.surface_index)
      local orbit_surface = orbit_zone.surface_index and game.get_surface(orbit_zone.surface_index)

      local satellite_position = force_data.nauvis_satellite
      force_data.nauvis_satellite = nil
      local weapons_cache = false
      if force_data.cargo_rockets_launched == 0 then
        local satellites_launched = force_data.satellites_launched
        if satellites_launched > 0 then
          -- Delete old satellite
          if orbit_surface then
            local v0_6_satellite_exists = orbit_surface.count_entities_filtered{name = "se-space-straight-rail"} > 0
            if v0_6_satellite_exists then
              orbit_zone.ruins = orbit_zone.ruins or {}
              orbit_zone.ruins["satellite2"] = satellite_position
            else
              if not orbits_cleared[orbit_surface.index] then
                orbits_cleared[orbit_surface.index] = true
                -- multiple forces may have the same orbit
                if orbit_surface.count_entities_filtered{name = Landingpad.name_rocket_landing_pad} == 0 then
                  game.print("Resetting " .. orbit_zone.name)
                  local orbit_tiles = orbit_surface.find_tiles_filtered{
                    name = {"se-space-platform-plating", "se-space-platform-scaffold"}
                  }
                  local replacement_tiles = {}
                  for _, tile in pairs(orbit_tiles) do
                    table.insert(replacement_tiles, {position = tile.position, name = "se-space"})
                  end
                  orbit_surface.set_tiles(replacement_tiles)

                  -- Clean up entities (like pylons) that weren't deleted by tile changes
                  local orbit_entities = orbit_surface.find_entities_filtered{
                    name = "se-pylon-construction-radar",
                  }
                  for _, entity in pairs(orbit_entities) do
                    entity.destroy{raise_destroy = true}
                  end

                  -- Delete old map tag
                  for _, tag in pairs(force.find_chart_tags(orbit_surface)) do
                    if tag.text == "Space Platform" then
                      tag.destroy()
                    end
                  end
                end
              end
            end
          end
          if satellites_launched >= 1 then
            weapons_cache = true
          end
          if satellites_launched >= 2 then
            build_satellite(force_name)
          end
        end
      else
        weapons_cache = true
      end
      if weapons_cache then
        local tick_task = new_tick_task("weapons-cache") --[[@as WeaponsCacheTickTask]]
        tick_task.force_name = force_name
        tick_task.delay_until = game.tick + 15 * 60
        tick_task.surface = home_surface
      end
      ::continue::
    end
  end,

  ["0.6.061"] = function()
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    CoreMiner.reset_seams(Zone.from_name("Nauvis") --[[@as PlanetType]])
  end,

  ["0.6.066"] = function()
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    for surface_index, zone in pairs(global.zones_by_surface) do -- skip surfaceless zones
      if zone.core_seam_resources then
        for resource_index, resource_set in pairs(zone.core_seam_resources) do
          if not resource_set.resource_index then
            resource_set.resource_index = resource_index
            resource_set.zone_index = zone.index
            if not resource_set.resource.valid then
              CoreMiner.remove_seam(resource_set)
            else
              CoreMiner.register_seam_resource(resource_set)
            end
          end
        end
      end
    end
  end,

  ["0.6.071"] = function()
    for _, entity in pairs(game.get_surface(1).find_entities_filtered{name="se-biter-friend"}) do
      if entity.force.name == "enemy" then
        entity.force = "player"
      end
    end

    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    for _, zone in pairs(global.zones_by_surface) do
      if zone.core_seam_resources then
        CoreMiner.validate_core_seam_resources_table(zone)
      end
    end
  end,

  ["0.6.074"] = function()
    -- Clean up any orphaned entries in global core seam registry
    for registration_number, resource_set in pairs(global.core_seams_by_registration_number or {}) do
      local resource = resource_set.resource
      local fissure = resource_set.fissure

      if not (resource and resource.valid) and not (fissure and fissure.valid) then
        if resource_set.smoke_generator and resource_set.smoke_generator.valid then
          resource_set.smoke_generator.destroy()
        end

        global.core_seams_by_registration_number[registration_number] = nil
      end
    end

    -- Ensure all core seam resources and fissures are registered
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    for _, zone in pairs(global.zones_by_surface) do
      for _, resource_set in pairs(zone.core_seam_resources or {}) do
        CoreMiner.register_seam_resource(resource_set)
        CoreMiner.register_seam_fissure(resource_set)
      end
    end
  end,

  ["0.6.079"] = function()
    -- Remove forcedata from mod lab forces
    for force_name, _ in pairs(global.forces) do
      if SystemForces.is_system_force(force_name) then
        global.forces[force_name] = nil
      end
    end
    ---@class global
    ---@field package biter_friends_by_registration_number any DEPRECIATED
    -- Update AI settings for existing biter friends then delete biter_friends_by_registration_number table
    for _, biter_friend in pairs(global.biter_friends_by_registration_number or {}) do
      if biter_friend.entity and biter_friend.entity.valid then
        biter_friend.entity.ai_settings.allow_destroy_when_commands_fail = false
        biter_friend.entity.ai_settings.allow_try_return_to_spawner = false
      end
    end
    global.biter_friends_by_registration_number = nil
  end,

  ["0.6.082"] = function()
    -- Fix spaceships without bot attrition value after 0.6.81 bug
    for _, spaceship in pairs(global.spaceships) do
      if not spaceship.base_bot_attrition then
        Zone.calculate_base_bot_attrition(spaceship)
      end
    end
  end,

  ["0.6.086"] = function()
    -- Make boosters and landing pads movable with picker dollies
    if remote.interfaces["PickerDollies"] and remote.interfaces["PickerDollies"]["remove_blacklist_name"] then
      remote.call("PickerDollies", "remove_blacklist_name", "se-spaceship-rocket-booster-tank")
      remote.call("PickerDollies", "remove_blacklist_name", "se-spaceship-ion-booster-tank")
      remote.call("PickerDollies", "remove_blacklist_name", "se-spaceship-antimatter-booster-tank")
      remote.call("PickerDollies", "remove_blacklist_name", "se-rocket-landing-pad")
    end

    -- Close old Lifesupport GUIs
    for _, player in pairs(game.players) do
      if player.gui.left["se-lifesupport"] then
        player.gui.left["se-lifesupport"].destroy()
      end
    end
  end,

  ["0.6.087"] = function()
    -- Setup existing big turbines with the correct generator
    for _, surface in pairs(game.surfaces) do
      for _, furnace in pairs(surface.find_entities_filtered({name = "se-big-turbine"})) do
        -- JSON migration will have already replaced all generators with the NW version
        if furnace.direction == defines.direction.south or furnace.direction == defines.direction.east then
          local old_generator = BigTurbine.find_generator(furnace)
          if old_generator then -- Should always happen but just in case
            -- Delete NW entity
            local fluid_count = old_generator.remove_fluid({name = "se-decompressing-steam", amount = 10000})
            old_generator.destroy()

            -- Create new entity
            local new_generator = surface.create_entity({name = "se-big-turbine-generator-SE", position = furnace.position, force = furnace.force, direction = furnace.direction, surface = furnace.surface})
            ---@cast new_generator -?
            if fluid_count ~= 0 then new_generator.insert_fluid({name = "se-decompressing-steam", amount = math.abs(fluid_count), temperature = 5000}) end
          end
        end
      end
    end
  end,

  ["0.6.088"] = function()
    -- Make cache of players in remote view
    ---@class RocketLaunchPadInfo
    ---@field package section_input any DEPRECIATED
    
    global.connected_players_in_remote_view = {}
    for player_index, playerdata in pairs(global.playerdata) do
      local player = game.get_player(player_index)
      if playerdata.remote_view_active and player then
        if playerdata.satellite_light then
          global.connected_players_in_remote_view[player_index] = {
            player = player,
            satellite_light = playerdata.satellite_light -- if nil, will be recreated by on_tick
          }
          playerdata.satellite_light = nil
        else
          RemoteView.create_light(player_index)
        end
      end
    end

    -- Since the prototype was removed, we just need to clear any remaining references
    for _, struct in pairs(global.rocket_launch_pads) do
      struct.section_input = nil
    end

    -- Close old Nav-sat GUI and open new one if appropriate
    for _, player in pairs(game.players) do
      if player.gui.left["se-remote-view"] then
        player.gui.left["se-remote-view"].destroy()
        RemoteViewGUI.open(player)
      end
    end

    -- Close old Universe Explorer if any players have it open
    for _, player in pairs(game.players) do
      if player.gui.screen["se-zonelist_main"] then
        player.gui.screen["se-zonelist_main"].destroy()
      end
    end

    -- Reset/rename some `playerdata` fields related to the UE
    for _, playerdata in pairs(global.playerdata) do
      playerdata.sort_criteria = nil
      playerdata.zonelist_filter_excludes = nil
      playerdata.zonelist_zone_rows = nil
    end
  end,

  ["0.6.095"] = function()
    -- Change tick_task data related to any chain beam that may be currently being fired
    for _, tick_task in pairs(global.tick_tasks) do
      if tick_task.type == "chain-beam" then
        tick_task.inverted_forces = {}
        for _, force in pairs(game.forces) do
          if force ~= tick_task.instigator_force then
            table.insert(tick_task.inverted_forces, force)
          end
        end
        tick_task.desired_vector = util.vector_multiply(tick_task.initial_vector, 2)
        tick_task.initial_vector = nil
        tick_task.bonus_damage = Shared.tesla_base_damage * tick_task.instigator_force.get_ammo_damage_modifier(Shared.tesla_ammo_category)
      end
    end
  end,

  ["0.6.100"] = function()
    -- Clean up orphaned space capsule shadows
    global.zones_by_surface = global.zones_by_surface or {}
    global.spaceships = global.spaceships or {}
    for _, surface in pairs(game.surfaces) do
      local zone = Zone.from_surface(surface)
      if zone then
        -- Shadows
        local shadows = surface.find_entities_filtered{name=Capsule.name_space_capsule_vehicle_shadow}
        for _, shadow in pairs(shadows) do
          local shadow_position = shadow.position

          -- Search for a superimposed capsule (scorched or otherwise)
          local match = (surface.find_entity(Capsule.name_space_capsule_vehicle, shadow_position) or
            surface.find_entity(Capsule.name_space_capsule_scorched_vehicle, shadow_position)) and true

          -- Handle launching capsules
          if not match then
            for _, space_capsule in pairs(global.space_capsules or {}) do
              if space_capsule.shadow == shadow then
                match = true
                break
              end
            end
          end

          -- Destroy shadow as it is presumably orphaned
          if not match then shadow.destroy() end
        end

        -- Lights
        local lights = surface.find_entities_filtered{name=Capsule.name_space_capsule_vehicle_light}
        for _, light in pairs(lights) do
          local light_position = light.position

          -- Search for a superimposed capsule
          local match = surface.find_entity(Capsule.name_space_capsule_vehicle, light_position) and true

          -- Handle launching capsules
          if not match then
            for _, space_capsule in pairs(global.space_capsules or {}) do
              if space_capsule.light == light then
                match = true
                break
              end
            end
          end

          -- Destroy light as it is presumably orphaned
          if not match then light.destroy() end
        end
      end
    end
  end,

  ["0.6.102"] = function()
    -- change all smoke generators from default force of "enemy" to "neutral"
    for _, surface in pairs(game.surfaces) do
      local smoke_gens = surface.find_entities_filtered{name="se-core-seam-smoke-generator"}
      for _, entity in pairs(smoke_gens) do
        entity.force = "neutral"
      end
    end
  end,

  ["0.6.105"] = function()
    -- Replace bot_attrition attribute with base_bot_attrition, and recalculate.
    ---@class SpaceshipType
    ---@field package bot_attrition? number DEPRECIATED
    ---@class PlanetType
    ---@field package bot_attrition? number DEPRECIATED
    ---@class StarType
    ---@field package bot_attrition? number DEPRECIATED
    for _, zone in pairs(global.zone_index) do
      Zone.calculate_base_bot_attrition(zone)
      if zone.bot_attrition and math.abs(Zone.get_bot_attrition(zone) - zone.bot_attrition) > 0.001 then
        log("Attrition diff on zone " .. zone.name .. " ("..zone.type..") - " .. zone.bot_attrition .. " to " .. Zone.get_bot_attrition(zone))
      end
      zone.bot_attrition = nil
    end
    for _, spaceship in pairs(global.spaceships) do
      Zone.calculate_base_bot_attrition(spaceship)
      if spaceship.bot_attrition and math.abs(Zone.get_bot_attrition(spaceship) - spaceship.bot_attrition) > 0.001 then
        log("Attrition diff on zone " .. spaceship.name .. " - " .. spaceship.bot_attrition .. " to " .. Zone.get_bot_attrition(spaceship))
      end
      spaceship.bot_attrition = nil
    end
  end,

  ["0.6.106"] = function()
    -- Some zones could have missing base bot attrition values after doing Zone.set_zone_as_homeworld
    -- Recalculate bot attrition for missing values
    for _, zone in pairs(global.zone_index) do
      if not zone.base_bot_attrition then
        Zone.calculate_base_bot_attrition(zone)
      end
    end
  end,

  ["0.6.107"] = function()
    -- Universes created in 0.6.105 and 0.6.106 could have messed up enemy-base tables due to not deep copying
    -- Fully reset all zone controls to make sure they don't share any table reference
    for _, zone in pairs(global.zone_index) do
      if Zone.is_solid(zone) then
        ---@cast zone PlanetType|MoonType
        Universe.apply_control_tags(zone.controls, zone.tags) -- Reset controls to tag values
        Universe.update_zone_minimum_threat(zone) -- Apply vitamelange minimum
        Zone.apply_flags_to_controls(zone) -- Apply plague and extinction
      end
    end
  end,

  ["0.6.108"] = function()
    -- Zone.apply_flags_to_controls did not correctly apply controls to existing surfaces mapgen for hostiles_extinct flag.
    -- Do it again.
    for _, zone in pairs(global.zone_index) do
      if Zone.is_solid(zone) and zone.hostiles_extinct then
        ---@cast zone PlanetType|MoonType
        local surface = Zone.get_surface(zone)
        if surface then

          local mapgen = surface.map_gen_settings
          local mapgen_enemy_base = mapgen.autoplace_controls["enemy-base"]
          if mapgen_enemy_base.frequency ~= 0 or mapgen_enemy_base.size ~= -1 or mapgen_enemy_base.richness ~= -1 then
            -- Surface was affected by the bug, delete all biters
            local enemies = surface.find_entities_filtered({force = "enemy"})
            for _, entity in pairs(enemies) do
              entity.destroy()
            end
          end

          -- Fix mapgen
          Zone.apply_flags_to_controls(zone)
        end
      end
    end
  end,

  ["0.6.109"] = function()
    -- stop tracking non-SE linked containers
    if global.linked_containers then
      for unit_number, linked_container in pairs(global.linked_containers) do
        if not linked_container.container or not linked_container.container.valid or linked_container.container.name ~= "se-linked-container" then
          global.linked_containers[unit_number] = nil
        end
      end
    end

    -- update elevator EEI capacity values and dis/connect wires if they must be
    global.tick_tasks = global.tick_tasks or {}
    global.next_tick_task_id = global.next_tick_task_id or 1
    if global.space_elevators then
      for _, struct in pairs(global.space_elevators) do
        if struct.is_primary then
          if struct.lua_energy and struct.energy_interface and struct.opposite_struct.energy_interface then -- redistribute power from lua_energy into the EEI's
            if struct.energy_interface.valid and struct.opposite_struct.energy_interface.valid then
              struct.energy_interface.electric_buffer_size = SpaceElevator.interface_energy_buffer
              struct.opposite_struct.energy_interface.electric_buffer_size = SpaceElevator.interface_energy_buffer
              struct.energy_interface.energy = math.max(struct.energy_interface.energy + struct.lua_energy / 2, 0)
              struct.opposite_struct.energy_interface.energy = math.max(
                struct.energy_interface.energy + struct.lua_energy / 2, 0)
              struct.lua_energy = 0;
            end
          end
          if struct.electric_pole and struct.opposite_struct.electric_pole then
            if struct.electric_pole.valid and struct.opposite_struct.electric_pole.valid then
              --remember connections
              local p_pole_neighbors = struct.electric_pole.neighbours
              local s_pole_neighbors = struct.opposite_struct.electric_pole.neighbours
              local p_pole_connect_neighbours = {}
              local s_pole_connect_neighbours = {}
              for _, entity in pairs(p_pole_neighbors.copper) do
                if entity.valid and not (entity.type == "power-switch") then
                  table.insert(p_pole_connect_neighbours, { target_entity = entity, wire = defines.wire_type.copper })
                else
                  local switch_neighbors = entity.neighbours.copper
                  if switch_neighbors[1] ~= nil then
                    if switch_neighbors[1].unit_number == struct.electric_pole.unit_number then
                      table.insert(p_pole_connect_neighbours,
                        {
                          target_entity = entity,
                          wire = defines.wire_type.copper,
                          target_wire_id = defines.wire_connection_id.power_switch_left,
                          bruh = "power_switch"
                        })
                    end
                  end
                  if switch_neighbors[2] ~= nil then
                    if switch_neighbors[2].unit_number == struct.electric_pole.unit_number then
                      table.insert(p_pole_connect_neighbours,
                        {
                          target_entity = entity,
                          wire = defines.wire_type.copper,
                          target_wire_id = defines.wire_connection_id.power_switch_right,
                          bruh = "power_switch"
                        })
                    end
                  end
                end
              end
              for _, entity in pairs(s_pole_neighbors.copper) do
                if entity.valid and not (entity.type == "power-switch") then
                  table.insert(s_pole_connect_neighbours, { target_entity = entity, wire = defines.wire_type.copper })
                else
                  local switch_neighbors = entity.neighbours.copper
                  if switch_neighbors[1] ~= nil then
                    if switch_neighbors[1].unit_number == struct.opposite_struct.electric_pole.unit_number then
                      table.insert(s_pole_connect_neighbours,
                        {
                          target_entity = entity,
                          wire = defines.wire_type.copper,
                          target_wire_id = defines.wire_connection_id.power_switch_left,
                          bruh = "power_switch"
                        })
                    end
                    if switch_neighbors[2] ~= nil then
                      if switch_neighbors[2].unit_number == struct.opposite_struct.electric_pole.unit_number then
                        table.insert(s_pole_connect_neighbours,
                          {
                            target_entity = entity,
                            wire = defines.wire_type.copper,
                            target_wire_id = defines.wire_connection_id.power_switch_right,
                            bruh = "power_switch"
                          })
                      end
                    end
                  end
                end
              end
              util.concatenate_tables(p_pole_connect_neighbours, struct.electric_pole.circuit_connection_definitions)
              util.concatenate_tables(s_pole_connect_neighbours,
                struct.opposite_struct.electric_pole.circuit_connection_definitions)
              --destroy the poles
              struct.electric_pole.destroy();
              struct.opposite_struct.electric_pole.destroy()
              local new_p_pole = struct.surface.create_entity { --rebuild to get game to connect to nearest poles
                name = "se-space-elevator-energy-pole",
                position = struct.position, struct.position,
                direction = defines.direction.north,
                force = struct.force_name,
                create_build_effect_smoke = false
              }
              ---@cast new_p_pole -?
              local new_s_pole = struct.opposite_struct.surface.create_entity {
                name = "se-space-elevator-energy-pole",
                position = struct.opposite_struct.position,
                direction = defines.direction.north,
                force = struct.force_name,
                create_build_effect_smoke = false
              }
              ---@cast new_s_pole -?
              local new_switch = struct.surface.create_entity { -- the elevator now has a power switch too
                name = "se-space-elevator-power-switch",
                position = struct.position, struct.position,
                direction = defines.direction.north,
                force = struct.force_name,
                create_build_effect_smoke = false
              }
              ---@cast new_switch -?
              new_switch.power_switch_state = true
              struct.power_switch = new_switch
              struct.electric_pole = new_p_pole
              struct.opposite_struct.electric_pole = new_s_pole
              --reconnect circuit wires and copper wires
              for _, connect_info in pairs(p_pole_connect_neighbours) do
                if connect_info.target_entity.valid then 
                  struct.electric_pole.connect_neighbour(connect_info) 
                end
              end
              for _, connect_info in pairs(s_pole_connect_neighbours) do
                if connect_info.target_entity.valid then
                  struct.opposite_struct.electric_pole.connect_neighbour(connect_info)
                end
              end
              --connect the ends together
              if struct.built then
                SpaceElevator.connect_wires(struct)
              else
                SpaceElevator.disconnect_wires(struct)
              end
            end
          end
        end
      end
      local tick_task = new_tick_task("game-message") --[[@as GameMessageTickTask]]
      tick_task.message =
      "[img=utility/warning_icon] [color=255,255,0]Space elevators [img=item/se-space-elevator] now require wired connections to transfer power.\nPlease check your elevators if you rely on them for power.[/color]"
      tick_task.delay_until = game.tick + 3 * 60;
    end

    -- Disable vanilla win
    if remote.interfaces["silo_script"] and remote.interfaces["silo_script"]["set_no_victory"] then
      remote.call("silo_script", "set_no_victory", true)
    end

    ---@class global
    ---@field package rng any DEPRECIATED
    -- Renamed global.rng to global.universe_rng
    global.universe_rng = global.rng
    global.rng = nil
  end,

  ["0.6.113"] = function()
    -- Fix zone controls for biter-less special zones sometimes still having vitamelange
    -- Only for non-generated surfaces, existing surrfaces can be fixed optionally with /se-migration-remove-vita-from-special-zones
    for _, zone in pairs(global.zone_index) do
      if zone.special_type and zone.special_type ~= "vitamelange" and not zone.surface_index then
        zone.controls["se-vitamelange"] = {frequency = 0, size = -1, richness = -1}
      end
    end
  end,

  ["0.6.117"] = function()
    -- Recreate all core seams to fix potential rounding error
    -- https://forums.factorio.com/viewtopic.php?f=47&t=104138
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    for _, zone in pairs(global.zone_index) do
      if zone.type == "planet" or zone.type == "moon" then
        ---@cast zone PlanetType|MoonType
        CoreMiner.reset_seams(zone)
      end
    end
  end,

  ["0.6.118"] = function()
    -- cache the watch areas and filters of exiting elevators
    if global.space_elevators then
      for _, struct in pairs(global.space_elevators) do
        struct.watch_area = Util.area_add_position(SpaceElevator.space_elevator_watch_rect[struct.direction], struct.position)
        struct.output_area = Util.area_add_position(SpaceElevator.space_elevator_output_rect[struct.direction], struct.position)
        struct.force_forward_area = Util.area_add_position(SpaceElevator.space_elevator_force_forward_rect, struct.position)
      end
    end

    -- make new global for existing games, if necessary
    global.cache_rocket_fuel_cost = global.cache_rocket_fuel_cost or {}

    -- close all the GUIs impacted by the changes to refactor the dropdown / search into a common component
    -- not sure if it's necessary but it doesn't hurt to do so out of an abundance of caution
    for _, player in pairs(game.players) do
      if player then
        DeliveryCannonGUI.gui_close(player)
        LaunchpadGUI.gui_close(player)
        LandingpadGUI.gui_close(player)
        SpaceshipGUI.gui_close(player)
      end
    end

    -- Delivery cannons switch to mode based operation
    -- Converts existing is_off and auto_select_targets into modes
    -- This doesn't migrate entity tags on blueprints so deserializing blueprinted delivery cannons must maintain knowledge of these separate settings
    for _, delivery_cannon in pairs(global.delivery_cannons) do
      delivery_cannon.mode = DeliveryCannon.mode_for_individual_settings(delivery_cannon.is_off, delivery_cannon.auto_select_targets)
    end
    -- Adds the new global table for tracking delivery cannon artillery queues
    global.delivery_cannon_queues = {}
  end,

  ["0.6.121"] = function()

    if script.active_mods["Krastorio2"] then

      game.print({"space-exploration.migrate_0_6_121"})

      -- Research techs for the Advanced Catalogue and Broad Advanced Catalogue if the Science Packs are already researched.
      for _, force in pairs(game.forces) do
        if force.technologies["kr-advanced-tech-card"].researched then
          force.technologies["se-kr-advanced-catalogue-1"].researched = true
        end
        if force.technologies["kr-singularity-tech-card"].researched then
          force.technologies["se-kr-advanced-catalogue-2"].researched = true
        end
      end

      -- Remove Gravimetrics facility entities performing the old Singularity Card recipes and place their contents in a box.
      for _, surface in pairs(game.surfaces) do
        local grav_facs = surface.find_entities_filtered{name="se-space-gravimetrics-laboratory"}
        for _, grav_fac in pairs(grav_facs) do
          local recipe = grav_fac.get_recipe()
          if recipe and (recipe.name == "singularity-tech-card" or recipe.name == "singularity-tech-card-alt") then
            local position = table.deepcopy(grav_fac.position)
            local force = grav_fac.force
            local temp_inv = game.create_inventory(30)

            grav_fac.mine{
              inventory = temp_inv,
              raise_destroy = true
            }
            local migration_container = surface.create_entity{
              name="iron-chest",
              position=position,
              force=force,
              raise_built=true
            }
            if migration_container then
              local inventory = migration_container.get_inventory(defines.inventory.chest)
              if inventory then
                for inv_item, item_count in pairs(temp_inv.get_contents()) do
                  inventory.insert({name=inv_item, count=item_count})
                end
                temp_inv.destroy()
              else
                log("Migration failed for surface " .. surface.name .. " location x: " .. position.x .. " y: " .. position.y)
                for inv_item, item_count in pairs(temp_inv.get_contents()) do
                  log("Item lost: " .. inv_item .. " count: " .. item_count)
                end
              end
            end
          end
        end
      end

      -- Avoid deleting efficiency modules in new recipes that disallow them
      replace_dummy_recipes({"kr-atmospheric-condenser", "kr-electrolysis-plant"})
    end
  end,

  ["0.6.122"] = function()
    -- Avoid deleting efficiency modules in new recipes that disallow them
    if script.active_mods["Krastorio2"] then
      replace_dummy_recipes({"kr-atmospheric-condenser-_-waterless"})
    end

    -- spaceships could have docked but updated one last time causing them to think they were still flying
    for _, ss in pairs(global.spaceships) do
      if not Spaceship.is_on_own_surface(ss) then
        -- if its docked, it shouldn't be flagged as moving
        if ss.speed ~= 0 or ss.is_moving then
          log("Fixing spaceship combinator: "..ss.name)
          ss.speed = 0
          ss.is_moving = false
          Spaceship.update_output_combinator(ss, game.tick)
        end
      end
    end

    -- find and re-register any landing or launch pads that may have been lost due to
    -- abandoning a spaceship with the same index as a zone
    for _, zone in pairs(global.zone_index) do
      local surface = Zone.get_surface(zone)
      if surface then
        for _, entity in pairs(surface.find_entities_filtered{name=Landingpad.name_rocket_landing_pad}) do
          if not global.rocket_landing_pads[entity.unit_number] then
            log("Re-registering landing pad on "..surface.name..":"..entity.unit_number)
            Landingpad.on_entity_created({
              entity = entity,
              tick = game.tick,
            })
          end
        end
        for _, entity in pairs(surface.find_entities_filtered{name=Launchpad.name_rocket_launch_pad}) do
          if not global.rocket_launch_pads[entity.unit_number] then
            log("Re-registering launch pad on "..surface.name..":"..entity.unit_number)
            Launchpad.on_entity_created({
              entity = entity,
              tick = game.tick,
            })
          end
        end
      end
    end

    -- indestructible space elevator power switch
    for _, zone in pairs(global.zone_index) do
      local surface = Zone.get_surface(zone)
      if surface then
        for _, entity in pairs(surface.find_entities_filtered{name="se-space-elevator-power-switch"}) do
          if entity.destructible then
            log("Marking power switch destructible on "..surface.name..": "..entity.unit_number)
            entity.destructible = false
          end
        end
      end
    end
  end,

  ["0.6.123"] = function()
    -- Correct special type "imersite" being set when Krastorio2 is not active
    if not game.active_mods["Krastorio2"] then
      for _, zone in pairs(global.zone_index) do
        if    zone.special_type
          and zone.special_type == "imersite"
        then
          zone.special_type = nil
        end
      end
    end
  end,

  ["0.6.124"] = function ()
    -- Enable the Spaceship Victory tech when Krastorio 2 is enabled
    global.tick_tasks = global.tick_tasks or {}
    global.next_tick_task_id = global.next_tick_task_id or 1
    Krastorio2.enable_spaceship_victory_tech_on_migrate()
  end,

  ["0.6.127"] = function()
    --recondense any tables that might have holes in their index
    global.spaceships = global.spaceships or {}
    for _, spaceship in pairs(global.spaceships) do
      if spaceship.particles then
        local particles = {}
        for _, particle in pairs(spaceship.particles) do
          table.insert(particles, particle)
        end
        spaceship.particles = particles
      end

      if spaceship.entity_particles then
        local entity_particles = {}
        for _, entity_particle in pairs(spaceship.entity_particles) do
          table.insert(entity_particles, entity_particle)
        end
        spaceship.entity_particles = entity_particles
      end

      if spaceship.engines then
        local engines = {}
        for _, engine in pairs(spaceship.engines) do
          table.insert(engines, engine)
        end
        spaceship.engines = engines
      end
    end

    if global.simulation_spaceships then -- Sim save files
      for _, spaceship in pairs(global.simulation_spaceships) do
        if spaceship.particles then
          local particles = {}
          for _, particle in pairs(spaceship.particles) do
            table.insert(particles, particle)
          end
          spaceship.particles = particles
        end

        if spaceship.entity_particles then
          local entity_particles = {}
          for _, entity_particle in pairs(spaceship.entity_particles) do
            table.insert(entity_particles, entity_particle)
          end
          spaceship.entity_particles = entity_particles
        end

        if spaceship.engines then
          local engines = {}
          for _, engine in pairs(spaceship.engines) do
            table.insert(engines, engine)
          end
          spaceship.engines = engines
        end
      end
    end

    -- Beacon overload optimizations
    global.beacon_overloaded_entities = global.beacon_overloaded_entities or {}
    global.beacon_overloaded_shapes = global.beacon_overloaded_shapes or {}
  end,

  ["0.6.130"] = function()
    -- Fix mismatched own_surface_index and own_surface
    for _, spaceship in pairs(global.spaceships) do
      if spaceship.own_surface_index then
        spaceship.own_surface = game.get_surface(spaceship.own_surface_index)
      else
        spaceship.own_surface = nil
      end
    end
  end,

  ["0.6.131"] = function()
    -- globals moved to on_init
    global.playerdata = global.playerdata or {}
    global.tick_tasks = global.tick_tasks or {}
    global.next_tick_task_id = global.next_tick_task_id or 1
    global.forces = global.forces or {}
    global.glyph_vaults = global.glyph_vaults or {}
    global.glyph_vaults_made_loot = global.glyph_vaults_made_loot or {}
    global.gravimetrics_labs = global.gravimetrics_labs or {}
    global.core_seams_by_registration_number = global.core_seams_by_registration_number or {}
    global.delivery_cannon_payloads = global.delivery_cannon_payloads or {}
    global.dimensional_anchors = global.dimensional_anchors or {}
    global.energy_beam_target_zones = global.energy_beam_target_zones or {}
    global.energy_transmitters = global.energy_transmitters or {}
    global.rocket_landing_pads = global.rocket_landing_pads or {}
    global.linked_containers = global.linked_containers or {}
    global.meteor_showers = global.meteor_showers or {}
    global.nexus = global.nexus or {}
    global.ruins = global.ruins  or {}
    global.space_elevators = global.space_elevators or {}
    global.spaceship_projectile_speeds = global.spaceship_projectile_speeds or {}
    global.spaceships = global.spaceships or {}
    global.train_gui_trains = global.train_gui_trains or {}
    global.zones_by_surface = global.zones_by_surface or {}
    global.cache_travel_delta_v = global.cache_travel_delta_v or {}
    global.chart_tag_buffer = global.chart_tag_buffer or {}
    global.chart_tag_next_id = global.chart_tag_next_id or 0
    ---@class global
    ---@field package next_meteor_shower any DEPRECIATED
    global.next_meteor_shower = nil
    ---@class global
    ---@field package astronomical any DEPRECIATED
    global.astronomical = nil
    global.space_capsules = global.space_capsules or {}
    global.vault_loot_rng = global.vault_loot_rng or game.create_random_generator()
    global.next_spaceship_index = global.next_spaceship_index or 1
    if not global.core_mining then CoreMiner.create_core_mining_tables() end

    -- migrate arty40 entities
    if global.ruins and global.ruins["arty40"] then
      local global_ruins = global.ruins["arty40"]
      global_ruins.accumulators = global_ruins.accumulators or {}
      global_ruins.burner_turbine_generators = global_ruins.burner_turbine_generators or {}
      global_ruins.logistic_chest_buffers = global_ruins.logistic_chest_buffers or {}
      if global_ruins.zone_index then
        local zone = Zone.from_zone_index(global_ruins.zone_index)
        if zone and zone.surface_index then
          local surface = game.get_surface(zone.surface_index)
          if surface then
            local accumulators = surface.find_entities_filtered{type="accumulator", force="conquest"}
            for _, entity in pairs(accumulators) do
              global_ruins.accumulators[entity] = true
            end
            local gens = surface.find_entities_filtered{name="burner-turbine-generator", force="conquest"}
            for _, entity in pairs(gens) do
              global_ruins.burner_turbine_generators[entity] = true
            end
            local buffers = surface.find_entities_filtered{name="logistic-chest-buffer", force="conquest"}
            for _, entity in pairs(buffers) do
              global_ruins.logistic_chest_buffers[entity] = true
            end
            local tanks = surface.find_entities_filtered{name="storage-tank", force="conquest"}
            global_ruins.petrol_tank = tanks[1]
          end
        end
      end
    end

    -- Fix typoed `unit_unber` reference
    if global.gravimetrics_labs then
      for _, lab in pairs(global.gravimetrics_labs) do
        if lab.unit_unber then
          lab.unit_number = lab.unit_unber
          lab.unit_unber = nil
        end
      end
    end
    if global.nexus then
      for _, nexus in pairs(global.nexus) do
        if nexus.unit_unber then
          nexus.unit_number = nexus.unit_unber
          nexus.unit_unber = nil
        end
      end
    end

    -- Fix arty40 losing its tech
    if global.ruins and global.ruins["arty40"] then
      if Ruin.ruins["arty40"] and Ruin.ruins["arty40"].prebuild then
        Ruin.ruins["arty40"].prebuild()
      end
    end
  end,

  ["0.6.132"] = function()
    -- Reset conquest tech (could be inflated from recreating the ruin multiple times)
    local conquest = game.forces["conquest"]
    conquest.reset() -- Will trigger SystemForces.setup_system_forces()
  end,

  ["0.6.134"] = function()
    --Init `global.train_gui_trains` due to games being started without it.
    global.train_gui_trains = global.train_gui_trains or {}
  end,

  ["0.6.135"] = function()
    local meteor_names = {
      "se-static-meteor-01",
      "se-static-meteor-02",
      "se-static-meteor-03",
      "se-static-meteor-04",
      "se-static-meteor-05",
      "se-static-meteor-06",
      "se-static-meteor-07",
      "se-static-meteor-08",
      "se-static-meteor-09",
      "se-static-meteor-10",
      "se-static-meteor-11",
      "se-static-meteor-12",
      "se-static-meteor-13",
      "se-static-meteor-14",
      "se-static-meteor-15",
      "se-static-meteor-16",
    }

    -- Mark any meteors that collide with player structures for deconstruction
    for _, surface in pairs(game.surfaces) do
      for _, meteor in pairs(surface.find_entities_filtered{name=meteor_names}) do
        colliding_area = Util.area_add_position(meteor.prototype.collision_box, meteor.position)
        for _, entity in pairs(surface.find_entities_filtered{area=colliding_area}) do
            if not SystemForces.is_system_force(entity.force.name) then
              meteor.order_deconstruction(entity.force)
              break
            end
        end
      end
    end

    -- Clean up any orphan poles that might be stuck to spaceships. This will not fix broken
    -- clamps themselves. The player will have to pick it up and place it down again.
    for _, surface in pairs(game.surfaces) do
      for _, pole in pairs(surface.find_entities_filtered{ name = {
        "se-spaceship-clamp-power-pole-external-east",
        "se-spaceship-clamp-power-pole-external-west"
      }}) do
        if not surface.find_entity("se-spaceship-clamp", pole.position) then
          pole.destroy()
        end
      end
    end

    for _, spaceships in pairs({
      global.spaceships or {},
      global.simulation_spaceships or { },
    }) do
      for _, spaceship in pairs(spaceships) do
        if spaceship.console and spaceship.console.valid then
          -- Spaceships that do not have a console can only happen if the mod
          -- is updated after a landed console is destroyed, and before its next update.
          -- This case is handled in the `on_post_entity_died` event.
          spaceship.last_console_unit_number = spaceship.console.unit_number
        end
      end
    end
  end
}

Migrate.test_migrations = {
  --[[
  --Add migrations for testing in the following format with a custom named key.
  --When ready for release, change the name to the current version number and move to Migration.migrations above.
  ["My debug migrations"] = function()
    do_stuff()
  end,
  --]]

}

return Migrate
