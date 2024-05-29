-- -- -- Finite oil
local resource_autoplace = require("__core__/lualib/resource-autoplace")

if krastorio.general.getSafeSettingValue("kr-finite-oil") then
  data.raw["mining-drill"]["pumpjack"].energy_usage = "100kW"
  data.raw["mining-drill"]["pumpjack"].mining_speed = 2

  data.raw.resource["crude-oil"].infinite = false
  data.raw.resource["crude-oil"].minimum = 25000
  data.raw.resource["crude-oil"].normal = 100000
  data.raw.resource["crude-oil"].infinite_depletion_amount = 5
  data.raw.resource["crude-oil"].minable = {
    mining_time = 1,
    results = {
      {
        type = "fluid",
        name = "crude-oil",
        amount_min = 20,
        amount_max = 20,
        probability = 1,
      },
    },
  }

  data.raw.resource["crude-oil"].autoplace = resource_autoplace.resource_autoplace_settings({
    name = "crude-oil",
    order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
    base_density = 8.2,
    base_spots_per_km2 = 3.0,
    random_probability = 1 / 48,
    random_spot_size_minimum = 1,
    random_spot_size_maximum = 1, -- don't randomize spot size
    additional_richness = 20000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 1,
  })
else
  data.raw["mining-drill"]["kr-mineral-water-pumpjack"].energy_usage = "100kW"
  data.raw["mining-drill"]["kr-mineral-water-pumpjack"].mining_speed = 2

  data.raw.resource["mineral-water"].infinite = true
  data.raw.resource["mineral-water"].minimum = 60000
  data.raw.resource["mineral-water"].normal = 300000
  data.raw.resource["mineral-water"].infinite_depletion_amount = 10
  data.raw.resource["mineral-water"].minable = {
    mining_time = 1,
    results = {
      {
        type = "fluid",
        name = "mineral-water",
        amount_min = 10,
        amount_max = 10,
        probability = 1,
      },
    },
  }

  -- Copy of the crude oil settings from the base mod
  data.raw.resource["mineral-water"].autoplace = resource_autoplace.resource_autoplace_settings({
    name = "mineral-water",
    order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
    base_density = 8.2,
    base_spots_per_km2 = 1.8,
    random_probability = 1 / 48,
    random_spot_size_minimum = 1,
    random_spot_size_maximum = 1, -- don't randomize spot size
    additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
    has_starting_area_placement = false,
    regular_rq_factor_multiplier = 1,
  })
end
