
for iterator,value in ipairs(data.raw["recipe"]["kj_tower"].ingredients) do 
	if data.raw["recipe"]["kj_tower"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_tower"].ingredients[iterator].amount = value.amount * settings.startup["kj_tower_cost_setting_multiplicator"].value
	end
end
