-- Rebalance vanilla tank (aka heavy armor vehicle in Krastrio2)
data.raw.car["tank"].max_health = 5000
data.raw.gun["tank-cannon"].attack_parameters.range = 60

-- Rebalance some turrets
data.raw.turret["gun-ammo-turret-rampant-arsenal"].attack_parameters.range = 50
data.raw.turret["cannon-ammo-turret-rampant-arsenal"].attack_parameters.range = 150
data.raw.turret["cannon-ammo-turret-rampant-arsenal"].attack_parameters.turn_range = 1.0
data.raw.turret["rapid-cannon-ammo-turret-rampant-arsenal"].attack_parameters.range = 98
data.raw.turret["rapid-cannon-ammo-turret-rampant-arsenal"].attack_parameters.turn_range = 1.0
data.raw.turret["lightning-electric-turret-rampant-arsenal"].attack_parameters.range = 40
data.raw.turret["lightning-electric-turret-rampant-arsenal"].attack_parameters.turn_range = 1.0
data.raw.turret["kr-railgun-turret"].attack_parameters.range = 112
data.raw.turret["kr-rocket-turret"].attack_parameters.turn_range = 1.0

-- Add custom HE mortar bomb
if data.raw.technology["ironclad"] then
	table.insert(
		data.raw.technology["ironclad"].effects,
		{ type = "unlock-recipe", recipe = "mortar-he-cluster-bomb" }
	)
end

-- Buff deep sea oil and oil rig
if data.raw["mining-drill"]["oil_rig"] then
	data.raw["mining-drill"]["oil_rig"].max_health = 10000;
	data.raw["mining-drill"]["oil_rig"].mining_speed = 4;
end

if data.raw.resource["deep_oil"] then
	data.raw.resource["deep_oil"].infinite_depletion_amount = 0
	data.raw.resource["deep_oil"].minimum  = 6000
	data.raw.resource["deep_oil"].normal   = 30000
end

-- Make ratte tank can be accessed earlier
if data.raw.technology["kj_rattetank"] then
	data.raw.technology["kj_rattetank"].unit.ingredients = {
		{"automation-science-pack", 10},
		{"logistic-science-pack", 10},
		{"chemical-science-pack", 10},
		{"military-science-pack", 10},
		{"se-rocket-science-pack", 10},
		{"space-science-pack", 1},
	}
	data.raw.technology["kj_rattetank_ammo"].unit.ingredients = {
		{"automation-science-pack", 10},
		{"logistic-science-pack", 10},
		{"chemical-science-pack", 10},
		{"military-science-pack", 10},
		{"se-rocket-science-pack", 10},
		{"space-science-pack", 1},
	}
end

-- Make planes can use JK fuel
if mods["Krastorio2"] then
	local planes = {"kj_b17", "kj_747", "kj_bf109", "kj_ho229", "kj_ju52", "kj_ju87", "kj_jug38", "kj_xb35"}
	for _, plane in ipairs(planes) do
		if data.raw["car"][plane] then
			prototype = data.raw["car"][plane]
			prototype.burner.fuel_categories = {"vehicle-fuel", "kj_kerosine"}
			prototype.burner.fuel_category = nil
			prototype.burner.burnt_inventory_size = 1
			if mods["AircraftRealism"] then
				prototype = data.raw["car"][plane.."-airborne"]
				if prototype then
					prototype.burner.fuel_categories = {"vehicle-fuel", "kj_kerosine"}
					prototype.burner.fuel_category = nil
					prototype.burner.burnt_inventory_size = 1
				end
			end
		end
	end
end


if data.raw["locomotive"]["cargo_ship_engine"] then
	data.raw["locomotive"]["cargo_ship_engine"].equipment_grid = "cargoship-grid"
end
if data.raw["fluid-wagon"]["oil_tanker"] then
	data.raw["fluid-wagon"]["oil_tanker"].equipment_grid = "shipwagon-grid"
end
if data.raw["cargo-wagon"]["cargo_ship"] then
	data.raw["cargo-wagon"]["cargo_ship"].equipment_grid = "shipwagon-grid"
end
if data.raw["cargo-wagon"]["boat"] then
	data.raw["cargo-wagon"]["boat"].equipment_grid = "boat-grid"
end
if data.raw["car"]["indep-boat"] then
	data.raw["car"]["indep-boat"].equipment_grid = "boat-grid"
end
