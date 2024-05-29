local data_util = require("data_util")

-- If K2 Advanced Lab exists, add it to the Space Science Laboratory recipe
if data.raw.item["biusart-lab"] then
	data_util.replace_or_add_ingredient("se-space-science-lab", "lab", "biusart-lab", 10)
	data_util.tech_add_prerequisites("se-space-science-lab", {"kr-advanced-lab"})
end