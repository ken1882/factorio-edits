local data_util = require("data_util")
local module_util = require("__space-exploration__/prototypes/phase-multi/module-util")

local modules_per_tier = module_util.modules_per_tier
local energy_required = module_util.energy_required

for _, base_name in pairs({"productivity-module", "speed-module", "effectivity-module"}) do
  for tier = 1, 9 do
    local name = module_util.module_name(base_name, tier)
    if tier > 1 then
      local tier_down = module_util.module_name(base_name, tier-1)
      data_util.replace_or_add_ingredient(name, tier_down, tier_down, modules_per_tier)
    end
    data_util.set_craft_time(name, energy_required(tier))
  end
end
