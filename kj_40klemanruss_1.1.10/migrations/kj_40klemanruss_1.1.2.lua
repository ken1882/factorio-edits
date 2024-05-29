-- fix bolter ammo after 1.1.5
-- active recipes
if not game.active_mods["Wh40k_Armoury_fork"] then
	for _, force in pairs(game.forces) do
		if force.technologies["kj_40klemanruss"] and force.technologies["kj_40klemanruss"].researched then
			force.recipes["kj_bolt"].enabled = true
		end
	end
end
