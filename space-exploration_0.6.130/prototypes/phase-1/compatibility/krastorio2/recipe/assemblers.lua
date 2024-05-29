local data_util = require("data_util")

-- Advanced Assembler
data_util.replace_or_add_ingredient("kr-advanced-assembling-machine", "ai-core", "se-heavy-bearing", 10)

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