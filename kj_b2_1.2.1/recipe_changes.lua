
for iterator,value in ipairs(data.raw["recipe"]["kj_b2"].ingredients) do 
	if data.raw["recipe"]["kj_b2"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b2"].ingredients[iterator].amount = value.amount * settings.startup["kj_b2_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_b2_medium"].ingredients) do 
	if data.raw["recipe"]["kj_b2_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b2_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_b2ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_b2_big"].ingredients) do 
	if data.raw["recipe"]["kj_b2_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b2_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_b2ammo_cost_setting_multiplicator"].value
	end
end	
for iterator,value in ipairs(data.raw["recipe"]["kj_b2_huge"].ingredients) do 
	if data.raw["recipe"]["kj_b2_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b2_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_b2ammo_cost_setting_multiplicator"].value
	end
end	
for iterator,value in ipairs(data.raw["recipe"]["kj_b2_atom"].ingredients) do 
	if data.raw["recipe"]["kj_b2_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b2_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_b2ammo_cost_setting_multiplicator"].value
	end
end	