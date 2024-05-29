
for iterator,value in ipairs(data.raw["recipe"]["kj_xb35"].ingredients) do 
	if data.raw["recipe"]["kj_xb35"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_xb35"].ingredients[iterator].amount = value.amount * settings.startup["kj_xb35_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_xb35_medium"].ingredients) do 
	if data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_xb35ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_xb35_big"].ingredients) do 
	if data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_xb35ammo_cost_setting_multiplicator"].value
	end
end	
for iterator,value in ipairs(data.raw["recipe"]["kj_xb35_huge"].ingredients) do 
	if data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_xb35ammo_cost_setting_multiplicator"].value
	end
end	
for iterator,value in ipairs(data.raw["recipe"]["kj_xb35_atom"].ingredients) do 
	if data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_xb35_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_xb35ammo_cost_setting_multiplicator"].value
	end
end	