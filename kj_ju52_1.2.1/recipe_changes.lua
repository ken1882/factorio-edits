
for iterator,value in ipairs(data.raw["recipe"]["kj_ju52"].ingredients) do 
	if data.raw["recipe"]["kj_ju52"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_ju52"].ingredients[iterator].amount = value.amount * settings.startup["kj_ju52_cost_setting_multiplicator"].value
	end
end	
