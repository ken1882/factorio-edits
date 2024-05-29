
for iterator,value in ipairs(data.raw["recipe"]["kj_40kbunker"].ingredients) do 
	if data.raw["recipe"]["kj_40kbunker"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_40kbunker"].ingredients[iterator].amount = value.amount * settings.startup["kj_40kbunker_cost_setting_multiplicator"].value
	end
end

for iterator,value in ipairs(data.raw["recipe"]["kj_40kbunker_turret"].ingredients) do 
	if data.raw["recipe"]["kj_40kbunker_turret"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_40kbunker_turret"].ingredients[iterator].amount = value.amount * settings.startup["kj_40kbunker_cost_setting_multiplicator"].value
	end
end
