local data_util = require("data_util")

--[[
if data.raw.technology["automation-science-pack"] then
  data.raw.technology["automation-science-pack"].icon = "__space-exploration-graphics__/graphics/technology/beaker/red.png"
  data.raw.technology["automation-science-pack"].icon_size = 128
end
]]

se_utility_science_pack_recipe_override()
se_production_science_pack_recipe_override()

data.raw.item["satellite"].rocket_launch_product = { data_util.mod_prefix .. "satellite-telemetry", 100}
--data.raw.technology["space-science-pack"].prerequisites = {data_util.mod_prefix .."space-science-lab"}
--data.raw.recipe["space-science-pack"].category = "space-manufacturing" -- must be made in space.
data.raw.item["satellite"].subgroup = "rocket-logistics"
data.raw.item["satellite"].order = "a-a-b"
data.raw.tool["space-science-pack"].stack_size = 200

-- Rocket fuel is one of the critical items in SE. It needs to have the same energy and stack size. (For space capsule update and general logistics).
data.raw.item["rocket-fuel"].fuel_value = "100MJ"
data.raw.item["rocket-fuel"].stack_size = 10

local excluded_labs = {data_util.mod_prefix.."space-science-lab"}
-- Exclude the K2 Singularity Lab as it is an upgrade to the SE Space Science Lab
if mods["Krastorio2"] then
  table.insert(excluded_labs,"kr-singularity-lab")
end

for _, lab in pairs(data.raw.lab) do
  if lab.inputs and not data_util.table_contains(excluded_labs, lab.name) then
    for _, input in pairs(lab.inputs) do
      if not (string.find(input, "module", 1, true) or string.find(input, "circuit-board", 1, true)) then
        if not data_util.table_contains(data.raw.lab[data_util.mod_prefix.."space-science-lab"].inputs, input) then
          table.insert(data.raw.lab[data_util.mod_prefix.."space-science-lab"].inputs, input)
        end
      end
    end
  end
end

data_util.tech_add_ingredients(data_util.mod_prefix .."deep-space-science-pack-1", {
  data_util.mod_prefix .. "material-science-pack-4",
  data_util.mod_prefix .. "energy-science-pack-4",
  data_util.mod_prefix .. "astronomic-science-pack-4"}) -- people can remove bio if desired.

data_util.tech_add_ingredients_with_prerequisites("speed-module-5", { data_util.mod_prefix .. "material-science-pack-1"})
data_util.tech_add_ingredients_with_prerequisites("speed-module-6", { data_util.mod_prefix .. "material-science-pack-2"})
data_util.tech_add_ingredients_with_prerequisites("speed-module-7", { data_util.mod_prefix .. "material-science-pack-3"})
data_util.tech_add_ingredients_with_prerequisites("speed-module-8", { data_util.mod_prefix .. "material-science-pack-4"})
data_util.tech_add_ingredients_with_prerequisites("speed-module-9", { data_util.mod_prefix .. "deep-space-science-pack-1"})

data_util.tech_add_ingredients_with_prerequisites("effectivity-module-5", { data_util.mod_prefix .. "energy-science-pack-1"})
data_util.tech_add_ingredients_with_prerequisites("effectivity-module-6", { data_util.mod_prefix .. "energy-science-pack-2"})
data_util.tech_add_ingredients_with_prerequisites("effectivity-module-7", { data_util.mod_prefix .. "energy-science-pack-3"})
data_util.tech_add_ingredients_with_prerequisites("effectivity-module-8", { data_util.mod_prefix .. "energy-science-pack-4"})
data_util.tech_add_ingredients_with_prerequisites("effectivity-module-9", { data_util.mod_prefix .. "deep-space-science-pack-1"})

data_util.tech_add_ingredients_with_prerequisites("productivity-module-5", { data_util.mod_prefix .. "biological-science-pack-1"})
data_util.tech_add_ingredients_with_prerequisites("productivity-module-6", { data_util.mod_prefix .. "biological-science-pack-2"})
data_util.tech_add_ingredients_with_prerequisites("productivity-module-7", { data_util.mod_prefix .. "biological-science-pack-3"})
data_util.tech_add_ingredients_with_prerequisites("productivity-module-8", { data_util.mod_prefix .. "biological-science-pack-4"})
data_util.tech_add_ingredients_with_prerequisites("productivity-module-9", { data_util.mod_prefix .. "deep-space-science-pack-1"})

data.raw.capsule["raw-fish"].capsule_action = {
  attack_parameters = {
    ammo_category = "capsule",
    ammo_type = {
      action = {
        action_delivery = {
          target_effects = {
            damage = {
              amount = 5,
              type = "poison"
            },
            type = "damage"
          },
          type = "instant"
        },
        type = "direct"
      },
      category = "capsule",
      target_type = "position"
    },
    cooldown = 60,
    range = 0,
    type = "projectile"
  },
  type = "use-on-self"
}

-- please stop the space fish
for _, fish in pairs(data.raw.fish) do
  if not string.find(fish.name, "space", 1, true) then
    if not fish.collision_mask then
      fish.collision_mask = { "ground-tile"}
    end
    table.insert(fish.collision_mask, space_collision_layer)
  end
end

for _, car in pairs(data.raw.car) do
  if car.selection_priority == nil or car.selection_priority == 50 then
    car.selection_priority = 51
  end
end

for _, spidertron in pairs(data.raw["spider-vehicle"]) do
  if spidertron.selection_priority == nil or spidertron.selection_priority == 51 then
    spidertron.selection_priority = 52
  end
end
