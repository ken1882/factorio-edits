local Shared = {}
-- used in data phase and control

Shared.spaceship_victory_speed = 250
Shared.spaceship_victory_duration = 600
Shared.spaceship_victory_size = 2500

Shared.resources_with_shared_controls = {
 ["lithia-water"] = true, --uses ground-water
}

Shared.tesla_ammo_category = "tesla"
Shared.tesla_beam_flat_damage = 50
Shared.tesla_base_damage = 60

Shared.cargo_rocket_launch_pad_tank_nonbuffer = 10000
Shared.cargo_rocket_launch_pad_tank_buffer = 1000

Shared.dummy_migration_recipe_prefix = "dummy-migration-recipe-"

Shared.se_default_mapgen = {
    order = "a",
    basic_settings = {
      water = 1.5, -- Water "coverage"
      autoplace_controls = {
        -- Nauvis climate
        hot = {size = 0.5},
        cold = {size = 0.5},
        -- Un-checks SE resources in the mapgen UI. SE resources are removed later anyway regardless of this,
        -- but it's a good visual indicator that these settings don't do anything.
        ["se-beryllium-ore"] = {size = 0},
        ["se-cryonite"] = {size = 0},
        ["se-holmium-ore"] = {size = 0},
        ["se-iridium-ore"] = {size = 0},
        ["se-methane-ice"] = {size = 0},
        ["se-naquium-ore"] = {size = 0},
        ["se-vitamelange"] = {size = 0},
        ["se-vulcanite"] = {size = 0},
        ["se-water-ice"] = {size = 0}
      },
      property_expression_names = {
        -- More Nauvis climate
        ["control-setting:moisture:bias"] = 0.05,
        ["control-setting:aux:bias"] = -0.35
      },
      starting_area = 2,
    },
    advanced_settings = {
      enemy_evolution =
      {
        time_factor =       0.0000005,
        destroy_factor =    0.0005,
        pollution_factor =  0.00000025
      },
      pollution =
      {
        ageing = 1,
        enemy_attack_pollution_consumption_modifier = 0.5
      },
    },
  }

return Shared
