local data_util = require("data_util")

data_util.remove_recipe_from_effects(data.raw.technology["se-pulveriser"].effects, "se-pulverised-sand")
data_util.delete_recipe("se-pulverised-sand")
data_util.delete_recipe("glass-from-sand")

-- While not necessary when Peaceful Mode is off, having this alternative means deathworlds are perhaps a little easier to start with
-- military science not requring biters to be defeated.
local bio_lab_alt = table.deepcopy(data.raw.recipe["kr-bio-lab"])
bio_lab_alt.name = "kr-bio-lab-alt"
bio_lab_alt.category = "crafting-with-fluid"
data:extend({bio_lab_alt})
data_util.replace_or_add_ingredient("kr-bio-lab-alt", "biomass", "petroleum-gas", 2000, true)
data_util.replace_or_add_ingredient("kr-bio-lab-alt", nil, "oxygen-barrel", 40)
data_util.replace_or_add_result("kr-bio-lab-alt",nil,"empty-barrel",40)
data_util.set_craft_time("kr-bio-lab-alt", 60)
data_util.tech_lock_recipes("kr-bio-processing",{"kr-bio-lab-alt"})
if data.raw.recipe["kr-bio-lab-alt"].ingredients then
  data.raw.recipe["kr-bio-lab-alt"].main_product = "kr-bio-lab"
end
if data.raw.recipe["kr-bio-lab-alt"].normal then
  data.raw.recipe["kr-bio-lab-alt"].normal.main_product = "kr-bio-lab"
end
if data.raw.recipe["kr-bio-lab-alt"].expensive then
  data.raw.recipe["kr-bio-lab-alt"].expensive.main_product = "kr-bio-lab"
end

-- K2s peaceful mode makes changes to the fertilizer recipe in phase-3 so our earlier changes have been overwritten again
-- So we make a change here to account for the specific peaceful mode changes
if krastorio.general.getSafeSettingValue("kr-peaceful-mode") then
  -- Fertilizer recipe is brought in line with non-peaceful option so that we don't need to rebalance everything else due to peaceful mode
  local fertilizer = data.raw.recipe["fertilizer"]
  if fertilizer then
    if fertilizer.ingredients then
      fertilizer.ingredients = {
        { name = "sand", amount = 5},
        { name = "biomass", amount = 2},
        { type = "fluid", name = "nitric-acid", amount = 10},
        { type = "fluid", name = "mineral-water", amount = 50}
      }
    end
    if fertilizer.normal then
      fertilizer.normal.ingredient = {
        { name = "sand", amount = 5},
        { name = "biomass", amount = 2},
        { type = "fluid", name = "nitric-acid", amount = 10},
        { type = "fluid", name = "mineral-water", amount = 50}
      }
    end
    if fertilizer.expensive then
      fertilizer.expensive.ingredient = {
        { name = "sand", amount = 5},
        { name = "biomass", amount = 2},
        { type = "fluid", name = "nitric-acid", amount = 10},
        { type = "fluid", name = "mineral-water", amount = 50}
      }
    end
  end
end