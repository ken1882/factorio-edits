-- This source is dedicated to balancing Power production and distribution in SE and K2

-- fix power progression
-- higher tech means more power density
-- more complicated setups mean higher energy efficiency (closer to 1).
-- simpler setups mean reduced energy efficiency.

-- fuild isothermic generator is 0.75 normally
-- both convert fuel to energy directly so shouldn't be over 80% efficiency.
-- fuild isothermic generator is less space efficient.
data.raw["generator"]["kr-gas-power-station"].energy_source.effectivity = 0.75
data.raw["generator"]["kr-gas-power-station"].collsion_mask = --land
  {"item-layer","object-layer","player-layer","water-tile",space_collision_layer, spaceship_collision_layer}
data.raw["generator"]["se-fluid-burner-generator"].collsion_mask = --space
  {"water-tile","ground-tile","item-layer","object-layer","player-layer"}

-- Rebalancing the K2 Fusion Reactor
data.raw["generator"]["kr-advanced-steam-turbine"].maximum_temperature = 1625
data.raw["generator"]["kr-advanced-steam-turbine"].max_power_output = "100MW"
data.raw["generator"]["kr-advanced-steam-turbine"].effectivity = 1
-- 1045/300 to get the correct consumption of 209/s of steam to make 100MW at 975C in the Factorio Engine.
data.raw["generator"]["kr-advanced-steam-turbine"].fluid_usage_per_tick = 209/60

-- Improve Energy Storage entity to account for now being the final accumulator
if data.raw.accumulator["kr-energy-storage"] then
	local accu = data.raw.accumulator["kr-energy-storage"]
	-- Pretty sure this might be OP, but hey, we're at DSS3 here.
	accu.energy_source = {
		type = "electric",
		buffer_capacity = "5000MJ",
		usage_priority = "tertiary",
		input_flow_limit = "10MW",
		output_flow_limit = "50MW"
	}
end

-- Adjust prototypes so that Flat Solar Panel upgrades from K2 Solar Panel
local se_space_solar_panel = data.raw["solar-panel"]["se-space-solar-panel"]
data.raw["solar-panel"]["kr-advanced-solar-panel"].fast_replaceable_group = se_space_solar_panel.fast_replaceable_group
data.raw["solar-panel"]["kr-advanced-solar-panel"].collision_box = se_space_solar_panel.collision_box
data.raw["solar-panel"]["kr-advanced-solar-panel"].collision_mask = se_space_solar_panel.collision_mask
data.raw["solar-panel"]["kr-advanced-solar-panel"].next_upgrade = "se-space-solar-panel"

-- Ensure balanced efficiency for lack of logistical challenge for this energy producer
data.raw["burner-generator"]["kr-antimatter-reactor"].burner.effectivity = 0.8
data.raw["burner-generator"]["kr-antimatter-reactor"].max_power_output = "2GW"