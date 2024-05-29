
for iterator,value in ipairs(data.raw["recipe"]["kj_ho229"].ingredients) do 
	if data.raw["recipe"]["kj_ho229"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ho229"].ingredients[iterator].amount = value.amount * settings.startup["kj_ho229_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_ho229_normal"].ingredients) do 
	if data.raw["recipe"]["kj_ho229_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ho229_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_ho229ammo_cost_setting_multiplicator"].value
	end
end	
