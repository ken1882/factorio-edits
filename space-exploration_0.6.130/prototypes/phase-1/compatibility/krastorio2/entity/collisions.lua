local data_util = require("data_util")

-- Whitelist K2 entities for use in Space

local allow_in_space = {
  ["accumulator"] = {
    "kr-energy-storage",
    "kr-intergalactic-transceiver",
  },
  ["assembling-machine"] = {
    "kr-fuel-refinery",
    "kr-electrolysis-plant",
    "kr-matter-plant",
    "kr-matter-assembler",
  },
  ["beacon"] = {
    "kr-singularity-beacon",
  },
  ["burner-generator"] = {
      "kr-antimatter-reactor",
  },
  ["container"] = {
    "kr-medium-container",
    "kr-big-container",
  },
  ["electric-energy-interface"] = {
    "kr-tesla-coil",
  },
  ["furnace"] = {
    "kr-stabilizer-charging-station",
  },
  ["inserter"] = {
    "kr-superior-inserter",
    "kr-superior-long-inserter",
    "kr-superior-filter-inserter",
    "kr-superior-long-filter-inserter",
    "kr-superior-long-filter-inserter",
  },
  ["lab"] = {
    "biusart-lab",
    "kr-singularity-lab",
  },
  ["logistic-container"] = {
    "kr-medium-active-provider-container",
    "kr-medium-buffer-container",
    "kr-medium-passive-provider-container",
    "kr-medium-requester-container",
    "kr-medium-storage-container",

    "kr-big-active-provider-container",
    "kr-big-buffer-container",
    "kr-big-passive-provider-container",
    "kr-big-requester-container",
    "kr-big-storage-container",
  },
  ["mining-drill"] = {
    "kr-quarry-drill",
  },
  ["radar"] = {
    "kr-sentinel",
  },
  ["solar-panel"] = {
    "kr-advanced-solar-panel",
  },
  ["storage-tank"] = {
    "kr-fluid-storage-1",
    "kr-fluid-storage-2",
  },
}

for category_name, entities in pairs(allow_in_space) do
  for _, entity_name in pairs(entities) do
    local entity = data.raw[category_name][entity_name]
    if entity then
      --log("Entity Exists: " .. entity_name)
      entity.se_allow_in_space = true
    else
      --log("Entity Not Exisiting: " .. entity_name)
    end
  end
end

-- Blacklist K2 entities from use in Space
local krastorio_entities_to_add = {
  ["assembling-machine"] = {
    "kr-advanced-furnace",
    "kr-electrolysis-plant",
    "kr-filtration-plant",
    --"kr-air-filter", -- added later?
  },
  -- ["boiler"] = {
  --   "se-electric-boiler", -- added later, also should be done by SE
  -- },
  ["generator"] = {
    "kr-advanced-steam-turbine",
  },
  ["furnace"] = {
    "kr-crusher",
    "kr-air-purifier",
  },
  ["loader-1x1"] = {
    "kr-loader",
    "kr-fast-loader",
    "kr-express-loader",
    "kr-advanced-loader",
    "kr-superior-loader",
  },
  ["electric-energy-interface"] = {
    "kr-wind-turbine",
  },
}

-- Add appropriate collision masks for the Intergalactic Transciever entities
for _, prototype in pairs({
  data.raw["accumulator"]["kr-intergalactic-transceiver"],
  data.raw["electric-energy-interface"]["kr-activated-intergalactic-transceiver"]}) do
  if not prototype.collision_mask then
    prototype.collision_mask = {"item-layer","object-layer","player-layer","water-tile"}
  end
  if not data_util.table_contains(prototype.collision_mask, spaceship_collision_layer) then
    table.insert(prototype.collision_mask, spaceship_collision_layer)
  end
end