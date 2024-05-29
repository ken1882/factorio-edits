local data_util = require("data_util")


data_util.enable_recipe("first-aid-kit")

-- Alt First Aid Kit
local first_aid_kit_2 = table.deepcopy(data.raw.recipe["first-aid-kit"])
first_aid_kit_2.name = "first-aid-kit-fish"
data:extend({first_aid_kit_2})
data_util.replace_or_add_ingredient("first-aid-kit-fish", "biomass", "raw-fish", 1)