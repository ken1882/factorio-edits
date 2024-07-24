local data_util = require("data_util")

-- Advanced Assembler
data_util.replace_or_add_ingredient("kr-advanced-assembling-machine", "ai-core", "se-heavy-bearing", 10)
data_util.replace_or_add_ingredient("kr-advanced-assembling-machine", nil, "se-heat-shielding", 4)
data_util.replace_or_add_ingredient("kr-advanced-assembling-machine", nil, "processing-unit", 10)

-- Advanced Furnace
data_util.replace_or_add_ingredient("kr-advanced-furnace", nil, "industrial-furnace", 2)
data_util.replace_or_add_ingredient("kr-advanced-furnace", "steel-beam", "steel-beam", 10)
data_util.replace_or_add_ingredient("kr-advanced-furnace", "electronic-components", "se-heat-shielding", 20)
data_util.replace_or_add_ingredient("kr-advanced-furnace", "copper-plate", "copper-plate", 30)
data_util.replace_or_add_ingredient("kr-advanced-furnace", "rare-metals", "rare-metals", 30)

-- Advanced Chemical Plant
data_util.replace_or_add_ingredient("kr-advanced-chemical-plant", "electronic-components", "chemical-plant", 2)
data_util.replace_or_add_ingredient("kr-advanced-chemical-plant", "imersium-beam", "electric-engine-unit", 10)
data_util.replace_or_add_ingredient("kr-advanced-chemical-plant", "rare-metals", "rare-metals", 30)
data_util.replace_or_add_ingredient("kr-advanced-chemical-plant", nil, "kr-steel-pump", 2)
data_util.replace_or_add_ingredient("kr-advanced-chemical-plant", nil, "se-iridium-plate", 20)

-- Update the Research Server recipe for its new role producing insights and sig data
data.raw.recipe["kr-research-server"].category = "space-manufacturing"
data_util.replace_or_add_ingredient("kr-research-server", "advanced-circuit", "processing-unit", 50)
data_util.replace_or_add_ingredient("kr-research-server", "electronic-components", "se-space-assembling-machine", 1)

-- Add Imersium Beams to the Advanced Research Server recipe
data.raw.recipe["kr-quantum-computer"].category = "space-manufacturing"
data_util.replace_or_add_ingredient("kr-quantum-computer", "steel-beam", "imersium-beam", 20)
data_util.replace_or_add_ingredient("kr-quantum-computer", "copper-plate", "kr-research-server", 1)
data_util.replace_or_add_ingredient("kr-quantum-computer", "rare-metals", "se-holmium-solenoid", 20)

-- Integrate the K2 AI Core into Neural Supercomputers recipe
data_util.replace_or_add_ingredient("se-space-supercomputer-3","se-bioelectrics-data","ai-core", 50)
data_util.remove_ingredient_sub(data.raw.recipe["se-space-supercomputer-3"],"se-neural-gel-2")