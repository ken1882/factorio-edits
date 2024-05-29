
for iterator,value in ipairs(data.raw["recipe"]["kj_jug38"].ingredients) do 
	if data.raw["recipe"]["kj_jug38"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_jug38"].ingredients[iterator].amount = value.amount * settings.startup["kj_jug38_cost_setting_multiplicator"].value
	end
end		
