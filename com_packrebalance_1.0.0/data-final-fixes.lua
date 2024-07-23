if data.raw.technology["ironclad"] then
	table.insert(
		data.raw.technology["ironclad"].effects,
		{ type = "unlock-recipe", recipe = "mortar-he-cluster-bomb" }
	)
end