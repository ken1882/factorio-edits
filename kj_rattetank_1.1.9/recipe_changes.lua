
for iterator,value in ipairs(data.raw["recipe"]["kj_rattetank"].ingredients) do 
	if data.raw["recipe"]["kj_rattetank"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_rattetank"].ingredients[iterator].amount = value.amount * settings.startup["kj_rattetank_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_280SKC34_penetration"].ingredients) do 
	if data.raw["recipe"]["kj_280SKC34_penetration"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_280SKC34_penetration"].ingredients[iterator].amount = value.amount * settings.startup["kj_rattetankammunition_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_280SKC34_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_280SKC34_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_280SKC34_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_rattetankammunition_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_280SKC34_incendiary"].ingredients) do 
	if data.raw["recipe"]["kj_280SKC34_incendiary"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_280SKC34_incendiary"].ingredients[iterator].amount = value.amount * settings.startup["kj_rattetankammunition_cost_setting_multiplicator"].value
	end
end	
