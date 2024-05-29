-- active recipes
for _, force in pairs(game.forces) do
	if force.technologies["kj_pak"] and force.technologies["kj_pak"].researched then
		force.recipes["kj_pak_turret"].enabled = true
	end
end
