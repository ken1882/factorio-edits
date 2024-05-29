
for iterator,value in ipairs(data.raw["recipe"]["kj_vierling"].ingredients) do 
	if data.raw["recipe"]["kj_vierling"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_vierling"].ingredients[iterator].amount = value.amount * settings.startup["kj_vierling_cost_setting_multiplicator"].value
	end
end
for iterator,value in ipairs(data.raw["recipe"]["kj_2cmfv_normal_vierling"].ingredients) do 
	if data.raw["recipe"]["kj_2cmfv_normal_vierling"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_2cmfv_normal_vierling"].ingredients[iterator].amount = value.amount * settings.startup["kj_vierling_cost_setting_multiplicator"].value
	end
end