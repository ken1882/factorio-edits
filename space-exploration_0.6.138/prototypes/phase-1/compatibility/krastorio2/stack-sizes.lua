-- Dedicated solely to modifying Krastorio 2 item stack sizes to match with the expected logisitcal challenges presented by SE
local item = data.raw.item

if settings.startup["kr-stack-size"].value == "No changes" then

  -- Logistics tab items
  if krastorio.general.getSafeSettingValue("kr-containers") then
    item["kr-medium-container"].stack_size = 35
    item["kr-medium-passive-provider-container"].stack_size = 35
    item["kr-medium-active-provider-container"].stack_size = 35
    item["kr-medium-storage-container"].stack_size = 35
    item["kr-medium-buffer-container"].stack_size = 35
    item["kr-medium-requester-container"].stack_size = 35

    item["kr-big-container"].stack_size = 20
    item["kr-big-passive-provider-container"].stack_size = 20
    item["kr-big-active-provider-container"].stack_size = 20
    item["kr-big-storage-container"].stack_size = 20
    item["kr-big-buffer-container"].stack_size = 20
    item["kr-big-requester-container"].stack_size = 20
  end

  item["kr-fluid-storage-1"].stack_size = 40
  item["kr-fluid-storage-2"].stack_size = 20

  item["kr-small-roboport"].stack_size = 25
  item["kr-large-roboport"].stack_size = 10

  item["kr-black-reinforced-plate"].stack_size = 100
  item["kr-white-reinforced-plate"].stack_size = 100

  -- Production tab items
  item["kr-advanced-steam-turbine"].stack_size = 10
  item["kr-advanced-solar-panel"].stack_size = 20
  item["kr-mineral-water-pumpjack"].stack_size = 20
  item["kr-advanced-furnace"].stack_size = 20
  item["kr-greenhouse"].stack_size = 25
  item["kr-bio-lab"].stack_size = 25
  item["kr-crusher"].stack_size = 25
  item["kr-electrolysis-plant"].stack_size = 25
  item["kr-filtration-plant"].stack_size = 25
  item["kr-atmospheric-condenser"].stack_size = 25
  item["kr-quantum-computer"].stack_size = 25

  item["kr-matter-assembler"].stack_size = 10
  item["kr-stabilizer-charging-station"].stack_size = 10

  item["biusart-lab"].stack_size = 10
  item["kr-singularity-lab"].stack_size = 1

  -- Resources tab items
  item["raw-imersite"].stack_size = 50
  item["raw-rare-metals"].stack_size = 50
  item["coke"].stack_size = 50
  item["fertilizer"].stack_size = 50
  item["biomass"].stack_size = 100
  item["quartz"].stack_size = 50
  item["silicon"].stack_size = 50
  item["rare-metals"].stack_size = 100
  item["imersite-powder"].stack_size = 100
  item["imersium-plate"].stack_size = 100
  item["enriched-iron"].stack_size = 50
  item["enriched-copper"].stack_size = 50
  item["enriched-rare-metals"].stack_size = 50
  item["lithium-chloride"].stack_size = 50
  item["lithium"].stack_size = 50
  item["lithium-sulfur-battery"].stack_size = 50
  item["tritium"].stack_size = 50
  item["fuel"].stack_size = 100
  item["bio-fuel"].stack_size = 100
  item["advanced-fuel"].stack_size = 100
  item["uranium-fuel-cell"].stack_size = 10

  -- Manufacturing tab items
  item["matter-cube"].stack_size = 25
  item["iron-beam"].stack_size = 100
  item["steel-beam"].stack_size = 100
  item["imersium-beam"].stack_size = 100
  item["steel-gear-wheel"].stack_size = 100
  item["imersium-gear-wheel"].stack_size = 100
  item["inserter-parts"].stack_size = 100
  item["electronic-components"].stack_size = 100
  item["automation-core"].stack_size = 50
  item["ai-core"].stack_size = 50
  item["charged-matter-stabilizer"].stack_size = 20

  -- Science tab items
  item["biters-research-data"].stack_size = 50
  item["space-research-data"].stack_size = 50
  data.raw.tool["kr-optimization-tech-card"].stack_size = 200

  -- Equipment & Combat tab items

  data.raw.ammo["artillery-shell"].stack_size = 25 -- This is the only item we increase the stack size of, due to the ridiculousness of a stack size of 1 for ammo.

  item["fusion-reactor-equipment"].stack_size = 20
  item["big-solar-panel-equipment"].stack_size = 20
  item["imersite-solar-panel-equipment"].stack_size = 20
  item["big-imersite-solar-panel-equipment"].stack_size = 20
  item["energy-shield-mk3-equipment"].stack_size = 20
  item["energy-shield-mk4-equipment"].stack_size = 20
  item["kr-laser-artillery-turret"].stack_size = 10
  item["kr-railgun-turret"].stack_size = 10
  item["kr-rocket-turret"].stack_size = 10
end
