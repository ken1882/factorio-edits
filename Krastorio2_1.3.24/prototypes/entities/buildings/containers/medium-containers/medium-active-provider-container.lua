local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

local _medium_containers = "containers/medium-containers/"
local _specific = "medium-active-provider-container/"
local _icon_path = kr_entities_icons_path .. _medium_containers
local _sprites_path = kr_entities_path .. _medium_containers .. _specific

if krastorio.general.getSafeSettingValue("kr-containers") then
  data:extend({
    {
      type = "logistic-container",
      name = "kr-medium-active-provider-container",
      icon = _icon_path .. "medium-active-provider-container.png",
      icon_size = 64,
      icon_mipmaps = 4,
      flags = { "placeable-player", "player-creation", "not-rotatable" },
      minable = { mining_time = 0.5, result = "kr-medium-active-provider-container" },
      max_health = 500,
      corpse = "big-remnants",
      collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
      selection_box = { { -1, -1 }, { 1, 1 } },
      damaged_trigger_effect = hit_effects.entity(),
      resistances = {
        { type = "physical", percent = 30 },
        { type = "fire", percent = 50 },
        { type = "impact", percent = 50 },
      },
      fast_replaceable_group = "container",
      inventory_size = 120,
      scale_info_icons = kr_icons_size,
      logistic_mode = "active-provider",
      vehicle_impact_sound = sounds.generic_impact,
      opened_duration = logistic_chest_opened_duration,
      animation = {
        filename = _sprites_path .. "medium-active-provider-container.png",
        priority = "extra-high",
        width = 85,
        height = 85,
        frame_count = 6,
        hr_version = {
          filename = _sprites_path .. "hr-medium-active-provider-container.png",
          priority = "extra-high",
          width = 340,
          height = 340,
          frame_count = 6,
          line_length = 3,
          scale = 0.25,
        },
      },
      circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
      circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
    },
  })
end
