
for iterator,value in ipairs(data.raw["recipe"]["kj_40kbaneblade"].ingredients) do 
	if data.raw["recipe"]["kj_40kbaneblade"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_40kbaneblade"].ingredients[iterator].amount = value.amount * settings.startup["kj_40kbaneblade_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_baneblade_normal"].ingredients) do 
	if data.raw["recipe"]["kj_baneblade_normal"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_baneblade_normal"].ingredients[iterator].amount = value.amount * settings.startup["kj_40kbanebladeammo_cost_setting_multiplicator"].value
	end
end	

