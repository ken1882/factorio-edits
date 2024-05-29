-- active recipes
for _, force in pairs(game.forces) do
	if force.technologies["kj_b17"] and force.technologies["kj_b17"].researched then
		force.recipes["kj_b17_gunner_normal"].enabled = true
	end
end
