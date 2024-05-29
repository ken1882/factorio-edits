local Log = {}

Log.debug_prints = is_debug_mode -- does debug_log() do game.print()?
Log.debug_logs = is_debug_mode -- does debug_log() do log()?
Log.print_tags = false -- are tags printed as well with any other print?
Log.debug_big_logs = false -- the big file oututs (astro)

--Array of strings for white/black list logging based on tags
--tags auto populate with source filename, function name, and event name
--for a set of message tags to pass the filter, one tag must exist in the tag_whitelist (if not empty) and no tag may exist in the tag_blacklist
--ex. {"zone.lua", "on_tick"}
Log.tag_whitelist = {}
Log.tag_blacklist = {}

Log.event_name_map = {} --used to map uint `event.name` to a human readable string
for name, id in pairs(defines.events) do
  Log.event_name_map[id] = name
end

---logs a message to the factorio log file
---@param message? string|number|boolean|table message to log
---@param tags? string|string[] string or array of strings to be checked against white/black list
function Log.debug_log(message, tags)
  if (not Log.debug_logs) or script.level.is_simulation then return end
  if not Log.check_tags(tags) then return end
  if type(message) == "number" or type(message) == "boolean" or type(message) == "nil" then
    message = tostring(message)
  elseif type(message) == "table" then
    message = serpent.line(message)
  end
  log("Debug: "..message)
  if Log.debug_prints and game then game.print(message) end
end
Log.log = Log.debug_log --aliases
Log.debug = Log.debug_log

---assert condition is true else print an error. DOES NOT HALT!!
---@param condition boolean condition that will cause failure if false
---@param message? string error message to be printed
function Log.assert(condition, message)
  if condition then return end
  if __DebugAdapter then __DebugAdapter.breakpoint("Assertion failed!") end -- cause a debugger breakpoint
  local msg = "Assertion failed!"
  log(msg) if game then game.print(msg) end
  if type(message) == "string" then
    msg = message
    log(msg) if game then game.print(msg) end
  end
end

---Used internally to auto generate tags and check against white/black list
---@param tags? string|string[] array of tags to be checked against white/black list
---@return boolean allowed if the tags pass the white/black list
function Log.check_tags(tags)
  --populate tags table
  tags = tags or {}
  if type(tags) == "string" then tags = {tags} end

  --check if tag is white/black listed
  local found = next(Log.tag_whitelist) == nil
  for _, tag in pairs(tags) do
    if not found and Util.table_contains(Log.tag_whitelist, tag) then
      found = true
    end
    if Util.table_contains(Log.tag_blacklist, tag) then
      return false
    end
  end
  if found and Log.print_tags then game.print("⬐ tags: "..serpent.line(tags)) end
  return found
end

---Dumps the entire Lua variable environment to a file
function Log.dump_env()
  local msg = "dumping environment..."
  log(msg)
  game.print(msg)

  game.write_file("space-exploration.environment.lua", serpent.dump(_ENV, {comment=false, sparse=true, indent = "\t", nocode=true, name="_ENV"}), false)

  local msg = "finished dumping environment."
  log(msg)
  game.print(msg)
end

function Log.log_global()
  game.write_file("space-exploration.global.lua", serpent.dump(global, {comment=false, sparse=true, indent = "\t", nocode=true, name="global"}), false)
end

function Log.log_universe()
  game.write_file("space-exploration.universe.lua", serpent.dump(global.universe, {comment=false, sparse=true, indent = "\t", nocode=true, name="universe"}), false)
end

function Log.log_spaceships()
  game.write_file("space-exploration.spaceships.lua", serpent.dump(global.spaceships, {comment=false, sparse=true, indent = "\t", nocode=true, name="spaceships"}), false)
end

function Log.log_universe_simplified()
  local string = ""
  for s, star in pairs(global.universe.stars) do
    string = string .. star.name .. " ("..star.stellar_position.x.." "..star.stellar_position.y..")\n"
    for p, planet in pairs(star.children) do
      if planet.orbit then
        string = string .. star.name .. " > "..planet.name ..": ".. (planet.resources and Util.values_to_string(planet.resources) or "")..
          ". Orbit: "..(planet.orbit.resources and Util.values_to_string(planet.orbit.resources) or "") .."\n"
      else
        string = string .. star.name .. " > "..planet.name ..": ".. (planet.resources and Util.values_to_string(planet.resources) or "") .."\n"
      end
      if planet.children then
        for m, moon in pairs(planet.children) do
          string = string .. star.name .. " > "..planet.name .. " > "..moon.name  ..": ".. (moon.resources and Util.values_to_string(moon.resources) or "") ..
           ". Orbit: "..(moon.orbit.resources and Util.values_to_string(moon.orbit.resources) or "") .."\n"
        end
      end
    end
  end
  for z, zone in pairs(global.universe.space_zones) do
    string = string .. zone.name .. " ("..zone.stellar_position.x.." "..zone.stellar_position.y..") "..(zone.resources and Util.values_to_string(zone.resources) or "").."\n"
  end
  game.write_file("space-exploration.universe_simplified.lua", string, false)
end

function Log.log_forces()
  game.write_file("space-exploration.forces.lua", serpent.dump(global.forces, {comment=false, sparse=true, indent = "\t", nocode=true, name="forces"}), false)
end

function Log.log_map_gen()
  local map_gens = {}
  for surface_name, surface in pairs(game.surfaces) do
    map_gens[surface_name] = surface.map_gen_settings
  end
  game.write_file("space-exploration.map_gen.lua", serpent.dump(map_gens, {comment=false, sparse=true, indent = "\t", nocode=true, name="map_gens"}), false)
end

return Log
