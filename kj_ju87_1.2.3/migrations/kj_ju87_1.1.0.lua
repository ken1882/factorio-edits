-- active recipes
for _, force in pairs(game.forces) do
	if force.technologies["kj_ju87"] and force.technologies["kj_ju87"].researched then
		force.recipes["kj_ju87_gunner_normal"].enabled = true
	end
end
