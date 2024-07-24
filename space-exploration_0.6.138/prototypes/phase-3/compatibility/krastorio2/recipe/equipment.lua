local data_util = require("data_util")

data_util.remove_ingredient("spidertron","ai-core")

-- Sheild Projector
-- Include K2 Advanced Tech Card and Lithium Sulfur Battery instead of Base battery.
data_util.replace_or_add_ingredient("shield-projector","battery","lithium-sulfur-battery",160)

---- Shields
-- Clean up unused K2 alternate recipes and techs.
data.raw.recipe["energy-shield-mk3-equipment-2"] = nil
data.raw.recipe["energy-shield-mk4-equipment-2"] = nil

---- Batteries
-- Personal Battery Mk2
data_util.replace_or_add_ingredient("battery-mk2-equipment", nil, "se-holmium-cable", 2)
data_util.replace_or_add_ingredient("big-battery-mk2-equipment", nil, "se-holmium-cable", 4)

-- Personal Battery Mk3
data_util.replace_or_add_ingredient("battery-mk3-equipment", nil, "se-superconductive-cable", 2)
data_util.replace_or_add_ingredient("big-battery-mk3-equipment", nil, "se-superconductive-cable", 4)
data_util.replace_or_add_ingredient("big-battery-mk3-equipment", "lithium-sulfur-battery", "lithium-sulfur-battery", 8)