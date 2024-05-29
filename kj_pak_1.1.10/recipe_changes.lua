
for iterator,value in ipairs(data.raw["recipe"]["kj_pak"].ingredients) do 
	if data.raw["recipe"]["kj_pak"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_pak"].ingredients[iterator].amount = value.amount * settings.startup["kj_pak_cost_setting_multiplicator"].value
	end
end

for iterator,value in ipairs(data.raw["recipe"]["kj_pak_turret"].ingredients) do 
	if data.raw["recipe"]["kj_pak_turret"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_pak_turret"].ingredients[iterator].amount = value.amount * settings.startup["kj_pak_cost_setting_multiplicator"].value
	end
end

for iterator,value in ipairs(data.raw["recipe"]["kj_pak_penetration"].ingredients) do 
	if data.raw["recipe"]["kj_pak_penetration"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_pak_penetration"].ingredients[iterator].amount = value.amount * settings.startup["kj_pakammo_cost_setting_multiplicator"].value
	end
end

for iterator,value in ipairs(data.raw["recipe"]["kj_pak_highexplosive"].ingredients) do 
	if data.raw["recipe"]["kj_pak_highexplosive"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_pak_highexplosive"].ingredients[iterator].amount = value.amount * settings.startup["kj_pakammo_cost_setting_multiplicator"].value
	end
end

for iterator,value in ipairs(data.raw["recipe"]["kj_pak_incendiary"].ingredients) do 
	if data.raw["recipe"]["kj_pak_incendiary"].ingredients[iterator] ~= nil and value.amount ~= nil then
	data.raw["recipe"]["kj_pak_incendiary"].ingredients[iterator].amount = value.amount * settings.startup["kj_pakammo_cost_setting_multiplicator"].value
	end
end	
