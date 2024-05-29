local data_util = require("data_util")

if krastorio.general.getSafeSettingValue("kr-containers") then
  -- Harmonize AAI Containers & Warehouses and Krastorio 2 versions
  -- Adjust recipes of all of them to be the same so that one isn't cheaper than the other, but keep them existing in case of aestheric choices by the player.
  data_util.replace_or_add_ingredient("kr-big-container", "kr-medium-container", "concrete", 100)
  data_util.replace_or_add_ingredient("kr-big-container", nil, "steel-plate", 100)
  data_util.replace_or_add_ingredient("kr-big-container", "steel-beam", "steel-beam", 50)

  data_util.replace_or_add_ingredient("kr-big-passive-provider-container", "advanced-circuit", "advanced-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-passive-provider-container", nil, "electronic-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-active-provider-container", "advanced-circuit", "advanced-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-active-provider-container", nil, "electronic-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-storage-container", "advanced-circuit", "advanced-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-storage-container", nil, "electronic-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-buffer-container", "advanced-circuit", "advanced-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-buffer-container", nil, "electronic-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-requester-container", "advanced-circuit", "advanced-circuit", 20)
  data_util.replace_or_add_ingredient("kr-big-requester-container", nil, "electronic-circuit", 20)

  data_util.replace_or_add_ingredient("kr-medium-container", "steel-chest", "steel-plate", 15)
  data_util.replace_or_add_ingredient("kr-medium-container", "steel-beam", "steel-beam", 5)

  data_util.replace_or_add_ingredient("kr-medium-passive-provider-container", "advanced-circuit", "advanced-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-passive-provider-container", nil, "electronic-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-active-provider-container", "advanced-circuit", "advanced-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-active-provider-container", nil, "electronic-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-storage-container", "advanced-circuit", "advanced-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-storage-container", nil, "electronic-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-buffer-container", "advanced-circuit", "advanced-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-buffer-container", nil, "electronic-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-requester-container", "advanced-circuit", "advanced-circuit", 4)
  data_util.replace_or_add_ingredient("kr-medium-requester-container", nil, "electronic-circuit", 4)
end
  
-- Adjust cost of AAI Containers even if K2s Containers are disabled.
data_util.replace_or_add_ingredient("aai-strongbox", "steel-plate", "steel-plate", 15)
data_util.replace_or_add_ingredient("aai-strongbox", nil, "steel-beam", 5)

data_util.replace_or_add_ingredient("aai-storehouse", "steel-plate", "steel-plate", 50)
data_util.replace_or_add_ingredient("aai-storehouse", nil, "steel-beam", 25)

data_util.replace_or_add_ingredient("aai-warehouse", "steel-plate", "steel-plate", 100)
data_util.replace_or_add_ingredient("aai-warehouse", nil, "steel-beam", 50)