mod_gui = require("__core__/lualib/mod-gui")
core_util = require("__core__/lualib/util.lua") -- adds table.deepcopy
collision_mask_util_extended = require("__space-exploration__/collision-mask-util-extended/control/collision-mask-util-control")

local mod_display_name = "Space Exploration"

-- Set to false automatically by the build script
is_debug_mode = false
-- Has to be set manually for now
is_closed_testing = false


Util = require("scripts/util") util = Util
sha2 = require('scripts/sha2')
Essential = require('scripts/essential')

Log = require('scripts/log')
Event = require('scripts/event')
Profiler = require( 'scripts/profiler')
Queue = require('scripts/queue')

Watermark = require('scripts/watermark')

Shared = require("shared")
GuiCommon = require("scripts/gui-common")
UniverseRaw = require("scripts/universe-raw")
UniverseLegacy = require("scripts/universe-legacy")
UniverseHomesystem = require("scripts/universe-homesystem")
Universe = require("scripts/universe")
Location = require('scripts/location')
Pin = require('scripts/pin')
RemoteView = require('scripts/remote-view')
RemoteViewGUI = require('scripts/remote-view-gui')
Spectator = require('scripts/spectator')
SpaceshipObstacles = require('scripts/spaceship-obstacles')
MapView = require( 'scripts/map-view')
Respawn = require('scripts/respawn')
RelativeGUI = require('scripts/relative-gui') -- must be included before all relative guis
Launchpad = require('scripts/launchpad')
LaunchpadGUI = require('scripts/launchpad-gui')
Landingpad = require('scripts/landingpad')
LandingpadGUI = require('scripts/landingpad-gui')
Capsule = require('scripts/capsule')
CapsuleGUI = require('scripts/capsule-gui')
Zone = require('scripts/zone')
Zonelist = require('scripts/zonelist')
Weapon = require('scripts/weapon')
Medpack = require('scripts/medpack')
SpaceshipClamp = require('scripts/spaceship-clamp')
SpaceshipClone = require('scripts/spaceship-clone')
Spaceship = require('scripts/spaceship')
SpaceshipGUI = require('scripts/spaceship-gui')
CoreMiner = require('scripts/core-miner')
CondenserTurbine = require('scripts/condenser-turbine')
BigTurbine = require('scripts/big-turbine')
Meteor = require('scripts/meteor')
Beacon = require('scripts/beacon')
Lifesupport = require('scripts/lifesupport')
DeliveryCannon = require('scripts/delivery-cannon')
DeliveryCannonGUI = require('scripts/delivery-cannon-gui')
Composites = require('scripts/composites')
EnergyBeam = require('scripts/energy-beam')
EnergyBeamGUI = require('scripts/energy-beam-gui.lua')
EnergyBeamDefence = require('scripts/energy-beam-defence')
SolarFlare = require('scripts/solar-flare')
Nexus = require('scripts/nexus')
Arco = require('scripts/arco')
Interburbulator = require('scripts/interburbulator')
LinkedContainer = require('scripts/linked-container')
SpaceElevator = require('scripts/space-elevator')
SpaceElevatorGUI = require('scripts/space-elevator-gui')
TrainGUI = require('scripts/train-gui')
Blueprint = require('scripts/blueprint')
Scanner = require('scripts/scanner')
Tech = require('scripts/tech')
EntitySwap = require('scripts/entity-swap')
BlueprintConverter = require('scripts/blueprint-converter')

Ancient = require('scripts/ancient')
DAnchor = require('scripts/dimensional-anchor')
Ruin = require('scripts/ruin')

Informatron = require('scripts/informatron')

require('scripts/compatibility/miniloaders')
EntityMove = require('scripts/compatibility/entity-move')
AbandonedRuins = require('scripts/compatibility/abandoned-ruins')
Command = require('scripts/commands')
Krastorio2 = require('scripts/compatibility/krastorio2')

Migrate = require('scripts/migrate')

sp_tile_scaffold = mod_prefix.."space-platform-scaffold"
sp_tile_plate = mod_prefix.."space-platform-plating"
name_space_tile = mod_prefix.."space"
name_out_of_map_tile = "out-of-map"
space_tiles = {
  name_space_tile
}
name_asteroid_tile = mod_prefix.."asteroid"
name_land_fallback_tile = "nuclear-ground"

tiles_only_allowed_in_space = {
  name_space_tile,
  name_asteroid_tile,
  sp_tile_scaffold,
  sp_tile_plate,
}

tiles_allowed_everywhere = {
  name_out_of_map_tile,
  mod_prefix .. "spaceship-floor",
  "transport-drone-road", -- Transport Drone mod
  "transport-drone-road-better",
  "transport-drone-proxy-tile",
}

-- tiles_allowed_in_space = tiles_only_allowed_in_space + tiles_allowed_everywhere
tiles_allowed_in_space = table.deepcopy(tiles_only_allowed_in_space)
Util.concatenate_tables(tiles_allowed_in_space, tiles_allowed_everywhere)

name_fluid_rocket_fuel = mod_prefix.."liquid-rocket-fuel"
name_thermofluid_hot = mod_prefix.."space-coolant-hot"
name_thermofluid_supercooled = mod_prefix.."space-coolant-supercooled"
name_suffix_spaced = "-spaced"
name_suffix_grounded = "-grounded"

name_thruster_suits = {
  mod_prefix.."thruster-suit",
  mod_prefix.."thruster-suit-2",
  mod_prefix.."thruster-suit-3",
  mod_prefix.."thruster-suit-4",
}
base_space_thrust = 1
thruster_suit_thrust = {
  [mod_prefix.."thruster-suit"] = 2,
  [mod_prefix.."thruster-suit-2"] = 3,
  [mod_prefix.."thruster-suit-3"] = 4,
  [mod_prefix.."thruster-suit-4"] = 5,
}

first_starting_item_stacks = {
  {name = mod_prefix.."medpack", count = 5},
  {name = mod_prefix.."capsule-"..Weapon.name_biter_friend, count = 1},
}
starting_item_stacks = {
  {name = mod_prefix.."medpack", count = 1}
}

suffocation_interval = 120

system_forces = core_util.list_to_map{
  "enemy",
  "neutral",
  "capture",
  "conquest",
  "ignore",
  "friendly",
  "kr-internal-turrets"  -- Krastorio 2 tesla coils and planetary teleporters
}
protected_system_forces = core_util.list_to_map{"capture", "conquest", "friendly"}

collision_player = mod_prefix.."collision-player"
collision_player_not_space = mod_prefix.."collision-player-not-space"
collision_rocket_destination_surface = mod_prefix.."collision-rocket-destination-surface"
collision_rocket_destination_orbit = mod_prefix.."collision-rocket-destination-orbital"

---Warns the player if playing a non-freeplay scenario.
---@return boolean@Whether we warned or not.
local function warn_for_non_freeplay_scenario()
  local scenario_name = script.level.level_name
  if scenario_name ~= "freeplay" and not is_testing_game() then
    local specific_line = ""
    if scenario_name == "sandbox" then
      specific_line = {"", "\n", {"space-exploration.warn_scenario_sandbox"}}
    elseif scenario_name == "pvp" then
      specific_line = {"", "\n", {"space-exploration.warn_scenario_pvp"}}
    end
    local tick_task = new_tick_task("game-message") --[[@as GameMessageTickTask]]
    tick_task.message = {"space-exploration.warn_scenario_generic", specific_line}
    tick_task.delay_until = game.tick + 180 --3s
    return true
  end
  return false
end

---Checks evolution settings. If they are harder than the SE defaults preset, warns the player.
local function warn_for_nondefault_settings()
  for evolution_factor, value in pairs(Shared.se_default_mapgen.advanced_settings.enemy_evolution) do
    if game.map_settings.enemy_evolution[evolution_factor] > value then
      local tick_task = new_tick_task("game-message") --[[@as GameMessageTickTask]]
      tick_task.message = {"space-exploration.warn_nondefault_mapgen", {"map-gen-preset-name.space-exploration"}}
      tick_task.delay_until = game.tick + 3600 --60s
      break
    end
  end
end

---Gets PlayerData table for a given player or creates an empty one if it doesn't exist
---@param player LuaPlayer
---@return PlayerData
function get_make_playerdata(player)
  local player_index = player.index
  global.playerdata = global.playerdata or {}
  global.playerdata[player_index] = global.playerdata[player_index] or {}
  return global.playerdata[player_index]
end

---@param player LuaPlayer
---@param key string
---@param values any[]
function player_set_dropdown_values(player, key, values)
   local playerdata = get_make_playerdata(player)
   playerdata.dropdown_values = playerdata.dropdown_values or {}
   playerdata.dropdown_values[key] = values
end

---@param player LuaPlayer
---@param key any
---@param index any
---@return any?
function player_get_dropdown_value(player, key, index)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values and playerdata.dropdown_values[key] then
     return playerdata.dropdown_values[key][index]
   end
end

---@param player LuaPlayer
---@param key string
---@return any
function player_get_dropdown_values(player, key)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values and playerdata.dropdown_values[key] then
     return playerdata.dropdown_values[key]
   end
end

---@param player LuaPlayer
---@param key string
function player_clear_dropdown_values(player, key)
   local playerdata = get_make_playerdata(player)
   if playerdata.dropdown_values then playerdata.dropdown_values[key] = nil end
end

---@param player LuaPlayer
function player_clear_all_dropdown_values(player)
   local playerdata = get_make_playerdata(player)
   playerdata.dropdown_values = nil
end

---Gets the player character, even if player is using a non-character controller.
---@param player LuaPlayer
---@return LuaEntity? character
function player_get_character(player)
  if player.character then return player.character end
  local playerdata = get_make_playerdata(player)
  if playerdata.character then
    if playerdata.character.valid then
      return playerdata.character
    else
      playerdata.character = nil
    end
  end
end

-- creation must contain position
-- returns entity, position
---@param surface LuaSurface
---@param creation LuaSurface.create_entity_param
---@param radius number
---@param precision number
---@return LuaEntity?
---@return MapPosition?
function create_non_colliding(surface, creation, radius, precision)
    radius = radius or 32
    precision = precision or 1
    local try_pos = creation.position
    local safe_pos = surface.find_non_colliding_position(creation.name, try_pos, radius, precision) or try_pos
    creation.position = safe_pos
    return surface.create_entity(creation), safe_pos
end

-- returns entity, position
---@param entity LuaEntity
---@param position MapPosition
---@param radius? number
---@param precision? number
---@return LuaEntity?
---@return MapPosition?
function teleport_non_colliding(entity, position, radius, precision)
  if entity then
    radius = radius or 32
    precision = precision or 1
    local try_pos = position
    local safe_pos = entity.surface.find_non_colliding_position(entity.name, try_pos, radius, precision) or try_pos
    entity.teleport(safe_pos)
    return entity, safe_pos
  end
end

---@param player LuaPlayer
---@param position MapPosition
---@param surface? LuaSurface
---@param radius? number
---@param precision number
---@return LuaPlayer
---@return MapPosition
function teleport_non_colliding_player(player, position, surface, radius, precision)
  surface = surface or player.surface
  radius = radius or 32
  precision = precision or 1
  local try_pos = position
  local safe_pos = surface.find_non_colliding_position(player.character.name, try_pos, radius, precision) or try_pos
  player.teleport(safe_pos, surface)
  Log.debug_log("Teleported " .. player.name .. " to " .. serpent.line(safe_pos))
  return player, safe_pos
end

---Teleports a character to a given surface, preferably at the given position.
---@param character LuaEntity Character to be teleported
---@param surface LuaSurface Surface that character is to be teleported to
---@param position MapPosition Position that character is to be teleported to
---@return LuaEntity? character
---@return MapPosition safe_position
function teleport_character_to_surface(character, surface, position)
  local try_pos = position
  local safe_pos = surface.find_non_colliding_position(character.name, try_pos, 32, 1) or try_pos
  if surface == character.surface then
    -- easy
    character.teleport(safe_pos)
    return character, safe_pos
  end
  local zone = Zone.from_surface(surface)
  if zone and zone.type ~= "spaceship" then
    ---@cast zone -SpaceshipType
    Zone.discover(character.force.name, zone)
  end
  local player = character.player
  if player then
    -- use the player to do it
    player.teleport(safe_pos, surface) -- surface change breaks character reference
    local playerdata = get_make_playerdata(player)
    return player.character, safe_pos
  end

  -- attach a player to do it
  for player_index, playerdata in pairs(global.playerdata) do
    local player = game.get_player(player_index)
    if player and player.connected then
      if (not player.character) and playerdata.character and playerdata.character == character then
        local player_pos = player.position
        local player_surface = player.surface
        local controller_type = player.controller_type
        if playerdata.remote_view_active then
          RemoteView.persist_inventory(player)
        end
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
        player.teleport(safe_pos, surface) -- surface change breaks character reference
        playerdata.character = player.character
        player.set_controller{type = controller_type}
        --player.set_controller{type = defines.controllers.spectator}
        player.teleport(player_pos, player_surface)
        if playerdata.remote_view_active then
          RemoteView.restore_inventory(player)
        end
        Log.debug("character moved by reassociation")
        return playerdata.character, safe_pos
      end
    end
  end

  -- clone the character and destroy the original
  -- what could possibly go wrong?
  surface.clone_entities{
    entities = {character},
    destination_offset = util.vectors_delta(character.position, safe_pos),
    destination_surface = surface,
    destination_force = character.force,
    snap_to_grid = false
  }
  local candidate = surface.find_entity(character.name, safe_pos)
  if candidate and candidate.player == nil
    and candidate.color.r == character.color.r
    and candidate.color.g == character.color.g
    and candidate.color.b == character.color.b then
      candidate.teleport(safe_pos)
      for player_index, playerdata in pairs(global.playerdata) do
        if playerdata.character and playerdata.character == character then
          playerdata.character = candidate
        end
      end
      character.destroy()
      Log.debug("character moved by cloning")
      return candidate, safe_pos
  end
  local candidates = surface.find_entities_filtered{
    type = character.type,
    name = character.name,
    force = character.force
  }
  for _, candidate in pairs(candidates) do
    if candidate.player == nil
      and candidate.color.r == character.color.r
      and candidate.color.g == character.color.g
      and candidate.color.b == character.color.b then
        candidate.teleport(safe_pos)

        for player_index, playerdata in pairs(global.playerdata) do
          if playerdata.character and playerdata.character == character then
            playerdata.character = candidate
          end
        end
        character.destroy()
        Log.debug("character moved by cloning")
        return candidate, safe_pos
    end
  end

  Log.debug("character move by cloning but failed")
  -- failed
  return nil, safe_pos
end

---Teleports a character to a given surface, in a non-colliding position near the given position.
---@param character LuaEntity Character entity, _must be valid_
---@param surface LuaSurface Target surface, _must be valid_
---@param position MapPosition Target position
---@param ignore_collision? boolean Whether to try searching for a non-colliding position. Defaults to false.
---@return LuaEntity character
---@return MapPosition position
function teleport_character_to_surface_2(character, surface, position, ignore_collision)
  if not ignore_collision then
    position = surface.find_non_colliding_position(character.name, position, 32, 1) or position
  end

  -- Simplest case, teleport character and escape
  if surface == character.surface then
    character.teleport(position)
    return character, position
  end

  -- Trigger zone discovery if appropriate
  local zone = Zone.from_surface(surface)
  if zone and zone.type ~= "spaceship" then
    ---@cast zone -SpaceshipType
    Zone.discover(character.force.name, zone)
  end

  -- If character associated with player, teleport the player, then update character reference
  if character.player then
    local player = character.player
    player.teleport(position, surface)
    character = player.character
  else
    -- Stash character in a vehicle and teleport the vehicle
    local vehicle = character.surface.create_entity{
      name = Spectator.name_seat,
      position = character.position,
      force = character.force
    }
    ---@cast vehicle -?
    vehicle.set_driver(character)
    vehicle.teleport(position, surface)
    character = vehicle.get_driver()
    ---@cast character -LuaPlayer
    vehicle.destroy() -- Driver will be ejected
    character.teleport(position) -- Character is teleported to the desired position
  end

  return character, position
end

---Teleports a vehicle to a given surface/position, updating `PlayerData` character references for
---any driver/passenger inside.
---@param vehicle LuaEntity Vehicle to teleport
---@param surface LuaSurface Surface to teleport vehicle to
---@param position MapPosition Position to teleport vehicle to
---@param raise_event boolean Raise script_raised_teleport event if true, default true
function teleport_vehicle_to_surface(vehicle, surface, position, raise_event)
  if raise_event == nil then
    raise_event = true
  end
  if surface == vehicle.surface then
    vehicle.teleport(position, surface, raise_event)
  else
    local driver = vehicle.get_driver()
    local passenger = vehicle.get_passenger()
    local driver_playerdata, passenger_playerdata

    if driver and not driver.is_player() then
      for _, playerdata in pairs(global.playerdata) do
        if playerdata.character == driver then
          driver_playerdata = playerdata
          break
        end
      end
    end

    if passenger and not passenger.is_player() then
      for _, playerdata in pairs(global.playerdata) do
        if playerdata.character == passenger then
          passenger_playerdata = playerdata
          break
        end
      end
    end

    vehicle.teleport(position, surface, raise_event)

    if driver_playerdata then driver_playerdata.character = vehicle.get_driver() end
    if passenger_playerdata then passenger_playerdata.character = vehicle.get_passenger() end
  end
end

--unused
---@param data {surface:LuaSurface, name:string, area:BoundingBox}
function surface_set_area_tiles(data)
  if not (data.surface and data.name and data.area) then return end

  local tiles = {}
  for y = data.area.left_top.y, data.area.right_bottom.y, 1 do
    for x = data.area.left_top.x, data.area.right_bottom.x, 1 do
      table.insert(tiles, {
        name = data.name,
        position = {x = x, y = y}})
    end
  end
  data.surface.set_tiles(tiles, true)
end

---@param data {surface:LuaSurface, name:string, area:BoundingBox}
function surface_set_space_tiles(data)
  if not (data.surface and data.area) then return end

  local tiles = {}
  for y = data.area.left_top.y, data.area.right_bottom.y, 1 do
    for x = data.area.left_top.x, data.area.right_bottom.x, 1 do
      table.insert(tiles, {
        name = name_space_tile,
        position = {x = x, y = y}})
    end
  end
  data.surface.set_tiles(tiles, true)
end

-- unused
---@param array any
---@param position any
function position_2d_array_add(array, position)
    if not array[position.y] then array[position.y] = {} end
    if not array[position.y][position.x] then array[position.y][position.x] = position end
end

---unused
---@param array any
---@param position any
---@param range any
function position_2d_array_add_range(array, position, range)
    for y = position.y - range, position.y + range, 1 do
      for x = position.x - range, position.x + range, 1 do
            position_2d_array_add(array, {x = x, y = y})
      end
    end
end

---Returns whether a given lua tile is an "empty space" tile.
---@param tile LuaTile Tile to evaluate
---@return boolean is_space
function tile_is_space(tile)
    for _, name in pairs(space_tiles) do
      if tile.name == name then return true end
    end
    return false
end

---Returns whether a given lua tile is a space platform tile
---@param tile LuaTile Tile to evalute
---@return boolean is_space_platform
function tile_is_space_platform(tile)
    return tile.name == sp_tile_plate or tile.name == sp_tile_scaffold
end


--[[---@param event EventData.on_player_created Event data
function on_player_created(event)
    --local player = game.get_player(event.player_index)
    --TODO: capsule crash sequence
end
Event.addListener(defines.events.on_player_created, on_player_created)]]--

---@param player LuaPlayer
function close_own_guis(player)
  -- NOTE: don't close remote view gui here
  SpaceshipGUI.gui_close(player)
  --player_clear_all_dropdown_values(player)
end


--[[
  tag: {
    surface_name (optional)
    force_name
    position
    icon_type (item/virtual)
    icon_name
    text
    chart_range (optional)
  }
]]
---@param tag {force_name:string, surface:LuaSurface, position:MapPosition, icon_type:string, icon_name:string, text:string, chart_range:integer}
function chart_tag_buffer_add(tag)
  local surface = tag.surface
  local force_name = tag.force_name
  local force = game.forces[force_name]
  local range = tag.chart_range or Zone.discovery_scan_radius

  force.chart(surface, util.position_to_area(tag.position, range))

  global.chart_tag_buffer = global.chart_tag_buffer or {}
  global.chart_tag_next_id = (global.chart_tag_next_id or 0) + 1
  global.chart_tag_buffer[global.chart_tag_next_id] = tag
end

---@param player LuaPlayer
function player_capture_selected(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.capture_text and rendering.is_valid(playerdata.capture_text) then
    rendering.destroy(playerdata.capture_text)
  end
  local entity = player.selected
  if entity and (entity.force.name == "capture" or entity.force.name == "conquest") and entity.type ~= "wall" then
    local range = 1
    local box = entity.bounding_box
    local pos = player.position
    if player.character and pos.x > box.left_top.x - range
      and pos.x < box.right_bottom.x + range
      and pos.y > box.left_top.y - range
      and pos.y < box.right_bottom.y + range then
        local blocker = entity.surface.find_nearest_enemy{position=entity.position, max_distance=32, force=player.force}
        if blocker then
          entity.surface.create_entity{
             name = "flying-text",
             position = entity.position,
             text = {"space-exploration.capture-blocked"},
             render_player_index = player.index,
          }
        else
          entity.force = player.force
          local zone = Zone.from_surface(entity.surface)
          if zone then
            local inventory = entity.get_inventory(defines.inventory.chest)
            if inventory then
              for _, item_name in pairs(Ruin.track_loot_items) do
                local count = inventory.get_item_count(item_name)
                if count > 0 then
                  zone.looted_items = zone.looted_items or {}
                  zone.looted_items[item_name] = (zone.looted_items[item_name] or 0) + count
                end
              end
            end
          end
          if entity.name == "se-spaceship-console" then
            local spaceship = Spaceship.from_entity(entity)
            if spaceship then
              spaceship.force_name = player.force.name
            end
            -- capture the rest of the ship
            for _, subentity in pairs(entity.surface.find_entities_filtered{force = "capture"}) do
              subentity.force = player.force
            end
          end
        end
    else
      if not Util.table_contains(
      {"turret", "ammo-turret", "electric-turret", "fluid-turret", "artillery-turret",
        "combat-robot", "logistic-robot", "construction-robot",
        "wall", "gate"}, entity.type) then
          playerdata.capture_text = rendering.draw_text{
            text = {"space-exploration.touch-to-capture"},
            surface = entity.surface,
            target = entity,
            target_offset = {0, -0.5},
            players={player},
            color={r=0.8,g=0.8,b=0.8,a=0.8},
            alignment="center",
            scale = (1 + box.right_bottom.x-box.left_top.x)/3,
        }
      end
    end
  end
end

---@param event EventData.on_selected_entity_changed Event data
function on_selected_entity_changed(event)
  local player = game.get_player(event.player_index)
  ---@cast player -?
  player_capture_selected(player)
end
Event.addListener(defines.events.on_selected_entity_changed, on_selected_entity_changed)

--- unused
---@param array any
---@param current any
---@return unknown?
function get_selected_index(array, current)
  local i = 0
  for _, item in ipairs(array) do
    i = i + 1
    if item == current then return i end
  end
end

---@param element LuaGuiElement
---@param relevant_value? uint
---@return string?
function get_dropdown_string(element, relevant_value)
  if not relevant_value then relevant_value = 1 end
  if element.selected_index and element.items[element.selected_index] then
    local selected = element.items[element.selected_index]
    if type(selected) == "string" then
      return selected
    elseif type(selected) == "table" and selected[relevant_value] then
      return selected[relevant_value]
    end
  end
end

---@param element LuaGuiElement
---@param preset {name:string, display:LocalisedString}[]
---@return string?
function selected_name_from_dropdown_preset(element, preset)
  -- options eg:  destination_type_options

  local selected_string = get_dropdown_string(element)
  for _, option in pairs(preset) do
    if type(option.display) == "string" then
      if option.display == selected_string then
        return option.name
      end
    elseif type(option.display) == "table" and option.display[1] == selected_string then
      return option.name
    end
  end
end

---@param preset {name:string, display:LocalisedString}[]
---@param current string
---@return LocalisedString[]
---@return uint?
function dropdown_from_preset(preset, current)
  -- options eg:  destination_type_options
  local selected_index
  local list = {}
  for _, option in pairs(preset) do
    table.insert(list, option.display)
    if option.name == current then selected_index = #list end
  end
  return list, selected_index
end

---@param inv LuaInventory
---@return uint
function count_inventory_slots_used(inv)
  return #inv - inv.count_empty_stacks()
end

---@param element LuaGuiElement
---@param name string
---@return LuaGuiElement?
function gui_element_or_parent(element, name)
  if not (element and element.valid) then return end
  if element.name == name then
    return element
  elseif element.parent then
    return gui_element_or_parent(element.parent, name)
  end
end

function update_spidertron_lists()
  global.spidertron_names = util.get_item_names_for_entity_types{"spider-vehicle"}

  -- "roboport" also gets signal transmitters/receivers
  local take_item_stacks = util.get_item_names_for_entity_types{"construction-robot", "roboport", "logistic-container", "solar-panel", "accumulator", "inserter"}
  table.insert(take_item_stacks, "substation")
  table.insert(take_item_stacks, mod_prefix .. "pylon-substation")
  table.insert(take_item_stacks, "laser-turret")

  local exclude_items = {mod_prefix.."spaceship-console", mod_prefix.."spaceship-console-alt"}
  for _, item in pairs(exclude_items) do
    util.remove_from_table(take_item_stacks, item)
  end
  global.spidertron_default_item_filters = take_item_stacks

  Log.debug_log("spidertron_names: " .. serpent.line(global.spidertron_names))
  Log.debug_log("spidertron_default_item_filters: " .. serpent.line(global.spidertron_default_item_filters))
end

---@param player LuaPlayer
function on_tick_player(player)

  local playerdata = get_make_playerdata(player)

  --on_tick_player_gui(player)

  -- save position
  playerdata.surface_positions = playerdata.surface_positions or {}
  playerdata.surface_positions[player.surface.index] = player.position
end

---@param event EventData.on_surface_deleted Event data
function on_surface_deleted(event)
  if global.playerdata then
    for _, playerdata in pairs(global.playerdata) do
      if playerdata.surface_positions then
        playerdata.surface_positions[event.surface_index] = nil
      end
    end
  end
  Zone.rebuild_surface_index()
end
Event.addListener(defines.events.on_surface_deleted, on_surface_deleted)

---@param character LuaEntity
---@return boolean
function is_character_passenger(character)
  if character and character.vehicle then return true end
  if global.tick_tasks then
    for _, tick_task in pairs(global.tick_tasks) do
      if tick_task.passengers then
        for _, passenger in pairs(tick_task.passengers) do
          if passenger == character then
            return true
          end
        end
      end
    end
  end
  return false
end

---@param event EventData.on_player_changed_position Event data
function on_player_changed_position(event)
  local player = game.get_player(event.player_index)
  ---@cast player -?
  if not player.character then return end
  local playerdata = get_make_playerdata(player)
  player_capture_selected(player)

  local zone = Zone.from_surface(player.surface)
  if zone then
    if player.vehicle and player.vehicle.type == "spider-vehicle" then
      local tile = player.surface.get_tile(player.vehicle.position)
      if tile.name == "interior-divider" then
        playerdata.interior_divider_collisions = (playerdata.interior_divider_collisions or 0) + 1
        local max_health = player.vehicle.prototype.max_health
        player.vehicle.health = math.min(max_health - max_health * playerdata.interior_divider_collisions / 10, player.vehicle.health - player.vehicle.health / 10)
        if player.vehicle.health <= 1 then
          player.vehicle.die()
          playerdata.interior_divider_collisions = nil
          teleport_non_colliding_player(player, player.position, nil, nil, 0.25)
        end
      end
    end
    -- track visited
    if not playerdata.visited_zone then
      playerdata.visited_zone = {}
    end
    if zone.type ~= "spaceship" and not playerdata.visited_zone[zone.index] then 
      ---@cast zone -SpaceshipType
      playerdata.visited_zone[zone.index] = event.tick
    end

    if (not playerdata.has_entered_anomaly) and zone.type == "anomaly" and player.character then
      ---@cast zone AnomalyType
      playerdata.has_entered_anomaly = true
      player.print({"space-exploration.galaxy_ship_authenticated"})
      for _, entity in pairs(player.surface.find_entities_filtered{force="ignore"}) do
        entity.force = "friendly"
      end
      player.force.chart(player.surface, util.position_to_area(Ancient.galaxy_ship_default_position, 2))
      player.force.chart_all(player.surface)
    end
    if zone.vault_pyramid_position then
      if (not player.vehicle) then
        if not (zone.vault_pyramid and zone.vault_pyramid.valid) then
          -- make the pyramid again.
          Ancient.make_vault_exterior(zone)
        end
        -- check if touching the pyramid
        local x_test = Ancient.pyramid_width/2
        local y_test = Ancient.pyramid_height/2
        local buffer = 1
        if player.position.x < zone.vault_pyramid_position.x + x_test + buffer
          and player.position.x > zone.vault_pyramid_position.x - x_test - buffer
          and player.position.y < zone.vault_pyramid_position.y + y_test + buffer
          and player.position.y > zone.vault_pyramid_position.y - y_test - buffer then
            if (not string.find(player.character.name, "jetpack", 1, true)) and (not is_character_passenger(player.character)) then
              Ancient.make_vault_interior(zone, player.force)
              local vault = global.glyph_vaults[zone.glyph][zone.index]
              local vault_surface = game.get_surface(vault.surface_index)
              player.teleport({0, Ancient.cartouche_path_end-2}, vault_surface)
              local corpses = vault_surface.find_entities_filtered{type="corpse"}
              for _, corpse in pairs(corpses) do corpse.destroy() end
              if not playerdata.first_entered_vault then
                playerdata.first_entered_vault = zone
              end
            end
        end
      end
    end
  else -- no zone
    local vault = Ancient.vault_from_surface(player.surface)
    if vault then
      -- check if on the entrance/exit section
      if player.position.x <=4 and player.position.x >= -4 and player.position.y > Ancient.cartouche_path_end -1 and player.position.y < Ancient.cartouche_path_end +1 then
        local zone = Zone.from_zone_index(vault.zone_index)
        local zone_surface = Zone.get_make_surface(zone)
        local pos = table.deepcopy(zone.vault_pyramid_position) or {x = 0, y = 0}
        pos.y = pos.y + Ancient.pyramid_height/2 + 1
        teleport_character_to_surface(player.character, zone_surface, pos)
      end
    end
  end
end
Event.addListener(defines.events.on_player_changed_position, on_player_changed_position)

---Handles cargo rocket fragments and meteors being spawned, as well as the creation of biter
---spawners on vitamelange worlds.
---@param event EventData.on_trigger_created_entity Event data
function on_trigger_created_entity(event)
  if not event.entity.valid then return end

  local entity_name = event.entity.name
  local meteor_name = string.match(entity_name, "meteor[-]%d%d")

  local surface = event.entity.surface
  local position = event.entity.position
  local tile = surface.get_tile(position)

  if meteor_name then
    if not tile_is_space(tile) and not tile.collides_with("player-layer") then
      -- Create an explosion
      surface.create_entity{name=mod_prefix .. "meteor-explosion", position=position}

      -- Destroy space platform if no entities on top
      local zone = Zone.from_surface(surface)
      if Zone.is_space(zone) then
        ---@cast zone -PlanetType, -MoonType
        local tileset = Meteor.get_tiles_to_destroy(surface, position, math.random(5))
        surface.set_tiles(tileset, true, "abort_on_collision")

        -- Update tile, depending on whether it changed
        tile = surface.get_tile(position)
      end

      -- Decide whether to spawn biter meteors or meteor fragments
      local zone = Zone.from_surface(surface)
      if Zone.is_biter_meteors_hazard(zone) then
        local r = math.random()
        local tick_task = new_tick_task("create-entity") --[[@as CreateEntityTickTask]]

        tick_task.delay_until = event.tick + 1
        tick_task.surface = surface
        tick_task.create_entity_data = {position=position, force="enemy"}

        if r < 0.1 then
          tick_task.create_entity_data.name = "behemoth-worm-turret"
        elseif r < 0.5 then
          tick_task.create_entity_data.name = "spitter-spawner"
        else
          tick_task.create_entity_data.name = "biter-spawner"
        end
      else
        local meteor_remnant = surface.create_entity{
          name=mod_prefix .. "static-" .. meteor_name, position=position, force="neutral"}
        ---@cast meteor_remnant -?
        Util.conditional_mark_for_deconstruction({meteor_remnant}, surface, position)
      end
    end
  elseif entity_name == mod_prefix .. "trigger-movable-debris" then
    local entities = surface.find_entities_filtered{type="simple-entity", position=position}
    Util.conditional_mark_for_deconstruction(entities, surface, position)
  end
end
Event.addListener(defines.events.on_trigger_created_entity, on_trigger_created_entity)

-- put an item back in the inventory or drop to ground
-- display flying text
---@param entity LuaEntity
---@param player_index? uint
---@param message LocalisedString
---@param event? EntityCreationEvent|EventData.on_entity_cloned|EventData.on_player_built_tile|EventData.on_robot_built_tile
function cancel_entity_creation(entity, player_index, message, event)
  local position = entity.position
  local surface = entity.surface
  local player
  if player_index then
    player = game.get_player(player_index)
  end
  if entity.type == "entity-ghost" then
    entity.destroy()
    if player then
      player.play_sound{
        path = "utility/cannot_build",
        volume_modifier = 1.0
      }
      surface.create_entity{
         name = "flying-text",
         position = position,
         text = message,
         render_player_index = player_index,
      }
    end
    return
  end
  local inserted = 0
  local item_to_place = entity.prototype.items_to_place_this and entity.prototype.items_to_place_this[1]
  if player then
    if player.mine_entity(entity, false) then
      inserted = 1
    elseif item_to_place and item_to_place.name then
      inserted = player.insert{name = item_to_place.name, count = 1}
    end
    -- play entity cannot build sound
    player.play_sound{
      path = "utility/cannot_build",
      volume_modifier = 1.0
    }
  end
  if inserted == 0 and item_to_place and item_to_place.name and event and event.robot then
    local inventory = event.robot.get_inventory(defines.inventory.robot_cargo)
    inserted = inventory.insert{name = item_to_place.name, count = 1}
  end
  if entity and entity.valid then
    entity.destroy()
  end
  if inserted == 0 and item_to_place and item_to_place.name then
    surface.spill_item_stack(
      position,
      {name = item_to_place.name, count = 1},
      true, -- loot
      player and player.force or (event and event.robot and event.robot.force),
      false -- allow_belts
    )
  end
  surface.create_entity{
    name = "flying-text",
    position = position,
    text = message,
    render_player_index = player_index,
  }
end

-- put an item back in the inventory or drop to ground
-- display flying text
---@param surface LuaSurface
---@param tile LuaTilePrototype Tile that was attempted to be placed, that must be cancelled
---@param old_tiles OldTileAndPosition
---@param player_index uint
---@param message LocalisedString
---@param event EventData.on_player_built_tile|EventData.on_robot_built_tile
---@param fallback_tile_name string
function cancel_tile_placement(surface, tile, old_tiles, player_index, message, event, fallback_tile_name)
  local player
  if player_index then
    player = game.get_player(player_index)
    if player.controller_type == defines.controllers.editor then
      -- tile placement could be allowed for testing but it will create errors further down the line so this should not be enabled.
      -- e.g:
        -- space platform on a spaceship surface will break cause errors.
        -- water and/or land in space will cause entity problems.
        -- space surfaces on planets will cause entity problems and maybe errors.
    end
  end
  local set_tiles = {}
  local set_hidden_tiles = {}
  for i, old_tile_and_position in pairs(old_tiles) do
    local position = old_tile_and_position.position
    local old_tile = old_tile_and_position.old_tile

    -- return the item for the new tile
    if tile.items_to_place_this and tile.items_to_place_this[1] then
      local inserted = 0
      if player then
        inserted = player.insert{name = tile.items_to_place_this[1].name, count = 1}
      end
      if inserted == 0 and event and event.robot then
        local inventory = event.robot.get_inventory(defines.inventory.robot_cargo)
        inserted = inventory.insert{name = tile.items_to_place_this[1].name, count = 1}
      end
      if inserted == 0 then
        surface.spill_item_stack(
          position,
          {name = tile.items_to_place_this[1].name, count = 1},
          true, -- loot
          player and player.force or (event and event.robot and event.robot.force),
          false -- allow_belts
        )
      end
    end
    if i == 1 then
      surface.create_entity{
        name = "flying-text",
        position = old_tile_and_position.position,
        text = message,
        render_player_index = player_index,
     }
    end

    -- try to restore the previous state, reclaim the removed item
    local inventory
    if player then inventory = player.get_inventory(defines.inventory.character_main) end
    if event and event.robot then inventory = event.robot.get_inventory(defines.inventory.robot_cargo) end

    local handled = false
    if inventory then
      if old_tile.items_to_place_this and old_tile.items_to_place_this[1] then
        local item = old_tile.items_to_place_this[1]
        local removed = inventory.remove({name = item.name, count = 1})
        if removed > 0 then
          handled = true
          table.insert(set_tiles, {name = old_tile.name, position = position})
          -- Also bring back the hidden tile under this placeable tile
          local hidden = surface.get_hidden_tile(position)
          table.insert(set_hidden_tiles, {name = hidden, position = position})
        end
      end
    end

    -- The old tile has no item to place, so putting it back should be fine
    if not (old_tile.items_to_place_this and old_tile.items_to_place_this[1]) then
      handled = true
      table.insert(set_tiles, {name = old_tile.name, position = position})
    end

    -- Try the hidden tile
    -- or a fallback tile
    if not handled then
      local hidden = surface.get_hidden_tile(position) or (fallback_tile_name or "out-of-map")
      local hidden_tile = game.tile_prototypes[hidden]
      table.insert(set_tiles, {name = hidden, position = position})
      -- if this change would make an entity invalid then the entity needs to be removed.

      local collision_mask = {}
      for name, blocks in pairs(hidden_tile.collision_mask) do
        if blocks then table.insert(collision_mask, name) end
      end
      local entities = surface.find_entities_filtered{
        area = util.tile_to_area(position),
        collision_mask = collision_mask}
      for _, entity in pairs(entities) do
        if player then player.mine_entity(entity, true) end
        if entity.valid then
          cancel_entity_creation(entity, player_index, message, event)
        end
        if entity.valid then -- fallback
          entity.destroy()
        end
      end
    end
  end
  surface.set_tiles(set_tiles)
  -- Must do hidden tiles *after* set_tiles
  for _, set_hidden_tile in pairs(set_hidden_tiles) do
    surface.set_hidden_tile(set_hidden_tile.position, set_hidden_tile.name)
  end
end

---@param surface LuaSurface
---@return boolean
function is_surface_space(surface)
  local zone = Zone.from_surface(surface)
  if zone and Zone.is_space(zone) then
    ---@cast zone -PlanetType, -MoonType
    return true
  elseif surface and surface.name and string.starts(surface.name, "Space Factory") then -- Space Factorissimo compatibility
    return true
  end
  return false
end

---@param surface LuaSurface
---@return boolean
function is_testing_surface(surface)
  return is_testing_game() or surface.generate_with_lab_tiles
end

---@param prototype LuaEntityPrototype
---@return boolean
local function is_water_creator(prototype)
  return prototype.fluid and prototype.fluid.name == "water" -- OffshorePump
    or prototype.fixed_recipe and util.has_product(prototype.fixed_recipe, "water") -- Fixed AssemblingMachine
end

---@param event EntityCreationEvent Event data
function on_entity_created(event)
  local entity
  if event.entity and event.entity.valid then
    entity = event.entity
  end
  if event.created_entity and event.created_entity.valid then
    entity = event.created_entity
  end
  if (not entity) or entity.type == "tile-ghost" then return end

  if is_testing_surface(entity.surface) then
    return -- Don't do any swapping when placing on lab tiles
  end

  local zone = Zone.from_surface(entity.surface)

  --Revert grounded and spaced chosts to their "natural" state, to properly react to being hand-built. Will re-swap once properly built
  if entity.type == "entity-ghost" then
    -- replace with non-suffixed forms when placing ghosts
    -- TODO: This should be moved to EntitySwap.on_entity_created, to use the cache 
    if string.find(entity.ghost_name, name_suffix_grounded, 1, true) then
      return EntitySwap.swap_ghost(entity, util.replace(entity.ghost_name, name_suffix_grounded, ""))
    end
    if string.find(entity.ghost_name, name_suffix_spaced, 1, true) then
      return EntitySwap.swap_ghost(entity, util.replace(entity.ghost_name, name_suffix_spaced, ""))
    end
    if is_surface_space(entity.surface) then
      if entity.ghost_type == "offshore-pump" then
        cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied"}, event)
        return
      end
    else -- not space
      if zone and (not zone.is_homeworld) and zone.tags and util.table_contains(zone.tags, "water_none") and is_water_creator(entity.ghost_prototype) then
        -- there is no water on this planet, send via rocket, cannon, or ship
        cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-no-water"}, event)
        return
      end
    end
  else
    if is_surface_space(entity.surface) then
      if (entity.type == "car")
        and (not string.find(entity.name, mod_prefix.."space", 1, true))
        and entity.prototype.effectivity > 0 then
        cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-vehicle-in-space"}, event)
        return
      end
      if game.entity_prototypes[entity.name..name_suffix_spaced] then
        -- replace with spaced
        return EntitySwap.swap_structure(entity, entity.name..name_suffix_spaced)
      end
      if string.find(entity.name, name_suffix_grounded, 1, true) then
        -- replace with non-grounded
        return EntitySwap.swap_structure(entity, util.replace(entity.name, name_suffix_grounded, ""))
      end
      if entity.type == "offshore-pump" then
        cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied"}, event)
        return
      end
    else -- not space
      if string.find(entity.name, name_suffix_spaced, 1, true) then
        -- replace with non-spaced
        return EntitySwap.swap_structure(entity, util.replace(entity.name, name_suffix_spaced, ""))
      end
      if game.entity_prototypes[entity.name..name_suffix_grounded] then
        -- replace with grounded
        return EntitySwap.swap_structure(entity, entity.name..name_suffix_grounded)
      end
      if zone and (not zone.is_homeworld) and zone.tags and util.table_contains(zone.tags, "water_none") and is_water_creator(entity.prototype) then
        -- there is no water on this planet, send via rocket, cannon, or ship
        cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-no-water"}, event)
        return
      end
    end
  end
end
Event.addListener(defines.events.on_robot_built_entity, on_entity_created)
Event.addListener(defines.events.on_built_entity, on_entity_created)
Event.addListener(defines.events.script_raised_built, on_entity_created)
Event.addListener(defines.events.script_raised_revive, on_entity_created)

--[[
When the player kills themself by placing water under themselves, the on_built_tile event does not fire.
Instead we listen to the on_player_died event, and replace any nearby water tiles with some non-water tile next to it.
]]
---@param event EventData.on_pre_player_died Event data
function on_pre_player_died(event)
  local player = game.get_player(event.player_index)
  ---@cast player -?
  local zone = Zone.from_surface(player.surface)
  if (not zone) or Zone.is_solid(zone) then -- treat as land
    ---@cast zone PlanetType|MoonType
    if zone and (not zone.is_homeworld) and (zone.tags and (util.table_contains(zone.tags, "water_none"))) then
      -- water should not be here
      local area = {left_top = {player.position.x - 20, player.position.y - 20}, right_bottom = {player.position.x + 20, player.position.y + 20}}
      local tick_task = new_tick_task("remove-water") --[[@as RemoveWaterTickTask]]
      tick_task.delay_until = event.tick + 1
      tick_task.surface = player.surface
      tick_task.area = area
      tick_task.position = player.position
    end
  end
end
Event.addListener(defines.events.on_pre_player_died, on_pre_player_died)

---@param surface LuaSurface
---@param area BoundingBox
---@param position MapPosition
function remove_water_tiles(surface, area, position)
  local bad_tiles = {}
  local good_tile_name
  for _, tile in pairs(surface.find_tiles_filtered({
    area = area
  })) do
    if string.find(tile.name, "water", 1, true) then
      table.insert(bad_tiles, tile)
    else
      good_tile_name = tile.name
    end
  end
  if not good_tile_name then -- if we cant find a tile type to replace the water with use landfill as a default
    good_tile_name = "landfill"
  end
  if next(bad_tiles) then
    -- there is no water on this planet, send via rocket, cannon, or ship
    surface.create_entity({
      name = "flying-text",
      position = position,
      text = {"space-exploration.construction-denied-no-water"}
    })
    local tiles = {}
    for _, tile in pairs(bad_tiles) do
      table.insert(tiles, {
        name = good_tile_name,
        position = tile.position
      })
    end
    surface.set_tiles(tiles)
  end
end

---@param event EventData.on_player_built_tile|EventData.on_robot_built_tile Event data
function on_built_tile(event)
  if not event.surface_index then return end
  local surface = game.get_surface(event.surface_index)
  if not surface then return end
  local player
  local tile = event.tile -- top left tile
  local old_tiles = event.tiles -- all tiles over a large square
  local stack = event.stack -- used to create, may be empty

  if is_testing_surface(surface) then
    return -- Allow placement on lab surfaces, even on ground
  end

  for _, old_tile in pairs(old_tiles) do
    if old_tile.old_tile.name == "interior-divider" then
      if tile.name == "transport-drone-proxy-tile" then return error("Invalid map state") end
      cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"}, event, name_land_fallback_tile)
      return
    end
  end
  --tile_is_space(tile)
  local zone = Zone.from_surface(surface)
  -- temp due to issue with transport drones script
  if tile.name == "transport-drone-proxy-tile" then return end

  if (not zone) or Zone.is_solid(zone) then -- treat as land
    ---@cast zone PlanetType|MoonType
    if Util.table_contains(tiles_only_allowed_in_space, tile.name) and not global.remove_placement_restrictions then
      cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"}, event, name_land_fallback_tile)
      return
    elseif string.find(tile.name, "water", 1, true) then
      if zone and (not zone.is_homeworld) and (zone.tags and (util.table_contains(zone.tags, "water_none"))) then
        -- should not be here
        cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied-no-water"}, event, name_land_fallback_tile)
        return
      end
    end
    if tile.name == "landfill" then -- remove nearby fish
      local area = {left_top={}, right_bottom={}}
      for _, old_tile in pairs(old_tiles) do
        if area.left_top.x == nil or area.left_top.x > old_tile.position.x - 1 then
          area.left_top.x = old_tile.position.x - 1
        end
        if area.right_bottom.x == nil or area.right_bottom.x < old_tile.position.x + 2 then
          area.right_bottom.x = old_tile.position.x + 2
        end
        if area.left_top.y == nil or area.left_top.y > old_tile.position.y - 1 then
          area.left_top.y = old_tile.position.y - 1
        end
        if area.right_bottom.y == nil or area.right_bottom.y < old_tile.position.y + 2 then
          area.right_bottom.y = old_tile.position.y + 2
        end
      end
      local fish = surface.find_entities_filtered{type = "fish", area = area}
      for i, fsh in pairs(fish) do
        fsh.die()
      end
    end
  else -- treat as space
    if zone.type == "spaceship" and (not Util.table_contains(Spaceship.names_spaceship_floors, tile.name)) then
      ---@cast zone SpaceshipType
      cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"}, event, name_space_tile)
      return
    elseif not Util.table_contains(tiles_allowed_in_space, tile.name) then
      cancel_tile_placement(surface, tile, old_tiles, event.player_index, {"space-exploration.construction-denied"}, event, name_space_tile)
      return
    end
    if tile.name == mod_prefix .. "space-platform-scaffold" then
      local bad_tiles = {}
      for _, old_tile_and_position in pairs(old_tiles) do
        if old_tile_and_position.old_tile.name == mod_prefix .. "asteroid" then
          table.insert(bad_tiles, old_tile_and_position)
        end
      end
      if next(bad_tiles) then
        cancel_tile_placement(surface, tile, bad_tiles, event.player_index, {"space-exploration.construction-denied"}, event, name_space_tile)
        return
      end
    end
  end
end
Event.addListener(defines.events.on_player_built_tile, on_built_tile)
Event.addListener(defines.events.on_robot_built_tile, on_built_tile)

---@param event EventData.script_raised_set_tiles Event data
function on_script_raised_set_tiles(event)
  if not event.surface_index then return end
  local surface = game.get_surface(event.surface_index)
  if not surface then return end

  local zone = Zone.from_surface(surface)
  local set_tiles = {}
  for _, tile in pairs(event.tiles) do
    if (not zone) or Zone.is_solid(zone) then -- treat as land
      ---@cast zone PlanetType|MoonType
      if Util.table_contains(tiles_only_allowed_in_space, tile.name) then
        table.insert(set_tiles, {name="mineral-black-dirt-1", position=tile.position})
      elseif string.find(tile.name, "water", 1, true) then
        if zone and (not zone.is_homeworld) and (zone.tags and (util.table_contains(zone.tags, "water_none"))) then
          -- should not be here
          table.insert(set_tiles, {name="mineral-black-dirt-1", position=tile.position})
        end
      end
    else -- treat as space
      ---@cast zone -PlanetType, -MoonType
      if zone.type == "spaceship" and (not Util.table_contains(Spaceship.names_spaceship_floors, tile.name)) then
        ---@cast zone SpaceshipType
        table.insert(set_tiles, {name=name_space_tile, position=tile.position})
      elseif not Util.table_contains(tiles_allowed_in_space, tile.name) then
        table.insert(set_tiles, {name=name_space_tile, position=tile.position})
      end
    end
  end
  if next(set_tiles) then
    surface.set_tiles(set_tiles, true) -- DO NOT raise an event or it might cause a loop
  end
end
Event.addListener(defines.events.script_raised_set_tiles, on_script_raised_set_tiles)

---@param event EventData.on_tick Event data
function on_tick(event)


  for _, player in pairs(game.connected_players) do
    on_tick_player(player)
  end

  for _, tick_task in pairs(global.tick_tasks) do
    if (not tick_task.delay_until) or event.tick >= tick_task.delay_until then
      if tick_task.type == "chain-beam" then
        ---@cast tick_task ChainBeamTickTask
        Weapon.chain_beam(tick_task)
      elseif tick_task.type == "plague-tick" then
        ---@cast tick_task PlagueTickTask
        Weapon.plague_tick(tick_task, event.tick)
      elseif tick_task.type == "cryogun-unfreeze" then
        ---@cast tick_task CryogunUnfreezeTickTask
        Weapon.cryogun_unfreeze(tick_task, event.tick)
      elseif tick_task.type == "bind-corpse" then
        ---@cast tick_task BindCorpseTickTask
        Respawn.tick_task_bind_corpse(tick_task)
      elseif tick_task.type == "launchpad-journey" then
        ---@cast tick_task CargoRocketTickTask
        Launchpad.tick_journey(tick_task)
      elseif tick_task.type == "capsule-journey" then
        ---@cast tick_task CapsuleTickTask
        Capsule.tick_journey(tick_task)
      elseif tick_task.type == "grow_energy_tree" then
        ---@cast tick_task GrowEnergyTreeTickTask
        EnergyBeam.grow_energy_tree(tick_task)
      elseif tick_task.type == "solar-flare" then
        ---@cast tick_task SolarFlareTickTask
        SolarFlare.tick_flare(tick_task, event.tick)
      elseif tick_task.type == "force-message" then
        ---@cast tick_task ForceMessageTickTask
        if tick_task.force_name then
          local force = game.forces[tick_task.force_name]
          if force then
            force.print(tick_task.message)
          end
        end
        tick_task.valid = false
      elseif tick_task.type == "game-message" then
        ---@cast tick_task GameMessageTickTask
        game.print(tick_task.message)
        tick_task.valid = false
      elseif tick_task.type == "set-entity-traits" then --**FIXME** unused, tick_task.type == "set-entity-traits" does not exist
        if tick_task.entity and tick_task.entity.valid then
          if tick_task.minable ~= nil then
            tick_task.entity.minable = tick_task.minable
          end
        end
        tick_task.valid = false
      elseif tick_task.type == "make-vault-pyramid" then
        ---@cast tick_task MakeVaultPyramidTickTask
        Ancient.make_vault_exterior(tick_task.zone)
        tick_task.valid = false
      elseif tick_task.type == "remove-water" then
        ---@cast tick_task RemoveWaterTickTask
        remove_water_tiles(tick_task.surface, tick_task.area, tick_task.position)
        tick_task.valid = false
      elseif tick_task.type == "create-entity" then
        ---@cast tick_task CreateEntityTickTask
        local surface = tick_task.surface
        local ghosts = surface.find_entities_filtered{
          type="entity-ghost",
          area=Util.position_to_area(tick_task.create_entity_data.position, 1)
        }
        local ghost_properties = {}
        for _, ghost in pairs(ghosts) do
          table.insert(ghost_properties, {
            type = "entity-ghost",
            name = ghost.ghost_name,
            force = ghost.force,
            position = ghost.position,
            direction = ghost.direction,
            item_requests = ghost.item_requests,
            tags = ghost.tags
          })
        end
        surface.create_entity(tick_task.create_entity_data)
        for _, ghost_details in pairs(ghost_properties) do
          local ghost = surface.create_entity{
            name = "entity-ghost",
            inner_name = ghost_details.name,
            force = ghost_details.force,
            position = ghost_details.position,
            direction = ghost_details.direction
          }
          ---@cast ghost -?
          ghost.item_requests = ghost_details.item_requests
          ghost.tags = ghost_details.tags
        end
        tick_task.valid = false
      elseif tick_task.type == "weapons-cache" then
        ---@cast tick_task WeaponsCacheTickTask
        local forcedata = global.forces[tick_task.force_name]
        if not forcedata.weapons_cache then

          local surface = tick_task.surface

          local min_x = 1000000
          local max_x = -1000000
          local min_y = 1000000
          local max_y = -1000000

          local zone = Zone.from_surface(surface)
          local entities = surface.find_entities_filtered{force = tick_task.force_name, position = {0,0}, radius = zone.radius * 0.95}
          for _, entity in pairs(entities) do
            --local p = entity.position
            min_x = math.min(min_x, entity.position.x)
            min_y = math.min(min_y, entity.position.y)
            max_x = math.max(max_x, entity.position.x)
            max_y = math.max(max_y, entity.position.y)
          end
          local center = {x = (min_x + max_x) / 2, y = (min_y + max_y) / 2}
          local length = util.vectors_delta_length({x=min_x, y=min_y},{x=max_x, y=max_y}) -- diagonal
          local radius = 32 + length/2
          local try_pos
          local safe_pos
          local container_name = "crash-site-chest-2"
          for i = 0, 10 do
            try_pos = util.vectors_add(center, util.orientation_to_vector(math.random(), radius))
            safe_pos = surface.find_non_colliding_position(container_name, try_pos, 32, 1)
            if safe_pos then break end
          end
          safe_pos = safe_pos or try_pos
          surface.request_to_generate_chunks(safe_pos, 1)
          surface.force_generate_chunk_requests() -- must be generated to place

          local container = surface.create_entity{
             name = container_name,
             force = "neutral",
             position = safe_pos
          }
          ---@cast container -?
          container.insert({name = mod_prefix.."railgun", count=1})
          container.insert({name = mod_prefix.."railgun-ammo", count=200})
          container.insert({name = mod_prefix.."medpack-4", count = 10})
          container.insert({name = "aai-strongbox-requester", count = 3})
          container.insert({name = "aai-warehouse-requester", count = 1})
          if script.active_mods["Krastorio2"] then
            container.insert({name = "biomass", count = 2000})
          end
          container.destructible = false
          local force = game.forces[tick_task.force_name]
          Scanner.chart_position(force, surface, util.position_to_chunk_position(safe_pos))
          force.print({"space-exploration.weapons-cache-found",
            "[gps="..math.floor(safe_pos.x)..","..math.floor(safe_pos.y)..","..surface.name.."]"
          })
          forcedata.weapons_cache = {position = safe_pos, surface = surface}
        end
        tick_task.valid = false
      elseif tick_task.type == "restore-inventory-on-cutscene-exit" then
        ---@cast tick_task RestoreInventoryOnCutsceneExitTickTask
        RemoteView.restore_inventory_on_cutscene_exit(tick_task)
        tick_task.valid = false
      elseif tick_task.type == "train-check-destination-full" then
        ---@cast tick_task TrainCheckDestinationFullTickTask
        SpaceElevator.train_check_destination_full(tick_task)
        tick_task.valid = false
      else
        tick_task.valid = false
      end
      if not tick_task.valid then
        global.tick_tasks[tick_task.id] = nil
      end
    end
  end

end
Event.addListener(defines.events.on_tick, on_tick)

---@param type string
---@return BaseTickTask
function new_tick_task(type)
  global.tick_tasks = global.tick_tasks or {}
  global.next_tick_task_id = global.next_tick_task_id or 1
  local new_tick_task = {
    id = global.next_tick_task_id,
    valid = true,
    type = type
  }
  global.tick_tasks[new_tick_task.id] = new_tick_task
  global.next_tick_task_id = global.next_tick_task_id + 1
  return new_tick_task
end

---Destroys inactive turrets that have lost all of their HP, as they would otherwise linger on.
---@param event EventData.on_entity_damaged Event data
function on_entity_damaged(event)
  -- event.entity.name ~= "shield-projector-barrier"
  if event.entity.valid and not event.entity.active and event.entity.health <= 0 then
    local t = event.entity.type
    if t == "turret" or t == "ammo-turret" or t == "electric-turret" or t == "fluid-turret" then
      -- Reactivate the entity; this will prompt the game to actually kill it
      event.entity.active = true
    end
  end
end
Event.addListener(defines.events.on_entity_damaged, on_entity_damaged)

---@param force_name string
function build_satellite(force_name)
  local home_zone = Zone.get_force_home_zone(force_name)
  if not home_zone then home_zone = Zone.get_default() end
  local zone = home_zone.orbit
  Log.debug("build_satellite: " .. force_name)
  if zone.ruins and zone.ruins["satellite2"] then return end -- don't build twice

  local surface = Zone.get_make_surface(zone)
  local satellite_position = Zone.find_zone_landing_position(zone, {
    x = (-0.5+math.random()) * 256,
    y = (-0.5+math.random()) * 64})

  surface.request_to_generate_chunks(satellite_position, 2)
  surface.force_generate_chunk_requests() -- must be generated to place

  -- Center preview on satellite
  for _, player in pairs(game.forces[force_name].players) do
    local playerdata = get_make_playerdata(player)
    playerdata.surface_positions = playerdata.surface_positions or {}
    playerdata.surface_positions[surface.index] = satellite_position
  end

  Ruin.build({
    ruin_name = "satellite2",
    surface_index = surface.index,
    position = satellite_position,
    force_name_override = force_name
  })
  zone.ruins = zone.ruins or {}
  zone.ruins["satellite2"] = satellite_position
  local range = Zone.discovery_scan_radius
  game.forces[force_name].chart(surface, {
      {satellite_position.x - range, satellite_position.y - range},
      {satellite_position.x + range, satellite_position.y + range}
  })
  game.forces[force_name].print({"space-exploration.satellite-discovered-platform",
    Zone.get_print_name(zone)})
  chart_tag_buffer_add({
    force_name = force_name,
    surface = Zone.get_make_surface(zone),
    position = satellite_position,
    icon_type = "item",
    icon_name = "satellite",
    text = "Space Platform",
    chart_range = Zone.discovery_scan_radius,
  })
end

---@param force_name string
---@param surface LuaSurface
function on_satellite_launched(force_name, surface)
  Log.debug_log("on_satellite_launched: " .. force_name)
  local starting_zone = Zone.from_surface(surface)
  if not game.forces[force_name] then return end
  if not starting_zone then
    return game.forces[force_name].print({"space-exploration.satellite_invalid_launch_location"})
  end
  global.forces[force_name].satellites_launched = (global.forces[force_name].satellites_launched or 0) + 1

  if global.forces[force_name].satellites_launched == 1 then
    -- Satellite 1: Unlock remote view
    game.forces[force_name].print({"space-exploration.satellite-view-unlocked"})
    -- Nav view unlock is automatically handled through RemoteView.is_unlocked()

    for _, player in pairs(game.forces[force_name].players) do
      local player_index = player.index
      RemoteView.update_overhead_button(player_index)
      MapView.update_overhead_button(player_index)
      Zonelist.update_overhead_button(player)
    end

    local tick_task = new_tick_task("weapons-cache") --[[@as WeaponsCacheTickTask]]
    tick_task.force_name = force_name
    tick_task.delay_until = game.tick + 30 * 60
    tick_task.surface = game.get_surface(Zone.get_force_home_zone(force_name).surface_index)

  elseif global.forces[force_name].satellites_launched == 2 then
    -- Satellite 2: Discover Nauvis Orbit and the space platform. Unlock universe explorer, starmap, interstellar map.
    build_satellite(force_name)
    -- Unlocks are automatically handled through ZoneList.is_unlocked() and MapView.is_unlocked()

    for _, player in pairs(game.forces[force_name].players) do
      local player_index = player.index
      MapView.update_overhead_button(player_index)
      Zonelist.update_overhead_button(player)
    end

  elseif global.forces[force_name].satellites_launched == 3 then
    -- Satellite 3. Discover the first moon. (Haven moon)
    Zone.discover_first_moon(force_name, {"", "[img=item/satellite] ", {"space-exploration.satellite"}})
    local tick_task = new_tick_task("force-message") --[[@as ForceMessageTickTask]]
    tick_task.force_name = force_name
    tick_task.message = {"space-exploration.first-discovered-zone-star-map-hint"}
  elseif global.forces[force_name].satellites_launched == 4 then
    -- Discover the first asteroid field
    Zone.discover_first_asteroid_field(force_name, {"", "[img=item/satellite] ", {"space-exploration.satellite"}}, starting_zone)
  elseif global.forces[force_name].satellites_launched == 5 then
    Zone.discover_vulacnite_planet(force_name, {"", "[img=item/satellite] ", {"space-exploration.satellite"}}, starting_zone)
  elseif global.forces[force_name].satellites_launched == 6 or global.forces[force_name].satellites_launched == 7 then
    Zone.discover_cryonite_moon_or_parent(force_name, {"", "[img=item/satellite] ", {"space-exploration.satellite"}}, starting_zone)
  else
    -- Discover the next celestial body (Planet's moons, then star's planets/moons, then other stars, then nothing)
    local dicovered_something = Zone.discover_next_satellite(force_name, {"", "[img=item/satellite] ", {"space-exploration.satellite"}}, starting_zone)
    if not dicovered_something then
      for _, player in pairs(game.forces[force_name].connected_players) do
        if player.surface.index == surface.index then
          if settings.get_player_settings(player)["se-print-satellite-discovered-nothing"].value then
            player.print({"space-exploration.satellite-discovered-nothing"})
          end
        end
      end
    end
  end

end


---@param event EventData.on_rocket_launched Event data
function on_rocket_launched(event)
  if event.rocket and event.rocket.valid then
    if event.rocket.get_item_count("satellite") > 0 then
      on_satellite_launched(event.rocket.force.name, event.rocket.surface)
    end
  end
end
Event.addListener(defines.events.on_rocket_launched, on_rocket_launched)

---@param event EventData.on_rocket_launch_ordered Event data
function on_rocket_launch_ordered(event)
  if event.rocket and event.rocket.valid then
    local zone = Zone.from_surface(event.rocket.surface)
    if event.rocket.get_item_count(mod_prefix.."star-probe") > 0 then
      if not (zone and zone.type == "orbit" and zone.parent.type == "star") then
        local probe_count = event.rocket.get_item_count(mod_prefix .. "star-probe")
        event.rocket.remove_item({name=mod_prefix.."star-probe", count=probe_count})
        local tick_task = new_tick_task("force-message") --[[@as ForceMessageTickTask]]
        tick_task.force_name = event.rocket.force.name
        tick_task.message = {"space-exploration.probe_invalid_launch_star"}
        tick_task.delay_until = event.tick + 750 --5s
      end
    elseif event.rocket.get_item_count(mod_prefix.."belt-probe") > 0 then
      if not (zone and zone.type == "asteroid-belt") then
        ---@cast zone -AsteroidBeltType
        local probe_count = event.rocket.get_item_count(mod_prefix .. "belt-probe")
        event.rocket.remove_item({name=mod_prefix.."belt-probe", count=probe_count})
        local tick_task = new_tick_task("force-message") --[[@as ForceMessageTickTask]]
        tick_task.force_name = event.rocket.force.name
        tick_task.message = {"space-exploration.probe_invalid_launch_belt"}
        tick_task.delay_until = event.tick + 750 --5s
      end
    elseif event.rocket.get_item_count(mod_prefix.."void-probe") > 0 then
      if not (zone and zone.type == "asteroid-field") then
        ---@cast zone -AsteroidFieldType
        local probe_count = event.rocket.get_item_count(mod_prefix .. "void-probe")
        event.rocket.remove_item({name=mod_prefix.."void-probe", count=probe_count})
        local tick_task = new_tick_task("force-message") --[[@as ForceMessageTickTask]]
        tick_task.force_name = event.rocket.force.name
        tick_task.message = {"space-exploration.probe_invalid_launch_field"}
        tick_task.delay_until = event.tick + 750 --5s
      end
    end
  end
end
Event.addListener(defines.events.on_rocket_launch_ordered, on_rocket_launch_ordered)

---@param force LuaForce
function setup_force(force)
  if is_system_force(force.name) then return end

  local force_name = force.name
  if global.forces[force_name] then return end
  Log.debug("setup_force: "..force_name)
  global.forces = global.forces or {}
  global.forces[force_name] = {
    force_name = force_name,
    zones_discovered_count = 0, -- planets and moons discovered
    zones_discovered = {}, -- name = ForceZoneData{discovered_at = tick discovered, marker = map marker}
    satellites_launched = 0,
    cargo_rockets_launched = 0,
    cargo_rockets_crashed = 0,
    zone_assets = {}, -- zone_index > (rocket_launch_pad_names/ rocket_landing_pad_names)
    zone_priorities = {}
  }
  local homeworld = Zone.from_name("Nauvis") --[[@as PlanetType]]
  global.forces[force_name].homeworld_index = homeworld.index
  Zone.discover(force_name, homeworld)
  Zone.discover(force_name, homeworld.parent)
  for _, zone in pairs(global.zone_index) do
    if zone.is_homeworld then
      global.forces[force_name].zone_priorities[zone.index] = global.forces[force_name].zone_priorities[zone.index] or 1
    end
  end

  local friendly = game.forces["friendly"]
  if friendly then
    friendly.set_friend(force, true)
    force.set_friend(friendly, true)
  end

  local ignore = game.forces["ignore"]
  if ignore then
    ignore.set_cease_fire(force, true)
    force.set_cease_fire(ignore, true)
  end

  local capture = game.forces["capture"]
  if capture then
    capture.set_cease_fire(force, true)
    force.set_cease_fire(capture, true)
  end
end

---@param force LuaForce
---@return string[]
function allied_forces(force)
  local allied_forces = {}
  for _, oforce in pairs(game.forces) do
    if oforce.name == force.name or force.get_friend(oforce) then
      table.insert(allied_forces, oforce.name)
    end
  end
  return allied_forces
end

---@param force LuaForce
---@return string[]
function ceasefire_forces(force)
  local ceasefire_forces = {}
  for _, oforce in pairs(game.forces) do
    if oforce.name == force.name or force.get_cease_fire(oforce) then
      table.insert(ceasefire_forces, oforce.name)
    end
  end
  return ceasefire_forces
end

---@param force LuaForce
---@return string[]
function enemy_forces(force)
  local enemy_forces = {}
  for _, oforce in pairs(game.forces) do
    if oforce ~= force and not force.get_cease_fire(oforce) then
      if (not is_system_force(oforce.name)) or oforce.name == "enemy" or oforce.name == "conquest" then
        table.insert(enemy_forces, oforce.name)
      end
    end
  end
  return enemy_forces
end

---Returns true if given force name is registered in `global.forces` to have players.
---@param force_name string Name of force to evaluate
---@return boolean is_player_force
function is_player_force(force_name)
  return (global.forces[force_name] ~= nil and global.forces[force_name].has_players)
end

---Returns an array of names of forces that have players.
---@return string[] force_names Array of force names
function get_player_forces()
  local force_names = {}
  for name, forcedata in pairs(global.forces) do
    if forcedata.has_players and game.forces[name] then
      table.insert(force_names, name)
    end
  end
  return force_names
end

---@param force LuaForce
---@param surface LuaSurface
---@param position MapPosition
---@return LuaEntity|false
function find_enemy(force, surface, position)
  local enemy_forces = enemy_forces(force)

  for _, radius in pairs({8,32,256,1024}) do
    local enemies = surface.find_entities_filtered{
      force = enemy_forces,
      type = {"unit-spawner", "turret"},
      position = position,
      radius = radius
    }
    if next(enemies) then return enemies[math.random(#enemies)] end
  end

  local enemy = surface.find_nearest_enemy{position=position, max_distance=20000, force=force}
  if enemy then return enemy end

  -- final try, anything enemy anywhere
  local enemies = surface.find_entities_filtered{ force = enemy_forces }
  if next(enemies) then
    enemy = enemies[math.random(#enemies)]
    if enemy.destructible and enemy.is_entity_with_health then
      return enemy
    end

    for _, enemy in pairs(enemies) do
      if enemy.destructible and enemy.is_entity_with_health then
        return enemy
      end
    end
  end

  return false
end

--/c remote.call("space-exploration", "set_force_homeworld", {zone_name = "Arendel", force_name = "player-2", spawn_position = {x = 0, y = 0}, reset_discoveries = true})
---@param data {zone_name:string, force_name:string, spawn_position?: MapPosition, reset_discoveries?:boolean}
function set_force_homeworld(data)
  local zone = Zone.from_name(data.zone_name)
  if not zone then return game.print({"space-exploration.no_zone_found"}) end
  if not zone.is_homeworld then return game.print({"space-exploration.zone_must_be_a_homeworld"}) end

  local force = game.forces[data.force_name]
  if not force  then return game.print({"space-exploration.no_force_found"}) end

  local force_data = global.forces[data.force_name]
  if not force_data  then return game.print({"space-exploration.no_force_data_found"}) end

  force_data.homeworld_index = zone.index
  Zone.get_make_surface(zone) -- make sure the surface exists
  force.set_spawn_position(data.spawn_position or {x = 0, y = 0}, zone.surface_index)

  if data.reset_discoveries then
    force_reset_discoveries(data.force_name)
  end
end

---@param force_name string
function force_reset_discoveries(force_name)
  local force_data = global.forces[force_name]
  if not force_data then return game.print({"space-exploration.no_force_data_found", force_name}) end

  force_data.zones_discovered_count = 0
  force_data.zones_discovered = {}
  force_data.satellites_launched = 0
  force_data.zone_priorities = {}
  local homeworld
  if force_data.homeworld_index then
    homeworld = Zone.from_zone_index(force_data.homeworld_index)
  else
    homeworld = Zone.from_name("Nauvis") --[[@as PlanetType]]
  end
  Zone.discover(force_name, homeworld)
  Zone.discover(force_name, homeworld.parent)
  for _, zone in pairs(global.zone_index) do
    if zone.is_homeworld then
      global.forces[force_name].zone_priorities[zone.index] = global.forces[force_name].zone_priorities[zone.index] or 1
    end
  end
end

---@param force_name string
---@return boolean
function is_system_force(force_name)
  return system_forces[force_name]
    or string.starts(force_name, "EE_") -- Editor Extensions
    or string.starts(force_name, "bpsb-") -- Blueprint Sandboxes
end

function setup_util_forces()

  if not game.forces["conquest"] then
    game.create_force("conquest") -- will shoot at the player, does not show icons, cannot be deconstructed. Has capture mechanic but active entities must be destroyed.
  end
  local conquest = game.forces["conquest"]
  conquest.ai_controllable = true

  if not game.forces["ignore"] then
    game.create_force("ignore") -- won't shoot at the player, does not show icons, cannot be deconstructed.
  end
  local ignore = game.forces["ignore"]
  for _, force in pairs(game.forces) do
    ignore.set_cease_fire(force, true)
    force.set_cease_fire(ignore, true)
  end

  if not game.forces["capture"] then
    game.create_force("capture") -- won't shoot at the player, does not show icons, cannot be deconstructed. Has capture mechanic.
  end
  local capture = game.forces["capture"]
  for _, force in pairs(game.forces) do
    capture.set_cease_fire(force, true)
    force.set_cease_fire(capture, true)
  end

  if not game.forces["friendly"] then
    game.create_force("friendly") -- acts like a player entity, displays power icons, can be deconstructured by player
  end
  local friendly = game.forces["friendly"]
  for _, force in pairs(game.forces) do
    friendly.set_friend(force, true)
    force.set_friend(friendly, true)
  end

  local enemy = game.forces["enemy"]
  enemy.set_friend(conquest, true)
  conquest.set_friend(enemy, true)

  capture.set_friend(conquest, true)
  conquest.set_friend(capture, true)
  capture.set_friend(ignore, true)
  ignore.set_friend(capture, true)
  capture.set_friend(enemy, true)
  enemy.set_friend(capture, true)

  ignore.set_friend(conquest, true)
  conquest.set_friend(ignore, true)
  ignore.set_friend(enemy, true)
  enemy.set_friend(ignore, true)
end

---@param event EventData.on_force_created Event data
function on_force_created(event)
  setup_force(event.force)
end
Event.addListener(defines.events.on_force_created, on_force_created)

function setup_collision_layers()

  collision_mask_util_extended.named_collision_mask_integrity_check() -- detect non-1 mask entities

  global.named_collision_masks = {}

  -- a full-height wall that you cannot fly though, such as the wall of an underground tunnel.
  global.named_collision_masks.flying_layer = collision_mask_util_extended.get_named_collision_mask("flying-layer")
  -- things that should block projectiles
  global.named_collision_masks.projectile_collision_layer = collision_mask_util_extended.get_named_collision_mask("projectile-layer")
  -- empty space only
  global.named_collision_masks.empty_space_collision_layer = collision_mask_util_extended.get_named_collision_mask("empty-space-tile")
  -- All space tiles have this
  global.named_collision_masks.space_collision_layer = collision_mask_util_extended.get_named_collision_mask("space-tile")
  -- Spaceship tiles move around
  global.named_collision_masks.spaceship_collision_layer = collision_mask_util_extended.get_named_collision_mask("moving-tile")
  -- All planet tiles have this
  global.named_collision_masks.planet_collision_layer = collision_mask_util_extended.get_named_collision_mask("planet-tile")

end

-- Disables vanilla win, plus Better Victory Screen support
local function disable_vanilla_win()
  for _, interface in pairs({"silo_script", "better-victory-screen"}) do
    if remote.interfaces[interface] and remote.interfaces[interface]["set_no_victory"] then
      remote.call(interface, "set_no_victory", true)
    end
  end
end

---@param event ConfigurationChangedData
function on_configuration_changed(event)

  Essential.detect_breaking_prototypes()

  -- this must be first in case other changes alter a tech and the saved table is invalidated.
  Tech.record_old_forces_technologies()

  global.tick_tasks = global.tick_tasks or {}

  setup_collision_layers()

  Essential.enable_critical_techs() -- needed after bad mod removal

  AbandonedRuins.exclude_surfaces()

  if not global.core_mining then CoreMiner.create_core_mining_tables() end

  Zone.create_inhabited_chunks()

  Migrate.do_migrations(event)

  if script.level.is_simulation or is_testing_game() then
    return -- Skip the rest of on_configuration_changed to speed up loading
  end

  Migrate.always_do_migrations()

  local zone = Zone.from_name("Nauvis") --[[@as PlanetType]]
  zone.fragment_name = "se-core-fragment-omni"
  zone.surface_index = 1
  zone.inflated = true

  if global.astronomical then
    global.universe = global.astronomical
    global.astronomical = nil
  end

  if global.forces then
    for force_name in pairs(global.forces) do
      local forcedata = global.forces[force_name]
      forcedata.force_name = force_name
      if (not forcedata.homeworld_index) and not is_system_force(force_name) then
        forcedata.homeworld_index = zone.index
      end
    end
  end

  for _, force in pairs(game.forces) do
    force.reset_recipes()
    if force.technologies["radar"] then
      force.technologies["radar"].enabled = true
    end
  end

  -- enable any recipes that should be unlocked.
  -- mainly required for entity-update-externals as a migration file won't work
  for _, force in pairs(game.forces) do
    for _, tech in pairs(force.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
            force.recipes[effect.recipe].enabled = true
          end
        end
      end
    end
  end

  if global.next_meteor_shower and
    global.next_meteor_shower > game.tick + 60 * 60 * settings.global["se-meteor-interval"].value then
    global.next_meteor_shower = game.tick + math.random() * 60 * 60 * settings.global["se-meteor-interval"].value
  end

  if not global.remove_placement_restrictions then
    Zone.zones_fix_all_tiles()
  end

  Universe.load_resource_data()

  local zone = Zone.from_name("Nauvis") --[[@as PlanetType]]
  zone.fragment_name = "se-core-fragment-omni"
  zone.surface_index = 1
  zone.inflated = true
  zone.resources = {}
  zone.ticks_per_day = 25000

  CoreMiner.equalise_all()

  global.cache_travel_delta_v = nil

  if game.technology_prototypes[mod_prefix.."linked-container"] then
    for _, force in pairs(game.forces) do
      force.technologies[mod_prefix.."teleportation"].enabled = true
    end
  end

  update_spidertron_lists()

  Tech.clear_old_forces_technologies()

  Pin.validate_pin_signals()

  disable_vanilla_win()

  game.print({"space-exploration.please-consider-patreon"})

end
Event.addListener("on_configuration_changed", on_configuration_changed, true)

-- When creating a new game, script.on_init() will be called on each mod that has a control.lua file.
-- When loading a save game and the mod did not exist in that save game script.on_init() is called.
function on_init()

    -- Astronomical first
    global.seed = game.get_surface(1).map_gen_settings.seed
    global.next_tick_task_id = 1
    global.tick_tasks = {}

    setup_collision_layers()

    Essential.detect_breaking_prototypes()

    Essential.enable_critical_techs() -- needed after bad mod removal


    if not is_testing_game() then
      local warned = warn_for_non_freeplay_scenario()
      if not warned then
        warn_for_nondefault_settings()
      end
    end

    AbandonedRuins.exclude_surfaces()

    setup_util_forces()

    update_spidertron_lists()

    ---Global table containing all core mining entities indexed by miner entity `unit_number`.
    ---@type IndexMap<CoreMiningInfo>
    global.core_mining = {}

    ---Table of meteor zones, indexed by zone index
    ---@type IndexMap<AnyZoneType>
    global.meteor_zones = {}

    Universe.build()

    if Log.debug_big_logs then
      Log.log_universe_simplified()
      Log.log_universe()
    end

    -- Other stuff second
    global.playerdata = global.playerdata or {}
    global.forces = global.forces or {}

    for _, force in pairs(game.forces) do
      setup_force(force)
    end

    Migrate.fill_tech_gaps(false)

    for _, force in pairs(game.forces) do


        force.reset_recipes()

        -- enable any recipes that should be unlocked.
        -- mainly required for entity-update-externals as a migration file won't work
        for _, tech in pairs(force.technologies) do
          if tech.researched then
            for _, effect in pairs(tech.effects) do
              if effect.type == "unlock-recipe" and force.recipes[effect.recipe] then
                force.recipes[effect.recipe].enabled = true
              end
            end
          end
        end

        for tech in pairs(force.technologies['rocket-silo'].prerequisites) do
          force.technologies[tech].enabled = true
        end
    end

    if remote.interfaces["freeplay"] and remote.interfaces["freeplay"]["set_created_items"] and remote.interfaces["freeplay"]["get_created_items"] then
      local stacks = remote.call("freeplay", "get_created_items")
      for _, starting_item_stack in pairs(first_starting_item_stacks) do
        stacks[starting_item_stack.name] = starting_item_stack.count
      end
      remote.call("freeplay", "set_created_items", stacks)
    end

    -- Disable vanilla win
    disable_vanilla_win()
end
Event.addListener("on_init", on_init, true)

---@param event EventData.on_player_respawned|EventData.on_player_created|{player_index:uint} Event data
function on_player_spawned(event)
  local player = game.get_player(event.player_index)
  ---@cast player -?
  if player and player.character then
    for _, item_stack in pairs(starting_item_stacks) do
      player.insert(item_stack)
    end
  end
  local forcedata = global.forces[player.force.name]
  if forcedata then
    forcedata.has_players = true
  end
  update_overhead_buttons(player)
end
Event.addListener(defines.events.on_player_respawned, on_player_spawned)

---@param event EventData.on_player_changed_force Event data
function on_player_changed_force(event)
  local player = game.get_player(event.player_index)
  ---@cast player -?
  setup_force(player.force)
  local forcedata = global.forces[player.force.name]
  if forcedata then
    forcedata.has_players = true
  end
  TrainGUI.gui_close(player) -- Force close GUI, new force might not have access
end
Event.addListener(defines.events.on_player_changed_force, on_player_changed_force)

---@param event EventData.on_player_created Event data
function on_player_created(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and player.connected then
    player.print({"space-exploration.please-consider-patreon"})
  end
  if not player.get_quick_bar_slot(10) then
    player.set_quick_bar_slot(10, mod_prefix.."medpack")
  end
  on_player_spawned(event)
end
Event.addListener(defines.events.on_player_created, on_player_created)

---@param event EventData.on_player_joined_game Event data
function on_player_joined_game(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player and player.connected then
    player.print({"space-exploration.please-consider-patreon"})
  end
  local forcedata = global.forces[player.force.name]
  if forcedata then
    forcedata.has_players = true
  end
  update_overhead_buttons(player)
end
Event.addListener(defines.events.on_player_joined_game, on_player_joined_game)

-- Fix for Factorio 1.1
---@param player LuaPlayer
function update_overhead_buttons(player)
  local button_flow = mod_gui.get_button_flow(player)
  if button_flow["informatron_overhead"] then
    local caption = button_flow["informatron_overhead"].caption
    local tooltip = button_flow["informatron_overhead"].tooltip
    local sprite = button_flow["informatron_overhead"].sprite
    button_flow["informatron_overhead"].destroy()
    button_flow.add{type="sprite-button", name="informatron_overhead", sprite = sprite, tooltip = tooltip}
  end

  if button_flow[RemoteView.name_button_overhead_satellite] then button_flow[RemoteView.name_button_overhead_satellite].destroy() end
  RemoteView.update_overhead_button(player.index)

  if button_flow[MapView.name_button_overhead_interstellar] then button_flow[MapView.name_button_overhead_interstellar].destroy() end
  MapView.update_overhead_button(player.index)

  if button_flow[Zonelist.name_button_overhead_explorer] then button_flow[Zonelist.name_button_overhead_explorer].destroy() end
  Zonelist.update_overhead_button(player)
end

-- Returns true if the game is a testing game (from Editor Extensions or from ctrl+clicking "New Game")
---@return boolean
function is_testing_game()
  return script.level.level_name == "testing" or
         script.level.mod_name == "EditorExtensions" or
         game.default_map_gen_settings.height == 50 and game.default_map_gen_settings.width == 50 -- vanilla debug map
end

---@param event EventData.on_pre_player_left_game Event data
function on_pre_player_left_game(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  if player then
    --needed to make sure the RemoteView satellite spotlight is not orphaned
    RemoteView.stop(player)
  end
end
Event.addListener(defines.events.on_pre_player_left_game, on_pre_player_left_game)

-- merge in all of an old force to a new force
---@param event EventData.on_forces_merged Event data
function on_forces_merged(event)
  -- add things like launch counts
  -- merge things like zone assets
  -- use a single value for things like satellite position
  Log.debug("merging forces: " .. event.source_name .. " to " .. event.destination.name)
  local source_forcedata = global.forces[event.source_name]
  local destination_forcedata = global.forces[event.destination.name]
  if source_forcedata and destination_forcedata then
    -- zones_discovered
    if source_forcedata.zones_discovered then
      destination_forcedata.zones_discovered = destination_forcedata.zones_discovered or {}
      for a, b in pairs(source_forcedata.zones_discovered) do
        if not destination_forcedata.zones_discovered[a] then
          destination_forcedata.zones_discovered[a] = b
        end
      end
      destination_forcedata.zones_discovered_count = table_size(destination_forcedata.zones_discovered)
    end
    --zone_priorities
    if source_forcedata.zone_priorities then
      destination_forcedata.zone_priorities = destination_forcedata.zone_priorities or {}
      for a, b in pairs(source_forcedata.zone_priorities) do
        if not destination_forcedata.zone_priorities[a] then
          destination_forcedata.zone_priorities[a] = b
        else
          destination_forcedata.zone_priorities[a] = math.max(destination_forcedata.zone_priorities[a], b)
        end
      end
    end
    --satellites_launched
    if source_forcedata.satellites_launched then
      destination_forcedata.satellites_launched = (destination_forcedata.satellites_launched or 0) + source_forcedata.satellites_launched
    end
    --cargo_rockets_launched
    if source_forcedata.cargo_rockets_launched then
      destination_forcedata.cargo_rockets_launched = (destination_forcedata.cargo_rockets_launched or 0) + source_forcedata.cargo_rockets_launched
    end
    --cargo_rockets_crashed
    if source_forcedata.cargo_rockets_crashed then
      destination_forcedata.cargo_rockets_crashed = (destination_forcedata.cargo_rockets_crashed or 0) + source_forcedata.cargo_rockets_crashed
    end
    --first_discovered_vault
    if source_forcedata.first_discovered_vault and not destination_forcedata.first_discovered_vault then
      destination_forcedata.first_discovered_vault = source_forcedata.first_discovered_vault
    end
    --first_entered_vault
    if source_forcedata.first_entered_vault and not destination_forcedata.first_entered_vault then
      destination_forcedata.first_entered_vault = source_forcedata.first_entered_vault
    end
    --solar_flare
    if source_forcedata.solar_flare and not destination_forcedata.solar_flare then
      destination_forcedata.solar_flare = source_forcedata.solar_flare
    end

    --arcospheres
    if source_forcedata.arcosphere_collectors_launched then
      destination_forcedata.arcosphere_collectors_launched = (destination_forcedata.arcosphere_collectors_launched or 0) + source_forcedata.arcosphere_collectors_launched
    end
    if source_forcedata.arcospheres_collected then
      destination_forcedata.arcospheres_collected = (destination_forcedata.arcospheres_collected or 0) + source_forcedata.arcospheres_collected
    end

    local single_depth_tables = {
      "chart_tag_buffer",
      "tick_tasks",
      "gravimetrics_labs",
      "space_capsule_launches",
      "delivery_cannons",
      "rocket_landing_pads",
      "rocket_launch_pads",
      "spaceships",
      "nexus"
    }
    for _, table_name in pairs(single_depth_tables) do
      if global[table_name] then
        for _, thing in pairs(global[table_name]) do
          if thing.force_name == event.source_name then
             thing.force_name = event.destination.name
          end
        end
      end
    end

    -- Zones
    for _, zone in pairs(global.zone_index) do
      local single_depth_tables = {
        "energy_transmitters",
      }
      for _, table_name in pairs(single_depth_tables) do
        if source_forcedata.zone_assets[table_name] then
          for _, thing in pairs(global[table_name]) do
            if thing.force_name == event.source_name then
               thing.force_name = event.destination.name
            end
          end
        end
      end
    end

    --zone_assets
    if source_forcedata.zone_assets then

      local single_depth_tables = {
        "energy_beam_defence",
      }
      for _, table_name in pairs(single_depth_tables) do
        if source_forcedata.zone_assets[table_name] then
          for _, thing in pairs(global[table_name]) do
            if thing.force_name == event.source_name then
               thing.force_name = event.destination.name
            end
          end
        end
      end

      destination_forcedata.zone_assets = destination_forcedata.zone_assets or {}
      for a, b in pairs(source_forcedata.zone_assets) do
        if not destination_forcedata.zone_assets[a] then
          destination_forcedata.zone_assets[a] = b
        else
          for table_name, subtable in pairs(b) do
            if not destination_forcedata.zone_assets[a][table_name] then
              destination_forcedata.zone_assets[a][table_name] = subtable
            elseif table_name == "rocket_launch_pad_names" or table_name == "rocket_landing_pad_names" then
              for name, structs in pairs(subtable) do
                destination_forcedata.zone_assets[a][table_name][name] = destination_forcedata.zone_assets[a][table_name][name] or {}
                for unit_number, struct in pairs(structs) do
                  destination_forcedata.zone_assets[a][table_name][name][unit_number] = struct
                end
              end
            end
          end
        end
      end
      destination_forcedata.zones_discovered_count = table_size(destination_forcedata.zones_discovered)
    end
    --zone_assets
    if source_forcedata.rocket_landing_pad_names then
      if not destination_forcedata.rocket_landing_pad_names then
        destination_forcedata.rocket_landing_pad_names = source_forcedata.rocket_landing_pad_names
      else
        for name, structs in pairs(source_forcedata.rocket_landing_pad_names) do
          destination_forcedata.rocket_landing_pad_names[name] = destination_forcedata.rocket_landing_pad_names[name] or {}
          for unit_number, struct in pairs(structs) do
            destination_forcedata.rocket_landing_pad_names[name][unit_number] = struct
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_forces_merged, on_forces_merged)

---Cancels the creation of an entity if not built in an SE zone or (optionally) by a player force.
---@param zone? AnyZoneType|SpaceshipType Zone entity is getting built in, if any
---@param entity LuaEntity Entity creatd
---@param event EntityCreationEvent|EventData.on_entity_cloned
---@param ignore_force? boolean Whether to skip player force check
---@return boolean
function cancel_creation_when_invalid(zone, entity, event, ignore_force)
  if not zone then
    cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-surface-without-zone"}, event)
    return true
  elseif not ignore_force and not is_player_force(entity.force.name) then
    cancel_entity_creation(entity, event.player_index, {"space-exploration.construction-denied-not-player-force"}, event)
    return true
  end
  return false
end

---@param inventory LuaInventory
---@return string[]
function find_items_banned_from_transport(inventory)
  local found_banned_items = {}
  for item_name, _count in pairs(inventory.get_contents()) do
    if global.items_banned_from_transport[item_name] then
      table.insert(found_banned_items, item_name)
    end
  end
  return found_banned_items
end

---@param character LuaEntity
---@return string[]
function find_items_banned_from_transport_in_character(character)
  local found_banned_items = {}
  for _, inventory_type in pairs({defines.inventory.character_main, defines.inventory.character_trash}) do
    local inventory = character.get_inventory(inventory_type)
    local banned_items_in_inventory = find_items_banned_from_transport(inventory)
    Util.concatenate_tables(found_banned_items, banned_items_in_inventory)
  end
  if character.cursor_stack and character.cursor_stack.valid_for_read and global.items_banned_from_transport[character.cursor_stack.name] then
    table.insert(found_banned_items, character.cursor_stack.name)
  end
  return found_banned_items
end

function trigger_victory(force, message)
  if remote.interfaces["better-victory-screen"] and remote.interfaces["better-victory-screen"]["trigger_victory"] then
    remote.call("better-victory-screen", "trigger_victory",
      force, -- winning force
      true, -- Force victory screen even if we did the other victory
      message -- winning message
    )
  else
    game.reset_game_state() -- Force victory screen even if we did the other victory
    game.set_game_state{
      game_finished=true,
      player_won=true,
      can_continue=true,
      victorious_force=force}
  end
end

require('scripts/remote-interface')
require('menu-simulations/menu-simulations-remote-interface')

-- Setup remotes needed by simulations that aren't otherwise loaded during the sims
-- TODO: Ideally this would be done inside the `menu-simulations` mod.
if script.level.is_simulation then
  if not remote.interfaces["jetpack"] then
    remote.add_interface("jetpack", {
      ["get_jetpacks"] = function(data) return {} end,
      ["block_jetpack"] = function(data) end,
      ["unblock_jetpack"] = function(data) end
    })
  end
end


--log( serpent.block( data.raw["projectile"], {comment = 1false, numformat = '%1.8g' } ) )
-- /c Log.debug(serpent.block( game.surfaces.nauvis.map_gen_settings.autoplace_controls, {comment = false, numformat = '%1.8g' }))
