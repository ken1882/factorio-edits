game.reload_script()
for index, force in pairs(game.forces) do
	force.reset_recipes()
	force.reset_technologies()
	if force.technologies["optics"].researched then
    		force.recipes["hnt-search-light"].enabled = true
  	end
end