
for iterator,value in ipairs(data.raw["recipe"]["kj_b17"].ingredients) do 
	if data.raw["recipe"]["kj_b17"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b17"].ingredients[iterator].amount = value.amount * settings.startup["kj_b17_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_b17_normal"].ingredients) do 
	if data.raw["recipe"]["kj_b17_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b17_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_b17ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_b17_medium"].ingredients) do 
	if data.raw["recipe"]["kj_b17_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b17_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_b17ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_b17_big"].ingredients) do 
	if data.raw["recipe"]["kj_b17_big"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b17_big"].ingredients[iterator].amount = value.amount * settings.startup["kj_b17ammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_b17_huge"].ingredients) do 
	if data.raw["recipe"]["kj_b17_huge"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_b17_huge"].ingredients[iterator].amount = value.amount * settings.startup["kj_b17ammo_cost_setting_multiplicator"].value
	end
end	
