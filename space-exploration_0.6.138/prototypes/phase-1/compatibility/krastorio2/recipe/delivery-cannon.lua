local data_util = require("data_util")

--Add various K2 products to the delivery cannon.
se_delivery_cannon_recipes = se_delivery_cannon_recipes or {}

local function cannonize(recipe_name, item_name)
  se_delivery_cannon_recipes[recipe_name] = {name=item_name}
end

cannonize("raw-imersite"        ,"raw-imersite")
cannonize("imersite-powder"     ,"imersite-powder")
cannonize("fine-imersite-powder","se-kr-fine-imersite-powder")
cannonize("imersium-plate"      ,"imersium-plate")
cannonize("imersite-crystal"    ,"imersite-crystal")
cannonize("coke"                ,"coke")
cannonize("quartz"              ,"quartz")
cannonize("silicon"             ,"silicon")
cannonize("enriched-iron"       ,"enriched-iron")
cannonize("enriched-copper"     ,"enriched-copper")
cannonize("enriched-rare-metals","enriched-rare-metals")
cannonize("raw-rare-metals"     ,"raw-rare-metals")
cannonize("rare-metals"         ,"rare-metals")
cannonize("lithium"             ,"lithium")
cannonize("lithium-chloride"    ,"lithium-chloride")
cannonize("tritium"             ,"tritium")
cannonize("fuel"                ,"fuel")
cannonize("bio-fuel"            ,"bio-fuel")
cannonize("advanced-fuel"       ,"advanced-fuel")
cannonize("fertilizer"          ,"fertilizer")
