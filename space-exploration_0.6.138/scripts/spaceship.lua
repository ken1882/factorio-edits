local Spaceship = {}

Spaceship.names_tech_integrity = {
  {name = mod_prefix.."spaceship-integrity", bonus_per_level = 100, infinite = false},
  {name = mod_prefix.."factory-spaceship", bonus_per_level = 500, infinite = true}
}
Spaceship.integrity_base = 300
Spaceship.integrity_cost_per_container_slot = 0.5
Spaceship.integrity_cost_per_fluid_capacity = 0.0005 -- 2000 fluid per integrity point
Spaceship.integrity_cost_per_phantom_tile = 0.25
Spaceship.integrity_credit_per_wall = 0.75
Spaceship.integrity_cost_per_equipment_type = {
  ["default"] = 1,
  ["belt-immunity-equipment"] = 0,
  ["movement-bonus-equipment"] = 0,
  ["night-vision-equipment"] = 0,
}

Spaceship.name_spaceship_console = mod_prefix .. "spaceship-console"
Spaceship.name_spaceship_console_output = mod_prefix .. "spaceship-console-output"
Spaceship.console_output_offset = {x = 1.5, y = -1}

Spaceship.engine_efficiency_blocked = 0.60
Spaceship.engine_efficiency_unblocked = 1
Spaceship.engine_efficiency_unblocked_taper = 20
Spaceship.engine_efficiency_side = 0.01
Spaceship.engines = {
  [mod_prefix .. "spaceship-rocket-engine"] = { name = mod_prefix .. "spaceship-rocket-engine", thrust = 100 / 5, max_energy = 1837, smoke_trigger = mod_prefix .. "spaceship-engine-smoke" },
  [mod_prefix .. "spaceship-ion-engine"] = { name = mod_prefix .. "spaceship-ion-engine", thrust = 250 / 5, max_energy = 183700, smoke_trigger = mod_prefix .. "spaceship-engine-smoke" },
  [mod_prefix .. "spaceship-antimatter-engine"]= { name = mod_prefix .. "spaceship-antimatter-engine", thrust = 500 / 5, max_energy = 18370, smoke_trigger = mod_prefix .. "spaceship-engine-smoke" }
}
Spaceship.names_engines = {}
Spaceship.names_engines_map = {}
Spaceship.names_smoke_trigger = {}

Spaceship.names_booster_tanks = {
  mod_prefix .. "spaceship-rocket-booster-tank",
  mod_prefix .. "spaceship-ion-booster-tank",
  mod_prefix .. "spaceship-antimatter-booster-tank"
}
Spaceship.names_planet_booster_tanks = {
  mod_prefix .. "spaceship-rocket-booster-tank",
  mod_prefix .. "spaceship-antimatter-booster-tank"
}
Spaceship.ion_stream_energy = 4000000 -- 2x rocket fuel

Spaceship.overweight_generator_names = nil -- cache of generator names that add stress
Spaceship.cache_generator_stress = nil -- cache of generator entities that add stress
Spaceship.cache_no_stress_entity_names = nil -- cache of entity names that shouldn't add any stress

Spaceship.names_spaceship_floors = {mod_prefix .. "spaceship-floor"}
Spaceship.names_spaceship_floors_map = core_util.list_to_map(Spaceship.names_spaceship_floors)
Spaceship.names_spaceship_walls = {mod_prefix .. "spaceship-wall"}
Spaceship.names_spaceship_walls_map = core_util.list_to_map(Spaceship.names_spaceship_walls)
Spaceship.names_spaceship_gates = {mod_prefix .. "spaceship-gate"}
Spaceship.names_spaceship_gates_map = core_util.list_to_map(Spaceship.names_spaceship_gates)
Spaceship.names_spaceship_bulkheads = {
  mod_prefix .. "spaceship-wall",
  mod_prefix .. "spaceship-gate",
  SpaceshipClamp.name_spaceship_clamp_keep,
}
for _, engine in pairs(Spaceship.engines) do
  table.insert(Spaceship.names_engines, engine.name)
  Spaceship.names_engines_map[engine.name] = true
  table.insert(Spaceship.names_spaceship_bulkheads, engine.name)
  if engine.smoke_trigger then
    table.insert(Spaceship.names_smoke_trigger, engine.smoke_trigger)
  end
end
Spaceship.names_spaceship_bulkheads_map = core_util.list_to_map(Spaceship.names_spaceship_bulkheads)

Spaceship.integrity_affecting_types = {
  {type=""} -- This table cannot be empty. Remove this line when adding an entry.
}
Spaceship.integrity_affecting_names = {
  {name = mod_prefix.."nexus", integrity_stress_container = 2000},
  {name = mod_prefix.."linked-container", integrity_stress_container = 1000},
  {mod = "Krastorio2", name = "kr-antimatter-reactor", integrity_stress_structure = 100, integrity_stress_container = 100, max_speed_multiplier = 0.5},
}

Spaceship.signal_for_own_spaceship_id = {type = "item", name = Spaceship.name_spaceship_console}
Spaceship.signal_for_destination_spaceship = {type = "virtual", name = mod_prefix.."spaceship"}
Spaceship.signal_for_speed = {type = "virtual", name = "signal-speed"}
Spaceship.signal_for_distance = {type = "virtual", name = "signal-distance"}
Spaceship.signal_for_launch = {type = "virtual", name = mod_prefix.."spaceship-launch"}
Spaceship.signal_for_anchor_using_left = {type = "virtual", name = mod_prefix.."anchor-using-left-clamp"}
Spaceship.signal_for_anchor_using_right = {type = "virtual", name = mod_prefix.."anchor-using-right-clamp"}
Spaceship.signal_for_anchor_to_left = {type = "virtual", name = mod_prefix.."anchor-to-left-clamp"}
Spaceship.signal_for_anchor_to_right = {type = "virtual", name = mod_prefix.."anchor-to-right-clamp"}

Spaceship.energy_per_launch_integrity_delta_v = 135 * 1000
Spaceship.tick_interval_density = 60 -- must coincide with %60
Spaceship.tick_interval_move = 20 -- must coincide with %60
Spaceship.tick_interval_anchor = 5 -- must coincide with %60
Spaceship.tick_interval_gui = 5 -- must coincide with %60
Spaceship.tick_interval_output = 60

Spaceship.tick_max_await = 60 * 10 -- 10 seconds

Spaceship.types_to_restore = {-- after surface change/area clone
  "inserter",
  "pump",
  --"transport-belt" -- entity.active does not work on belts
}

-- Note: production machines should NOT be included as some are supposed to be disabled on specific surfaces.
Spaceship.time_to_restore = 1

Spaceship.particle_speed_power = 0.75 -- 0.5 would be sqrt, 0 is static, 1 is linear with speed.
Spaceship.space_drag = 0.00135
Spaceship.minimum_impulse = 1/100
Spaceship.minimum_mass = 100
Spaceship.speed_taper = 250
Spaceship.travel_speed_multiplier = 1/200
Spaceship.integrity_pulse_interval = 60 * 60 * 10
Spaceship.tile_status = {}

--[[
change to:
{
  outer = 0 or 1. outer skin of tiles including diagonals
  floor = 0 or 1, has floor otherwise exterior
  exposed = 0 for contained, or higher for any tile exposed to space
  wall = 0 or 1, walls only
  bulkhead = 0 or 1, any bulkhead
  connection nil or distance to console.
}

]]--

Spaceship.tile_status.exterior = 1 -- any tile not with flooring (without bulkhead)
Spaceship.tile_status.wall_exterior = 2 -- bulkeahd outside of flooring
Spaceship.tile_status.bulkhead_exterior = 3 -- bulkeahd outside of flooring
Spaceship.tile_status.floor = 4 -- unknown floor
Spaceship.tile_status.wall = 5 -- unknown bulkhead
Spaceship.tile_status.bulkhead = 6 -- unknown bulkhead
Spaceship.tile_status.floor_exterior = 7 -- outside floor
Spaceship.tile_status.floor_interior = 8 -- contained floor
Spaceship.tile_status.floor_console_disconnected = 9 -- disconnected floor
Spaceship.tile_status.wall_console_disconnected = 10 -- disconnected bulkhead
Spaceship.tile_status.bulkhead_console_disconnected = 11 -- disconnected bulkhead
Spaceship.tile_status.floor_console_connected = 12 -- connected floor
Spaceship.tile_status.wall_console_connected = 13 -- connected bulkhead
Spaceship.tile_status.bulkhead_console_connected = 14 -- connected bulkhead



  --[[ tile statuses
    1 = exterior
    2 = floor_pending (on the edge of checking, used for next tick)
    3 = unknown floor (exists but unknown containment statis)
    4 = exterior floor
    5 = bulkhead (floor with wall or gate)
    6 = interior (contained) floor
  ]]--

--[[
console sends out a pule over all connected spaceship tiles (with a max based on tech)
then consider all tiles with wall or gate.
divide tiles into groups, ones that touch the outside are not part of the ship.
]]--

Spaceship.names = {
  "Abaddon", "Ackbar", "Aegis", "Albatross", "Alchemist", "Albion", "Alexander",
    "Angler", "Apparition", "ArchAngel", "Assassin", "Avenger", "Axe",
  "Bade", "Bardiche", "Battleth", "Blackbird", "Bounty Hunter", "Breaker",
    "Brigandine","Bullfinch", "Buzzard",
  "Cartographer", "Catface", "Calamari", "Canary", "Caravel", "Carrak", "Citadel", "Clockwerk",
    "Chimera", "Coot", "Cormorant", "Crane", "Crossbill", "Crow", "Cuckoo",
  "Darkstar", "Dauntless", "Desby", "Dragon", "Drake", "Dream", "Doombringer",
    "Dolphin", "Devourer", "Dunn",
  "Eagle", "Earthshaker", "Earl Grey", "Egret", "Eider", "Ember", "Enigma", "Eris", "Excalibur",
  "Falcon", "Falx", "Feral Pigeon", "Firecrest", "Firefly", "Flying Duckman",
    "Fountain", "Fulmar",
  "Gadwall", "Gannet", "Garganey", "Gigantosaurus", "Ghast", "Ghoul", "Ghost",
    "Glaive", "Goldcrest", "Goldeneye", "Goldfinch", "Goosander", "Goose",
    "Goshawk", "Grasshopper", "Greenfinch", "Griffon", "Grouse", "Guillemot",
  "Halberd", "Hammer", "Hammerhead", "Harrier", "Hawk", "Harking", "Heron", "Hippogryph", "Honeybadger", "Honeybear",
  "Iron Cordon", "Ingot", "Intrepid", "Invoker", "Isabella",
  "Jack Snipe", "Jackdaw", "Jay",
  "Kamsta", "Katherine", "Kestrel", "Kingfisher", "Kite", "Knight", "Kraken",
  "Lapwing", "Lance", "Lancer", "Lick", "Linnet", "Lucas",
  "Magi", "Magpie", "Mallard",  "Mangonel", "Medusa", "Memento", "Merlin",
    "Mistress", "Mocking Jay", "Monstrosity", "Moorhen", "Musk",
  "Naga", "Narwhal", "Nebulon", "Nemesis", "Newton", "Nexela", "Nial", "Nicholas",
    "Nightjar", "Nissa", "Nightingale", "Night Stalker",
  "Oracle", "Orca", "Ostricth", "Outrider", "Owl",
  "Partridge", "Pangolin", "Penguin", "Peregrine", "Petrel", "Phantom",
    "Pheasant", "Phoenix", "Piccard", "Pintail", "Pioneer",
    "Pipit", "Plover", "Prophet", "Prowler", "Pochard", "Puffin",
  "Quail",
  "Radiance", "Raptor", "Raven", "Razor", "Razorbill", "Red Kite", "Redshank",
    "Redstart", "Redwing", "Requiem",
    "Riccardo", "Robin", "Roc", "Rook", "Rossi", "Rogue", "Ruff",
  "Sanderling", "Sawfish", "Scythe", "Seraph", "Serenity", "Sickle", "Shadow",
    "Shag", "Sharknado", "Shelduck", "Sherrif", "Shoveler", "Sin Eater", "Siren",
    "Siskin",  "Skylark", "Skyshark", "Skywalker", "Skywrath", "Smew", "Snek",
    "Snipe",  "Sparrowhawk", "Spear", "Spectre", "Spinosaur", "Spynx",
    "Starchaser", "Starling", "Stonechat", "Swallow", "Swan", "Swift", "Swordfish",
  "Tachyon", "Tali", "Tantive", "Teal", "Templar", "Terrorblade", "Tesla", "Thanatos",
    "Throne", "Thrush", "Tigress", "Tin Can", "Titan", "Trebuchet",
    "Trimaran", "Turnstone", "Turing", "Tusk", "Twite",
  "Ursa", "Undertaker", "Undying Dodo", "Underlord",
  "Vengeance", "Viper", "Virtue", "Visage", "Void Hunter", "Volt", "Vulture",
  "Wagtail", "Warbird", "Warbler", "Warcry", "Warden", "Warlock", "Warlord", "Warrunner",
    "Waxwing", "Weaver", "Wheatear", "Whimbrel", "Whinchat", "Whitestar",
    "Wigeon", "Windranger", "Woodcock", "Wraith", "Wrath", "Wren", "Wyvern", "Wyrm",
  "Xena", "Xenon", "Xylem",
  "Yacht", "Yellowhammer", "Yettie",
  "Zenith", "Zilla", "Zombie", "Zweihander"
}


--[[========================================================================================
Helper functions for getting spaceship references.
]]--

---@param spaceship_index uint
---@return SpaceshipType?
function Spaceship.from_index(spaceship_index)
  return global.spaceships[tonumber(spaceship_index)]
end

---@param entity LuaEntity
---@return SpaceshipType?
function Spaceship.from_entity(entity)
  if not entity then return end
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.console and spaceship.console.valid and spaceship.console.unit_number == entity.unit_number then
      return spaceship
    end
  end
end

---@param name string
---@return SpaceshipType?
function Spaceship.from_name(name)
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.name == name then
      return spaceship
    end
  end
end

---@param surface_index uint
---@return SpaceshipType?
function Spaceship.from_own_surface_index(surface_index) -- can't be a zone
  if global.simulation_spaceships then
    for _, spaceship in pairs(global.simulation_spaceships) do
      if spaceship.own_surface_index == surface_index then
        return spaceship
      end
    end
  end
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.own_surface_index == surface_index then
      return spaceship
    end
  end
end

---@param surface LuaSurface
---@param position MapPosition
---@return SpaceshipType?
function Spaceship.from_surface_position(surface, position)
  local x = math.floor(position.x or position[1])
  local y = math.floor(position.y or position[2])
  -- TODO allow multiple spaceships per surface
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.own_surface_index then
      if spaceship.own_surface_index == surface.index then
        return spaceship
      end
    elseif spaceship.console and spaceship.console.valid and spaceship.console.surface == surface then
      -- check tiles
      if spaceship.known_tiles and spaceship.known_tiles[x] and spaceship.known_tiles[x][y] and
        (spaceship.known_tiles[x][y] == Spaceship.tile_status.floor_console_connected
        or spaceship.known_tiles[x][y] == Spaceship.tile_status.bulkhead_console_connected) then
          return spaceship
      end
    end
  end
end

--[[========================================================================================
Helper functions for spaceship states
]]

---@param spaceship SpaceshipType
---@return boolean
function Spaceship.is_on_own_surface(spaceship)
  return spaceship.own_surface_index and not spaceship.awaiting_requests
end

---@param spaceship SpaceshipType
---@return boolean
function Spaceship.is_in_invalid_zone(spaceship)
  return spaceship.zone_index == nil and spaceship.space_distortion == nil and spaceship.stellar_position == nil
end

---Returns whether a given position is within a ship's "console-connected" floor bounds.
---@param position MapPosition Position to evaluate
---@param spaceship SpaceshipType Spaceship to check against
---@param interior_only? boolean If false, also allows `bulkhead_console_connected` tiles. Defaults to true. 
---@return boolean
function Spaceship.is_position_on_spaceship(position, spaceship, interior_only)
  local x = math.floor((position.x or position[1]))
  local y = math.floor((position.y or position[2]))
  local value = spaceship.known_tiles[x] and spaceship.known_tiles[x][y]

  return (value == Spaceship.tile_status.floor_console_connected or
    (interior_only == false and value == Spaceship.tile_status.bulkhead_console_connected))
end

--[[========================================================================================
Helper functions for getting the surfaces a spaceship cares about.
]]

---@param spaceship SpaceshipType
---@return LuaSurface?
function Spaceship.get_own_surface(spaceship)
  local surface = spaceship.own_surface
  if surface and surface.valid then return surface end

  if spaceship.own_surface_name then -- Used for custom spaceship surfaces e.g. simulations
    spaceship.own_surface = game.get_surface(spaceship.own_surface_name)
  else
    spaceship.own_surface = game.get_surface("spaceship-"..spaceship.index)
  end

  return spaceship.own_surface
end

---@param spaceship SpaceshipType
---@return LuaSurface
function Spaceship.get_current_surface(spaceship)
  if spaceship.zone_index then
    local zone = Zone.from_zone_index(spaceship.zone_index)
    if zone then
      return Zone.get_make_surface(zone)
    end
  end
  return Spaceship.get_own_surface(spaceship)
end

--[[
Computes the spaceship integrity limit for a force.
]]

---@param force LuaForce
---@return integer
function Spaceship.get_integrity_limit(force)
  local integrity = Spaceship.integrity_base
  for _, tech_branch in pairs(Spaceship.names_tech_integrity) do
    local i = 1
    while i > 0 do
      local tech = force.technologies[tech_branch.name.."-"..i]
      if (not tech) and i == 1 then
        tech = force.technologies[tech_branch.name]
      end
      if not tech then
        i = -1
      else
        local levels = tech.level - tech.prototype.level + (tech.researched and 1 or 0)
        integrity = integrity + levels * tech_branch.bonus_per_level
        i = i + 1
      end
    end
  end
  return integrity
end

--[[
Computes the cost (in fuel) of launching a spaceship from its current surface.
]]

---@param spaceship SpaceshipType
---@return number?
function Spaceship.get_launch_energy_cost(spaceship)
  if spaceship.zone_index and spaceship.integrity_stress then
    local zone = Zone.from_zone_index(spaceship.zone_index)
    if zone then
      if Zone.is_space(zone) then
        ---@cast zone -PlanetType, -MoonType
        return 250 * spaceship.integrity_stress * Spaceship.energy_per_launch_integrity_delta_v
      end
      ---@cast zone PlanetType|MoonType
      local delta_v = Zone.get_launch_delta_v(zone)
      local energy_cost = delta_v * spaceship.integrity_stress * Spaceship.energy_per_launch_integrity_delta_v
      return energy_cost
    end
  end
end

---Computes the launch energy needed for a given spaceship, updating its `launch_energy` property.
---Returns launch energy as well as an array of all the booster tank lua entities on board.
---@param spaceship SpaceshipType Spaceship data
---@return float launch_energy Spaceship launch energy
---@return LuaEntity[]? booster_tanks Booster tanks
function Spaceship.get_compute_launch_energy(spaceship)
  spaceship.launch_energy = nil
  local tanks = nil
  local zone
  if spaceship.zone_index then
    zone = Zone.from_zone_index(spaceship.zone_index)
  end
  if spaceship.zone_index and spaceship.console and spaceship.console.valid and spaceship.known_tiles then
    spaceship.launch_energy = 0
    local surface = spaceship.console.surface
    tanks = surface.find_entities_filtered{name = Spaceship.names_booster_tanks, area = spaceship.known_bounds}
    for _, tank in pairs(tanks) do
      local tank_x = math.floor(tank.position.x)
      local tank_y = math.floor(tank.position.y)

      if spaceship.known_tiles[tank_x] and spaceship.known_tiles[tank_x][tank_y]
        and spaceship.known_tiles[tank_x][tank_y] == Spaceship.tile_status.floor_console_connected
        and #tank.fluidbox > 0 then
          local fluidbox = tank.fluidbox[1] or {amount = 0}
          if fluidbox.amount > 0 then
            if zone and Zone.is_space(zone) and fluidbox.name == "se-ion-stream" then
              ---@cast zone -PlanetType, -MoonType
              spaceship.launch_energy = spaceship.launch_energy + fluidbox.amount * Spaceship.ion_stream_energy
            else
              spaceship.launch_energy = spaceship.launch_energy + fluidbox.amount * game.fluid_prototypes[fluidbox.name].fuel_value
            end
          end
      end
    end
  end
  return spaceship.launch_energy, tanks
end

---@param spaceship SpaceshipType
---@return MapPosition.0?
function Spaceship.get_console_or_middle_position(spaceship)
  if spaceship.console and spaceship.console.valid then
    return spaceship.console.position
  end
  if spaceship.known_tiles_average_x and spaceship.known_tiles_average_y then
    return {x = spaceship.known_tiles_average_x, y = spaceship.known_tiles_average_y}
  end
end

---@param spaceship SpaceshipType
---@return MapPosition.0?
function Spaceship.get_boarding_position(spaceship)
  if spaceship.known_tiles_average_x and spaceship.known_bounds then
    return {
      x = spaceship.known_bounds.left_top.x + math.random() * (spaceship.known_bounds.right_bottom.x - spaceship.known_bounds.left_top.x),
      y = spaceship.known_bounds.right_bottom.y + 32
    }
  end
  if spaceship.console and spaceship.console.valid then
    return Util.vectors_add(spaceship.console.position, {x = 64 * ( math.random() - 0.5), y = 64})
  end
end

---@param spaceship SpaceshipType
function Spaceship.destroy(spaceship)
  global.spaceships[spaceship.index]  = nil
  spaceship.valid = false

  -- if a player has this gui open then close it
  local gui_name = SpaceshipGUI.name_spaceship_gui_root
  for _, player in pairs(game.connected_players) do
    local root = player.gui.left[gui_name]
    if root and root.tags and root.tags.index == spaceship.index then
      root.destroy()
    end
  end
  if spaceship.own_surface_index then
    game.delete_surface(spaceship.own_surface_index)
    spaceship.own_surface_index = nil
    spaceship.own_surface = nil
  end

  -- make sure that history references to this spaceship are cleaned up
  for _, player in pairs(game.players) do
    RemoteView.make_history_valid(player)
  end
end

--[[========================================================================================
Helper functions for getting information about a spaceship's target destination
]]

---@param spaceship SpaceshipType
---@return (AnyZoneType|SpaceshipType)?
function Spaceship.get_destination_zone(spaceship)
  if spaceship.destination then
    if spaceship.destination.type == "spaceship" then
      return Spaceship.from_index(spaceship.destination.index)
    else
      return Zone.from_zone_index(spaceship.destination.index)
    end
  end
end

---@param spaceship SpaceshipType
---@return boolean
function Spaceship.is_near_destination(spaceship)
  if spaceship.near then
    if not spaceship.destination then
      return true
    elseif spaceship.near.type == spaceship.destination.type
     and spaceship.near.index == spaceship.destination.index then
       return true
    end
  end
  return false
end

---@param spaceship SpaceshipType
---@return boolean
function Spaceship.is_at_destination(spaceship)
  if spaceship.destination and spaceship.destination.type ~= "spaceship" and spaceship.zone_index and spaceship.zone_index == spaceship.destination.index then
     return true
  end
  return false
end

---Gets or makes the spaceship's own surface.
---@param spaceship SpaceshipType Spaceship data
---@return LuaSurface ship_surface
function Spaceship.get_make_spaceship_surface(spaceship)
  local current_surface = spaceship.console.surface
  local ship_surface
  if spaceship.own_surface_index then
    ship_surface = game.get_surface("spaceship-" .. spaceship.index)
  end
  if not ship_surface then
    local map_gen_settings = {
      autoplace_controls = {
        ["planet-size"] = { frequency = 1/1000, size = 1 }
      },
      width = 0,
      height = 0
    }
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
      },
    }
    ship_surface = game.create_surface("spaceship-"..spaceship.index, map_gen_settings)

    ship_surface.freeze_daytime = true
    ship_surface.daytime = 0.4 -- dark but not midnight
    -- normally this daylight shouldn't be used since Spaceship.set_light is called during launch, right after surface creation
    spaceship.own_surface_index = ship_surface.index
    spaceship.own_surface = ship_surface
  end
  if not ship_surface then
    game.print("Error creating ship surface")
  elseif current_surface == ship_surface then
    Log.debug("Same surface")
  end
  return ship_surface
end

---@param character LuaEntity
---@return boolean
local function find_and_warn_banned_items_in_character(character)
  local banned_items = find_items_banned_from_transport_in_character(character)
  if next(banned_items) then
    local name = character.player and character.player.name or "Character"
    character.force.print({"space-exploration.banned-items-in-character", name, serpent.line(banned_items)})
    return true
  else
    return false
  end
end

---@param vehicle LuaEntity
---@return boolean
local function find_and_warn_banned_items_in_passengers(vehicle)
  local has_banned_items = false
  local driver = vehicle.get_driver()
  local passenger = vehicle.get_passenger()
  if driver and driver.object_name ~= "LuaPlayer" then
    has_banned_items = has_banned_items or find_and_warn_banned_items_in_character(driver)
  end
  if passenger and passenger.object_name ~= "LuaPlayer" then
    has_banned_items = has_banned_items or find_and_warn_banned_items_in_character(passenger)
  end
  return has_banned_items
end

---Launches a spaceship.
---@param spaceship SpaceshipType the spaceship data
function Spaceship.launch(spaceship)
  if not spaceship.is_launching then Log.debug("Abort launch not is_launching") return end
  if spaceship.is_doing_check or game.tick <= (spaceship.surface_lock_timeout or 0) then return end

  local automated_launch = spaceship.is_launching_automatically
  spaceship.is_launching = false
  spaceship.is_launching_automatically = false

  if not spaceship.zone_index then Log.debug("Abort launch no zone_index") return end
  if not spaceship.integrity_valid then Log.debug("Abort launch not integrity_valid") return end
  if not spaceship.known_tiles then Log.debug("Abort launch not known_tiles") return end
  if not spaceship.console and spaceship.console.valid then Log.debug("Abort launch not known_tiles") return end

  local current_surface = spaceship.console.surface
  local current_zone = Zone.from_surface(current_surface)

  local required_energy = Spaceship.get_launch_energy_cost(spaceship)
  local _, tanks = Spaceship.get_compute_launch_energy(spaceship)
  if not (required_energy and spaceship.launch_energy and spaceship.launch_energy >= required_energy) then return end

  -- Check for banned items
  if next(global.items_banned_from_transport) then -- If there's any banned item
    local has_banned_items = false
    local banned_items_cargo = {}
    local containers = current_surface.find_entities_filtered({ type = {"container", "logistic-container", "car", "spider-vehicle", "cargo-wagon", "character"}, area = spaceship.known_bounds})
    for _, container in pairs(containers) do
      local tile_pos = Util.position_to_tile(container.position)
      if spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected then
        if container.type == "character" then
          has_banned_items = has_banned_items or find_and_warn_banned_items_in_character(container)
        else
          local inventory_name
          if container.type == "container" or container.type == "logistic-container" then
            inventory_name = defines.inventory.chest
          elseif container.type == "cargo-wagon" then
            inventory_name = defines.inventory.cargo_wagon
          elseif container.type == "car" then
            inventory_name = defines.inventory.car_trunk
            has_banned_items = has_banned_items or find_and_warn_banned_items_in_passengers(container)
          elseif container.type == "spider-vehicle" then
            inventory_name = defines.inventory.spider_trunk
            has_banned_items = has_banned_items or find_and_warn_banned_items_in_passengers(container)
          end
          local inventory = container.get_inventory(inventory_name)
          util.concatenate_tables(banned_items_cargo, find_items_banned_from_transport(inventory))
        end
      end
    end

    if next(banned_items_cargo) then
      game.forces[spaceship.force_name].print({"space-exploration.banned-items-in-spaceship", Zone.get_print_name(spaceship), serpent.line(banned_items_cargo)})
      has_banned_items = true
    end

    if has_banned_items then return end
  end

  -- point of no return
  Log.debug("spaceship launch start")
  local ship_surface = Spaceship.get_make_spaceship_surface(spaceship)

  local linked_containers = current_surface.find_entities_filtered{
    area=spaceship.known_bounds,
    name="se-linked-container"
  }
  for _, linked_container in pairs(linked_containers) do
    linked_container.link_id = 0
  end

  local valid_tanks = {}
  local valid_tank_fuel = {}
  local total_energy = 0
  local zone = Zone.from_zone_index(spaceship.zone_index)
  for _, tank in pairs(tanks) do
    local tank_x = math.floor(tank.position.x)
    local tank_y = math.floor(tank.position.y)

    if spaceship.known_tiles[tank_x] and spaceship.known_tiles[tank_x][tank_y]
      and spaceship.known_tiles[tank_x][tank_y] == Spaceship.tile_status.floor_console_connected
      and #tank.fluidbox > 0 then
        local fluidbox = tank.fluidbox[1] or {amount = 0}
        if fluidbox.amount > 0 and required_energy > 0 and (Zone.is_space(zone) or fluidbox.name ~= "se-ion-stream") then
          local amount = fluidbox.amount
          local energy_per_fuel = (Zone.is_space(zone) and fluidbox.name == "se-ion-stream") and Spaceship.ion_stream_energy or game.fluid_prototypes[fluidbox.name].fuel_value
          table.insert(valid_tanks, tank)
          table.insert(valid_tank_fuel, fluidbox.amount)
          total_energy = total_energy + amount * energy_per_fuel
        end
    end
  end

  for i, tank in pairs(valid_tanks) do
    local percent_required = required_energy / total_energy -- Remove x% from all valid booster tanks
    local consume = math.min(valid_tank_fuel[i], math.ceil(percent_required * valid_tank_fuel[i]))
    local fluidbox = tank.fluidbox[1] or {amount = 0}
    fluidbox.amount = fluidbox.amount - consume

    -- Include consumed fuel in force's consumption statistics
    game.forces[spaceship.force_name].fluid_production_statistics.on_flow(
      tank.fluidbox[1].name, -consume)

    if fluidbox.amount > 0 then
      tank.fluidbox[1] = fluidbox
    else
      tank.fluidbox[1] = nil
    end
  end

  -- set the ship's location to the new statuses
  spaceship.near = {type="zone", index= spaceship.zone_index}
  spaceship.stopped = true
  spaceship.zone_index = nil
  spaceship.near_star = Zone.get_star_from_child(current_zone) or Zone.get_star_from_position(spaceship)
  Spaceship.set_light(spaceship, ship_surface)

  -- start generating chunks at the destination
  spaceship.requests_made = SpaceshipClone.enqueue_generate_clone_to_area(spaceship, current_surface, ship_surface, {dx=0,dy=0})

  if automated_launch then
    -- await chunk generation before completing the launch
    spaceship.await_start_tick = game.tick
    spaceship.awaiting_requests = true
    spaceship.clone_params = {
      clone_from = current_surface,
      clone_to = ship_surface,
      clone_delta = {dx=0,dy=0}
    }
  else
    -- immediate launch
    SpaceshipClone.clone(spaceship, current_surface, ship_surface, {dx=0,dy=0}, nil)
  end
  Log.debug("spaceship launch end")
end

---Lands a spaceship.
---@param spaceship SpaceshipType Spaceship data
---@param position MapPosition Position at which to land
---@param ignore_average? boolean If we are cloning based on the corner of the ship or its center
function Spaceship.land_at_position(spaceship, position, ignore_average)
  if spaceship.is_doing_check or
    not (
      Spaceship.is_on_own_surface(spaceship) and
      spaceship.near and spaceship.near.type == "zone" and
      spaceship.known_tiles and
      game.tick > (spaceship.surface_lock_timeout or 0)
    ) then return end
  local destination_zone = Zone.from_zone_index(spaceship.near.index)
  if not destination_zone then return end

  local ship_surface = game.get_surface("spaceship-" .. spaceship.index)
  local target_surface = Zone.get_make_surface(destination_zone)

  local offset_x = util.to_rail_grid(position.x - spaceship.known_tiles_average_x)
  local offset_y = util.to_rail_grid(position.y - spaceship.known_tiles_average_y)
  if ignore_average then
    offset_x = util.to_rail_grid(position.x)
    offset_y = util.to_rail_grid(position.y)
  end

  local destination_area = {
    left_top = {
      x = spaceship.known_bounds.left_top.x + offset_x,
      y = spaceship.known_bounds.left_top.y + offset_y
    },
    right_bottom = {
      x = spaceship.known_bounds.right_bottom.x + offset_x,
      y = spaceship.known_bounds.right_bottom.y + offset_y
    },
  }

  if target_surface.count_tiles_filtered{name = name_out_of_map_tile, area = destination_area, limit = 1} > 0 then
    ship_surface.print({"space-exploration.spaceship-cannot-land-out-of-map"})
    return
  end

  local dont_land_on = table.deepcopy(Ancient.vault_entrance_structures)
  table.insert(dont_land_on, Ancient.name_gate_blocker)
  table.insert(dont_land_on, Ancient.name_gate_blocker_void)
  for name, stuff in pairs(Ancient.gate_fragments) do
    table.insert(dont_land_on, name)
  end

  local dont_land_on_entity = target_surface.find_entities_filtered{name = dont_land_on, area = destination_area, limit = 1}
  if dont_land_on_entity and dont_land_on_entity[1] then
    ship_surface.print({"", {"space-exploration.spaceship-land-fail-entity-in-the-way", {"space-exploration.ruin"}}, " "..util.gps_tag(target_surface.name, dont_land_on_entity[1].position)})
    return
  end

  if destination_zone.fragment_name then
    local resource_names = {
      destination_zone.fragment_name,
      destination_zone.fragment_name .. CoreMiner.name_core_seam_sealed_suffix
    }
    local core_seam = target_surface.find_entities_filtered{name=resource_names, area=destination_area, limit=1}
    if core_seam and core_seam[1]  then
      ship_surface.print({"", {"space-exploration.spaceship-land-fail-entity-in-the-way", {"entity-name.se-core-seam"}}, " "..util.gps_tag(target_surface.name, core_seam[1].position)})
      return
    end
  end

  local landing_area_entities = {}
  for x = spaceship.known_bounds.left_top.x, spaceship.known_bounds.right_bottom.x do
    for y = spaceship.known_bounds.left_top.y, spaceship.known_bounds.right_bottom.y do
      local value = spaceship.known_tiles[x] and spaceship.known_tiles[x][y]
      if value == Spaceship.tile_status.floor_console_connected
        or value == Spaceship.tile_status.bulkhead_console_connected then
        local area = {
          left_top = {
            x = x + offset_x,
            y = y + offset_y
          },
          right_bottom = {
            x = x + 31/32 + offset_x,
            y = y + 31/32 + offset_y
          }
        }
        local entities = target_surface.find_entities_filtered{area = area}
        for _, entity in pairs(entities) do
          local entity_type = entity.type
          if entity.force.name ~= "neutral" and entity_type ~= "entity-ghost" and entity_type ~= "tile-ghost"
            and entity_type ~= "logistic-robot" and entity_type ~= "construction-robot" and entity_type ~= "deconstructible-tile-proxy" then
            ship_surface.print({"", {"space-exploration.spaceship-land-fail-entity-in-the-way", entity.prototype.localised_name}, " "..util.gps_tag(target_surface.name, entity.position)})
            return
          end
          table.insert(landing_area_entities, entity)
        end
      end
    end
  end

  -- point of no return
  Log.debug_log('spaceship land start')
  Spaceship.deactivate_engines(spaceship)

  local linked_containers = ship_surface.find_entities_filtered{
    area=spaceship.known_bounds,
    name="se-linked-container"
  }
  for _, linked_container in pairs(linked_containers) do
    linked_container.link_id = 0
  end

  Spaceship.destroy_all_smoke_triggers(ship_surface)
  SpaceshipObstacles.destroy(spaceship, ship_surface) -- destroy all the obstacles on the ship's surface
  Zone.apply_markers(destination_zone) -- in case the surface exists

  -- clear the target area
  for _, entity in pairs(landing_area_entities) do
    if entity.valid then
      if entity.type == "character" then
        entity.health = entity.health * 0.1
      elseif entity.type ~= "spider-leg" then
        util.safe_destroy(entity)-- maybe use die?
      end
    end
  end

  -- request chunk generation at destination and then immediately land there
  local clone_delta = {dx=offset_x,dy=offset_y}
  SpaceshipClone.enqueue_generate_clone_to_area(spaceship, ship_surface, target_surface, clone_delta)
  SpaceshipClone.clone(spaceship, ship_surface, target_surface, clone_delta, Spaceship.post_land_at_position)
  Log.debug_log('spaceship land end')
end

---Finishes landing the spaceship after the cloning procedure is complete.
---@param spaceship SpaceshipType Spaceship data
---@param clone_from LuaSurface Surface to clone from
---@param clone_to LuaSurface Surface to clone to
---@param clone_delta Delta
function Spaceship.post_land_at_position(spaceship, clone_from, clone_to, clone_delta)
  -- Before deleting the surface, complete any capsule launches that were in progress
  for _, tick_task in pairs(global.tick_tasks) do
    if tick_task.type == "capsule-journey" and tick_task.origin == spaceship then
      Capsule.truncate_ascent(tick_task)
    end
  end

  -- Stop remote view for players that were viewing the spaceship surface.
  for _, player in pairs(game.connected_players) do
    if RemoteView.is_active(player) and player.surface == clone_from then
      local character = player_get_character(player)

      if character and character.surface == clone_from then
        RemoteView.stop(player)
      else
        local clone_to_zone = Zone.from_surface(clone_to) --[[@as AnyZoneType]]
        local player_position = player.position

        player_position.x = player_position.x + clone_delta.dx
        player_position.y = player_position.y + clone_delta.dy

        RemoteView.start(player, clone_to_zone, player_position)
      end
    end
  end

  -- Find leftover characters and any vehicles they may be stashed in
  local entities = clone_from.find_entities_filtered{type = {"character", "car", "spider-vehicle"}}
  local clone_to_zone = Zone.from_surface(clone_to) --[[@as AnyZoneType|SpaceshipType]]

  if next(entities) then
    local target_zone = Zone.find_nearest_zone(spaceship.space_distortion,
      Zone.get_stellar_position(clone_to_zone), Zone.get_star_gravity_well(clone_to_zone),
      Zone.get_planet_gravity_well(clone_to_zone))

    -- Target zone must be a space zone
    if target_zone.orbit then target_zone = target_zone.orbit end
    ---@cast target_zone -StarType|-PlanetType|-MoonType

    -- Teleport any characters to the `target_zone`
    for _, entity in pairs(entities) do
      local entity_type = entity.type

      if entity_type == "character" then
        Spaceship.clean_up_leftover_character(entity, spaceship, target_zone)
      else -- entity is a car or spidertron
        local driver = entity.get_driver()
        local passenger = entity.get_passenger()

        if driver and not driver.is_player() then
          entity.set_driver(nil)
          Spaceship.clean_up_leftover_character(driver, spaceship, target_zone)
        end

        if passenger and not passenger.is_player() then
          entity.set_passenger(nil)
          Spaceship.clean_up_leftover_character(passenger, spaceship, target_zone)
        end
      end
    end
  end

  game.delete_surface(clone_from)

  -- Set the ship's location to the new statuses
  spaceship.own_surface_index = nil
  spaceship.own_surface = nil
  spaceship.particles = {}
  spaceship.mineables = {}
  spaceship.zone_index = spaceship.near.index
  spaceship.near = nil
  spaceship.stopped = true
  spaceship.is_moving = false
  spaceship.speed = 0
end

---Teleports the character from the to-be-deleted spaceship surface to the `target-zone`.
---@param character LuaEntity Character to be teleported
---@param spaceship SpaceshipType Spaceship the character was on board
---@param target_zone AnyZoneType Zone the character should be teleported to
function Spaceship.clean_up_leftover_character(character, spaceship, target_zone)
  local matching_playerdata, matching_player_index

  -- Find the player/playerdata whose character this is
  for player_index, playerdata in pairs(global.playerdata) do
    if character == playerdata.character then
      matching_playerdata = playerdata
      matching_player_index = player_index
      break
    end
  end

  -- Disable jetpack, since cross-surface teleportation will invalidate jetpack's character refs
  if character.name:find("jetpack", 1, true) then
    local landing_character = remote.call("jetpack", "stop_jetpack_immediate", {character=character}) --[[@as LuaEntity]]
    if landing_character then character = landing_character end
  end

  local surface = Zone.get_make_surface(target_zone)
  local chunk_position = surface.get_random_chunk()
  local target_position = {
    x = chunk_position.x * 32 + math.random(32),
    y = chunk_position.y * 32 + math.random(32)
  } --[[@as MapPosition.0]]

  local new_character, _ =
    teleport_character_to_surface_2(character, Zone.get_make_surface(target_zone), target_position)

  -- Update `character` ref in `PlayerData` table
  if matching_playerdata then
    matching_playerdata.character = new_character

    local player = game.get_player(matching_player_index)
    if player then
      RemoteView.stop(player)
      player.print({"space-exploration.spaceship-character-stranded",
        Zone.get_print_name(spaceship), Zone.get_print_name(target_zone)})
    end
  end
end

--- Decrements the number of requests being waited upon for a spaceship surface transfer whenever a chunk is generated
---@param event EventData.on_chunk_generated Event data
function Spaceship.on_chunk_generated(event)
  if event.surface and string.find(event.surface.name, "spaceship-") then
    for _, spaceship in pairs(global.spaceships) do
      if spaceship.clone_params and spaceship.requests_made and spaceship.clone_params.clone_to == event.surface then
        spaceship.requests_made = spaceship.requests_made - 1
      end
    end
  end
end
Event.addListener(defines.events.on_chunk_generated, Spaceship.on_chunk_generated)

---Determines the rectangles necessary to somewhat quickly draw an image of the spaceship that this
---player is anchor scouting. Necessary because drawing each individual tile as a separate rectangle
---lags the game.
---@param player LuaPlayer
---@param spaceship SpaceshipType Spaceship data
function Spaceship.get_make_anchor_scouting_cache(player, spaceship)
  local playerdata = get_make_playerdata(player)
  if not playerdata.anchor_scouting_cache then
    playerdata.anchor_scouting_cache = {}

    if spaceship.known_tiles and spaceship.known_bounds then
      local aabb
      for x = spaceship.known_bounds.left_top.x, spaceship.known_bounds.right_bottom.x do
        for y = spaceship.known_bounds.left_top.y, spaceship.known_bounds.right_bottom.y do
          local value = spaceship.known_tiles[x] and spaceship.known_tiles[x][y]
          if value == Spaceship.tile_status.floor_console_connected
          or value == Spaceship.tile_status.bulkhead_console_connected then
            if not aabb then
               aabb = {min_x=x,max_x=x+1,min_y=y,max_y=y+1}
            else
              aabb.max_y = aabb.max_y + 1
            end
          else
            if aabb then
              table.insert(playerdata.anchor_scouting_cache, aabb)
              aabb = nil
            end
          end
        end
        if aabb then
          table.insert(playerdata.anchor_scouting_cache, aabb)
          aabb = nil
        end
      end
    end
  end
  return playerdata.anchor_scouting_cache
end

---Draws the rectangles where the ship would land during anchor scouting.
---@param player LuaPlayer
---@param spaceship SpaceshipType Spaceship data
function Spaceship.anchor_scouting_tick(player, spaceship)
  local anchor_scouting_cache = Spaceship.get_make_anchor_scouting_cache(player, spaceship)
  if anchor_scouting_cache then
    local offset_x = util.to_rail_grid(player.position.x - spaceship.known_tiles_average_x)
    local offset_y = util.to_rail_grid(player.position.y - spaceship.known_tiles_average_y)
    for _, aabb in pairs(anchor_scouting_cache) do
      rendering.draw_rectangle{
        color = {r = 0.125, g = 0.125, b = 0, a = 0.01},
          filled = true,
          left_top = {x=aabb.min_x+offset_x,y=aabb.min_y+offset_y},
          right_bottom = {x=aabb.max_x+offset_x,y=aabb.max_y+offset_y},
          surface = player.surface,
          time_to_live = Spaceship.tick_interval_anchor + 1, -- tll must be 1 greater than the interval at which we draw to not flicker
      }
    end
    if spaceship.known_clamps then
      for _, clamp_position in pairs(spaceship.known_clamps) do
        rendering.draw_rectangle{
          color = {r = 0, g = 0, b = 0.125, a = 0.01},
          filled = true,
          left_top = {x=clamp_position.x+offset_x+0.5,y=clamp_position.y+offset_y+0.5},
          right_bottom = {x=clamp_position.x+offset_x-0.5,y=clamp_position.y+offset_y-0.5},
          surface = player.surface,
          time_to_live = Spaceship.tick_interval_anchor + 1, -- as above
        }
      end
    end
  end
end

---Return a warning string if the spaceship is attempting to anchor to a solid zone without planet boosters. Return nil otherwise.
---@param spaceship SpaceshipType Spaceship data
---@param zone AnyZoneType|SpaceshipType Zone the spaceship is trying to anchor to
---@return LocalisedString?
function Spaceship.get_booster_warning_string(spaceship, zone)
  local ship_surface = Spaceship.get_own_surface(spaceship)
  if Zone.is_solid(zone) and ship_surface.count_entities_filtered{name = Spaceship.names_planet_booster_tanks, area = spaceship.known_bounds, limit = 1} == 0 then
    ---@cast zone PlanetType|MoonType
    if ship_surface.count_entities_filtered{name = mod_prefix .. "spaceship-ion-booster-tank", area = spaceship.known_bounds, limit = 1} > 0 then
      return {"space-exploration.spaceship-no-planet-boosters-warning-ion"}
    else
      return {"space-exploration.spaceship-no-planet-boosters-warning"}
    end
  end
  return nil
end

---Starts anchor scouting at the location the spaceship is currently at.
---@param spaceship SpaceshipType Spaceship data
---@param player LuaPlayer
function Spaceship.start_anchor_scouting(spaceship, player)
  if not spaceship.near and spaceship.near.type == "zone" then return end
  local zone = Zone.from_zone_index(spaceship.near.index)
  if not zone then return end

  local playerdata = get_make_playerdata(player)

  -- Save navsat inventory
  if playerdata.remote_view_active then
    RemoteView.persist_inventory(player)
  end

  -- enter remote view
  playerdata.anchor_scouting_for_spaceship_index = spaceship.index

  local character = player.character
  if character then
    playerdata.character = character
  end
  player.set_controller{type = defines.controllers.ghost}
  --player.set_controller{type = defines.controllers.spectator}

  if character then
    -- stop the character from continuing input action (running to doom)
    character.walking_state = {walking = false, direction = defines.direction.south}
    character.riding_state = {acceleration = defines.riding.acceleration.braking, direction = defines.riding.direction.straight}
    character.shooting_state = {state = defines.shooting.not_shooting, position = character.position}
    character.mining_state = {mining = false}
    character.picking_state = false
    character.repair_state = {repairing = false, position = character.position}
  end

  local surface = Zone.get_make_surface(zone)
  local position = {x=0,y=0}
  if playerdata.surface_positions and playerdata.surface_positions[surface.index] then
    position = playerdata.surface_positions[surface.index]
  end

  player.teleport(position, surface)

  -- warn player if they don't have booster tanks to escape.
  local booster_warning_string = Spaceship.get_booster_warning_string(spaceship, zone)
  if booster_warning_string then
    player.print(booster_warning_string)
  end
end

--- Stops any in progress anchor scouting for the given player
---@param player LuaPlayer
function Spaceship.stop_anchor_scouting(player)
  local playerdata = get_make_playerdata(player)
  if playerdata.anchor_scouting_for_spaceship_index then
    playerdata.anchor_scouting_for_spaceship_index = nil
    if playerdata.remote_view_active then
      local surface = player.surface
      local position = player.position
      RemoteView.stop(player)
      RemoteView.start(player)
      player.teleport(position, surface)
    else
      if playerdata.character and playerdata.character.valid then
        player.teleport(playerdata.character.position, playerdata.character.surface)
        player.set_controller{type = defines.controllers.character, character = playerdata.character}
      elseif not player.character then
        Respawn.die(player)
      end
    end
  end
  playerdata.anchor_scouting_cache = nil
end

--- When an equipment grid is changed, we have to recalculate integrity costs
---@param event EventData.on_player_placed_equipment|EventData.on_player_removed_equipment Event data
function Spaceship.on_equipment_grid_changed(event)
  local player = game.get_player(event.player_index)
  ---@cast player -? 
  local spaceship = Spaceship.from_own_surface_index(player.surface.index)
  if spaceship then
    Spaceship.start_integrity_check(spaceship)
  end
end
Event.addListener(defines.events.on_player_placed_equipment, Spaceship.on_equipment_grid_changed)
Event.addListener(defines.events.on_player_removed_equipment, Spaceship.on_equipment_grid_changed)

---Handles a number of spaceship-spacific entities getting built. Clone is deliberately not handled.
---@param event EntityCreationEvent Event data
function Spaceship.on_entity_created(event)
  local entity = event.created_entity or event.entity
  if not entity.valid then return end

  -- Ignore ghost entities/tiles
  local entity_type = entity.type
  if entity_type == "entity-ghost" or entity_type == "tile-ghost" then return end

  local surface_index = entity.surface.index
  local spaceship = Spaceship.from_own_surface_index(surface_index)

  if spaceship and not spaceship.is_cloning then
    Spaceship.start_integrity_check(spaceship)
  end

  local entity_name = entity.name

  if Spaceship.names_engines_map[entity_name] then
    if spaceship and spaceship.is_moving then
        -- Sets smoke
        Spaceship.find_own_surface_engines(spaceship)
      else
        entity.active = false
      end
  end

  if entity_name == Spaceship.name_spaceship_console then

    if spaceship then
      if not (spaceship.console and spaceship.console.valid) then
        spaceship.console = entity
        spaceship.last_console_unit_number = entity.unit_number
        spaceship.console_output = nil

        Spaceship.start_integrity_check(spaceship, 0.1)
      end
    else -- Console getting built anywhere that is _not_ a spaceship surface
      local zone = Zone.from_surface_index(surface_index)
      if cancel_creation_when_invalid(zone, entity, event, true) then return end
      ---@cast zone -?

      local spaceship_index = global.next_spaceship_index
      global.next_spaceship_index = spaceship_index + 1

      local name
      do -- Pick a name for the new spaceship
        local available_names = {}
        local found

        for _, candidate in pairs(Spaceship.names) do
          found = false

          for _, ship in pairs(global.spaceships) do
            if candidate == ship.name then
              found = true
              break
            end
          end

          if not found then
            table.insert(available_names, candidate)
          end
        end

        if next(available_names) then
          name = available_names[math.random(#available_names)]
        else
          name = "Spaceship " .. spaceship_index
        end
      end

      spaceship = {
        type = "spaceship",
        index = spaceship_index,
        valid = true,
        force_name = entity.force.name,
        unit_number = entity.unit_number,
        console = entity,
        last_console_unit_number = entity.unit_number,
        name = name,
        speed = 1,
      }

      -- For now all spaceships have 0 attrition but who knows
      Zone.calculate_base_bot_attrition(spaceship)

      if zone then
        spaceship.zone_index = zone.index -- this is dynamic and can be nil
        spaceship.destination_zone_index = zone.index
        spaceship.space_distortion = Zone.get_space_distortion(zone)
        spaceship.stellar_position = Zone.get_stellar_position(zone)
        spaceship.star_gravity_well = Zone.get_star_gravity_well(zone)
        spaceship.planet_gravity_well = Zone.get_planet_gravity_well(zone)
        spaceship.near_stellar_object = Zone.get_stellar_object_from_child(zone)
      end
      global.spaceships[spaceship_index] = spaceship

      -- Deserialize tags after adding spaceship to global
      local tags = util.get_tags_from_event(event, Spaceship.serialize)
      if tags then
        Spaceship.deserialize(entity, tags)
      end

      Spaceship.start_integrity_check(spaceship, 0.1)
    end

    if event.player_index then
      SpaceshipGUI.gui_open(game.get_player(event.player_index), spaceship)
    end
  end

  if spaceship then
    Spaceship.check_integrity_stress(spaceship)
  end
end
Event.addListener(defines.events.on_built_entity, Spaceship.on_entity_created)
Event.addListener(defines.events.on_robot_built_entity, Spaceship.on_entity_created)
Event.addListener(defines.events.script_raised_built, Spaceship.on_entity_created)
Event.addListener(defines.events.script_raised_revive, Spaceship.on_entity_created)

---@param event EventData.on_player_built_tile|EventData.on_robot_built_tile|EventData.on_robot_mined_tile|EventData.on_player_mined_tile
function Spaceship.on_tile_changed(event)
  local surface = game.get_surface(event.surface_index)
  if surface and string.find(surface.name, "spaceship-") then
    local spaceship = Spaceship.from_own_surface_index(surface.index)
    if not spaceship.is_cloning then
      Spaceship.check_integrity_stress(spaceship)
      spaceship.check_stage = nil -- reset
      Spaceship.start_integrity_check(spaceship)
    end
  else
    -- Fix remove tiles during check exploit
    if event.tiles then
      local zone = Zone.from_surface_index(event.surface_index)
      if zone then
        for _, old_tile_and_position in pairs(event.tiles) do
          if Spaceship.names_spaceship_floors_map[old_tile_and_position.old_tile.name] then
            -- find spaceships on this surface.
            for _, spaceship in pairs(global.spaceships) do
              if spaceship.zone_index == zone.index and spaceship.is_doing_check then
                if spaceship.check_tiles and
                  spaceship.check_tiles[old_tile_and_position.position.x] and
                  spaceship.check_tiles[old_tile_and_position.position.x][old_tile_and_position.position.y] then
                    spaceship.integrity_valid = false
                    Spaceship.stop_integrity_check(spaceship)
                    Spaceship.start_integrity_check(spaceship)
                end
              end
            end
          end
        end
      end
    end
  end
end
Event.addListener(defines.events.on_player_built_tile, Spaceship.on_tile_changed)
Event.addListener(defines.events.on_robot_built_tile, Spaceship.on_tile_changed)
Event.addListener(defines.events.on_robot_mined_tile, Spaceship.on_tile_changed)
Event.addListener(defines.events.on_player_mined_tile, Spaceship.on_tile_changed)

---@param event EntityRemovalEvent Event data
function Spaceship.on_removed_entity(event)
  if event.entity and event.entity.valid then
    if event.entity.name == Spaceship.name_spaceship_console then
      local outputs = event.entity.surface.find_entities_filtered{name = Spaceship.name_spaceship_console_output, area = util.position_to_area(event.entity.position, 2)}
      for _, output in pairs(outputs) do
        output.destroy()
      end
    elseif event.entity.surface and Spaceship.names_spaceship_bulkheads_map[event.entity.name] then
      -- this check is *not* appropriate if we can have multiple spaceships on a spaceship surface
      -- when implementing multiple ships per spaceship surface, the way of handling not responding to events raised by cloning must be changed to work with that
      if string.find(event.entity.surface.name, "spaceship-") then
        local spaceship = Spaceship.from_own_surface_index(event.entity.surface.index)
        if spaceship and not spaceship.is_cloning then
          spaceship.speed = spaceship.speed * 0.9
          Spaceship.destroy_all_smoke_triggers(event.entity.surface)
          Spaceship.check_integrity_stress(spaceship)
          Spaceship.start_integrity_check(spaceship)
        end
      end
    end
  end
end
Event.addListener(defines.events.on_entity_died, Spaceship.on_removed_entity)
Event.addListener(defines.events.on_robot_mined_entity, Spaceship.on_removed_entity)
Event.addListener(defines.events.on_player_mined_entity, Spaceship.on_removed_entity)
Event.addListener(defines.events.script_raised_destroy, Spaceship.on_removed_entity)

---@param event EventData.on_post_entity_died
local function on_post_entity_died(event)
  local ghost = event.ghost
  local unit_number = event.unit_number
  if not (ghost and unit_number) then return end
  if event.prototype.name ~= Spaceship.name_spaceship_console then return end

  -- The spaceship is only removed from global on the next tick update, and
  -- when the spaceship is landed. This means this function will always
  -- run before `Spaceship.destroy(...)`. There is a small chance that the 
  -- `last_console_unit_number` wasn't set during migration due to the rare
  -- case of landed console being destroyed, and migration running before next
  -- update. If this happens this loop won't find the spaceship, and just silently
  -- return.

  local spaceship --[[@as SpaceshipType? ]]
  for _, this_spaceship in pairs(global.spaceships) do
    if this_spaceship.last_console_unit_number == unit_number then
      spaceship = this_spaceship
      break
    end
  end
  if not (spaceship and spaceship.valid) then return end

  -- If the spaceship is on its own surface then the spaceship struct is not destroyed
  if spaceship.own_surface_index then return end

  ghost.tags = Spaceship.serialize_from_struct(spaceship)
end
Event.addListener(defines.events.on_post_entity_died, on_post_entity_died)

---@param spaceship SpaceshipType
---@return number? distance
function Spaceship.get_distance_to_destination(spaceship)
  if (not spaceship.destination) or Spaceship.is_near_destination(spaceship) then
    return 0
  end

  local target_zone = Spaceship.get_destination_zone(spaceship)
  if target_zone then

    local destination_space_distorion = Zone.get_space_distortion(target_zone)
    local destination_stellar_position = Zone.get_stellar_position(target_zone)
    local destination_star_gravity_well = Zone.get_star_gravity_well(target_zone)
    local destination_planet_gravity_well = Zone.get_planet_gravity_well(target_zone)

    local distortion_distance = 0
    local interstellar_distance = 0
    local star_gravity_distance = 0
    local planet_gravity_distance = 0

    distortion_distance = math.abs(spaceship.space_distortion - destination_space_distorion)

    interstellar_distance = Util.vectors_delta_length(spaceship.stellar_position, destination_stellar_position)
    --if distortion_distance == 1 then
    if distortion_distance >= 1 or (spaceship.space_distortion == 1 and destination_space_distorion == 1) then
      interstellar_distance = 0
    end
    if interstellar_distance == 0 then
      -- same solar system
      star_gravity_distance = math.abs(spaceship.star_gravity_well - destination_star_gravity_well)
    else
      star_gravity_distance = spaceship.star_gravity_well + destination_star_gravity_well
    end

    if star_gravity_distance == 0 then
      -- same solar system
      planet_gravity_distance = math.abs(spaceship.planet_gravity_well - destination_planet_gravity_well)
    else
      planet_gravity_distance = spaceship.planet_gravity_well + destination_planet_gravity_well
    end

    if target_zone.type == "anomaly" and star_gravity_distance == 0 and planet_gravity_distance == 0 and distortion_distance > 0 then
      ---@cast target_zone AnomalyType
      return math.random(Zone.travel_cost_space_distortion - 1000) * 4 + 1000
      -- actual distance calculation: return distortion_distance * Zone.travel_cost_space_distortion
    else
      return distortion_distance * Zone.travel_cost_space_distortion
      + interstellar_distance * Zone.travel_cost_interstellar
      + star_gravity_distance * Zone.travel_cost_star_gravity
      + planet_gravity_distance * Zone.travel_cost_planet_gravity
    end
  end
end

---Gets the number of spaceship tiles behind a given starting position.
---@param spaceship SpaceshipType Spaceship data
---@param start_position TilePosition "{x=int, y=int}"
---@return uint space_behind
function Spaceship.get_space_behind(spaceship, start_position)
  -- spaceship must be on own surface
  local space_behind = math.huge
  if spaceship.known_tiles and spaceship.known_tiles[start_position.x] then
    -- there's no way this is efficient but it needs to be profiled to see if this actually
    -- meaningfully contributes to the UPS cost of ships (probably contributes more to integrity
    -- checks than anything else)
    for y = start_position.y, spaceship.known_bounds.right_bottom.y, 1 do
      if spaceship.known_tiles[start_position.x][y]
        and (spaceship.known_tiles[start_position.x][y] == Spaceship.tile_status.floor_console_connected
        or spaceship.known_tiles[start_position.x][y] == Spaceship.tile_status.bulkhead_console_connected) then
          space_behind = y - start_position.y
          break
      end
    end
  end
  return space_behind
end

---@param spaceship SpaceshipType
---@param engine SpaceshipEngineType
function Spaceship.show_engine_efficiency(spaceship, engine)
  if spaceship.type == "simulation-spaceship" then return end

  local color
  if engine.efficiency <= 0.6 then
    color = "red"
  elseif engine.efficiency < 0.9 then
    color = "yellow"
  else -- >= 0.9
    color = "green"
  end
  local efficiency_string = "[color="..color.."]" .. math.ceil(engine.efficiency*100).."%" .. "[/color]"

  engine.entity.surface.create_entity{
    name = "tutorial-flying-text", -- it's centered and slower
    position = util.vectors_add({x=0, y=1}, engine.entity.position),
    text = efficiency_string
  }
end

---@param spaceship SpaceshipType the spaceship data
---@param engine SpaceshipEngineType engine
function Spaceship.update_smoke(spaceship, engine)
  if engine.entity.active then
    if (not engine.smoke_trigger) and Spaceship.engines[engine.entity.name].smoke_trigger then
      engine.smoke_trigger = engine.entity.surface.create_entity{
        name = Spaceship.engines[engine.entity.name].smoke_trigger,
        position = {x = engine.entity.position.x, y = engine.entity.bounding_box.right_bottom.y}
      }
    end
  elseif engine.smoke_trigger and engine.smoke_trigger.valid then
    engine.smoke_trigger.destroy()
    engine.smoke_trigger = nil
  end
end

---@param surface LuaSurface
function Spaceship.destroy_all_smoke_triggers(surface)
  local smoke_triggers = surface.find_entities_filtered{
    type = "smoke-with-trigger",
    name = Spaceship.names_smoke_trigger
    -- do not restrict area,
  }
  for _, smoke_trigger in pairs(smoke_triggers) do
    smoke_trigger.destroy()
  end
end

---Finds the engines for this spaceship.
---@param spaceship SpaceshipType Spaceship data
function Spaceship.find_own_surface_engines(spaceship)
  spaceship.engines = nil
  local surface = Spaceship.get_own_surface(spaceship)
  if surface then
    Spaceship.destroy_all_smoke_triggers(surface)
  end
  if surface and spaceship.known_tiles and spaceship.known_bounds then
    spaceship.engines = {}
    local engines = surface.find_entities_filtered{
      name = Spaceship.names_engines,
      area = spaceship.known_bounds
    }
    local y_engines = {} -- thrust harmonics
    for _, entity in pairs(engines) do
      local efficiency = Spaceship.engine_efficiency_blocked
      local box = entity.bounding_box
      local engine_y_behind = math.floor(box.right_bottom.y) + 1
      local engine_x = math.floor((box.left_top.x + box.right_bottom.x)/2)
      local space_behind
      if entity.position.x % 1 < 0.25 or entity.position.x % 1 > 0.75 then
        -- 2-wide trail
        space_behind = math.min(
          Spaceship.get_space_behind(spaceship, {x = engine_x - 1, y = engine_y_behind}),
          Spaceship.get_space_behind(spaceship, {x = engine_x, y = engine_y_behind})
        )
      else
        -- 1-wide trail
        space_behind = Spaceship.get_space_behind(spaceship, {x = engine_x, y = engine_y_behind})
      end
      if space_behind < 0 then
        efficiency = Spaceship.engine_efficiency_unblocked
      else
        efficiency = 1-(1-Spaceship.engine_efficiency_blocked) / (space_behind + Spaceship.engine_efficiency_unblocked_taper) * Spaceship.engine_efficiency_unblocked_taper
      end
      efficiency = efficiency - Spaceship.engine_efficiency_side
      local engine =  {entity = entity, efficiency = efficiency}
      if not y_engines[engine_y_behind] then
        y_engines[engine_y_behind] = {left = engine, right = engine}
      else
        if entity.position.x < y_engines[engine_y_behind].left.entity.position.x then
           y_engines[engine_y_behind].left = engine
        end
        if entity.position.x > y_engines[engine_y_behind].right.entity.position.x then
           y_engines[engine_y_behind].right = engine
        end
      end
      table.insert(spaceship.engines, engine)
    end

     -- thrust harmonics
     -- the left-most and right-most engines get a bonus
     -- there is a 1% incentive to have engines on different Y values.
     -- You waste integrity building this way, but it means more interesting designs are penalised less by the forced grid.
    for y, left_right in pairs(y_engines) do
      left_right.left.efficiency = left_right.left.efficiency + Spaceship.engine_efficiency_side
      if left_right.left ~= left_right.right then
        left_right.right.efficiency = left_right.right.efficiency + Spaceship.engine_efficiency_side
      end
    end

    -- Show the result
    local player_is_here = not SpaceshipObstacles.surface_has_no_players(surface)
    for _, engine in pairs(spaceship.engines) do
      if player_is_here then
        Spaceship.show_engine_efficiency(spaceship, engine)
      end
      Spaceship.update_smoke(spaceship, engine)
    end
  end
end

---Activates the engines on given spaceship.
---@param spaceship SpaceshipType Spaceship data
function Spaceship.activate_engines(spaceship)
  if not spaceship.engines then
    Spaceship.find_own_surface_engines(spaceship)
  end
  if spaceship.engines then
    for _, engine in pairs(spaceship.engines) do
      if engine.entity and engine.entity.valid then
        engine.entity.active = true
        Spaceship.update_smoke(spaceship, engine)
      else
        spaceship.engines = nil
        Spaceship.activate_engines(spaceship)
        return
      end
    end
  end
end

---Deactivates the engines on this spaceship.
---@param spaceship SpaceshipType Spaceship data
function Spaceship.deactivate_engines(spaceship)
  if not spaceship.engines then
    Spaceship.find_own_surface_engines(spaceship)
  end
  if spaceship.engines then
    for _, engine in pairs(spaceship.engines) do
      if engine.smoke_trigger and engine.smoke_trigger.valid then
        engine.smoke_trigger.destroy()
        engine.smoke_trigger = nil
      end
      if engine.entity and engine.entity.valid then
        engine.entity.active = false
        Spaceship.update_smoke(spaceship, engine)
      else
        spaceship.engines = nil
        Spaceship.deactivate_engines(spaceship)
        return
      end
    end
  end
end

---@param spaceship SpaceshipType
---@param time_passed integer
function Spaceship.surface_tick(spaceship, time_passed)
  -- actions that apply to maintaining a spaceship surface
  spaceship.speed = spaceship.speed or 0
  local surface = Spaceship.get_own_surface(spaceship)
  if spaceship.speed > 1 then
    surface.wind_orientation = 0.5
  end

  local speed_factor = SpaceshipObstacles.particle_speed_factor(spaceship.speed)
  surface.wind_speed = 0.01 + 0.005 * speed_factor

  -- floating characters
  for _, jetpack in pairs(remote.call("jetpack", "get_jetpacks", {surface_index = spaceship.own_surface_index})) do
    jetpack.velocity.y = jetpack.velocity.y +
      0.000005 * time_passed * (spaceship.speed / Spaceship.speed_taper) ^ Spaceship.particle_speed_power * Spaceship.speed_taper
    remote.call("jetpack", "set_velocity", {unit_number = jetpack.unit_number, velocity = jetpack.velocity})
  end

  -- obstacles
  SpaceshipObstacles.tick_obstacles(spaceship, surface, time_passed)
end

---Sets the lighting of a spaceship surface. This dictates both how bright the player's screen is
---and solar power.
---@param spaceship SpaceshipType Spaceship data
---@param surface LuaSurface the spaceship's surface
function Spaceship.set_light(spaceship, surface)
    -- expect 15 is the max, 10 + 5 planets but reduced start position
    local light_percent = Zone.get_solar(spaceship)
    Zone.set_solar_and_daytime_for_space_zone(surface, light_percent)
end

-- Apply engines to speed.
---@param spaceship SpaceshipType
---@param time_passed integer
function Spaceship.apply_engine_thust(spaceship, time_passed)
  if spaceship.engines then
    for i = #spaceship.engines, 1, -1 do -- Reverse iteration for safe removal
      local engine_table = spaceship.engines[i]
      local engine = engine_table.entity
      if engine and engine.valid then
        if engine.active and engine.is_crafting() then
          local engine_proto = Spaceship.engines[engine.name]
          spaceship.speed = spaceship.speed
            + (spaceship.speed_multiplier or 1) * engine_table.efficiency * engine_proto.thrust
            * (engine.energy / engine_proto.max_energy) / (Spaceship.minimum_mass + spaceship.integrity_stress)
            * (Spaceship.speed_taper / (Spaceship.speed_taper + spaceship.speed))
            * time_passed
        end
      else
        table.remove(spaceship.engines, i)
      end
    end
  end

end

---@param spaceship SpaceshipType
---@param time_passed integer
function Spaceship.apply_drag(spaceship, time_passed)
  -- space_drag from imperfect vacuum
  -- streamline 0 = 110.45
  -- streamline 1 = 181.25
  local drag = Spaceship.space_drag * (2 - (spaceship.streamline or 0)) * time_passed
  spaceship.speed = spaceship.speed * (1 - drag) + Spaceship.minimum_impulse

  -- brake
  if spaceship.target_speed and spaceship.speed > spaceship.target_speed then
    spaceship.speed = math.min(spaceship.speed, math.max(spaceship.target_speed + 1, spaceship.speed - 0.001 * time_passed))
    spaceship.speed = math.min(spaceship.speed, math.max(spaceship.target_speed + 0.5, spaceship.speed - (spaceship.speed + 0.5 - spaceship.target_speed) * (1 - math.pow(0.999, time_passed))))
  end
  spaceship.max_speed = math.max(spaceship.speed, spaceship.max_speed or 0)
end

---Moves spaceship away from the current planet.
---@param spaceship SpaceshipType Spaceship data
---@param travel_speed number Speed at which to move
function Spaceship.move_from_planet(spaceship, travel_speed)
  spaceship.planet_gravity_well = math.max(0, spaceship.planet_gravity_well - travel_speed / Zone.travel_cost_planet_gravity)
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-exiting-planet-gravity"}
end

---Moves given spaceship away from the current star at given speed.
---@param spaceship SpaceshipType Spaceship data
---@param travel_speed number Speed at which to move
function Spaceship.move_from_star(spaceship, travel_speed)
  spaceship.star_gravity_well = math.max(0, spaceship.star_gravity_well - travel_speed / Zone.travel_cost_star_gravity)
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-exiting-star-gravity"}
end

---Moves a given spaceship towards a given position in intestellar space at a given speed.
---@param spaceship SpaceshipType Spaceship data
---@param travel_speed number Speed at which to move
---@param destination_stellar_position StellarPosition Target stellar position
function Spaceship.move_towards_interstellar_position(spaceship, travel_speed, destination_stellar_position)
  spaceship.near_stellar_object = nil
  spaceship.stellar_position = Util.move_to(spaceship.stellar_position, destination_stellar_position,
    travel_speed / Zone.travel_cost_interstellar)
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-navigating-interstellar"}
end

---Moves a given spaceship towards a given position in intestellar space instantly.
---@param spaceship SpaceshipType Spaceship data
---@param travel_speed number Speed at which to move
---@param destination_stellar_position StellarPosition Target stellar position
function Spaceship.move_instant_interstellar_position(spaceship, travel_speed, destination_stellar_position)
  spaceship.stellar_position = table.deepcopy(destination_stellar_position)
  spaceship.space_distortion = 1 - travel_speed / Zone.travel_cost_space_distortion
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-spatial-distortions"}
end

---Moves a given ship towards the a given space distortion at a given speed.
---@param spaceship SpaceshipType Spaceship data
---@param travel_speed number Speed at which to move
---@param destination_space_distorion number the distortion of the target (does not have to be 1 / at the anomaly)
function Spaceship.move_to_anomaly(spaceship, travel_speed, destination_space_distorion)
  spaceship.near_stellar_object = nil
  local delta_space_distortion = destination_space_distorion - spaceship.space_distortion
  if delta_space_distortion == 0 then
    spaceship.near = table.deepcopy(spaceship.destination)
    spaceship.stopped = true
  else
    local space_distortion_travel = travel_speed / Zone.travel_cost_space_distortion
    -- step towards destination
    spaceship.space_distortion = spaceship.space_distortion
      + math.min(math.max(delta_space_distortion, -space_distortion_travel), space_distortion_travel)
    spaceship.travel_message = {"space-exploration.spaceship-travel-message-spatial-distortions"}
  end
end

---Moves a given spaceship away from the anomaly at a given speed.
---@param spaceship SpaceshipType the spaceship
---@param travel_speed number speed at which to move
function Spaceship.move_from_anomaly(spaceship, travel_speed)
  spaceship.space_distortion = spaceship.space_distortion - travel_speed / Zone.travel_cost_space_distortion
  spaceship.travel_message = {"space-exploration.spaceship-travel-message-spatial-distortions"}
end

--- Move the spaceship through space conventionally (i.e. no teleportation/spatial distortion)
---@param spaceship SpaceshipType Spaceship data
---@param travel_speed number speed at which to move
---@param target_zone AnyZoneType|SpaceshipType
---@param destination_stellar_position StellarPosition
---@param destination_star_gravity_well integer
---@param destination_planet_gravity_well integer
function Spaceship.move_conventional(spaceship, travel_speed, target_zone, destination_stellar_position, destination_star_gravity_well, destination_planet_gravity_well)
  local interstellar_distance = Util.vectors_delta_length(spaceship.stellar_position, destination_stellar_position)
  if interstellar_distance == 0 then -- same system
    if spaceship.type == "spaceship" then -- not needed on spaceship-lookahead
      spaceship.near_star = Zone.get_star_from_child(target_zone) or Zone.get_star_from_position(target_zone)
      spaceship.near_stellar_object = Zone.get_stellar_object_from_child(target_zone) or Zone.get_stellar_object_from_position(target_zone)
    end
    if spaceship.star_gravity_well == destination_star_gravity_well then -- same planet system
      if spaceship.planet_gravity_well == destination_planet_gravity_well then -- we're here
        spaceship.near = table.deepcopy(spaceship.destination)
        spaceship.stopped = true
      else
        local delta_planet_gravity = destination_planet_gravity_well - spaceship.planet_gravity_well
        local planet_gravity_travel = travel_speed / Zone.travel_cost_planet_gravity
        spaceship.planet_gravity_well = spaceship.planet_gravity_well
          + math.min(math.max(delta_planet_gravity, -planet_gravity_travel), planet_gravity_travel)
        spaceship.travel_message = {"space-exploration.spaceship-travel-message-navigating-planet-gravity"}
      end
    else
      if spaceship.planet_gravity_well > 0 then
        spaceship.planet_gravity_well = math.max(0, spaceship.planet_gravity_well - travel_speed / Zone.travel_cost_planet_gravity)
        spaceship.travel_message = {"space-exploration.spaceship-travel-message-exiting-planet-gravity"}
      else
        local delta_star_gravity = destination_star_gravity_well - spaceship.star_gravity_well
        local star_gravity_travel = travel_speed / Zone.travel_cost_star_gravity
        spaceship.star_gravity_well = spaceship.star_gravity_well
          + math.min(math.max(delta_star_gravity, -star_gravity_travel), star_gravity_travel)
        spaceship.travel_message = {"space-exploration.spaceship-travel-message-navigating-star-gravity"}
      end
    end
  else -- different systems
    if spaceship.planet_gravity_well > 0 then -- leave the planet gravity well
      Spaceship.move_from_planet(spaceship, travel_speed)
    elseif spaceship.star_gravity_well > 0 then -- leave the star gravity well
      Spaceship.move_from_star(spaceship, travel_speed)
    else -- match interstellar position
      Spaceship.move_towards_interstellar_position(spaceship, travel_speed, destination_stellar_position)
    end
  end
end

---Moves a given spaceship from its current position towards its destination.
---@param spaceship SpaceshipType Spaceship data
---@param time_passed number amount of time passed since the position of the spaceship was last updated
function Spaceship.move_to_destination(spaceship, time_passed)
  if not spaceship.destination then return end

  local target_zone = Spaceship.get_destination_zone(spaceship)
  if not target_zone then
    spaceship.destination = nil
    spaceship.travel_message = "No destination."
    Log.debug("Spaceship destination invalid")
    return
  end

  --Log.debug(game.tick .. " moving to destination.")
  -- move away from current zone
  if spaceship.near and not Spaceship.is_near_destination(spaceship) then
    --Log.debug(game.tick .. "Leaving zone.")
    spaceship.near = nil
    -- close any scouting views
    for _, player in pairs(game.connected_players) do
      local playerdata = get_make_playerdata(player)
      if playerdata.anchor_scouting_for_spaceship_index == spaceship.index then
        Spaceship.stop_anchor_scouting(player)
        player.print("Cannot anchor, spaceship has departed for a different destination.")
      end
    end
  end

  Spaceship.move_to_destination_basic(spaceship, target_zone, time_passed)

  local ship_surface = Spaceship.get_own_surface(spaceship)
  Spaceship.set_light(spaceship, ship_surface)
end

---Moves a spaceship or spaceship-lookahead.
---@param spaceship SpaceshipType Spaceship or spaceship-lookahead
---@param target_zone AnyZoneType|SpaceshipType Zone or spaceship
---@param time_passed number Time passed since the position of the spaceship was last updated
function Spaceship.move_to_destination_basic(spaceship, target_zone, time_passed)

  -- step towards destination
  local travel_speed = spaceship.speed * Spaceship.travel_speed_multiplier * time_passed
  local destination_space_distorion = Zone.get_space_distortion(target_zone)
  local destination_stellar_position = Zone.get_stellar_position(target_zone)
  local destination_star_gravity_well = Zone.get_star_gravity_well(target_zone)
  local destination_planet_gravity_well = Zone.get_planet_gravity_well(target_zone)

  if destination_space_distorion == 1 then -- target is anomaly (or spaceship at anomaly)
    if spaceship.planet_gravity_well > 0 then -- leave the planet gravity well
      Spaceship.move_from_planet(spaceship, travel_speed)
    elseif spaceship.star_gravity_well > 0 then -- leave the star gravity well
      Spaceship.move_from_star(spaceship, travel_speed)
    else -- move towards the anomaly
      Spaceship.move_to_anomaly(spaceship, travel_speed, destination_space_distorion)
    end
  elseif spaceship.space_distortion == 1 then -- at the anomaly so the stellar position can be anywhere instantly
    Spaceship.move_instant_interstellar_position(spaceship, travel_speed, destination_stellar_position)
  elseif destination_space_distorion > 0 then -- target is spaceship on way to/from anomaly
    local interstellar_distance = Util.vectors_delta_length(spaceship.stellar_position, destination_stellar_position)
    if spaceship.planet_gravity_well > 0 then -- leave the planet gravity well
      Spaceship.move_from_planet(spaceship, travel_speed)
    elseif spaceship.star_gravity_well > 0 then -- leave the star gravity well
      Spaceship.move_from_star(spaceship, travel_speed)
    elseif interstellar_distance > 0 then -- match interstellar position
      Spaceship.move_towards_interstellar_position(spaceship, travel_speed, destination_stellar_position)
    else -- move towards the anomaly
      Spaceship.move_to_anomaly(spaceship, travel_speed, destination_space_distorion)
    end
  elseif spaceship.space_distortion > 0 then -- leaving the anomaly
    Spaceship.move_from_anomaly(spaceship, travel_speed)
  else -- conventional travel to planet/star/spaceship
    Spaceship.move_conventional(spaceship, travel_speed, target_zone, destination_stellar_position, destination_star_gravity_well, destination_planet_gravity_well)
  end

end

---@param spaceship SpaceshipType
---@param event EventData.on_tick Event data
function Spaceship.spaceship_tick(spaceship, event)
  local valid_console = (spaceship.console and spaceship.console.valid) or false
  local update_tick_count = (valid_console and spaceship.console.unit_number + event.tick) or nil
  local is_on_own_surface = Spaceship.is_on_own_surface(spaceship)
    -- update asteroid density
  if valid_console and is_on_own_surface then
    if update_tick_count % Spaceship.tick_interval_density == 0 then
      spaceship.asteroid_density = 0
      if spaceship.speed > 5 then
        local target_zone = Spaceship.get_destination_zone(spaceship)
        if target_zone then
          local spaceship_lookahead = {
            type = "spaceship-lookahead",
            speed = spaceship.speed,
            stellar_position = spaceship.stellar_position,
            space_distortion = spaceship.space_distortion,
            star_gravity_well = spaceship.star_gravity_well,
            planet_gravity_well = spaceship.planet_gravity_well,
          }
          Spaceship.move_to_destination_basic(spaceship_lookahead, target_zone, 5 * 60) -- 5 seconds
          spaceship.future_asteroid_density = SpaceshipObstacles.get_asteroid_density(spaceship_lookahead)
        end
      end
      spaceship.asteroid_density = SpaceshipObstacles.get_asteroid_density(spaceship)
    end
  end

  if not valid_console then
    spaceship.check_message= {"space-exploration.spaceship-check-message-no-console"}
    spaceship.integrity_valid = false
  end

  -- Pause inserters, workaround for https://forums.factorio.com/viewtopic.php?f=58&t=89035
  -- Note: production machines should NOT be included as some are supposed to be disabled on specific surfaces.
  if spaceship.entities_to_restore and spaceship.entities_to_restore_tick < event.tick then
    for _, storedState in pairs(spaceship.entities_to_restore) do
      if storedState.entity and storedState.entity.valid then
        storedState.entity.active = storedState.active
      end
    end
    spaceship.entities_to_restore = nil
  end

  -- Restore circuit networks
  if spaceship.circuits_to_restore and spaceship.circuits_to_restore_tick < event.tick then

    -- Compute input state to restore to previous values and enable for a tick
    for _, storedState in pairs(spaceship.circuits_to_restore) do
      if storedState.entity and storedState.entity.valid then
        if spaceship.circuits_restore_phase == 1 then
          -- First tick
          local behavior = storedState.entity.get_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]
          local signal_idx = 1

          -- For all existing signals, cancel them out
          -- If they existed before, they will be re-added below
          local transientBehavior = storedState.cloned_entity.get_control_behavior()
          local existingNetwork = transientBehavior.get_circuit_network(storedState.wire, defines.circuit_connector_id.combinator_input)
          if existingNetwork ~= nil and existingNetwork.signals ~= nil then
            for _, signal in pairs(existingNetwork.signals) do
              local new_count = -signal.count
              if new_count > 2147483647 then new_count = 2147483647 end -- this won't be able to cancel out a signal of -2147483648 completly but otherwise set_signal crashes
              behavior.set_signal(signal_idx, {
                signal = signal.signal,
                count = new_count
              })
              signal_idx = signal_idx + 1
            end
          end

          -- Add as input all the signals we had before launching
          for _, signal in pairs(storedState.signals) do
            behavior.set_signal(signal_idx, signal)
            signal_idx = signal_idx + 1
          end

          -- Enable our constant combinator
          storedState.entity.get_control_behavior().enabled = true
        else
          -- second tick - destroy our temporary constant combinator
          storedState.entity.get_control_behavior().enabled = false
           -- not safe destroy because that fires events that are slow
          storedState.entity.destroy()
        end
      end
    end

    if spaceship.circuits_restore_phase == 1 then
      -- If in the first phase move to the second
      spaceship.circuits_restore_phase = 2
    else
      -- If the second phase already happened, remove our saved state
      spaceship.circuits_to_restore = nil
    end
  end

  if valid_console or is_on_own_surface then
    -- integrity check
    if spaceship.is_doing_check then
      if is_on_own_surface and spaceship.known_floor_tiles and not spaceship.is_doing_check_slowly then
        -- need to tick faster on bigger ships
        for i = 0, math.ceil(spaceship.known_floor_tiles / 1000) do
          -- tick once for each 1000 tiles
          if spaceship.is_doing_check then
            Spaceship.integrity_check_tick(spaceship)
          end
        end
      else
        Spaceship.integrity_check_tick(spaceship)
      end
    elseif valid_console and update_tick_count % Spaceship.integrity_pulse_interval == 0 and spaceship.console.energy > 0 then
      Spaceship.start_slow_integrity_check(spaceship)
    end

    if valid_console and update_tick_count % 60 == 0 then

      -- set speed
      if spaceship.target_speed_source ~= "manual-override" then
        local signal_target_speed = spaceship.console.get_merged_signal(Spaceship.signal_for_speed)
        if signal_target_speed > 0 then
          spaceship.target_speed = signal_target_speed + 0.5
          spaceship.target_speed_source = "circuit"
        elseif signal_target_speed < 0 then
          spaceship.stopped = true
          spaceship.target_speed = nil
          spaceship.target_speed_source = "circuit"
        elseif not spaceship.stopped then
          -- 0 means use set targets
          local last_target_speed = spaceship.target_speed
          local asteroid_density = spaceship.asteroid_density or SpaceshipObstacles.default_asteroid_density
          if spaceship.future_asteroid_density and spaceship.future_asteroid_density > asteroid_density then
            asteroid_density = spaceship.future_asteroid_density
          end
          if asteroid_density == SpaceshipObstacles.default_asteroid_density then
            spaceship.target_speed = spaceship.target_speed_normal
            spaceship.target_speed_source = "normal"
          elseif asteroid_density == SpaceshipObstacles.asteroid_density_by_zone_type['asteroid-belt'] then
            spaceship.target_speed = spaceship.target_speed_belt or spaceship.target_speed_normal
            spaceship.target_speed_source = "asteroid-belt"
          elseif asteroid_density == SpaceshipObstacles.asteroid_density_by_zone_type['asteroid-field'] then
            spaceship.target_speed = spaceship.target_speed_field or spaceship.target_speed_belt or spaceship.target_speed_normal
            spaceship.target_speed_source = "asteroid-field"
          end
          -- target speed was set to nil which means the fields are empty and target speed should be unlimited
          if not spaceship.target_speed then
            if last_target_speed and spaceship.is_moving then Spaceship.activate_engines(spaceship) end -- if spaceship was being speed throttled then need to fire all engines now that it's unlimited (but only once)
            spaceship.target_speed_source = nil
          end
        end
      end

      -- set destination
      for signal_name, type in pairs(Zone.signal_to_zone_type) do
        local value = spaceship.console.get_merged_signal({type = "virtual", name = signal_name})
        if value > 0 then
          local zone = Zone.from_zone_index(value)
          if zone and zone.type == type then
            if Zone.is_visible_to_force(zone, spaceship.force_name) or global.debug_view_all_zones then
              if (not spaceship.destination) or (spaceship.destination.type == "zone" and spaceship.destination.index ~= value) then
                spaceship.destination = { type = "zone", index = value }
                Spaceship.update_output_combinator(spaceship, event.tick)
              end
              break
            end
          end
        end
      end
      -- TODO: allow spacwhip as destination

      -- launch
      if not spaceship.own_surface_index and not spaceship.entities_to_restore then
        local value = spaceship.console.get_merged_signal(Spaceship.signal_for_launch)
        if value > 0 then
          spaceship.stopped = false
          spaceship.is_launching = true
          spaceship.is_launching_automatically = true
          spaceship.is_landing = false
          Spaceship.start_integrity_check(spaceship)
        end
      end

      -- land
      if is_on_own_surface
       and not spaceship.entities_to_restore
       and spaceship.destination
       and spaceship.destination.type == "zone"
       and Spaceship.is_near_destination(spaceship) then
        SpaceshipClamp.attempt_anchor_spaceship(spaceship)
        is_on_own_surface = Spaceship.is_on_own_surface(spaceship)
      end

    end

    -- delayed launch (either until the number of waiting chunk requests is finished or a maximum delay is reached)
    if spaceship.awaiting_requests and (spaceship.requests_made <= 0 or (event.tick - spaceship.await_start_tick) >= Spaceship.tick_max_await) then
      local params = spaceship.clone_params
      SpaceshipClone.clone(spaceship, params.clone_from, params.clone_to, params.clone_delta, nil)
      spaceship.awaiting_requests = false
      is_on_own_surface = Spaceship.is_on_own_surface(spaceship)
      spaceship.clone_params = nil
    end

    -- don't upkeep the ship as if it is in-transit until it has actually cloned to the own_surface_index surface
    if is_on_own_surface then
      -- space upkeep
      if event.tick % Spaceship.tick_interval_move == 0 then
        Spaceship.surface_tick(spaceship, Spaceship.tick_interval_move)
      end

      if spaceship.target_speed and spaceship.is_moving ~= true and spaceship.stopped then -- don't use == false
        spaceship.stopped = false
      end

      -- this has to be done every tick for seamless movement
      local surface = Spaceship.get_own_surface(spaceship)
      SpaceshipObstacles.tick_entity_obstacles(spaceship, surface)

      -- navigation
      if spaceship.integrity_valid
        and spaceship.destination
        and not spaceship.stopped
        and not Spaceship.is_near_destination(spaceship) then
          -- wants to move and can move
          if not spaceship.is_moving then
            spaceship.is_moving = true
            Spaceship.activate_engines(spaceship)
            Spaceship.start_integrity_check(spaceship)
          end

          if (event.tick % 6) == 0 then
            Spaceship.toggle_engines_for_target_speed(spaceship)
          end

          if event.tick % Spaceship.tick_interval_move == 0 then
            Spaceship.apply_engine_thust(spaceship, Spaceship.tick_interval_move)
            Spaceship.apply_drag(spaceship, Spaceship.tick_interval_move)
            Spaceship.move_to_destination(spaceship, Spaceship.tick_interval_move)
          end
      else
        -- can't move
        if spaceship.is_moving then
          spaceship.is_moving = false
          Spaceship.deactivate_engines(spaceship)
        end
        if Spaceship.is_near_destination(spaceship) then
          spaceship.speed = 0
          spaceship.travel_message = {"space-exploration.spaceship-travel-message-at-destination"}
        end
        if spaceship.speed > 0 then
          -- local drag = Spaceship.space_drag * (2 - (spaceship.streamline or 0)) -- Previous commit message was "This seems worse", and this variable is unused
          spaceship.speed = math.max(0, spaceship.speed * (1 - Spaceship.space_drag) - (spaceship.stopped and 0.1 or 0.02))
        end
      end
    end


  else
    -- Destroy the spaceship struct if the console is missing AND the spaceship is not flying
    Spaceship.destroy(spaceship)
    return
  end

  if valid_console and update_tick_count % Spaceship.tick_interval_output == 0 then
    Spaceship.update_output_combinator(spaceship, event.tick)
  end

end

---@param spaceship SpaceshipType
function Spaceship.toggle_engines_for_target_speed(spaceship)
  if spaceship.target_speed and spaceship.is_moving and spaceship.engines then
    local engine_probability = 1 / table_size(spaceship.engines)
    if spaceship.speed > spaceship.target_speed then
      for _, engine in pairs(spaceship.engines) do
        if engine.entity.valid and math.random() < engine_probability then
          engine.entity.active = false
          Spaceship.update_smoke(spaceship, engine)
        end
      end
    else
      for _, engine in pairs(spaceship.engines) do
        if engine.entity.valid and math.random() < engine_probability then
          engine.entity.active = true
          Spaceship.update_smoke(spaceship, engine)
        end
      end
    end
  end
end

---@param tick uint Current tick
function Spaceship.update_output_combinator(spaceship, tick)

  if not (spaceship.console and spaceship.console.valid) then return end
  if not (spaceship.console_output and spaceship.console_output.valid) then
    -- spawn the console output
    local console = spaceship.console
    local output_position = util.vectors_add(console.position, Spaceship.console_output_offset)
    local output = util.find_entity_or_revive_ghost(console.surface, Spaceship.name_spaceship_console_output, output_position)
    if not output then
      output = console.surface.create_entity{
        name = Spaceship.name_spaceship_console_output,
        position = util.vectors_add(console.position, Spaceship.console_output_offset),
        force = console.force,
        create_build_effect_smoke = false,
      }
      ---@cast output -?
    end
    spaceship.console_output = output
  end
  if spaceship.console_output and spaceship.console_output.valid then
    local ctrl = spaceship.console_output.get_or_create_control_behavior() --[[@as LuaConstantCombinatorControlBehavior]]

    local slot = 1
    -- Spaceship ID
    ctrl.set_signal(slot, {signal=Spaceship.signal_for_own_spaceship_id, count=spaceship.index})
    slot = slot + 1
    -- Speed
    if spaceship.is_moving and spaceship.speed > 0 then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_speed, count=math.max(1, spaceship.speed)})
    elseif Spaceship.is_on_own_surface(spaceship) then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_speed, count=-1}) -- stopped
    else
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_speed, count=-2}) -- anchored
    end
    slot = slot + 1

    -- Distance
    if (not spaceship.distance_to_destination_tick) or spaceship.distance_to_destination_tick + 60 < tick then
      spaceship.distance_to_destination = Spaceship.get_distance_to_destination(spaceship)
      spaceship.distance_to_destination_tick = tick
    end

    if spaceship.destination and Spaceship.is_near_destination(spaceship) then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=-1})
    elseif spaceship.destination and Spaceship.is_at_destination(spaceship)  then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=-2})
    elseif spaceship.distance_to_destination and spaceship.distance_to_destination > 0 then
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=math.max(1, spaceship.distance_to_destination)})
    else --no destination
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_distance, count=-3})
    end
    slot = slot + 1

    -- Destination
    if spaceship.destination then
      if spaceship.destination.type == "spaceship" then
        ctrl.set_signal(slot, {signal=Spaceship.signal_for_destination_spaceship, count=spaceship.destination.index})
      elseif spaceship.destination.type == "zone" then
        local zone = Spaceship.get_destination_zone(spaceship)
        local signal_name = Zone.get_signal_name(zone)
        ctrl.set_signal(slot, {signal={type="virtual", name=signal_name}, count=zone.index})
      else
        ctrl.set_signal(slot, {signal=Spaceship.signal_for_destination_spaceship, count=0})
      end
    else
      ctrl.set_signal(slot, {signal=Spaceship.signal_for_destination_spaceship, count=0})
    end
    slot = slot + 1

    -- Asteroid Density
    if spaceship.asteroid_density then
      ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-D"}, count=spaceship.asteroid_density * 100})
    else
      ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-D"}, count=SpaceshipObstacles.default_asteroid_density * 100})
    end
    slot = slot + 1

    -- Anchor (only change if the ship is not in the middle of launching)
    if not spaceship.awaiting_requests then
      if spaceship.zone_index then
        ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-A"}, count=spaceship.zone_index})
      else
        ctrl.set_signal(slot, {signal={type = "virtual", name = "signal-A"}, count=0})
      end
      slot = slot + 1
    end
  end
end

--- Updates all spaceships, potentially launching/landing them or spawning/destroying/changing speed of obstacles
--- or updating their guis or updating anchor scoutin
---@param event EventData.on_tick Event data
function Spaceship.on_tick(event)
  -- update spaceships
  for _, spaceship in pairs(global.spaceships) do
    Spaceship.spaceship_tick(spaceship, event)
  end

  -- update guis
  if event.tick % Spaceship.tick_interval_gui == 0 then
    for _, player in pairs(game.connected_players) do
      SpaceshipGUI.gui_update(player, event.tick)
    end
  end

  -- update obstacles
  SpaceshipObstacles.tick_projectile_speeds()

  -- update anchoring
  if event.tick % Spaceship.tick_interval_anchor == 0 then
    for _, player in pairs(game.connected_players) do
      local playerdata = get_make_playerdata(player)
      if playerdata and playerdata.anchor_scouting_for_spaceship_index then
        Spaceship.anchor_scouting_tick(player, Spaceship.from_index(playerdata.anchor_scouting_for_spaceship_index))
      end
    end
  end
end
Event.addListener(defines.events.on_tick, Spaceship.on_tick)

--[[
---@param event EventData.on_chunk_generated Event data
function Spaceship.on_chunk_generated(event)
  local area = event.area
  local surface = event.surface
  local spaceship = Spaceship.from_own_surface_index(surface.index)
  if spaceship then
    area.right_bottom.x = area.right_bottom.x + 0.99
    area.right_bottom.y = area.right_bottom.y + 0.99
    entities = surface.find_entities_filtered{
      area = area
    }
    for _, entity in pairs(entities) do -- rocks
      entity.destroy()
    end
    local bad_tiles = surface.find_tiles_filtered{name={name_asteroid_tile, "out-of-map"}}
    local set_tiles = {}
    for _, tile in pairs(bad_tiles) do
      table.insert(set_tiles, {position = tile.position, name=name_space_tile})
      surface.set_hidden_tile(tile.position, name_space_tile)
    end
    surface.set_tiles(set_tiles)
  end
end
Event.addListener(defines.events.on_chunk_generated, Spaceship.on_chunk_generated)
]]--

---@param surface LuaSurface
---@param position MapPosition
---@param color Color
---@param time uint
function Spaceship.flash_tile(surface, position, color, time)
  local a = (color.a or 1)
  rendering.draw_rectangle{
    color = {r = color.r * a, g = color.g * a, b = color.b * a, a = a},
    filled = true,
    left_top = position,
    right_bottom = {(position.x or position[1])+1, (position.y or position[2])+1},
    surface = surface,
    time_to_live = time
  }
end

---@param entity_name string
---@return number
function Spaceship.stress_for_generator_name(entity_name)
  if not Spaceship.cache_generator_stress then
    Spaceship.cache_generator_stress = {}
  end
  if Spaceship.cache_generator_stress[entity_name] then
    return Spaceship.cache_generator_stress[entity_name]
  end
  return Spaceship.stress_for_generator_prototype(game.entity_prototypes[entity_name])
end

---@param prototype LuaEntityPrototype
---@return number
function Spaceship.stress_for_generator_prototype(prototype)
  if not Spaceship.cache_generator_stress then
    Spaceship.cache_generator_stress = {}
  end
  if Spaceship.cache_generator_stress[prototype.name] then
    return Spaceship.cache_generator_stress[prototype.name]
  end
  local max_power = prototype.max_energy_production -- W per tick
  local is_void = prototype.void_energy_source_prototype ~= nil
  local is_burner = prototype.burner_prototype ~= nil
  local is_fluid = prototype.fluid_energy_source_prototype ~= nil
  local is_heat = prototype.heat_energy_source_prototype ~= nil
  local collision_box = prototype.collision_box
  local min_x = math.floor(collision_box.left_top.x * 2) / 2
  local max_x = math.ceil(collision_box.right_bottom.x * 2) / 2
  local min_y = math.floor(collision_box.left_top.y * 2) / 2
  local max_y = math.ceil(collision_box.right_bottom.y * 2) / 2
  local area = (max_x - min_x) * (max_y - min_y)
  local power_per_area = max_power / area
  local multiplier = 1
  if is_burner then
    multiplier = 2
  end
  if is_void then
    multiplier = 100
  end
  local base_cost = power_per_area * multiplier / 1000
  local cost = math.max(0, base_cost - 265)
  -- floor to nearest 5
  cost = 5 * math.floor(cost / 5)
  --Log.debug("generator_cost "..prototype.name.." "..cost)
  Spaceship.cache_generator_stress[prototype.name] = cost
  return cost
end

---@return string[]
function Spaceship.get_overweight_generator_names()
  if Spaceship.overweight_generator_names then return Spaceship.overweight_generator_names end
  local overweights = {}
  local prototypes = game.get_filtered_entity_prototypes({{filter = "type", type = "generator", mode = "or"}, {filter = "type", type = "burner-generator", mode = "or"}})
  for _, prototype in pairs(prototypes) do
    local cost = Spaceship.stress_for_generator_prototype(prototype)
    if cost > 0 then
      table.insert(overweights, prototype.name)
    end
  end
  Spaceship.overweight_generator_names = overweights
  return overweights
end

---@return Flags
function Spaceship.get_no_stress_entity_names()
  if Spaceship.cache_no_stress_entity_names then return Spaceship.cache_no_stress_entity_names end
  local no_stress_entity_names = {}
  local prototypes = game.get_filtered_entity_prototypes({{filter = "type", type = "storage-tank"}})
  for _, prototype in pairs(prototypes) do
    if string.starts(prototype.name, "se-space-pipe")
      or not prototype.selectable_in_game then
      no_stress_entity_names[prototype.name] = true
    end
  end
  Spaceship.cache_no_stress_entity_names = no_stress_entity_names
  return no_stress_entity_names
end

---@param breakdown_table {[string]:SpaceshipIntegrityStressBreakdownInfo}
---@param breakdown_key string
---@param added_values SpaceshipIntegrityStressBreakdownInfo
local function add_to_breakdown(breakdown_table, breakdown_key, added_values)
  if not breakdown_table[breakdown_key] then breakdown_table[breakdown_key] = {} end
  for key, value in pairs(added_values) do
    if type(value) == "number" then
      if not breakdown_table[breakdown_key][key] then breakdown_table[breakdown_key][key] = 0 end
      breakdown_table[breakdown_key][key] = breakdown_table[breakdown_key][key] + value
    else
      breakdown_table[breakdown_key][key] = value
    end
  end
end

---@param spaceship SpaceshipType
---@param area? BoundingBox.0
function Spaceship.calculate_integrity_stress(spaceship, area)

  spaceship.integrity_stress_structure = 0
  spaceship.integrity_stress_container = 0
  spaceship.integrity_stress_structure_breakdown = {}
  spaceship.integrity_stress_container_breakdown = {}
  spaceship.integrity_stress_structure_breakdown_string = nil
  spaceship.integrity_stress_container_breakdown_string = nil

  -- use all tiles for the cost even if they are not connected
  -- get walls for an integrity discount
  local surface = Spaceship.get_current_surface(spaceship)
  if not surface then surface = spaceship.console.surface end

  if not area then --- whole surface
    spaceship.tile_count = surface.count_tiles_filtered{name = Spaceship.names_spaceship_floors}
    spaceship.wall_count = surface.count_entities_filtered{name = Spaceship.names_spaceship_walls}
  else
    spaceship.tile_count = spaceship.known_floor_tiles + spaceship.known_bulkhead_tiles
    spaceship.wall_count = 0
    local walls = surface.find_entities_filtered{name = Spaceship.names_spaceship_walls, area = area}
    for _, wall in pairs(walls) do
      local tile_pos = Util.position_to_tile(wall.position)
      if spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.bulkhead_console_connected  then
        spaceship.wall_count = spaceship.wall_count + 1
      end
    end
  end

  -- Find weakpoints in the design
  -- If very narrow sections are used in the middle those are not strong,
  -- so we need to increase the cost not decrease it if it gets too narrow.
  -- Scan from front and back so decorative pointy bits are not a problem
  -- don't increase width in jump, follow the edge more loosely.
  -- phantom tiles start at the 50% reduced with mark.
  -- They should not have full effect immediatly.
  local widths = {}
  for x, x_tiles in pairs(spaceship.known_tiles) do
    for y, state in pairs(x_tiles) do
      if state == Spaceship.tile_status.floor_console_connected or state == Spaceship.tile_status.bulkhead_console_connected then
        widths[y] = (widths[y] or 0) + 1
      end
    end
  end
  local front_y = spaceship.known_bounds.left_top.y
  local back_y = spaceship.known_bounds.right_bottom.y

  local front_max_width = 0
  local back_max_width = 0

  local phantom_tiles = 0
  local thin_section_count = 0

  while front_y <= back_y do
    if front_max_width <= back_max_width then
      if widths[front_y] then
        local width = widths[front_y]
        if front_max_width < width then
          front_max_width = math.min(width, front_max_width + 2)
        end
        if width < front_max_width / 2 then
          -- tiles in more extreme hollows count more
          local hollow = (front_max_width / 2 - width)
          phantom_tiles = phantom_tiles + hollow * hollow / (front_max_width / 2)
          thin_section_count = thin_section_count + 1
        end
      end
      front_y = front_y + 1
    else
      if widths[back_y] then
        local width = widths[back_y]
        if back_max_width < width then
          back_max_width = math.min(width, back_max_width + 2)
        end
        if width < back_max_width / 2 then
          local hollow = (back_max_width / 2 - width)
          phantom_tiles = phantom_tiles + hollow * hollow / (front_max_width / 2)
          thin_section_count = thin_section_count + 1
        end
      end
      back_y = back_y - 1
    end
  end
  if phantom_tiles > 0 then
    Log.debug("phantom_tiles " .. phantom_tiles)
  end

  spaceship.container_slot_count = 0

  local containers = surface.find_entities_filtered{ type = {"container", "logistic-container", "car", "spider-vehicle", "locomotive", "cargo-wagon"}, area = area}

  for _, container in pairs(containers) do
    local tile_pos = Util.position_to_tile(container.position)
    if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
      local container_size = container.prototype.get_inventory_size(defines.inventory.car_trunk) or (container.prototype.get_inventory_size(defines.inventory.chest) or 0)
      local mult = 1
      if container.type == "locomotive" or container.type == "cargo-wagon" then
        mult = 0.1 -- 90% discount for trains
      end
      spaceship.container_slot_count = spaceship.container_slot_count + container_size * mult
      local breakdown_order = "a"

      -- Vehicle grids
      if container.type == "car" or container.type == "spider-vehicle" or container.type == "locomotive" or container.type == "cargo-wagon" then
        breakdown_order = "b"
        if container.grid then
          local grid_usage = 0
          for _, equipment in pairs(container.grid.equipment) do
            if equipment and equipment.shape and equipment.shape.width and equipment.shape.height then
              if Spaceship.integrity_cost_per_equipment_type[equipment.type] then
                grid_usage = grid_usage + (Spaceship.integrity_cost_per_equipment_type[equipment.type] * (equipment.shape.width * equipment.shape.height))
              else
                grid_usage = grid_usage + (Spaceship.integrity_cost_per_equipment_type["default"] * (equipment.shape.width * equipment.shape.height))
              end
            end
          end
          if grid_usage > 0 then
            spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + grid_usage
            spaceship.integrity_stress_container = spaceship.integrity_stress_container + grid_usage
            add_to_breakdown(spaceship.integrity_stress_structure_breakdown, container.name, {grid_usage = grid_usage, cost = grid_usage, order = breakdown_order})
            add_to_breakdown(spaceship.integrity_stress_container_breakdown, container.name, {grid_usage = grid_usage, cost = grid_usage, order = breakdown_order})
          end
        end
      end

      if container_size > 0 then
        add_to_breakdown(spaceship.integrity_stress_container_breakdown, container.name,
          {slot_count = container_size, cost = container_size * mult * Spaceship.integrity_cost_per_container_slot, order = breakdown_order})
      end
    end
  end

  spaceship.container_fluid_capacity = 0

  local fluid_containers = surface.find_entities_filtered{type = {"storage-tank", "fluid-wagon"}, area = area}
  local no_stress_entity_names = Spaceship.get_no_stress_entity_names()
  for _, container in pairs(fluid_containers) do
    if not no_stress_entity_names[container.name] then
      local mult = 2
      if container.type == "fluid-wagon" then
        mult = 0.1
      else
        if string.find(container.name, "booster", 1, true) then mult = 0.5 end
        if container.name == "storage-tank" then mult = 1 end
      end
      local tile_pos = Util.position_to_tile(container.position)
      if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
        if container.fluidbox and #container.fluidbox > 0 then
          for i = 1, #container.fluidbox do
            local container_fluid_capacity = container.fluidbox.get_capacity(i)
            local fluid_type_mult = 1
            local breakdown_key = container.name
            if container.fluidbox[1] and container.fluidbox[1].name == "steam" then
              fluid_type_mult = 2
            end
            if fluid_type_mult ~= 1 then
              local fluid = game.fluid_prototypes[container.fluidbox[1].name]
              breakdown_key = container.name .."+".. fluid.name -- + separates container name and fluid name, used for string formatting
            end
            local container_cost = fluid_type_mult * mult * container_fluid_capacity
            spaceship.container_fluid_capacity = spaceship.container_fluid_capacity + container_cost
            add_to_breakdown(spaceship.integrity_stress_container_breakdown, breakdown_key, {fluid_capacity = container_fluid_capacity,
              cost = container_cost * Spaceship.integrity_cost_per_fluid_capacity, order = "c"})
          end
        end
      end
    end
  end

  spaceship.speed_multiplier = 1

  -- name-based entity modifiers
  local names = {}
  local name_effects = {}
  for _, ia_name in pairs(Spaceship.integrity_affecting_names) do
    table.insert(names, ia_name.name)
    name_effects[ia_name.name] = ia_name
  end
  local entities = surface.find_entities_filtered{name = names, area = area}
  for _, entity in pairs(entities) do
    local tile_pos = Util.position_to_tile(entity.position)
    if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
      local name_effect_set = name_effects[entity.name]
      if name_effect_set.integrity_stress_container then
        spaceship.integrity_stress_container = spaceship.integrity_stress_container + name_effect_set.integrity_stress_container
        add_to_breakdown(spaceship.integrity_stress_container_breakdown, entity.name, {count = 1, cost = name_effect_set.integrity_stress_container, order = "d"})
      end
      if name_effect_set.integrity_stress_structure then
        spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + name_effect_set.integrity_stress_structure
        add_to_breakdown(spaceship.integrity_stress_structure_breakdown, entity.name, {count = 1, cost = name_effect_set.integrity_stress_structure , order = "d"})
      end
      if name_effect_set.max_speed_multiplier then
        spaceship.speed_multiplier = math.min(spaceship.speed_multiplier, name_effect_set.max_speed_multiplier)
      end
    end
  end

  -- type-based entity modifiers
  local types = {}
  local type_effects = {}
  for _, ia_type in pairs(Spaceship.integrity_affecting_types) do
    table.insert(types, ia_type.type)
    type_effects[ia_type.type] = ia_type
  end
  local entities = surface.find_entities_filtered{type = types, area = area}
  for _, entity in pairs(entities) do
    local tile_pos = Util.position_to_tile(entity.position)
    if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
      local type_effect_set = type_effects[entity.type]
      if type_effect_set.integrity_stress_container then
        spaceship.integrity_stress_container = spaceship.integrity_stress_container + type_effect_set.integrity_stress_container
        add_to_breakdown(spaceship.integrity_stress_container_breakdown, entity.name, {count = 1, cost = type_effect_set.integrity_stress_container, order = "d"})
      end
      if type_effect_set.integrity_stress_structure then
        spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + type_effect_set.integrity_stress_structure
        add_to_breakdown(spaceship.integrity_stress_structure_breakdown, entity.name, {count = 1, cost = type_effect_set.integrity_stress_structure, order = "d"})
      end
      if type_effect_set.max_speed_multiplier then
        spaceship.speed_multiplier = math.min(spaceship.speed_multiplier, type_effect_set.max_speed_multiplier)
      end
    end
  end

  local overweight_generator_names = Spaceship.get_overweight_generator_names()
  if next(overweight_generator_names) then
    -- Generators
    --local entities = surface.find_entities_filtered{type = "generator", area = area}
    local entities = surface.find_entities_filtered{name = overweight_generator_names, area = area}
    for _, entity in pairs(entities) do
      local tile_pos = Util.position_to_tile(entity.position)
      if area == nil or (spaceship.known_tiles[tile_pos.x] and spaceship.known_tiles[tile_pos.x][tile_pos.y] == Spaceship.tile_status.floor_console_connected) then
        local added_stress = Spaceship.stress_for_generator_name(entity.name)
        spaceship.integrity_stress_structure = spaceship.integrity_stress_structure + added_stress
        spaceship.integrity_stress_container = spaceship.integrity_stress_container + added_stress
        add_to_breakdown(spaceship.integrity_stress_structure_breakdown, entity.name, {count = 1, cost = added_stress, order = "e"})
        add_to_breakdown(spaceship.integrity_stress_container_breakdown, entity.name, {count = 1, cost = added_stress, order = "e"})
      end
    end
  end

  -- container slot is 0.5 or 24 for a normal container 4800 ish items. Cost is 24
  -- container can caryy 48 * 10 barrels = 24k fluid
  -- storage tank is 5, 25k fluids = 250 effective items. Cost is 12.5 (50% discount)
  -- booster tanks cost50% less
  spaceship.integrity_stress_structure =
    spaceship.integrity_stress_structure
    + spaceship.tile_count
    + phantom_tiles * Spaceship.integrity_cost_per_phantom_tile
    - spaceship.wall_count * Spaceship.integrity_credit_per_wall

  add_to_breakdown(spaceship.integrity_stress_structure_breakdown, mod_prefix .. "spaceship-floor", {count = spaceship.tile_count, cost = spaceship.tile_count, order="a-a"})
  add_to_breakdown(spaceship.integrity_stress_structure_breakdown, mod_prefix .. "spaceship-wall", {count = spaceship.wall_count, cost = - spaceship.wall_count * Spaceship.integrity_credit_per_wall, order="a-b"})
  if phantom_tiles > 0 then
    add_to_breakdown(spaceship.integrity_stress_structure_breakdown, "phantom-tiles",
      {count = thin_section_count, cost = phantom_tiles * Spaceship.integrity_cost_per_phantom_tile, order="z-a"})
  end

  spaceship.integrity_stress_container =
    spaceship.integrity_stress_container
    + spaceship.container_slot_count * Spaceship.integrity_cost_per_container_slot
    + spaceship.container_fluid_capacity * Spaceship.integrity_cost_per_fluid_capacity
  -- Already added to breakdown during container check

  -- if the ship is very long and thin start taking integrity penalties.
  local widths_total = 0
  for _, width in pairs(widths) do
    widths_total = widths_total + width
  end
  local width_average = widths_total / table_size(widths)
  local length = spaceship.known_bounds.right_bottom.y - spaceship.known_bounds.left_top.y
  -- over 4:1 length gets a penalty of 5% per additional length
  local integrity_multiplier = 1 + 0.05 * (length / width_average - 4)
  if integrity_multiplier > 1 then
    add_to_breakdown(spaceship.integrity_stress_structure_breakdown, "long-ship", {percentage = integrity_multiplier - 1,
      cost = spaceship.integrity_stress_structure * (integrity_multiplier - 1), order="z-b"})
    spaceship.integrity_stress_structure = spaceship.integrity_stress_structure * integrity_multiplier
  end

  -- corridor allowance
  local empty_tiles = spaceship.count_empty_tiles or 0
  --Log.debug((spaceship.count_empty_tiles or 0) .." / "..(spaceship.tile_count - spaceship.wall_count))
  spaceship.integrity_stress_structure_max = spaceship.integrity_stress_structure
  -- this encourages keeping 10% of the total size empty.
  local effective_empty_tiles = math.min(spaceship.tile_count * 0.1, empty_tiles)
  -- this encourages keeping 20% of the internal space empty.
  -- math.min((spaceship.tile_count - spaceship.wall_count) * 0.2, empty_tiles)
  -- this has the first empty tile discounted by 1, the last by 0, if 20% of the ship is empty they are discouted by 80%
  -- empty_tiles * math.max(0, 1 - empty_tiles / (spaceship.tile_count - spaceship.wall_count))
  spaceship.integrity_stress_structure = spaceship.integrity_stress_structure_max - effective_empty_tiles
  add_to_breakdown(spaceship.integrity_stress_structure_breakdown, "empty-tiles",
    {min = empty_tiles, max = spaceship.tile_count * 0.1, cost = - effective_empty_tiles, order="z-d"})

  spaceship.integrity_stress = math.max(spaceship.integrity_stress_structure, spaceship.integrity_stress_container)

  if spaceship.integrity_stress > spaceship.integrity_limit then
    spaceship.integrity_valid = false
    spaceship.check_message = {"space-exploration.spaceship-check-message-failed-stress"}
  end
end

---@param spaceship SpaceshipType
function Spaceship.check_integrity_stress(spaceship)
  spaceship.integrity_limit = Spaceship.get_integrity_limit(game.forces[spaceship.force_name])
  if Spaceship.is_on_own_surface(spaceship) then
    -- use all tiles
    Spaceship.calculate_integrity_stress(spaceship, nil) -- whole area
  elseif not (spaceship.console and spaceship.console.valid) then
    spaceship.integrity_valid = false
    spaceship.check_message= {"space-exploration.spaceship-check-message-no-console"}
  elseif not spaceship.integrity_valid then
    -- already invalid
  elseif not spaceship.known_bounds then
    spaceship.integrity_valid = false
    spaceship.check_message= {"space-exploration.spaceship-check-message-failed-unknown-bounds"}
  elseif spaceship.integrity_valid and spaceship.known_bounds and spaceship.known_tiles then
    Spaceship.calculate_integrity_stress(spaceship, spaceship.known_bounds) -- limited area

    --[[ TODO: use improved know tiles approach
    and spaceship.known_tile_count and spaceship.known_wall_count then
    spaceship.integrity_stress = spaceship.known_tile_count - spaceship.known_wall_count / 2
    if spaceship.integrity_stress > spaceship.integrity_limit then
      spaceship.integrity_valid = false
      spaceship.check_message = "Fail: Structural integrity stress exceeds technology limit."
    end
    ]]--
  end

end

---@param spaceship SpaceshipType
---@param alpha? unknown unused
function Spaceship.start_slow_integrity_check(spaceship, alpha)
  spaceship.is_doing_check_slowly = true
  Spaceship.start_integrity_check(spaceship, alpha)
end

---@param spaceship SpaceshipType
---@param alpha? number
function Spaceship.start_integrity_check(spaceship, alpha)
  if alpha then
    spaceship.check_flash_alpha = alpha
  end
  spaceship.is_doing_check = true
end

---@param surface LuaSurface
function Spaceship.restart_integrity_checks_on_surface(surface)
  local zone = Zone.from_surface(surface)
  if not zone then return end
  for _, spaceship in pairs(global.spaceships) do
    if spaceship.zone_index == zone.index and spaceship.is_doing_check then
      Spaceship.restart_integrity_check(spaceship)
    end
  end
end

---@param spaceship SpaceshipType
function Spaceship.restart_integrity_check(spaceship)
  spaceship.check_stage = nil
end

---@param spaceship SpaceshipType
function Spaceship.stop_integrity_check(spaceship)
  spaceship.check_flash_alpha = nil
  spaceship.is_doing_check = nil
  spaceship.is_doing_check_slowly = nil
  spaceship.check_stage = nil
  spaceship.pending_tiles = nil
  spaceship.streamline = nil
  if spaceship.integrity_valid and spaceship.check_tiles then
    -- success
    spaceship.count_empty_tiles = spaceship.check_count_empty_tiles
    spaceship.check_count_empty_tiles = nil

    spaceship.known_tiles = table.deepcopy(spaceship.check_tiles)
    spaceship.check_tiles = nil
    spaceship.known_clamps = table.deepcopy(spaceship.check_clamps)
    spaceship.check_clamps = {}

    -- get the average for surface transfer
    local min_x = nil
    local max_x = nil
    local min_y = nil
    local max_y = nil
    local floor_tiles = 0
    local bulkhead_tiles = 0
    local front_tiles = {} -- x:y
    for x, x_tiles in pairs(spaceship.known_tiles) do
      if min_x == nil or x < min_x then min_x = x end
      if max_x == nil or x > max_x then max_x = x end
      for y, status in pairs(x_tiles) do
        if status == Spaceship.tile_status.floor_console_connected
          or status == Spaceship.tile_status.bulkhead_console_connected then
            if min_y == nil or y < min_y then min_y = y end
            if max_y == nil or y > max_y then max_y = y end
            if status == Spaceship.tile_status.floor_console_connected then
              floor_tiles = floor_tiles + 1
            else
              bulkhead_tiles = bulkhead_tiles + 1
            end
            if (not front_tiles[x]) or y < front_tiles[x] then
               front_tiles[x] = y
            end
        end
      end
    end
    max_x = max_x + 1 -- whole tile
    max_y = max_y + 1 -- whole tile
    spaceship.known_floor_tiles = floor_tiles
    spaceship.known_bulkhead_tiles = bulkhead_tiles
    spaceship.known_bounds = {left_top = {x = min_x, y = min_y}, right_bottom={x = max_x, y = max_y}}
    spaceship.known_tiles_average_x = math.floor((min_x + max_x)/2)
    spaceship.known_tiles_average_y = math.floor((min_y + max_y)/2)
    local front_tiles_by_y = {} -- y:count
    local front_tiles_by_y_left = {} -- y:count
    local front_tiles_by_y_right = {} -- y:count
    local max_flat = 0
    for x, y in pairs(front_tiles) do
      front_tiles_by_y[y] = (front_tiles_by_y[y] or 0) + 1
      if front_tiles_by_y[y] > max_flat then
        max_flat = front_tiles_by_y[y]
      end
      if x < spaceship.known_tiles_average_x then
        front_tiles_by_y_left[y] = (front_tiles_by_y_left[y] or 0) + 1
      else
        front_tiles_by_y_right[y] = (front_tiles_by_y_right[y] or 0) + 1
      end
    end
    local width = max_x - min_x
    -- max_flat == width = 0
    -- max_flat == width / 3 = 1
    local streamline_flatness = math.min(1, (1 - (max_flat-2) / (width-2)) * 1.5)
    local streamline_left = math.min(1, 2 * (table_size(front_tiles_by_y_left)-1) / (math.max(0.5, (width-1) / 2.5)))
    local streamline_right = math.min(1, 2 * (table_size(front_tiles_by_y_right)-1) / (math.max(0.5, (width-1) / 2.5)))
    spaceship.streamline = (streamline_flatness + streamline_left + streamline_right
      + 3 * math.min(streamline_flatness, math.min(streamline_left, streamline_right))) / 6
    --spaceship.streamline = math.min(1, 3.5 * (table_size(front_tiles_by_y)-1) / width)
    -- if it is symetrical then 1/2 would be max (excluding the -1)
    -- use 1/3.5 as max so there can be a few flat areas
    Log.debug_log("streamline flat "..streamline_flatness.." left "..streamline_left.." right "..streamline_right)
    --Log.debug("streamline "..spaceship.streamline )
    if Spaceship.is_on_own_surface(spaceship) then
      Spaceship.find_own_surface_engines(spaceship)
    end
  else
    spaceship.integrity_valid = false
    spaceship.check_tiles = nil
    spaceship.check_message = {"space-exploration.spaceship-check-message-failed-empty"}
  end

  --spaceship.check_message = nil
  if spaceship.console and spaceship.console.valid then
    --spaceship.console.force.print("Spaceship integrity check complete.")
  end

  Spaceship.check_integrity_stress(spaceship)

  if spaceship.is_launching then
    Spaceship.launch(spaceship)
  end
end

---@param spaceship SpaceshipType
function Spaceship.integrity_check_tick(spaceship)
  if not(spaceship.console and spaceship.console.valid) then
    spaceship.check_message= {"space-exploration.spaceship-check-message-no-console"}
    spaceship.integrity_valid = false
    Spaceship.stop_integrity_check(spaceship)
    return
  end

  local surface = spaceship.console.surface
  -- check if the player is around
  local player_is_here = not SpaceshipObstacles.surface_has_no_players(surface)

  ---@param surface LuaSurface
  ---@param position MapPosition
  ---@param color Color
  ---@param time uint
  local function flash_tile_if_needed(surface, position, color, time)
    if player_is_here and not spaceship.is_doing_check_slowly then
      Spaceship.flash_tile(surface, position, color, time)
    end
  end

  if not (spaceship.check_stage and spaceship.check_tiles and spaceship.pending_tiles) then
    local start_tile = surface.get_tile(spaceship.console.position)
    if Spaceship.names_spaceship_floors_map[start_tile.name] then
      -- floor tiles is a 2d array x then y
      spaceship.check_count_empty_tiles = 0
      spaceship.check_tiles = {}
      spaceship.check_tiles[start_tile.position.x] = {}
      spaceship.check_tiles[start_tile.position.x][start_tile.position.y] = Spaceship.tile_status.floor
      spaceship.pending_tiles = {}
      spaceship.pending_tiles[start_tile.position.x] = {}
      spaceship.pending_tiles[start_tile.position.x][start_tile.position.y] = true
      spaceship.check_stage = "floor-connectivity"
      spaceship.check_message = {"space-exploration.spaceship-check-message-checking-console-floor"}
    else
      spaceship.check_message = {"space-exploration.spaceship-check-message-failed-console-floor"}
      spaceship.integrity_valid = false
      Spaceship.stop_integrity_check(spaceship)
      return
    end
  end
  if not (spaceship.check_tiles and spaceship.pending_tiles) then return end

  local alpha = spaceship.check_flash_alpha or 0.05

  -- do a round of checking
  -- check_tiles. List of tiles to check this tick.

  -- pending_tiles should always exists in check_tiles
  -- it basically justs keeps a lst of which ones to search

  local next_pending_tiles = {}
  local changed = false

  -- floor-connectivity: Starting from console tile, find and mark the type of every tile in the spaceship. Put it in spaceship.check_tiles. This step cannot fail. Also includes the exterior tiles right next to the spaceship.
  if spaceship.check_stage == "floor-connectivity" then
    local position_table = {}
    for x, x_tiles in pairs(spaceship.pending_tiles) do
      for y, _ in pairs(x_tiles) do
        local value = spaceship.check_tiles[x][y]
        if value == Spaceship.tile_status.floor or value == Spaceship.tile_status.bulkhead then
          for d = 1, 4 do -- 4 way direction
            local cx = x + (d == 2 and 1 or (d == 4 and -1 or 0))
            local cy = y + (d == 1 and -1 or (d == 3 and 1 or 0))
            if not (spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy]) then -- unknown tile
              changed = true
              local tile = surface.get_tile({cx, cy})
              position_table.x = cx + 0.5
              position_table.y = cy + 0.5
              local wall_count = surface.count_entities_filtered{
                position = position_table,
                name = Spaceship.names_spaceship_bulkheads
              }
              local clamps = surface.count_entities_filtered{
                position = position_table,
                name = SpaceshipClamp.name_spaceship_clamp_keep
              }
              if clamps > 0 then
                local position_table_copy = table.deepcopy(position_table)
                spaceship.check_clamps = spaceship.check_clamps or {}
                table.insert(spaceship.check_clamps,position_table_copy)
              end
              if tile.valid and Spaceship.names_spaceship_floors_map[tile.name] then
                spaceship.check_tiles[cx] = spaceship.check_tiles[cx] or {}
                if wall_count > 0 then
                  -- Wall on floor
                  spaceship.check_tiles[cx][cy] = Spaceship.tile_status.bulkhead
                  flash_tile_if_needed(surface, {cx, cy}, {r = 0, g = 0, b = 1, a = alpha}, 5)
                else
                  -- Floor
                  spaceship.check_tiles[cx][cy] = Spaceship.tile_status.floor
                  flash_tile_if_needed(surface, {cx, cy}, {r = 0, g = 1, b = 0, a = alpha}, 5)
                end
                next_pending_tiles[cx] = next_pending_tiles[cx] or {}
                next_pending_tiles[cx][cy] = true
              else
                spaceship.check_tiles[cx] = spaceship.check_tiles[cx] or {}
                if wall_count > 0 then
                  if clamps > 0 then
                    -- if it is a clamp sticking out of the craft treat it as exterior,
                    -- otherwise it is treated as unstable bulkhead and takes damage
                    spaceship.check_tiles[cx][cy] = Spaceship.tile_status.exterior
                    flash_tile_if_needed(surface, {cx, cy}, {r = 1, g = 0, b = 1, a = alpha}, 5)
                  else
                    -- Wall not on floor
                    spaceship.check_tiles[cx][cy] = Spaceship.tile_status.bulkhead_exterior
                    flash_tile_if_needed(surface, {cx, cy}, {r = 1, g = 0, b = 0, a = alpha}, 5)
                  end
                else
                  -- Empty space just outside the spaceship
                  spaceship.check_tiles[cx][cy] = Spaceship.tile_status.exterior
                  flash_tile_if_needed(surface, {cx, cy}, {r = 1, g = 0, b = 1, a = alpha}, 5)
                end
              end
            end
          end
        end
      end
    end
    if changed == false then
      -- all connected tiles have been found
      -- if in space and if moving detach disconnected tiles
      if spaceship.is_moving then
        local surface = Spaceship.get_own_surface(spaceship)
        if surface then
          local set_tiles = {}
          local all_tiles = surface.find_tiles_filtered{name=Spaceship.names_spaceship_floors}
          for _, tile in pairs(all_tiles) do
            if not (spaceship.check_tiles[tile.position.x] and spaceship.check_tiles[tile.position.x][tile.position.y]) then
              local stack = tile.prototype.items_to_place_this[1]
              table.insert(set_tiles, {name = name_space_tile, position = tile.position, ghost_name = tile.name, stack = stack})
              if player_is_here then
                Spaceship.flash_tile(surface, tile.position, {r = 1, g = 0, b = 0, a = alpha}, 120)
              end
            end
          end
          if next(set_tiles) then
            surface.set_tiles(set_tiles)
            for _, tile in pairs(set_tiles) do
              if Util.table_contains(Spaceship.names_spaceship_floors, tile.ghost_name) then
                surface.create_entity{name = "tile-ghost", inner_name = tile.ghost_name, force = spaceship.force_name, position=tile.position}
              end
            end
          end
        end
      end

      changed = true
      spaceship.check_stage = "containment"
      spaceship.check_message = {"space-exploration.spaceship-check-message-checking-containment"}
      for x, x_tiles in pairs(spaceship.check_tiles) do
        for y, status in pairs(x_tiles) do
          if status == Spaceship.tile_status.exterior
            or status == Spaceship.tile_status.bulkhead_exterior then
            next_pending_tiles[x] = next_pending_tiles[x] or {}
            next_pending_tiles[x][y] = true
          end
        end
      end
    end

  -- containment: For each exterior tile, find floor touching it, and mark it as exterior floor. All floor touching exterior floor is also exterior floor. Fails if the console is on an exterior floor.
  elseif spaceship.check_stage == "containment" then
    for x, x_tiles in pairs(spaceship.pending_tiles) do
      for y, _ in pairs(x_tiles) do
        local value = spaceship.check_tiles[x][y]
        if value == Spaceship.tile_status.exterior
         or value == Spaceship.tile_status.bulkhead_exterior
         or value == Spaceship.tile_status.floor_exterior then
          for cx = x-1, x+1 do -- 8 way direction
            for cy = y-1, y+1 do
              if spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy]
               and spaceship.check_tiles[cx][cy] == Spaceship.tile_status.floor then
                spaceship.check_tiles[cx][cy] = Spaceship.tile_status.floor_exterior
                changed = true
                next_pending_tiles[cx] = next_pending_tiles[cx] or {}
                next_pending_tiles[cx][cy] = true
                flash_tile_if_needed(surface, {cx, cy}, {r = 1, g = 1, b = 0, a = alpha}, 30)
              end
            end
          end
        end
      end
    end
    if changed == false then
      changed = true
      -- convert non-exterior floor to interior
      for x, x_tiles in pairs(spaceship.check_tiles) do
        for y, status in pairs(x_tiles) do
          if status == Spaceship.tile_status.floor then
            spaceship.check_tiles[x][y] = Spaceship.tile_status.floor_interior
            flash_tile_if_needed(surface, {x, y}, {r = 0, g = 0, b = 1, a = alpha}, 40)
          end
        end
      end
      local console_tile_x = math.floor(spaceship.console.position.x)
      local console_tile_y = math.floor(spaceship.console.position.y)
      if spaceship.check_tiles and spaceship.check_tiles[console_tile_x] and spaceship.check_tiles[console_tile_x][console_tile_y] == Spaceship.tile_status.floor_interior then
        spaceship.check_tiles[console_tile_x][console_tile_y] = Spaceship.tile_status.floor_console_connected
        next_pending_tiles[console_tile_x] = {}
        next_pending_tiles[console_tile_x][console_tile_y] = true
        spaceship.check_stage = "console-connectivity"
        spaceship.check_message = {"space-exploration.spaceship-check-message-checking-connectivity"}
      else
        for x, x_tiles in pairs(spaceship.check_tiles) do
          for y, status in pairs(x_tiles) do
            if status == Spaceship.tile_status.exterior
            or status == Spaceship.tile_status.bulkhead_exterior then
              flash_tile_if_needed(surface, {x, y}, {r = 1, g = 0, b = 0, a = alpha}, 120)
            end
          end
        end
        spaceship.integrity_valid = false
        spaceship.check_message =  {"space-exploration.spaceship-check-message-failed-containment"}
        return Spaceship.stop_integrity_check(spaceship)
      end
    end

  -- console-connectivity: There may be several "contained" areas, connected by exterior floor. Mark only the one with the console inside as the spaceship. Also populate check_count_empty_tiles (for corridor integrity bonus later).
  elseif spaceship.check_stage == "console-connectivity" then
    for x, x_tiles in pairs(spaceship.pending_tiles) do
      for y, _ in pairs(x_tiles) do
        local value = spaceship.check_tiles[x][y]
        if value == Spaceship.tile_status.floor_console_connected then
          local blockers = surface.count_entities_filtered{
            position = {x + 0.5, y + 0.5},
            collision_mask = {"object-layer"},
            limit = 1
          }
          if blockers == 0 then -- this tile is clear, add to corridor allowance.
            spaceship.check_count_empty_tiles = (spaceship.check_count_empty_tiles or 0) + 1
          end
        end
        if value == Spaceship.tile_status.floor_console_connected
         or value == Spaceship.tile_status.bulkhead_console_connected then

          for d = 1, 4 do -- 4 way direction
            local cx = x + (d == 2 and 1 or (d == 4 and -1 or 0))
            local cy = y + (d == 1 and -1 or (d == 3 and 1 or 0))
            if spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy] and
              (spaceship.check_tiles[cx][cy] == Spaceship.tile_status.floor_interior or spaceship.check_tiles[cx][cy] == Spaceship.tile_status.bulkhead) then
              if spaceship.check_tiles[cx][cy] == Spaceship.tile_status.floor_interior then
                  spaceship.check_tiles[cx][cy] = Spaceship.tile_status.floor_console_connected
              else
                  spaceship.check_tiles[cx][cy] = Spaceship.tile_status.bulkhead_console_connected
              end
              flash_tile_if_needed(surface, {cx, cy}, {r = 0, g = 1, b = 1, a = alpha}, 5)
              changed = true
              next_pending_tiles[cx] = next_pending_tiles[cx] or {}
              next_pending_tiles[cx][cy] = true
            end
          end
        end
      end
    end
    if changed == false then
      -- completed the check

      spaceship.check_message = nil -- No tooltip required
      spaceship.integrity_valid = true
      local set_tiles = {}
      local reset = false
      for x, x_tiles in pairs(spaceship.check_tiles) do
        for y, status in pairs(x_tiles) do
          if not (status == Spaceship.tile_status.floor_console_connected
              or status == Spaceship.tile_status.bulkhead_console_connected
              or status == Spaceship.tile_status.exterior) then
              spaceship.check_message = {"space-exploration.spaceship-check-message-unstable"}
              if player_is_here then
                Spaceship.flash_tile(surface, {x, y}, {r = 1, g = 0, b = 0, a = alpha}, 120)
              end
              -- detatch
              if Spaceship.is_on_own_surface(spaceship) and spaceship.is_moving then
                local support = 1 -- it will count self
                for cx = x-1, x+1 do
                  for cy = y-1, y+1 do
                    if spaceship.check_tiles[cx] and spaceship.check_tiles[cx][cy] then
                      if spaceship.check_tiles[cx][cy] ~= Spaceship.tile_status.exterior then
                        support = support + 1
                        if spaceship.check_tiles[cx][cy] == Spaceship.bulkhead_console_connected then
                          support = support + 2
                        end
                      end
                    end
                  end
                end
                if support <= 6 then -- has a chance to be removed
                  reset = true
                  if support - math.random(2) <= 4 then
                    local entities = surface.find_entities({{x,y}, {x+1,y+1}})
                    local remove = true
                    for _, entity in pairs(entities) do
                      if entity and entity.valid and entity.type ~= "character" and entity.health then
                        entity.damage(150, "neutral", "explosion")
                        remove = false
                      end
                    end
                    if remove then
                      local tile = surface.get_tile(x,y)
                      table.insert(set_tiles, {name = name_space_tile, ghost_name=tile.name, position = {x,y}})
                    end
                  end
                end
              end
          end
        end
      end
      if next(set_tiles) then
        spaceship.check_message = {"space-exploration.spaceship-check-message-valid-but-disconnecting"}
        surface.print({"space-exploration.spaceship-warning-sections-disconnecting"})
        surface.set_tiles(set_tiles)
        for _, tile in pairs(set_tiles) do
          if Spaceship.names_spaceship_floors_map[tile.ghost_name] then
            surface.create_entity{name = "tile-ghost", inner_name = tile.ghost_name, force = spaceship.force_name, position=tile.position}
          end
        end
      end

      Spaceship.stop_integrity_check(spaceship)

      if reset then
        Spaceship.start_integrity_check(spaceship)
        return
      else
        Spaceship.get_compute_launch_energy(spaceship)
        return
      end
    end

  end

  if changed then
    spaceship.pending_tiles = next_pending_tiles
  else
    spaceship.integrity_valid = false
    spaceship.check_message = {"space-exploration.spaceship-check-message-did-not-complete"}
    return Spaceship.stop_integrity_check(spaceship)
  end
end

function Spaceship.clean_integrity_affecting_tables()
  for ia_idx, ia_name in pairs(Spaceship.integrity_affecting_names) do
    if ia_name.mod ~= nil and not script.active_mods[ia_name.mod] then
      Spaceship.integrity_affecting_names[ia_idx] = nil
    end
  end
  for ia_idx, ia_type in pairs(Spaceship.integrity_affecting_types) do
    if ia_type.mod ~= nil and not script.active_mods[ia_type.mod] then
      Spaceship.integrity_affecting_types[ia_idx] = nil
    end
  end
end

--[[========================================================================================
Blueprinting and copy/pasting settings
]]--

---@param spaceship SpaceshipType?
---@return Tags?
function Spaceship.serialize_from_struct(spaceship)
  if not spaceship then return end

  local tags = {}

  tags.name = spaceship.name

  tags.target_speed_normal = spaceship.target_speed_normal
  tags.target_speed_field = spaceship.target_speed_field
  tags.target_speed_belt = spaceship.target_speed_belt

  return tags
end

---@param entity LuaEntity
---@return Tags?
function Spaceship.serialize(entity)
  return Spaceship.serialize_from_struct(Spaceship.from_entity(entity))
end

---@param entity LuaEntity
---@param tags Tags
function Spaceship.deserialize(entity, tags)
  local spaceship = Spaceship.from_entity(entity)
  if not spaceship then return end

  if tags.name then -- Guard against old blueprints not containing this tag
    spaceship.name = tostring(tags.name)
  end

  spaceship.target_speed_normal = tonumber(tags.target_speed_normal)
  spaceship.target_speed_field = tonumber(tags.target_speed_field)
  spaceship.target_speed_belt = tonumber(tags.target_speed_belt)

end

---@param event EventData.on_player_setup_blueprint
local function on_player_setup_blueprint(event)
  util.setup_blueprint(event, {Spaceship.name_spaceship_console}, Spaceship.serialize)
end
Event.addListener(defines.events.on_player_setup_blueprint, on_player_setup_blueprint)

---@param event EventData.on_entity_settings_pasted
local function on_entity_settings_pasted(event)
  util.settings_pasted(event, {Spaceship.name_spaceship_console}, Spaceship.serialize, Spaceship.deserialize)
end
Event.addListener(defines.events.on_entity_settings_pasted, on_entity_settings_pasted)

--[[========================================================================================
Initialization
]]--

function Spaceship.on_init()
    global.spaceships = {}
    Spaceship.clean_integrity_affecting_tables()
    global.next_spaceship_index = 1
end
Event.addListener("on_init", Spaceship.on_init, true)

function Spaceship.on_load()
  Spaceship.clean_integrity_affecting_tables()
end
Event.addListener("on_load", Spaceship.on_load, true)


return Spaceship
