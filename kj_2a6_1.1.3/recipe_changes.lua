
for iterator,value in ipairs(data.raw["recipe"]["kj_2a6"].ingredients) do 
	if data.raw["recipe"]["kj_2a6"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_2a6"].ingredients[iterator].amount = value.amount * settings.startup["kj_2a6_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_rh120_penetration"].ingredients) do 
	if data.raw["recipe"]["kj_rh120_penetration"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_rh120_penetration"].ingredients[iterator].amount = value.amount * settings.startup["kj_2a6ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_rh120_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_rh120_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_rh120_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_2a6ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_rh120_penetration_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_rh120_penetration_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_rh120_penetration_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_2a6ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_rh120_canister"].ingredients) do 
	if data.raw["recipe"]["kj_rh120_canister"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_rh120_canister"].ingredients[iterator].amount = value.amount * settings.startup["kj_2a6ammo_cost_setting_multiplicator"].value
	end
end	