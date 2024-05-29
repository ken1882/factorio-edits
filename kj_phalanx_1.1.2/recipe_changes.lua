
for iterator,value in ipairs(data.raw["recipe"]["kj_phalanx"].ingredients) do 
	if data.raw["recipe"]["kj_phalanx"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_phalanx"].ingredients[iterator].amount = value.amount * settings.startup["kj_phalanx_cost_setting_multiplicator"].value
	end
end
for iterator,value in ipairs(data.raw["recipe"]["kj_apds_normal"].ingredients) do 
	if data.raw["recipe"]["kj_apds_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_apds_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_phalanx_cost_setting_multiplicator"].value
	end
end