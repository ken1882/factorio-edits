local data_util = require("data_util")

local all_prerequisites_cache = {}

local function get_all_prerequisites(tech_name)
  -- cache to give this code a reasonable runtime
  if all_prerequisites_cache[tech_name] then return all_prerequisites_cache[tech_name] end
  all_prerequisites_cache[tech_name] = {}

  local cache_value = {}
  local technology = data.raw.technology[tech_name]
  if technology and technology.prerequisites then
    for _, own_prerequisite in pairs(technology.prerequisites) do
      for pre_prerequisite, _ in pairs(get_all_prerequisites(own_prerequisite)) do
        cache_value[pre_prerequisite] = true
      end
      cache_value[own_prerequisite] = true
    end
  end
  all_prerequisites_cache[tech_name] = cache_value
  return cache_value
end

local function get_all_required_ingredients(tech_name)
  local technology = data.raw.technology[tech_name]
  local ingredients = {}
  if technology and technology.effects then
    for _, effect in pairs(technology.effects) do
      if effect.type == "unlock-recipe" then
        local recipe = data.raw.recipe[effect.recipe]
        if recipe and recipe.ingredients then
          for _, ingredient in pairs(recipe.ingredients) do
            local name = ingredient.name or ingredient[1]
            ingredients[name] = true
          end
        end
      end
    end
  end
  return ingredients
end

local unlocked_ingredients_cache = {}

local function get_all_unlocked_ingredients(tech_name)
  -- cache to give this code a reasonable runtime
  if unlocked_ingredients_cache[tech_name] then return unlocked_ingredients_cache[tech_name] end

  local technology = data.raw.technology[tech_name]
  local ingredients = {}
  if technology and technology.effects then
    for _, effect in pairs(technology.effects) do
      if effect.type == "unlock-recipe" then
        local recipe = data.raw.recipe[effect.recipe]
        local result = (recipe and recipe.result) or (recipe and recipe.normal and recipe.normal.result)
        local results = (recipe and recipe.results) or (recipe and recipe.normal and recipe.normal.results)
        if result then
          local name = result
          if type(name) == "table" then
            name = result[1] or result.name
          end
          ingredients[name] = true
        elseif results and results[1] then
          local name = results[1][1] or results[1].name
          ingredients[name] = true
        end
      end
    end
    if technology and technology.prerequisites then
      for _, own_prerequisite in pairs(technology.prerequisites) do
        local unlocked_ingredients = get_all_unlocked_ingredients(own_prerequisite)
        for unlocked_ingredient, _ in pairs(unlocked_ingredients) do
          ingredients[unlocked_ingredient] = true
        end
      end
    end
  end
  unlocked_ingredients_cache[tech_name] = ingredients
  return ingredients
end

-- Prune tech tree of redundant prerequisites
for tech_name, technology in pairs(data.raw.technology) do
  local own_prerequisites = technology.prerequisites
  if own_prerequisites then
    local pre_prerequisites = {}
    for _, own_prerequisite in pairs(own_prerequisites) do
      for pre_prerequisite, _ in pairs(get_all_prerequisites(own_prerequisite)) do
        pre_prerequisites[pre_prerequisite] = true
      end
    end
    for i=#own_prerequisites,1,-1 do
      if pre_prerequisites[own_prerequisites[i]] then
        if is_debug_mode and false then
          log("TECH DUPLICATE PREREQUISITE WARNING: " .. tech_name .. " directly requires " .. own_prerequisites[i] .. " but already requires it through another tech.")
        end
        table.remove(own_prerequisites, i)
      end
    end
  end
end

function compatibility_name(name)
  local map_tech_ingredient_to_unlock_tech = {
    {"advanced-tech-card", "kr-advanced-tech-card"},
    {"matter-tech-card", "kr-matter-tech-card"},
    {"singularity-tech-card", "kr-singularity-tech-card"},
  }

  for _, mapping in pairs(map_tech_ingredient_to_unlock_tech) do
    if data_util.table_contains(mapping,name) then
      return mapping[2]
    end
  end

  return name
end


-- DEBUG LOGS: Finding technologies with missing pre-requisites
-- Fix them in SE's phase-3/technology.lua
if is_debug_mode and false then

  local unlocked_by_default = {"iron-ore", "copper-ore", "stone", "coal", "uranium", "se-water-ice", "se-methane-ice", "iron-plate", "copper-plate", "stone-tablet", "stone-brick", "wood", "steam", "water", "uranium", "raw-fish", "iron-gear-wheel", "iron-stick", "copper-cable", "motor"}

  -- For each science pack, check that the tech implicitly requires it (except automation, it has no tech)
  for tech_name, technology in pairs(data.raw.technology) do
    local all_prerequisites = get_all_prerequisites(tech_name)
    for _, ingredient in pairs(technology.unit.ingredients) do
      local ingredient_name = ingredient.name or ingredient[1]
      ingredient_name = compatibility_name(ingredient_name)
      if ingredient_name ~= "automation-science-pack" and ingredient_name ~= "basic-tech-card" and not all_prerequisites[ingredient_name] then
        log("TECH PREREQUISITE WARNING: " .. tech_name .. " needs " .. ingredient_name .. " but does not depend on its tech! - " .." All prerequisites: " .. serpent.line(all_prerequisites))
      end
    end
    local required_ingredients = get_all_required_ingredients(tech_name)
    local required_str = ""
    for ingredient, flag in pairs(required_ingredients) do
      if flag then
        required_str = required_str .. " " .. ingredient
      end
    end
    local unlocked_ingredients = {}
    for prerequisite_name, _ in pairs(all_prerequisites) do
      local prerequisite_unlocked_ingredients = get_all_unlocked_ingredients(prerequisite_name)
      for ingredient, _ in pairs(prerequisite_unlocked_ingredients) do
        required_ingredients[ingredient] = false
        unlocked_ingredients[ingredient] = true
      end
    end
    for _, ingredient in pairs(unlocked_by_default) do
      required_ingredients[ingredient] = false
    end
    local missing_str = ""
    for ingredient, flag in pairs(required_ingredients) do
      if flag then
        missing_str = missing_str .. " " .. ingredient
      end
    end
    local unlocked_str = ""
    for ingredient, flag in pairs(unlocked_ingredients) do
      if flag then
        unlocked_str = unlocked_str .. " " .. ingredient
      end
    end
    if missing_str ~= "" then
      log("TECH INGREDIENT WARNING: " .. tech_name .. " is missing " .. missing_str .. " out of its required " .. required_str .. " and what is available so far is " .. unlocked_str)
    end
  end

  log("TECH DEBUG DIAGNOSTIC COMPLETE")
end
