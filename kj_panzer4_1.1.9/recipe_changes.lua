
for iterator,value in ipairs(data.raw["recipe"]["kj_panzer4"].ingredients) do 
	if data.raw["recipe"]["kj_panzer4"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_panzer4"].ingredients[iterator].amount = value.amount * settings.startup["kj_panzer4_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_75kwk40_penetration"].ingredients) do 
	if data.raw["recipe"]["kj_75kwk40_penetration"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_75kwk40_penetration"].ingredients[iterator].amount = value.amount * settings.startup["kj_panzer4ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_75kwk40_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_75kwk40_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_75kwk40_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_panzer4ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_75kwk40_penetration_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_75kwk40_penetration_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_75kwk40_penetration_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_panzer4ammo_cost_setting_multiplicator"].value
	end
end	

