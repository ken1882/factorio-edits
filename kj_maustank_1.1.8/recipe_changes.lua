
for iterator,value in ipairs(data.raw["recipe"]["kj_maustank"].ingredients) do 
	if data.raw["recipe"]["kj_maustank"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_maustank"].ingredients[iterator].amount = value.amount * settings.startup["kj_maustank_cost_setting_multiplicator"].value
	end
end		

for iterator,value in ipairs(data.raw["recipe"]["kj_120kwk_penetration"].ingredients) do 
	if data.raw["recipe"]["kj_120kwk_penetration"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_120kwk_penetration"].ingredients[iterator].amount = value.amount * settings.startup["kj_maustankammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_120kwk_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_120kwk_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_120kwk_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_maustankammo_cost_setting_multiplicator"].value
	end
end	

for iterator,value in ipairs(data.raw["recipe"]["kj_120kwk_penetration_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_120kwk_penetration_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_120kwk_penetration_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_maustankammo_cost_setting_multiplicator"].value
	end
end	
