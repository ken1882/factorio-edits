
for iterator,value in ipairs(data.raw["recipe"]["kj_bf109"].ingredients) do 
	if data.raw["recipe"]["kj_bf109"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_bf109"].ingredients[iterator].amount = value.amount * settings.startup["kj_bf109_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_bf109_normal"].ingredients) do 
	if data.raw["recipe"]["kj_bf109_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_bf109_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_bf109ammo_cost_setting_multiplicator"].value
	end
end	
