-- Unifying Science pack ordering. Must remain in Phase 2 to override K2 changes in Phase 2
data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"
data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
data.raw.tool["se-rocket-science-pack"].order = "c[rocket-science-pack]"
data.raw.tool["space-science-pack"].order = "d[space-sciecne-pack]"
data.raw.tool["production-science-pack"].order = "e[production-science-pack]"
data.raw.tool["utility-science-pack"].order = "f[production-science-pack]"
data.raw.tool["kr-optimization-tech-card"].order  = "g[optimization-tech-card-1]-a"
data.raw.tool["advanced-tech-card"].order = "g[optimization-tech-card-2]-b"
data.raw.tool["singularity-tech-card"].order = "g[optimization-tech-card-3]-c"

-- Equipment Ordering (for displaying what equipment goes in what)

data.raw["generator-equipment"]["small-portable-generator"].order = "a[generator]-a[small-portable-generator]"
data.raw["generator-equipment"]["portable-generator"].order = "a[generator]-b[portable-generator]"
data.raw["generator-equipment"]["nuclear-reactor-equipment"].order = "a[generator]-c[nuclear-reactor]"
data.raw["generator-equipment"]["fusion-reactor-equipment"].order = "a[generator]-d[fusion-reactor]"
data.raw["generator-equipment"]["antimatter-reactor-equipment"].order = "a[generator]-e[antimatter-reactor]"
data.raw["generator-equipment"]["se-rtg-equipment"].order = "a[generator]-f[se-rtg-1]"
data.raw["generator-equipment"]["se-rtg-equipment-2"].order = "a[generator]-g[se-rtg-2]"

data.raw["solar-panel-equipment"]["solar-panel-equipment"].order = "a[generator]-h[solar-panel]"
data.raw["solar-panel-equipment"]["big-solar-panel-equipment"].order = "a[generator]-i[big-solar-panel]"
data.raw["solar-panel-equipment"]["imersite-solar-panel-equipment"].order = "a[generator]-j[imersite-solar-panel]"
data.raw["solar-panel-equipment"]["big-imersite-solar-panel-equipment"].order = "a[generator]-k[big-imersite-solar-panel]"

data.raw["battery-equipment"]["energy-absorber"].order = "b[battery]-a[energy-absorber]"
data.raw["battery-equipment"]["battery-equipment"].order = "b[battery]-b[battery]"
data.raw["battery-equipment"]["big-battery-equipment"].order = "b[battery]-c[big-battery]"
data.raw["battery-equipment"]["battery-mk2-equipment"].order = "b[battery]-d[batter-mk2]"
data.raw["battery-equipment"]["big-battery-mk2-equipment"].order = "b[battery]-e[big-battery-mk2]"
data.raw["battery-equipment"]["battery-mk3-equipment"].order = "b[battery]-f[battery-mk3]"
data.raw["battery-equipment"]["big-battery-mk3-equipment"].order = "b[battery]-g[big-battery-mk3]"

data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-1"].order = "c[defense]-a[se-adaptive-armour-1]"
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-2"].order = "c[defense]-b[se-adaptive-armour-2]"
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-3"].order = "c[defense]-c[se-adaptive-armour-3]"
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-4"].order = "c[defense]-d[se-adaptive-armour-4]"
data.raw["energy-shield-equipment"]["se-adaptive-armour-equipment-5"].order = "c[defense]-e[se-adaptive-armour-5]"
data.raw["energy-shield-equipment"]["energy-shield-equipment"].order = "c[defense]-f[energy-shield]"
data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].order = "c[defense]-g[energy-shield-mk2]"
data.raw["energy-shield-equipment"]["energy-shield-mk3-equipment"].order = "c[defense]-h[energy-shield-mk3]"
data.raw["energy-shield-equipment"]["energy-shield-mk4-equipment"].order = "c[defense]-i[energy-shield-mk4]"
data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].order = "c[defense]-j[energy-shield-mk5]"
data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].order = "c[defense]-k[energy-shield-mk6]"

data.raw["movement-bonus-equipment"]["exoskeleton-equipment"].order = "d[movement]-a[exoskeleton]"
data.raw["movement-bonus-equipment"]["advanced-exoskeleton-equipment"].order = "d[movement]-b[advanced-exoskeleton]"
data.raw["movement-bonus-equipment"]["superior-exoskeleton-equipment"].order = "d[movement]-c[superior-exoskeleton]"
data.raw["movement-bonus-equipment"]["additional-engine"].order = "d[movement]-d[additional-engine]"
data.raw["movement-bonus-equipment"]["advanced-additional-engine"].order = "d[movement]-e[advanced-additional-engine]"

data.raw["battery-equipment"]["jetpack-1"].order = "d[movement]-f[jetpack-1]"
data.raw["battery-equipment"]["jetpack-2"].order = "d[movement]-g[jetpack-2]"
data.raw["battery-equipment"]["jetpack-3"].order = "d[movement]-h[jetpack-3]"
data.raw["battery-equipment"]["jetpack-4"].order = "d[movement]-i[jetpack-4]"

data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].order = "d[movement]-j[belt-immunity]"

data.raw["night-vision-equipment"]["night-vision-equipment"].order = "e[utility]-a[night-vision]"
data.raw["night-vision-equipment"]["imersite-night-vision-equipment"].order = "e[utility]-b[imersite-night-vision]"
data.raw["roboport-equipment"]["personal-roboport-equipment"].order = "e[utility]-c[personal-roboport]"
data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].order = "e[utility]-d[personal-roboport-mk2]"
data.raw["roboport-equipment"]["vehicle-roboport"].order = "e[utility]-e[vehicle-roboport]"
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-1"].order = "e[utility]-f[se-lifesupport-1]"
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-2"].order = "e[utility]-g[se-lifesupport-2]"
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-3"].order = "e[utility]-h[se-lifesupport-3]"
data.raw["movement-bonus-equipment"]["se-lifesupport-equipment-4"].order = "e[utility]-i[se-lifesupport-4]"

data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk1-equipment"].order = "f[damageing]-a[submachine-laser-mk1]"
data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk2-equipment"].order = "f[damageing]-b[submachine-laser-mk2]"
data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk3-equipment"].order = "f[damageing]-c[submachine-laser-mk3]"
data.raw["active-defense-equipment"]["personal-submachine-laser-defense-mk4-equipment"].order = "f[damageing]-d[submachine-laser-mk4]"
data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].order = "f[damageing]-e[laser-mk1]"
data.raw["active-defense-equipment"]["personal-laser-defense-mk2-equipment"].order = "f[damageing]-f[laser-mk2]"
data.raw["active-defense-equipment"]["personal-laser-defense-mk3-equipment"].order = "f[damageing]-g[laser-mk3]"
data.raw["active-defense-equipment"]["personal-laser-defense-mk4-equipment"].order = "f[damageing]-h[laser-mk4]"
data.raw["active-defense-equipment"]["discharge-defense-equipment"].order = "f[damageing]-i[discharge]"