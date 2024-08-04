local data_util = require ( "data_util" )
-- indentation: 2

local pylons = {
  pylon       = {
    pole = data.raw['electric-pole'][data_util.mod_prefix .. "pylon"]
  },
  pylon_sub   = {
    pole = data.raw['electric-pole'][data_util.mod_prefix .. "pylon-substation"]
  },
  pylon_robo  = {
    pole = data.raw['electric-pole'][data_util.mod_prefix .. "pylon-construction"],
    robo = data.raw.roboport[data_util.mod_prefix .. "pylon-construction-roboport"]
  },
  pylon_radar = {
    pole = data.raw['electric-pole'][data_util.mod_prefix .. "pylon-construction-radar"],
    robo = data.raw.roboport[data_util.mod_prefix .. "pylon-construction-radar-roboport"],
    radar = data.raw.radar[data_util.mod_prefix .. "pylon-construction-radar-radar"]
  }
}

local function pre ( s )
  return "pylon-description." .. s
end
--[[
Needed locale strings:

[pylon-description]
pylon-breakdown=
pylon-pole-description-breakdown=
logistics-range=
construction-range=
link-range=
power-usage=
charging-power=
pylon-description.radar-scan=
pylon-description.radar-sector-scan=
pylon-energy-data=
pylon-energy-data-long=

]]

local function power_to_number ( p )
  local suf = p:match ( '[^%d.]+' ):gsub ( "W", "" )
  local val = tonumber ( p:match ( '[%d.]+' ) )

  return val * ( data_util.char_to_multiplier[suf] or 1 )
end

-- Copied from condenser-turbine.lua
local function trim_zeroes ( number, l )
  local s = string.format ( l and '%.' .. l .. 'f' or  '%f', number )

  --Can this whole loop below be replaced using s:gsub?
  for i = #s, 1, -1 do -- trims zeros
    if tonumber ( s:sub (i, i) ) == 0  or s:sub ( i, i ) == '.' then
      s = s:sub ( 1, -2 )
      if not s:find ( ".", 1, true ) then -- Stop trimming zeroes if there's no more decimal point.
        break
      end
    else
      break
    end
  end
  return s
end

local function number_to_string ( number ) -- is there a paralel in data_util I can use?
  local current_mult = 1
  for m, i in pairs ( data_util.char_to_multiplier ) do
    if i > 1 then -- can't be bothered to figure out how to handle sub 1 atm
      if number / ( i / ( data_util.char_to_multiplier[current_mult] or 1 ) ) > 0.8 then
        number = number / ( i / ( data_util.char_to_multiplier[current_mult] or 1 ) )
        current_mult = m
      else
        break
      end
    end
  end

  local s = trim_zeroes ( number )
  s = string.format ('%s %s', s, type ( current_mult ) == 'string' and current_mult or "" )
  return s
end
-- End copy

local function format_description ( proto )
  local old_desc = proto.pole and ( proto.pole.localised_description or { "entity-description." .. proto.pole.name } )
  local new_desc = { "" }

  if proto.pole then --                                                               wire reach,                     , supply diameter
    table.insert ( new_desc, { pre "pylon-pole-description-breakdown", proto.pole.maximum_wire_distance, proto.pole.supply_area_distance * 2 } )
  end

  local energy_usage = {
    input  = 0,
    drain  = 0,
    --buffer = 0
  }

  local pre_power_desc = { "" }
  local power_desc = { "" }

  if proto.robo then
    --local robo_desc = {pre "pylon-roboport-data", {""}}

    if proto.robo.logistics_radius and proto.robo.logistics_radius > 0 then -- logistic diameter
      table.insert ( pre_power_desc, { pre "logistics-range", proto.robo.logistics_radius * 2 } )
    end

    if proto.robo.construction_radius and proto.robo.construction_radius > 0 then -- construction diameter
      table.insert ( pre_power_desc, { pre "construction-range",   proto.robo.construction_radius * 2 } )
    end

    if proto.robo.charging_offsets and #proto.robo.charging_offsets > 0 then --charging slots      , chgarging energy
      table.insert ( power_desc, { pre "charging-power", #proto.robo.charging_offsets, proto.robo.charging_energy } )
      energy_usage.input  = energy_usage.input + power_to_number ( proto.robo.energy_source.input_flow_limit )
      energy_usage.drain  = energy_usage.drain + power_to_number ( proto.robo.energy_usage )
      --energy_usage.buffer = energy_usage.buffer + proto.robo.energy_source.buffer_capacity
    end

    if proto.robo.logistics_connection_distance then                          -- Roboport link distance
      table.insert ( pre_power_desc, { pre "link-range", proto.robo.logistics_connection_distance } )
    end

    --table.insert (power_desc, robo_desc)
  end

  if proto.radar then
    --local radar_desc = {pre "pylon-radar-data", {""}}

    if proto.radar.max_distance_of_nearby_sector_revealed then
      table.insert ( pre_power_desc, { pre "radar-scan", ( proto.radar.max_distance_of_nearby_sector_revealed * 2 + 1 ) } )
    end

    if proto.radar.max_distance_of_sector_revealed and proto.radar.max_distance_of_sector_revealed > proto.radar.max_distance_of_nearby_sector_revealed then
      table.insert ( pre_power_desc, { pre "radar-sector-scan", ( proto.radar.max_distance_of_sector_revealed * 2 + 1 ) } )
    end

    if proto.radar.energy_usage then
      energy_usage.input  = energy_usage.input + power_to_number ( proto.radar.energy_usage )
      energy_usage.drain  = energy_usage.drain + power_to_number ( proto.radar.energy_usage )
      --energy_usage.buffer = energy_usage.buffer + proto.radar.energy_source.buffer_capacity
    end

    --table.insert (power_desc, radar_desc)
  end


  if energy_usage.drain > 0 then
    energy_usage.desc = { pre "pylon-energy-data", number_to_string ( energy_usage.drain ) }
    if energy_usage.input > energy_usage.drain then
      energy_usage.desc[1] = energy_usage.desc[1] .. "-long"
      table.insert ( energy_usage.desc, number_to_string ( energy_usage.input ) )
    end
    table.insert ( power_desc, energy_usage.desc )
  end

  if #pre_power_desc > 1 then
    table.insert ( new_desc, pre_power_desc )
  end

  if #power_desc > 1 then
    table.insert ( new_desc, { pre "power-usage", power_desc } )
  end

  local desc = {pre  "pylon-breakdown", old_desc, new_desc }
  for _, entity in pairs ( proto ) do
    entity.localised_description = desc
    --log (serpent.block ({name = entity.name, localised_description = entity.localised_description}))
    --log (serpent.block (entity))
  end

end

for _, entity in pairs ( pylons ) do

  format_description ( entity )

end