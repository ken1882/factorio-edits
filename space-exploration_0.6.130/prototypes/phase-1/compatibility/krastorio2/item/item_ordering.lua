-- Item Subgroups
-- Reorder the K2 Warehouse subgroups.
data.raw["item-subgroup"]["kr-logistics-2"].order = "a3[container-3]"
data.raw["item-subgroup"]["kr-logistics-3"].order = "a6[container-6-b]"

-- Items directly
-- Re-order K2 belts
data.raw.item["kr-advanced-splitter"].subgroup = "splitter"
data.raw.item["kr-advanced-transport-belt"].subgroup = "transport-belt"
data.raw.item["kr-advanced-underground-belt"].subgroup = "underground-belt"

data.raw.item["kr-superior-splitter"].subgroup = "splitter"
data.raw.item["kr-superior-transport-belt"].subgroup = "transport-belt"
data.raw.item["kr-superior-underground-belt"].subgroup = "underground-belt"

-- Labs ordering
data.raw.item["biusart-lab"].subgroup = "lab"
data.raw.item["kr-singularity-lab"].subgroup = "lab"

data.raw.item["se-space-science-lab"].order = "g[lab]-g3[kr-singularity-lab]"
data.raw.item["kr-singularity-lab"].order = "g[lab]-g4[kr-singularity-lab]"

-- Pipes ordering
data.raw.item["kr-steel-pipe"].subgroup = "pipe"
data.raw.item["kr-steel-pipe-to-ground"].subgroup = "pipe"
data.raw.item["kr-steel-pump"].subgroup = "pipe"

data.raw.item["se-space-pipe"].order = "a[pipe]-ab[se-space-pipe]"

-- Portable RTG
data.raw.item["se-rtg-equipment"].subgroup = "equipment"
data.raw.item["se-rtg-equipment"].order = "a2[energy-source]-a41[portable-nuclear-core]"
-- Portable RTG 2
data.raw.item["se-rtg-equipment-2"].subgroup = "equipment"
data.raw.item["se-rtg-equipment-2"].order = "a2[energy-source]-a42[portable-nuclear-core]"

-- Energy Storage Accumulator
data.raw.item["kr-energy-storage"].subgroup = "solar"
data.raw.item["kr-energy-storage"].order = "e[accumulator]-a[accumulator]-final"

--- Advanced Solar Panel
data.raw.item["kr-advanced-solar-panel"].subgroup = "solar"
data.raw.item["kr-advanced-solar-panel"].order = "d[solar-panel]-a[solar-panel]-a"

-- Update K2s Rare Metal recipes to share the same subgroup
data.raw.item["raw-rare-metals"].subgroup = "rare-metals"
data.raw.item["raw-rare-metals"].order = "a-a-b"
data.raw.item["enriched-rare-metals"].subgroup = "rare-metals"
data.raw.item["enriched-rare-metals"].order = "a-a-c"
data.raw.item["rare-metals"].subgroup = "rare-metals"
data.raw.item["rare-metals"].order = "a-a-d"

-- Update K2s Imersite recipes to share the same subgroup
data.raw.item["raw-imersite"].subgroup = "imersite"
data.raw.item["raw-imersite"].order = "a-a-b"
data.raw.item["imersite-powder"].subgroup = "imersite"
data.raw.item["imersite-powder"].order = "a-a-c"
data.raw.item["imersite-crystal"].group = "resources"
data.raw.item["imersite-crystal"].subgroup = "imersite"
data.raw.item["imersite-crystal"].order = "a-a-e"
data.raw.item["imersium-plate"].subgroup = "imersite"
data.raw.item["imersium-plate"].order = "a-a-f"

-- Update K2s Stone recipes to share the same subgroup as SEs recipes
data.raw.item["quartz"].subgroup = "stone"
data.raw.item["quartz"].order = "a[quartz]"
data.raw.item["silicon"].subgroup = "stone"
data.raw.item["silicon"].order = "a[silicon]"

-- Update K2s Lithium recipes to share the same subgroup
data.raw.item["lithium-chloride"].subgroup = "lithium"
data.raw.item["lithium-chloride"].order = "b"
data.raw.item["lithium"].subgroup = "lithium"
data.raw.item["lithium"].order = "c"
data.raw.item["lithium-sulfur-battery"].group = "intermediate-products"
data.raw.item["lithium-sulfur-battery"].subgroup = "intermediate-product"

if krastorio.general.getSafeSettingValue("kr-containers") then
  -- Harmonize AAI Containers & Warehouses and Krastorio 2 versions
  -- Correct Medium Container and Warehouse item-subgroups
  data.raw.item["kr-medium-container"].subgroup = "kr-logistics-2"
  data.raw.item["kr-big-container"].subgroup = "kr-logistics-3"
  -- Correct item ordering within their groups.
  data.raw.item["kr-medium-container"].order = "b[storage]-3-a[kr-medium-container]"
  data.raw.item["kr-medium-passive-provider-container"].order = "b[storage]-3-b[kr-passive-provider-container]"
  data.raw.item["kr-medium-active-provider-container"].order = "b[storage]-3-c[kr-active-provider-container]"
  data.raw.item["kr-medium-storage-container"].order = "b[storage]-3-d[kr-storage-container]"
  data.raw.item["kr-medium-buffer-container"].order = "b[storage]-3-e[kr-buffer-container]"
  data.raw.item["kr-medium-requester-container"].order = "b[storage]-3-f[kr-requester-container]"
  --
  data.raw.item["kr-big-container"].order = "b[storage]-6-a[kr-big-container]"
  data.raw.item["kr-big-passive-provider-container"].order = "b[storage]-6-b[kr-big-passive-provider-container]"
  data.raw.item["kr-big-active-provider-container"].order = "b[storage]-6-c[kr-big-active-provider-container]"
  data.raw.item["kr-big-storage-container"].order = "b[storage]-6-d[kr-big-storage-container]"
  data.raw.item["kr-big-buffer-container"].order = "b[storage]-6-e[kr-big-buffer-container]"
  data.raw.item["kr-big-requester-container"].order = "b[storage]-6-f[kr-big-requester-container]"
end

-- Advanced Assembler
data.raw.item["kr-advanced-assembling-machine"].subgroup = "assembling"

-- Advanced Chemical Plant
data.raw.item["kr-advanced-chemical-plant"].subgroup = "chemistry"

-- Area Mining Drill (between Mk2 and Mk3 miners)
data.raw.item["area-mining-drill"].order = "a[items]-c[electric-mining-drill-mk2]-b"

---- Adaptive Armor
-- Alter ordering
data.raw.item["se-adaptive-armour-equipment-1"].subgroup = "character-equipment"
data.raw.item["se-adaptive-armour-equipment-1"].order = "s[energy-shield]-a1[adaptive-armour]"
data.raw.item["se-adaptive-armour-equipment-2"].subgroup = "character-equipment"
data.raw.item["se-adaptive-armour-equipment-2"].order = "s[energy-shield]-a2[adaptive-armour]"
data.raw.item["se-adaptive-armour-equipment-3"].subgroup = "character-equipment"
data.raw.item["se-adaptive-armour-equipment-3"].order = "s[energy-shield]-a3[adaptive-armour]"
data.raw.item["se-adaptive-armour-equipment-4"].subgroup = "character-equipment"
data.raw.item["se-adaptive-armour-equipment-4"].order = "s[energy-shield]-a4[adaptive-armour]"
data.raw.item["se-adaptive-armour-equipment-5"].subgroup = "character-equipment"
data.raw.item["se-adaptive-armour-equipment-5"].order = "s[energy-shield]-a5[adaptive-armour]"
