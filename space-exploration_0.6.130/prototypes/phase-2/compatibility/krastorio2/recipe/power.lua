local data_util = require("data_util")

-- Solar Panel recipe
data_util.replace_or_add_ingredient("solar-panel","glass","glass",15)

-- Make Substation Mk2 need holmium cables
data_util.replace_or_add_ingredient("kr-substation-mk2",nil,"se-holmium-cable", 4)