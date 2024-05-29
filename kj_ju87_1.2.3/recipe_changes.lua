
for iterator,value in ipairs(data.raw["recipe"]["kj_ju87"].ingredients) do 
	if data.raw["recipe"]["kj_ju87"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju87"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju87_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_ju87_gunner_normal"].ingredients) do 
	if data.raw["recipe"]["kj_ju87_gunner_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju87_gunner_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju87ammo_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_ju87_normal"].ingredients) do 
	if data.raw["recipe"]["kj_ju87_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju87_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju87ammo_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_ju87_medium"].ingredients) do 
	if data.raw["recipe"]["kj_ju87_medium"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju87_medium"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju87ammo_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_ju87_big"].ingredients) do 
	if data.raw["recipe"]["kj_ju87_big"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju87_big"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju87ammo_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_ju87_huge"].ingredients) do 
	if data.raw["recipe"]["kj_ju87_huge"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju87_huge"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju87ammo_cost_setting_multiplicator"].value
	end
end	
