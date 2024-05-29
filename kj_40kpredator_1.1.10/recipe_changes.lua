
for iterator,value in ipairs(data.raw["recipe"]["kj_40kpredator"].ingredients) do 
	if data.raw["recipe"]["kj_40kpredator"].ingredients[iterator] ~= nil and value.amount ~= nil then
		data.raw["recipe"]["kj_40kpredator"].ingredients[iterator].amount =	value.amount * settings.startup["kj_40kpredator_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_predator_normal"].ingredients) do 
	if data.raw["recipe"]["kj_predator_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
		data.raw["recipe"]["kj_predator_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_40kpredatorammo_cost_setting_multiplicator"].value
	end
end	
