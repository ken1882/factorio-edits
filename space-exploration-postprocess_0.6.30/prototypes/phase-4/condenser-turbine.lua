local data_util = require ("data_util")

data.raw["fluid"]["se-decompressing-steam"].heat_capacity = data.raw["fluid"]["steam"].heat_capacity

data.raw["generator"]["se-condenser-turbine-generator"].maximum_temperature = 900 -- match the maximal temperature that can actually get into the turbine
data.raw["generator"]["se-condenser-turbine-generator"].max_power_output = data.raw["generator"]["steam-turbine"].max_power_output
data.raw["generator"]["se-condenser-turbine-generator"].fluid_usage_per_tick = data.raw["generator"]["steam-turbine"].fluid_usage_per_tick
data.raw["generator"]["se-condenser-turbine-generator"].fluid_box.minimum_temperature = 100
local steam_energy = data_util.string_to_number (data.raw["fluid"]["se-decompressing-steam"].heat_capacity)

local function trim_zeroes (number, l)
  local s = string.format (l and '%.' .. l .. 'f' or  '%f', number)
  s = "" .. tonumber(s)
  return s
end

local function number_to_string (number) -- is there a paralel in data_util I can use?
  local current_mult = 1
  for m, i in pairs (data_util.char_to_multiplier) do
    if i > 1 then -- can't be bothered to figure out how to handle sub 1 atm
      if number / (i / (data_util.char_to_multiplier[current_mult] or 1)) > 0.8 then
        number = number / (i / (data_util.char_to_multiplier[current_mult] or 1))
        current_mult = m
      else
        break
      end
    end
  end

  local s = trim_zeroes (number, 2)
  s = string.format ('%s%s', s, type (current_mult) == 'string' and current_mult or "")
  return s
end

local function input_output_flow_rates (recipe)
  local recipe = data.raw.recipe[recipe]
  local condenced, input
  local ret = {}
  input = recipe.ingredients[1].amount
  for _, ing in pairs (recipe.results) do
    if ing.name == "se-decompressing-steam" then
      condenced = ing.amount
    else
      ret[ing.name] = {amount = ing.amount}
      if ing.temperature then
        ret[ing.name].temperature = ing.temperature
      end
    end
  end

  ret["steam-in"] = {amount = input}
  for _, ing in pairs (ret) do
    ing.amount = ing.amount / condenced
  end

  return ret
end

local function format_description (name, generator_name, temperatures, recipe) --normal and maximal are the temperatures to generate description for, maximal is optional
  local generator = data.raw.generator[generator_name]
  local furnace = data.raw.furnace[name]
  if not (generator and furnace) then return end

  local old_desc = furnace.localised_description
  local new_desc = {"entity-description.generator-description", old_desc or {"entity-description." .. furnace.name}, {""}}
  temperatures = temperatures and type (temperatures) == 'table' and temperatures or {temperatures} -- accepts both table and single value


  -- INPUT RATES
  local max_temp = 0
  local flow_rate = generator.fluid_usage_per_tick * 60
  if generator.max_power_output then
    local power = generator.fluid_usage_per_tick * (temperatures[1] - 15) * steam_energy * 60               -- use the first entry of the tenperature table, because we want the MIN steam temp for MAX flow rate
    flow_rate = flow_rate * math.min (1, (data_util.string_to_number (generator.max_power_output) / power)) -- reduce flow rate by a factor of the max power consumption
    max_temp = data_util.string_to_number (generator.max_power_output) * (generator.effectivity or 1) / (flow_rate * steam_energy) + 15 -- maximal temperature the generator can accept to maximize it's power, any more will just reduce fluid usage 
  end -- max_temp seems to be imprecise, be careful with that
  local rates = input_output_flow_rates (recipe)
  flow_rate = flow_rate * rates["steam-in"].amount -- correction factor for increased consumption of steam compared to condenced steam
  --log ("input = " .. flow_rate)
  local temp_list = {}
  if #temperatures == 1 then
    temp_list = {"format-degrees-c-compact", temperatures[1]}
  else
    temp_list = {"", {"format-degrees-c-compact", temperatures[1]}, " - ", {"format-degrees-c-compact", temperatures[#temperatures]}}
  end
  table.insert (new_desc[3], {'entity-description.generator-consumes', trim_zeroes (flow_rate, 3), data.raw.fluid.steam.localised_name or {'fluid-name.steam'}, #temperatures, temp_list})


  -- POWER
  table.insert (new_desc[3], 
    {"entity-description.generator-production",
    #temperatures
    }
  ) -- Power output: Variable/Fixed (color and font formatting included)
  local real_flow_rate = flow_rate
  local max_real_flow_rate = 0
  local max_power = generator.max_power_output and data_util.string_to_number (generator.max_power_output) or nil
  --log ("max power = " .. max_power)
  if generator.effectivity and max_power then
    max_power = max_power / generator.effectivity
  end
  for _, temperature in pairs (temperatures) do
    max_temp = math.floor (max_temp) + (max_temp * 2) % 2 -- if it's just under the number, the mod should be 1, which will even out the math floor.
    --log (temperature .. ", " .. max_temp)
    local final = false
    --max_temp seems to be imprecise, so some rounding is needed to make sure it doesn't use more lines than necsesary
    if max_temp > 0 and temperature >= max_temp then   -- we reached the max temperature, time to abort
      if temperature > (max_temp + 10) then            -- if temperaure is greated than max_temp, final is 2, else it's 1
        final = 2
      else
        final = 1
      end
      temperature = max_temp
    end



    --if not final then 
      local power = generator.fluid_usage_per_tick * (temperature - 15) * steam_energy * 60 -- formula to get generated power out of flow rate, temperature and steam power density
      --log ("power = " .. power)
      if max_power then
        local test_flow_rate = real_flow_rate * (math.min (power, max_power) / power)       -- if power is lower, it'll be x/x
        real_flow_rate = math.min (real_flow_rate, test_flow_rate)
        power = math.min (power, max_power)
      end -- cap at generator max power
      max_real_flow_rate = math.max (max_real_flow_rate, real_flow_rate)                  -- this should fix efficiency calc if the min temperature is already capped
      if generator.effectivity then
        power = power * generator.effectivity
      end -- some weird mental gymnastics to calculate effectivity even for generators with different max power and actual max power due to flow rates?
          -- divide the max power (if any) by effectivity, do the math min check, then multiply by it to reverse
      --log ("power = " .. power)
      power = number_to_string (power)

      --log ("power = " .. power)
      table.insert (new_desc[3], {'entity-description.power-temperature-relation', power, math.ceil(temperature), data.raw.fluid.steam.localised_name or {'fluid-name.steam'}})
    --end

    -- if the current temperature is equal to the max_temp, and there is no more entries in the temperature table, 
    -- then it means that this is the last temperature needed to be written, and there's no need for the final note.
    --if final then log (final .. ", " .. serpent.block ({next (temperatures, _)})) end
    if final and (next (temperatures, _) or final == 2) then 
      table.insert (new_desc[3], {'entity-description.max-flow-reached', data.raw.fluid.steam.localised_name or {'fluid-name.steam'}})
      break
    end
  end


  -- EFFECTIVITY
  --log ("effectivity = " .. max_real_flow_rate .. ", " .. flow_rate)
  local effectivity = generator.fluid_usage_per_tick * 60 * max_real_flow_rate / flow_rate^2 
  if generator.effectivity then
    effectivity = effectivity * generator.effectivity
  end

  if effectivity ~= 1 then
    table.insert (new_desc[3], {'entity-description.generator-effectivity', effectivity * 100})
  end


  -- OUTPUT RATES
  table.insert (new_desc[3], {'entity-description.generator-outputs'}) -- should I have it do plurality veriaty?
  local table_size = 0
  for fluid, rate in pairs (rates) do
    if fluid ~= "se-decompressing-steam" and fluid ~= "steam-in" then
      local fluid_name = data.raw.fluid[fluid].localised_name or {'fluid-name.' .. fluid}
      --log ("output = " .. math.min (rate.amount * flow_rate / rates["steam-in"].amount))
      local fluid_amount = trim_zeroes(rate.amount * flow_rate / rates["steam-in"].amount, 3) -- 3 decimal places
      if rate.temperature then
        fluid_name = {"", fluid_name, " (", {"format-degrees-c-compact", rate.temperature}, ")"}
      end
      table_size = table_size + 1
      table.insert (new_desc[3], {'entity-description.generator-output', fluid_name, fluid_amount})
    end
  end


  --final note
  table.insert (new_desc[3], {'entity-description.generator-warning', table_size})

  --log ("Turbine description test:\n" .. serpent.block ({new_desc}))
  furnace.localised_description = new_desc
end

-- FIX HOT STEAM RECIPE OUTPUT RATIO
-- Plan: check the amount of energy in hot and cold steam normally, get the ratio
-- Use the ratio to get the correct amount of steam to use with the updated cold steam temperature and termal energy
if data.raw["generator"]["steam-turbine"].maximum_temperature ~= 500 or steam_energy ~= 200 then -- no need to check anthing if those two values are vanilla
  local hot_steam_recipe = data.raw.recipe["se-big-turbine-internal"]
  local ind = {}
  for i, ing in pairs (hot_steam_recipe.results) do
    ind[ing.name] = i
  end
  local old_steam_energy_ratio = hot_steam_recipe.results[ind["steam"]].amount * 200 * 500 / (hot_steam_recipe.ingredients[1].amount * 200 * 5000) -- cold steam / hot steam
  -- X * Y / Z = A / B
  -- X = A/B * Z/Y
  local cold_steam_new_amount  = old_steam_energy_ratio * hot_steam_recipe.ingredients[1].amount * steam_energy * 5000 / (steam_energy * data.raw["generator"]["steam-turbine"].maximum_temperature)
  cold_steam_new_amount        = math.floor (cold_steam_new_amount) -- can be set to math.floor instead, potentially
  --log ('test ' .. cold_steam_new_amount)
  hot_steam_recipe.results[ind['water']].amount       = hot_steam_recipe.results[ind['water']].amount + (hot_steam_recipe.results[ind['steam']].amount - cold_steam_new_amount) -- add the old/new diff to the water amount
  hot_steam_recipe.results[ind['steam']].amount       = cold_steam_new_amount
  hot_steam_recipe.results[ind['steam']].temperature  = data.raw["generator"]["steam-turbine"].maximum_temperature
end

format_description("se-condenser-turbine", "se-condenser-turbine-generator",
  {
    data.raw["generator"]["steam-engine"].maximum_temperature,
    data.raw["generator"]["steam-turbine"].maximum_temperature,
    data.raw["generator"]["se-condenser-turbine-generator"].maximum_temperature
  },
  "se-condenser-turbine-reclaim-water-100-165"
)
format_description("se-big-turbine", "se-big-turbine-generator-NW",
  data.raw["generator"]["se-big-turbine-generator-NW"].maximum_temperature,
  "se-big-turbine-internal"
)

if mods["Krastorio2"] then
  format_description(
    "se-kr-advanced-condenser-turbine",
    "se-kr-advanced-condenser-turbine-generator",
    {
      data.raw.generator["se-kr-advanced-condenser-turbine-generator"].fluid_box.minimum_temperature, -- should be 950
      1375,
      data.raw.generator["se-kr-advanced-condenser-turbine-generator"].maximum_temperature -- should be 1625
    },
    "se-kr-advanced-condenser-turbine-reclaim-water-951-1000"
  )
end

--log ("steam recipe test:\n" .. serpent.block (data.raw.recipe["se-big-turbine-internal"]))
