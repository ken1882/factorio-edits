
for iterator,value in ipairs(data.raw["recipe"]["kj_747"].ingredients) do 
	if data.raw["recipe"]["kj_747"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_747"].ingredients[iterator].amount = value.amount * settings.startup["kj_747_cost_setting_multiplicator"].value
	end
end		
