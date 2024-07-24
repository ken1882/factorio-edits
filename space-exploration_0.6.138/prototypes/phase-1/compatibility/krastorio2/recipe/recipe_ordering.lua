-- Lithium Sulfur batteries
data.raw.recipe["lithium-sulfur-battery"].subgroup = "electronic"

if krastorio.general.getSafeSettingValue("kr-containers") then
    -- Harmonize AAI Containers & Warehouses and Krastorio 2 versions
    -- Correct Medium Container and Warehouse recipe-subgroups
    data.raw.recipe["kr-medium-container"].subgroup = "kr-logistics-2"
    data.raw.recipe["kr-big-container"].subgroup = "kr-logistics-3"
    -- Correct recipe ordering within their groups
    data.raw.recipe["kr-medium-container"].order = "b[storage]-3-a[kr-medium-container]"
    data.raw.recipe["kr-medium-passive-provider-container"].order = "b[storage]-3-b[kr-passive-provider-container]"
    data.raw.recipe["kr-medium-active-provider-container"].order = "b[storage]-3-c[kr-active-provider-container]"
    data.raw.recipe["kr-medium-storage-container"].order = "b[storage]-3-d[kr-storage-container]"
    data.raw.recipe["kr-medium-buffer-container"].order = "b[storage]-3-e[kr-buffer-container]"
    data.raw.recipe["kr-medium-requester-container"].order = "b[storage]-3-f[kr-requester-container]"
    --
    data.raw.recipe["kr-big-container"].order = "b[storage]-6-a[kr-big-container]"
    data.raw.recipe["kr-big-passive-provider-container"].order = "b[storage]-6-b[kr-big-passive-provider-container]"
    data.raw.recipe["kr-big-active-provider-container"].order = "b[storage]-6-c[kr-big-active-provider-container]"
    data.raw.recipe["kr-big-storage-container"].order = "b[storage]-6-d[kr-big-storage-container]"
    data.raw.recipe["kr-big-buffer-container"].order = "b[storage]-6-e[kr-big-buffer-container]"
    data.raw.recipe["kr-big-requester-container"].order = "b[storage]-6-f[kr-big-requester-container]"
end

-- Advanced Assembler
data.raw.recipe["kr-advanced-assembling-machine"].subgroup = "assembling"

-- Advanced Chemical Plant
data.raw.recipe["kr-advanced-chemical-plant"].subgroup = "chemistry"

-- Area Mining Drill (Between Mk2 and Mk3 miners)
data.raw.recipe["area-mining-drill"].order = "a[items]-c[electric-mining-drill-mk2]-b"

-- K2 Energy Storage (Final Accumulator)
data.raw.recipe["kr-energy-storage"].subgroup = "solar"
data.raw.recipe["kr-energy-storage"].order = "e[accumulator]-a[accumulator]-final"
data.raw.recipe["kr-energy-storage"].category = "space-manufacturing"

-- Reorder K2 Solar Panel to be with other solar panels.
data.raw.recipe["kr-advanced-solar-panel"].subgroup = "solar"
data.raw.recipe["kr-advanced-solar-panel"].order = "d[solar-panel]-a[solar-panel]-a"

-- Change recipe category of water condensation
data.raw.recipe["water-from-atmosphere"].category = "atmosphere-condensation-water"

