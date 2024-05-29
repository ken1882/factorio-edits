-- fix bolter ammo after 1.1.2
-- active recipes
if not game.active_mods["Wh40k_Armoury_fork"] then
	for _, force in pairs(game.forces) do
		if force.technologies["kj_40kpredator"] and force.technologies["kj_40kpredator"].researched then
			force.recipes["kj_bolt"].enabled = true
		end
	end
end