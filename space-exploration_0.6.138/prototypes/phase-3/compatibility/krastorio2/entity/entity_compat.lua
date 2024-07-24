local path = "prototypes/phase-3/compatibility/krastorio2/entity/"

--require(path .. "logistics")
if data.raw["logistic-robot"]["logistic-robot"] then
    data.raw["logistic-robot"]["logistic-robot"].speed = 0.05
    data.raw["logistic-robot"]["logistic-robot"].max_energy = "1.5MJ"
    data.raw["logistic-robot"]["logistic-robot"].max_health = 100
    data.raw["logistic-robot"]["logistic-robot"].max_payload_size = 1
end

if data.raw["construction-robot"]["construction-robot"] then
    data.raw["construction-robot"]["construction-robot"].speed = 0.06
    data.raw["construction-robot"]["construction-robot"].max_energy = "1.5MJ"
    data.raw["construction-robot"]["construction-robot"].max_health = 100
    data.raw["construction-robot"]["construction-robot"].max_payload_size = 1
end

--require(path .. "power")

-- Account for Heat Capacity Change of water for the Steam Engine and Boiler
data.raw["generator"]["steam-engine"].fluid_usage_per_tick = (((1/6)*3) + ((1/6)/3))/2