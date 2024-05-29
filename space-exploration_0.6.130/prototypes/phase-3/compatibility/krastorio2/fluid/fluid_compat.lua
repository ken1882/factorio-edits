local path = "prototypes/phase-3/compatibility/krastorio2/fluid/"


--require(path .. "water")
data.raw.fluid["water"].heat_capacity = "0.3KJ"
data.raw.fluid["steam"].heat_capacity = "0.3KJ"


data.raw["generator"]["steam-turbine"].fluid_usage_per_tick = data.raw["generator"]["steam-turbine"].fluid_usage_per_tick * (5/3)
