local data_util = require("data_util")
Shared = require("shared")

collision_mask_util_extended = require("collision-mask-util-extended/data/collision-mask-util-extended")

require("prototypes/phase-multi/no-recycle")

require("prototypes/phase-3/recipe")
require("prototypes/phase-3/entity")

require("prototypes/phase-3/technology")
require("prototypes/phase-3/technology-procedural")

require("prototypes/phase-3/noise-programs")

require("prototypes/phase-3/collision-common")
require("prototypes/phase-3/space-collision")

require("prototypes/phase-3/ruin-remnants")
require("prototypes/phase-3/ruins")

require("prototypes/phase-3/resources")

require("prototypes/phase-3/compatibility/angels")
require("prototypes/phase-3/compatibility/notnotmelon")

require("prototypes/phase-3/character")

require("prototypes/phase-3/energy-shield-equipment")

require("prototypes/phase-3/electric-boiling")

require("prototypes/phase-3/delivery-cannon")
require("prototypes/phase-3/meteor-defence")

require("prototypes/phase-3/space-biochemical")

require("prototypes/phase-3/extra-icon-info")

require("prototypes/phase-multi/item-group-assign")

--require("prototypes/phase-3/compatibility")

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_transfer = "2GW"

for _, fish in pairs(data.raw.fish) do
  if not fish.healing_per_tick then fish.healing_per_tick = 0.01 end
  fish.resistances = data_util.resistances_max(fish.resistances, {{type = "meteor", percent = 100}, {type = "fire", percent = 100}})
end


for _, tree in pairs(data.raw.tree) do
  tree.trigger_target_mask = tree.trigger_target_mask or {}
  table.insert(tree.trigger_target_mask, "flammable")
  table.insert(tree.trigger_target_mask, "tree")
end


-- undo some alien biomes changes, impotant for asteroid decals
data.raw.tile["se-space"].layer = 0
data.raw.tile["se-space"].pollution_absorption_per_second = 0.1
data.raw.tile["se-asteroid"].layer = 5

data.raw.tile["out-of-map"].pollution_absorption_per_second = 0.1

-- Fix water wube transition with asteroid tile
data.raw.tile["water-wube"].draw_in_water_layer = true
-- Let asteroids go over water wube
collision_mask_util_extended.remove_layer(data.raw.tile["water-wube"].collision_mask, "player-layer")


local function find_orphaned_recipes()
  local all_recipes = {}
  for _, recipe in pairs(data.raw.recipe) do
    if (recipe.enabled == false) or
      (recipe.normal and recipe.normal.enabled == false) or
      (recipe.expensive and recipe.expensive.enabled == false) then
      all_recipes[recipe.name] = true
    end
  end
  for _, tech in pairs(data.raw.technology) do
    if tech.effects then
      for _, effect in pairs(tech.effects) do
        if effect.type == "unlock-recipe" and effect.recipe then
          all_recipes[effect.recipe] = nil
        end
      end
    end
  end
  for recipe_name, valid in pairs(all_recipes) do
    log("Orphaned recipe: " .. recipe_name)
  end
end


-- stop rails from being destroyed by meteors and sky beams
for _, rail_type in pairs({"rail-signal", "rail-chain-signal"}) do
  for _, rail in pairs(data.raw[rail_type]) do
    rail.resistances = data_util.resistances_max(rail.resistances, {{type = "meteor", percent = 99.9}, {type = "fire", percent = 100}, {type = "laser", percent = 99}, {type = "explosion", percent = 80}})
  end
end
for _, rail_type in pairs({"straight-rail", "curved-rail"}) do
  for _, rail in pairs(data.raw[rail_type]) do
    rail.selection_priority = 20
    rail.resistances = data_util.resistances_max(rail.resistances, {{type = "meteor", percent = 99.9}, {type = "fire", percent = 100}, {type = "laser", percent = 99}, {type = "explosion", percent = 90}})
    if rail.max_health then rail.max_health = rail.max_health * 4 end
  end
end
for _, type in pairs({"locomotive", "cargo-wagon", "fluid-wagon", "artillery-wagon"}) do
  for _, prototype in pairs(data.raw[type]) do
    prototype.selection_priority = 51
  end
end

-- satellite
data.raw["god-controller"]["default"].item_pickup_distance = 0
data.raw["god-controller"]["default"].loot_pickup_distance = 0
data.raw["god-controller"]["default"].mining_speed = 0.0000001 -- required to remove ghosts but not mine entities.
data.raw["god-controller"]["default"].movement_speed = 1

-- dead
data.raw["spectator-controller"]["default"].movement_speed = 1

-- this won't work, the furnace recipes are hidden
if data.raw["recipe-category"]["recycle"] then
  table.insert(data.raw["assembling-machine"][data_util.mod_prefix .. "recycling-facility"].crafting_categories, "recycle")
end
if data.raw["recipe-category"]["recycle-with-fluids"] then
  table.insert(data.raw["assembling-machine"][data_util.mod_prefix .. "recycling-facility"].crafting_categories, "recycle-with-fluids")
end

-- Copy recipe limitations that were set to modules 1-3 in phase 1, before modules 4-9 were created during phase 2
for i=4,9 do
  data.raw.module["productivity-module-" .. i].limitation = data.raw.module["productivity-module-3"].limitation
  data.raw.module["effectivity-module-" .. i].limitation_blacklist = data.raw.module["effectivity-module-3"].limitation_blacklist
  data.raw.module["effectivity-module-" .. i].limitation_message_key = "efficiency-module-not-allowed"
end

data.raw["item-with-inventory"]["item-with-inventory"].inventory_size = 0

data.raw["map-gen-presets"].default["space-exploration"] = Shared.se_default_mapgen

if data.raw["map-gen-presets"].default and data.raw["map-gen-presets"].default.default then
  data.raw["map-gen-presets"].default.default.order = "a-a"
end

for _, recipe in pairs(data.raw.recipe) do
  for _, rtype in pairs({"normal", "expensive"}) do
    if type(recipe[rtype]) == "table" then
      recipe[rtype].always_show_made_in = not (recipe.category == "crafting" or recipe.category == nil and (recipe[rtype].category == nil or recipe[rtype].category == "crafting"))
    end
  end
  recipe.always_show_made_in = not (recipe.category == "crafting" or recipe.category == nil)
end

--find_orphaned_recipes()

--log( serpent.block( data.raw["assembling-machine"][data_util.mod_prefix .. "spaceship-clamp"], {comment = false, numformat = '%1.8g' } ) )

---- After all SE specific Code, we run what Compatability Code we wish to run. ----
require("prototypes/phase-3/compatibility/krastorio2/krastorio2")
