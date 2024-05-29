
for iterator,value in ipairs(data.raw["recipe"]["kj_40klemanruss"].ingredients) do 
	if data.raw["recipe"]["kj_40klemanruss"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_40klemanruss"].ingredients[iterator].amount = value.amount * settings.startup["kj_40klemanruss_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_lemanruss_normal"].ingredients) do 
	if data.raw["recipe"]["kj_lemanruss_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_lemanruss_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_40klemanrussammo_cost_setting_multiplicator"].value
	end
end	
