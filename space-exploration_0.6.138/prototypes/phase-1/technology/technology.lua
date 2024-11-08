local data_util = require("data_util")

if not data.raw.technology["sand-processing"] then
  data:extend({{
      type = "technology",
      name = "sand-processing",
      effects = {
        { type = "unlock-recipe", recipe = "sand-from-stone"},
      },
      icon = "__space-exploration-graphics__/graphics/technology/sand-processing.png",
      icon_size = 128,
      order = "a",
      prerequisites = {}, -- if basic automation existed from AAI Industry then this would not fire anyway
      unit = {
          count = 10,
          ingredients = {
              {"automation-science-pack", 1},
          },
          time = 30
      },
  }})
end

if not data.raw.technology["glass-processing"] then
  data:extend({{
      type = "technology",
      name = "glass-processing",
      effects = {
        { type = "unlock-recipe", recipe = "glass-from-sand"},
      },
      icon = "__space-exploration-graphics__/graphics/technology/glass-processing.png",
      icon_size = 128,
      order = "a",
      prerequisites = {"sand-processing"},
      unit = {
          count = 40,
          ingredients = {
              {"automation-science-pack", 1},
          },
          time = 30
      },
  }})
end

---@param icon string Path to the base background icon
---@param insights string String containing any of the basic insights. a=astrometric, s=energy, b=biological, m=material
---@return table[] icons Icon table of composite graphics
function add_insights_to_tech_icon(icon, insights)
  local icons = {}
  table.insert(icons, {
    icon = icon,
    shift = {0, -6}
  })
  for i = 1, #insights do
    local insight = string.sub(insights, i, i)
    table.insert(icons, {
      icon = (
        ((insight == "a") and "__space-exploration-graphics__/graphics/icons/catalogue/astronomic-insight.png") or
        ((insight == "s") and "__space-exploration-graphics__/graphics/icons/catalogue/energy-insight.png") or
        ((insight == "b") and "__space-exploration-graphics__/graphics/icons/catalogue/biological-insight.png") or
        ((insight == "m") and "__space-exploration-graphics__/graphics/icons/catalogue/material-insight.png")
      ),
      icon_minimaps = 4,
      icon_size = 64,
      shift = {
        (i-1-(#insights-1)/2)*128/#insights,  --evenly spread icons on the x-axis
        42
      },
      scale = 0.7,
    })
  end
  return icons
end

data:extend({
  -- alphabetical

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-science-pack",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rocket-science-pack", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/beaker/orange.png",
    icon_size = 256,
    order = "g-e-c",
    prerequisites = {
      "rocket-silo",
      "speed-module",
      "advanced-material-processing-2",
    },
    unit = {
     count = 500,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = "space-science-pack",
    effects = {
     { type = "unlock-recipe", recipe = "space-science-pack", },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-1.png", icon_size = 128},
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-1.png", icon_size = 128},
    },
    order = "g-e-d",
    prerequisites = {
      data_util.mod_prefix .. "space-science-lab",
      data_util.mod_prefix .. "space-decontamination-facility",
      data_util.mod_prefix .. "rocket-landing-pad",
    },
    unit = {
     count = 500,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = "utility-science-pack",
    effects = {
     { type = "unlock-recipe", recipe = "utility-science-pack", },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-2.png", icon_size = 128},
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-2.png", icon_size = 128},
    },
    order = "g-e-d",
    prerequisites = {
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "processing-cryonite"
    },
    unit = {
     count = 500,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = "energy-shield-mk3-equipment",
    effects = {
     { type = "unlock-recipe", recipe = "energy-shield-mk3-equipment", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/energy-shield-green.png", 128),
    order = "g-e-c",
    prerequisites = {
      "energy-shield-mk2-equipment",
    },
    unit = {
     count = 1000,
     time = 60,
     ingredients = {}
    },
  },
  {
    type = "technology",
    name = "energy-shield-mk4-equipment",
    effects = {
     { type = "unlock-recipe", recipe = "energy-shield-mk4-equipment", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/energy-shield-cyan.png", 128),
    order = "g-e-d",
    prerequisites = {
      "energy-shield-mk3-equipment",
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {}
    },
  },
  {
    type = "technology",
    name = "energy-shield-mk5-equipment",
    effects = {
     { type = "unlock-recipe", recipe = "energy-shield-mk5-equipment", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/energy-shield-blue.png", 128),
    order = "g-e-e",
    prerequisites = {
      data_util.mod_prefix.."nanomaterial",
      "energy-shield-mk4-equipment",
    },
    unit = {
     count = 4000,
     time = 60,
     ingredients = {}
    },
  },
  {
    type = "technology",
    name = "energy-shield-mk6-equipment",
    effects = {
     { type = "unlock-recipe", recipe = "energy-shield-mk6-equipment", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/energy-shield-magenta.png", 128),
    order = "g-e-f",
    prerequisites = {
      "energy-shield-mk5-equipment",
    },
    unit = {
     count = 8000,
     time = 60,
     ingredients = {}
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-1",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-1", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/adaptive-armour-1.png", 128),
    order = "e-g",
    prerequisites = {
      "chemical-science-pack",
      "battery",
      "modular-armor",
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-2",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-2", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/adaptive-armour-2.png", 128),
    order = "e-g",
    prerequisites = {
      "military-science-pack",
      "low-density-structure",
      "advanced-electronics-2",
      data_util.mod_prefix .. "adaptive-armour-1",
    },
    unit = {
     count = 200,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-3",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-3", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/adaptive-armour-3.png", 128),
    order = "e-g",
    prerequisites = {
      "space-science-pack",
      data_util.mod_prefix .. "adaptive-armour-2",
    },
    unit = {
     count = 300,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-4",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-4", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/adaptive-armour-4.png", 128),
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack-1",
      data_util.mod_prefix .. "adaptive-armour-3",
    },
    unit = {
     count = 400,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       {  data_util.mod_prefix .. "material-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "adaptive-armour-5",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "adaptive-armour-equipment-5", },
    },
    icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/adaptive-armour-5.png", 128),
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "nanomaterial",
      data_util.mod_prefix .. "material-science-pack-4",
      data_util.mod_prefix .. "adaptive-armour-4",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "military-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "biological-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "aeroframe-pole",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "aeroframe-pole", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/aeroframe-pole.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-beryllium",
      data_util.mod_prefix .. "astronomic-science-pack-1",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "aeroframe-scaffold",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "aeroframe-scaffold", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/aeroframe-scaffold.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "aeroframe-pole",
      data_util.mod_prefix .. "astronomic-science-pack-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "low-density-structure-beryllium",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "low-density-structure-beryllium"},
    },
    icons = {
      { icon = "__base__/graphics/technology/low-density-structure.png", scale = 1, icon_size = 256, shift = {12, 12}  },
      { icon ="__space-exploration-graphics__/graphics/technology/aeroframe-scaffold.png" , scale = 1, icon_size = 128, shift = {-64, -64} },
    },
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "aeroframe-scaffold",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "aeroframe-bulkhead",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "aeroframe-bulkhead", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/aeroframe-bulkhead.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "aeroframe-scaffold",
      data_util.mod_prefix .. "astronomic-science-pack-3",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "antimatter-reactor",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "antimatter-reactor", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/antimatter-reactor.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "nuclear-power",
      data_util.mod_prefix .. "antimatter-production"
    },
    unit = {
     count = 1000,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "astronomic-science-pack-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-science-pack-1", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-beryllium",
      data_util.mod_prefix .. "space-catalogue-astronomic-1",
      data_util.mod_prefix .. "space-hypercooling-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "astronomic-science-pack-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-science-pack-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-2"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "astronomic-science-pack-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-science-pack-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-3"
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "astronomic-science-pack-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-science-pack-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-astronomic-4"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "biological-science-pack-1",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "biological-science-pack-1",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-vitamelange",
      data_util.mod_prefix .. "space-catalogue-biological-1",
      data_util.mod_prefix .. "space-hypercooling-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1},
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "biological-science-pack-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-science-pack-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-2",
      data_util.mod_prefix .. "bioscrubber"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "biological-science-pack-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-science-pack-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-3"
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
       { data_util.mod_prefix .. "biological-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "biological-science-pack-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-science-pack-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-biological-4"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
       { data_util.mod_prefix .. "biological-science-pack-2", 1 },
       { data_util.mod_prefix .. "biological-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "core-miner",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "core-miner",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pyroflux-steam",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/core-miner.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     "oil-processing",
     data_util.mod_prefix .. "pulveriser",
     "electric-mining"
    },
    unit = {
     count = 200,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "centrifuge",
    icon_size = 256, icon_mipmaps = 1,
    icon = "__space-exploration-graphics__/graphics/technology/centrifuge.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "centrifuge"
      },
    },
    prerequisites = {"advanced-electronics-2"},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {data_util.mod_prefix .. "rocket-science-pack", 1}
      },
      time = 30,
      count = 200
    },
    order = "e-p-b-c"
  },
  {
    type = "technology",
    name = "steam-turbine",
    icon_size = 256,
    icon_mipmaps = 1,
    icon = "__space-exploration-graphics__/graphics/technology/steam-turbine.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "steam-turbine"
      },
    },
    prerequisites = {
      "steam-power",
      data_util.mod_prefix .. "electric-boiler"
    },
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30,
      count = 100
    },
    order = "e-p-b-c"
  },
  {
     name = data_util.mod_prefix .. "cryogun",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryogun" },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryogun-ammo" }
     },
     icon = "__space-exploration-graphics__/graphics/technology/cryogun.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "military-4",
       data_util.mod_prefix .. "aeroframe-pole",
       data_util.mod_prefix .. "processing-cryonite",
       data_util.mod_prefix .. "space-thermodynamics-laboratory",
       data_util.mod_prefix .. "space-hypercooling-2",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "military-science-pack", 1},
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       },
       time = 60
     }
  },
  {
     name = data_util.mod_prefix .. "meteor-point-defence",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-point-defence" },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-point-defence-ammo" }
     },
     icons = {
       {icon="__space-exploration-graphics__/graphics/technology/meteor-point-defence-base.png", icon_size = 128},
       {icon="__space-exploration-graphics__/graphics/technology/meteor-point-defence-mask.png", icon_size = 128, tint = {r=255,g=0,b=0}}
     },
     order = "g-b-z",
     prerequisites = {
       "steel-processing",
       "concrete",
       "electronics",
       "glass-processing",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
       },
       time = 30
     }
  },
  {
     name = data_util.mod_prefix .. "meteor-defence",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-defence" },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."meteor-defence-ammo" }
     },
     icon = "__space-exploration-graphics__/graphics/technology/meteor-defence.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "laser",
       "advanced-electronics-2",
       "battery",
       data_util.mod_prefix .. "meteor-point-defence",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       },
       time = 30
     }
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-catalogue-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "deep-catalogue-1", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nano-engineering-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-structural-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-energy-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "void-probe" },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/base-catalogue-1.png", icon_size = 128},
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-catalogue-1.png", icon_size = 128},
    },
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-naquium",
      data_util.mod_prefix .. "nanomaterial",
      data_util.mod_prefix .. "energy-science-pack-4",
      data_util.mod_prefix .. "biological-science-pack-4",
      data_util.mod_prefix .. "space-supercomputer-3",
    },
    unit = {
     count = 1000,
     time = 60,
     ingredients = {
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "biological-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-catalogue-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "deep-catalogue-2", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "singularity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "hyperlattice-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "timespace-anomaly-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "annihilation-data" },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/base-catalogue-2.png", icon_size = 128},
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-catalogue-2.png", icon_size = 128},
    },
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "antimatter-production",
      data_util.mod_prefix .. "deep-space-science-pack-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-catalogue-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "deep-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-fold-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-fold-data-alt" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-warp-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-warp-data-alt" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-dilation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-dilation-data-alt" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-injection-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-injection-data-alt" },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/base-catalogue-3.png", icon_size = 128},
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-catalogue-3.png", icon_size = 128},
    },
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "naquium-tessaract",
      data_util.mod_prefix .. "deep-space-science-pack-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-catalogue-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "deep-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "interstellar-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "teleportation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "wormhole-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rhga-data" },
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/base-catalogue-4.png", icon_size = 128},
      {icon = "__space-exploration-graphics__/graphics/technology/catalogue/mask-catalogue-4.png", icon_size = 128},
    },
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "nexus",
      data_util.mod_prefix .. "deep-space-science-pack-3",
    },
    unit = {
     count = 5000,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-space-science-pack-1",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "deep-space-science-pack-1",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-catalogue-1",
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "biological-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-space-science-pack-2",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "deep-space-science-pack-2",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-catalogue-2",
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-space-science-pack-3",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "deep-space-science-pack-3",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-catalogue-3",
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "deep-space-science-pack-4",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "deep-space-science-pack-4",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/deep-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-catalogue-4",
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-3", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "energy-science-pack-1",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "energy-science-pack-1",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-holmium",
      data_util.mod_prefix .. "space-catalogue-energy-1",
      data_util.mod_prefix .. "space-hypercooling-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "energy-science-pack-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-science-pack-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-energy-2"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "energy-science-pack-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-science-pack-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-energy-3"
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "energy-science-pack-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-science-pack-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-energy-4"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
       { data_util.mod_prefix .. "energy-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "fluid-burner-generator",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "fluid-burner-generator", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/fluid-burner-generator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-radiator-1",
      data_util.mod_prefix .. "condenser-turbine"
    },
    unit = {
     count = 200,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "fuel-refining",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "fuel-refinery", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/fuel-refinery.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "oil-processing"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "heat-shielding",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "heat-shielding",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/heat-shielding.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "chemical-science-pack"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "heavy-girder",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "heavy-girder", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/heavy-girder.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-iridium",
      data_util.mod_prefix .. "material-science-pack-1",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "heavy-bearing",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "heavy-bearing", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/heavy-bearing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "heavy-girder",
      data_util.mod_prefix .. "material-science-pack-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "heavy-composite",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "heavy-composite", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/heavy-composite.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "heavy-bearing",
      data_util.mod_prefix .. "material-science-pack-3",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "heavy-assembly",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "heavy-assembly", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/heavy-assembly.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "heavy-composite",
      data_util.mod_prefix .. "material-science-pack-4",
    },
    unit = {
     count = 400,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "holmium-cable",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-cable", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/holmium-cable.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-holmium",
      data_util.mod_prefix .. "energy-science-pack-1",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-unit-holmium",
    effects = {
	    { type = "unlock-recipe", recipe = data_util.mod_prefix .. "processing-unit-holmium", },
    },
    icons = {
      { icon = "__base__/graphics/technology/advanced-electronics-2.png", scale = 1, icon_size = 256, shift = {12, 12} },
      { icon = "__space-exploration-graphics__/graphics/technology/holmium-cable.png" , scale = 1, icon_size = 128, shift = {-64, -64} },
    },
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "holmium-cable",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "holmium-solenoid",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-solenoid", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/holmium-solenoid.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "holmium-cable",
      data_util.mod_prefix .. "energy-science-pack-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "ion-engine",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "spaceship-ion-engine" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "spaceship-ion-booster-tank" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/ion-engine.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "spaceship",
      data_util.mod_prefix .. "holmium-solenoid",
    },
    unit = {
     count = 1600,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack-3", 1 },
       { data_util.mod_prefix .."energy-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "quantum-processor",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "quantum-processor", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/quantum-processor.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "holmium-solenoid",
      data_util.mod_prefix .. "energy-science-pack-3",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "dynamic-emitter",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "dynamic-emitter", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/dynamic-emitter.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "quantum-processor",
      data_util.mod_prefix .. "energy-science-pack-4",
    },
    unit = {
     count = 400,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "lattice-pressure-vessel",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lattice-pressure-vessel", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/lattice-pressure-vessel.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "aeroframe-bulkhead",
      data_util.mod_prefix .. "astronomic-science-pack-4",
    },
    unit = {
     count = 400,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "long-range-star-mapping",
    effects = {},
    icon = "__space-exploration-graphics__/graphics/technology/long-range-star-mapping.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack-2",
    },
    max_level = "30", -- probably shouldn't go over 40
    unit = {
     count_formula = "1.25^L*100",
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
     }
    },
    enabled = false -- unlocked by building gate
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "dimensional-anchor",
    effects = {
      {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "dimensional-anchor",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/dimensional-anchor.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "naquium-tessaract",
    },
    unit = {
     count_formula = "1000",
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-3", 1 },
     }
    },
    enabled = false -- unlocked by building gate
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "material-science-pack-1",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "material-science-pack-1",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-iridium",
      data_util.mod_prefix .. "space-catalogue-material-1",
      data_util.mod_prefix .. "space-hypercooling-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1},
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "material-science-pack-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-science-pack-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-2"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "material-science-pack-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-science-pack-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-3"
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "material-science-pack-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-science-pack-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-catalogue-material-4"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
       { data_util.mod_prefix .. "material-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-1.png",
    icon_size = 128,
    order = "a-a-a",
    unit = {
     count = 10,
     time = 10,
     ingredients = {
       { "automation-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack-2",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-plastic", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-2", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-2.png",
    icon_size = 128,
    order = "a-a-b",
    prerequisites = {
      data_util.mod_prefix .. "lifesupport-facility",
      data_util.mod_prefix .. "medpack"
    },
    unit = {
     count = 200,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack-3",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-3", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-3.png",
    icon_size = 128,
    order = "a-b",
    prerequisites = {
      data_util.mod_prefix .. "biological-science-pack-1",
      data_util.mod_prefix .. "medpack-2"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "medpack-4",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "medpack-4", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/medpack-4.png",
    icon_size = 128,
    order = "a-c",
    prerequisites = {
      data_util.mod_prefix .. "self-sealing-gel",
      data_util.mod_prefix .. "biological-science-pack-4",
      data_util.mod_prefix .. "medpack-3",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack-4", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "naquium-cube",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-cube", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/naquium-cube.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "naquium-tessaract",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-tessaract", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-tessaract-alt", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/naquium-tessaract.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "arcosphere-folding",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "naquium-processor",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-processor", },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-processor-alt", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/naquium-processor.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack-3",
    },
    unit = {
     count = 1000,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "deep-space-science-pack-3", 1 },
     }
    },
  },

  {
     name = data_util.mod_prefix .. "plague",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "plague-bomb" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/plague.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "military-4",
       "rocketry",
       data_util.mod_prefix .. "biological-science-pack-4",
     },
     type = "technology",
     unit = {
       count = 1000,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "military-science-pack", 1},
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack-4", 1 },
       },
       time = 60
     }
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-beryllium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "beryllium-sulfate"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "beryllium-hydroxide"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "beryllium-powder"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "beryllium-ingot-no-vulcanite"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "beryllium-ingot-to-plate"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/beryllium-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "processing-cryonite",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pyroflux-smelting-beryllium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "molten-beryllium"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "beryllium-ingot"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/pyroflux-smelting-beryllium.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "pyroflux-smelting",
      data_util.mod_prefix .. "processing-beryllium",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "cargo-rocket-section-beryllium",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section-beryllium", },
    },
    icons = {
      { icon = "__space-exploration-graphics__/graphics/icons/cargo-rocket-section.png", scale = 1, icon_size = 64, shift = {3, 3} },
      { icon = "__space-exploration-graphics__/graphics/technology/beryllium-processing.png" , scale = .25, icon_size = 128, shift = {-16, -16} },
    },
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "processing-beryllium",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-cryonite",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-powder"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-crystal"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-rod"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-ion-exchange-beads"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-slush"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/cryonite-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "pulveriser",
     "industrial-furnace",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "cryonite-lubricant",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-lubricant"},
    },
    icons = {
      { icon = "__base__/graphics/technology/lubricant.png" , scale = 1, icon_size = 256, shift = {12, 12} },
      { icon = "__space-exploration-graphics__/graphics/technology/cryonite-processing.png", scale = 1, icon_size = 128, shift = {-64, -64} },
    },
    order = "e-g",
    prerequisites = {
     "lubricant",
     data_util.mod_prefix .. "processing-cryonite",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-water-ice",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-to-water-ice"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "melting-water-ice"},
    },
    icon = "__space-exploration-graphics__/graphics/icons/water-ice.png",
    icon_size = 64,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "processing-cryonite",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-methane-ice",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryonite-to-methane-ice"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "melting-methane-ice"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "processed-fuel-from-solid-fuel"},
    },
    icon = "__space-exploration-graphics__/graphics/icons/methane-ice.png",
    icon_size = 64,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "processing-cryonite",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-holmium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-ore-crushed"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-powder"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-chloride"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-ingot-no-vulcanite"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-ingot-to-plate"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/holmium-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "processing-cryonite",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pyroflux-smelting-holmium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "molten-holmium"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "holmium-ingot"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/pyroflux-smelting-holmium.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "pyroflux-smelting",
      data_util.mod_prefix .. "processing-holmium",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-iridium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iridium-ore-crushed"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iridium-powder"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iridium-blastcake"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iridium-ingot"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iridium-ingot-to-plate"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/iridium-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "pyroflux-smelting",
      "area-mining-drill",
      "production-science-pack",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "heat-shielding-iridium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "heat-shielding-iridium"},
    },
    icons = {
      {icon = "__space-exploration-graphics__/graphics/technology/heat-shielding.png", scale = 1, icon_size = 128, shift = {6, 6} },
      {icon = "__space-exploration-graphics__/graphics/technology/iridium-processing.png", scale = 0.5, icon_size = 128, shift = {-32, -32} },
    },
    order = "e-g",
    prerequisites = {
      "production-science-pack",
      data_util.mod_prefix .. "processing-iridium",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-naquium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-ore-crushed"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-refined"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-powder"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-crystal"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-ingot"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-ingot-to-plate"},
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-heat-pipe", },
      --{ type = "unlock-recipe", recipe = data_util.mod_prefix .. "naquium-heat-pipe-long", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/naquium-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack-4",
      data_util.mod_prefix .. "astronomic-science-pack-4"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
     }
    },
  },
  --[[{
    type = "technology",
    name = data_util.mod_prefix .. "enriched-naquium",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "enriched-naquium"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/naquium-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "deep-space-science-pack-1"
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
     }
    },
  },]]
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-vitamelange",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitamelange-nugget"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitamelange-bloom"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitamelange-spice"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitamelange-extract"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/vitamelange-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "processing-vulcanite",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "processing-vulcanite",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vulcanite-crushed"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vulcanite-enriched"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vulcanite-block"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "pyroflux"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "vulcanite-ion-exchange-beads"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/vulcanite-processing.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "core-miner",
     "industrial-furnace",
     data_util.mod_prefix .. "centrifuge",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pyroflux-smelting",
    effects = {
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "casting-machine"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "molten-iron"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iron-ingot"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "iron-ingot-to-plate"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "steel-ingot"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "steel-ingot-to-plate"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "molten-copper"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "copper-ingot"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "copper-ingot-to-plate"},
      --{type = "unlock-recipe", recipe = data_util.mod_prefix .. "stone-brick-vulcanite"},
      {type = "unlock-recipe", recipe = data_util.mod_prefix .. "glass-vulcanite"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/pyroflux-smelting.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "processing-vulcanite",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "vulcanite-rocket-fuel",
    effects = {
     { type = "unlock-recipe",  recipe = data_util.mod_prefix .. "vulcanite-rocket-fuel", }
    },
    icons = {
      { icon = "__base__/graphics/technology/rocket-fuel.png", scale = 1, icon_size = 256, shift = {12, 12} },
      { icon = "__space-exploration-graphics__/graphics/technology/vulcanite-processing.png", scale = 1, icon_size = 128, shift = {-64, -64} },
    },
    order = "e-g",
    prerequisites = {
      "rocket-fuel",
      data_util.mod_prefix .. "processing-vulcanite"
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pulveriser",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pulveriser",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pulverised-sand"
      }
    },
    icon = "__space-exploration-graphics__/graphics/technology/pulveriser.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     "fluid-handling",
     "concrete",
     "steel-processing",
    },
    unit = {
     count = 150,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "addon-power-pole",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "addon-power-pole",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/addon-power-pole.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "aeroframe-pole",
     data_util.mod_prefix .. "holmium-cable",
    },
    unit = {
     count = 50,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pylon",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pylon",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/pylon.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "aeroframe-pole",
     data_util.mod_prefix .. "holmium-cable",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pylon-substation",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pylon-substation",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/pylon-substation.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "pylon",
     data_util.mod_prefix .. "holmium-solenoid",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pylon-construction",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pylon-construction",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/pylon-construction.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "pylon",
     data_util.mod_prefix .. "holmium-solenoid",
     data_util.mod_prefix .. "aeroframe-scaffold",
     data_util.mod_prefix .. "heavy-girder",
     data_util.mod_prefix .. "material-science-pack-2",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "pylon-construction-radar",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "pylon-construction-radar",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/pylon-construction-radar.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "pylon-construction",
     data_util.mod_prefix .. "quantum-processor",
     data_util.mod_prefix .. "aeroframe-bulkhead",
     data_util.mod_prefix .. "heavy-bearing",
     data_util.mod_prefix .. "material-science-pack-3",
    },
    unit = {
     count = 300,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-3", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
       { data_util.mod_prefix .. "material-science-pack-3", 1 },
     }
    },
  },

  {
     name = data_util.mod_prefix .. "railgun",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "railgun" },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "railgun-ammo" }
     },
     icon = "__space-exploration-graphics__/graphics/technology/railgun.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "military-4",
       data_util.mod_prefix .. "space-electromagnetics-laboratory",
       data_util.mod_prefix .. "material-science-pack-1",
       data_util.mod_prefix .. "heavy-girder",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "military-science-pack", 1},
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "material-science-pack-1", 1 },
       },
       time = 60
     }
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-fuel-from-water",
    effects = {
     { type = "unlock-recipe",  recipe = data_util.mod_prefix .. "rocket-fuel-from-water-copper", }
    },
    icons = {
      { icon = "__base__/graphics/technology/rocket-fuel.png", scale = 1, icon_size = 256, shift = {12, 12} },
      { icon = "__space-exploration-graphics__/graphics/icons/fluid/water.png", scale = 2, icon_size = 64, shift = {-64, -64} },
    },
    order = "e-g",
    prerequisites = {
     "rocket-fuel"
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-landing-pad",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rocket-landing-pad", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section-pack", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section-unpack", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-landing-pad.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "rocket-launch-pad"
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-launch-pad",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-capsule", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-capsule-refurbish", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-section", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-cargo-pod", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cargo-rocket-fuel-tank", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rocket-launch-pad", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-launch-pad.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
     data_util.mod_prefix .. "thruster-suit"
    },
    unit = {
     count = 500,
     time = 15,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
    visible_when_disabled = true,
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-capsule-navigation",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/space-capsule-navigation.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
     "space-science-pack"
    },
    unit = {
     count = 50,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
    visible_when_disabled = true,
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-1",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = { data_util.mod_prefix .. "rocket-launch-pad" },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-2",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-cargo-safety-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-3",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-cargo-safety-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-cargo-safety-4",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-cargo-safety.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-cargo-safety-3",
    },
    max_level = "infinite",
    unit = {
     count_formula = "2^L",
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
    upgrade = true
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-1",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-landing-pad"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-2",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-reusability-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-3",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-reusability-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-reusability-4",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-reusability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-reusability-3",
    },
    max_level = "20",
    unit = {
     count_formula = "2^L",
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
    upgrade = true
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-1",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-landing-pad"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-2",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-survivability-1",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-3",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-survivability-2",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "rocket-survivability-4",
    effects = { },
    icon = "__space-exploration-graphics__/graphics/technology/rocket-survivability.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-survivability-3",
     },
    max_level = "infinite",
    unit = {
     count_formula = "2^L",
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
    upgrade = true
  },

  {
     name = data_util.mod_prefix .. "rtg-equipment",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."rtg-equipment" },
     },
     icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/rtg-equipment.png", 128),
     order = "g-b-z",
     prerequisites = {
       "advanced-electronics-2",
       "low-density-structure",
       "solar-panel-equipment",
       "uranium-processing",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       },
       time = 30
     }
  },
  {
     name = data_util.mod_prefix .. "rtg-equipment-2",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .."rtg-equipment-2" },
     },
     icons = data_util.technology_icon_constant_equipment("__space-exploration-graphics__/graphics/technology/rtg-equipment-2.png", 128),
     order = "g-b-z",
     prerequisites = {
       data_util.mod_prefix .. "rtg-equipment",
       data_util.mod_prefix .. "energy-science-pack-2",
       data_util.mod_prefix .. "holmium-solenoid",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-2", 1 }
       },
       time = 60
     }
  },


  {
     name = data_util.mod_prefix .. "space-accumulator",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-accumulator" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/accumulator.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       "electric-energy-accumulators",
       data_util.mod_prefix .. "holmium-cable",
       data_util.mod_prefix .. "heavy-girder",
       data_util.mod_prefix .. "material-science-pack-2"
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "material-science-pack-2", 1 },
         { data_util.mod_prefix .. "energy-science-pack-1", 1 }
       },
       time = 60
     }
  },
  {
     name = data_util.mod_prefix .. "space-accumulator-2",
     effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-accumulator-2" },
     },
     icon = "__space-exploration-graphics__/graphics/technology/accumulator-2.png",
     icon_size = 128,
     order = "g-b-z",
     prerequisites = {
       data_util.mod_prefix .. "space-accumulator",
       data_util.mod_prefix .. "superconductive-cable",
       data_util.mod_prefix .. "naquium-cube",
     },
     type = "technology",
     unit = {
       count = 200,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "material-science-pack-4", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       },
       time = 60
     },
     localised_name = {"technology-name."..data_util.mod_prefix .. "space-accumulator-2"},
     localised_description = {"technology-description."..data_util.mod_prefix .. "space-accumulator-2"}
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-astrometrics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-astrometrics-laboratory"},
    },
    icon = "__space-exploration-graphics__/graphics/technology/astrometrics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-assembling",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-assembling-machine" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-assembling.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "rocket-launch-pad",
      data_util.mod_prefix .. "delivery-cannon",
      "automation-2"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-belt",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-transport-belt", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-underground-belt", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-splitter", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-belt.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      "logistics-2",
      data_util.mod_prefix .. "space-assembling"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-pipe",
    effects = {
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-pipe", },
     { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-pipe-to-ground", },
    },
    icon = "__base__/graphics/technology/fluid-handling.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-assembling"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "condenser-turbine",
    effects = {
     { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "condenser-turbine" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/condenser-turbine.png",
    icon_size = 256,
    order = "e-g",
    prerequisites = {
      "space-science-pack",
      "steam-turbine"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-biochemical-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-biochemical-laboratory" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "melting-methane-ice" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "chemical-gel" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-mirror" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-mirror-alternate" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/biochemical-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-manufactory"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-a" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astrometric-analysis-multispectral-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "visible-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "uv-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "infrared-observation-data" },
      --{ type = "unlock-recipe", recipe = data_util.mod_prefix .. "doppler-shift-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-catalogue-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "utility-science-pack",
      data_util.mod_prefix .. "space-astrometrics-laboratory",
      data_util.mod_prefix .. "space-laser-laboratory",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astrometric-analysis-multispectral-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "microwave-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "xray-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gravitational-lensing-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gravity-wave-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-catalogue-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "astronomic-science-pack-1",
      data_util.mod_prefix .. "space-telescope-xray",
      data_util.mod_prefix .. "space-telescope-microwave",
      data_util.mod_prefix .. "aeroframe-pole",
      data_util.mod_prefix .. "space-gravimetrics-laboratory",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astrometric-analysis-multispectral-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radio-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gammaray-observation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "negative-pressure-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "darkmatter-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-catalogue-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "astronomic-science-pack-2",
      data_util.mod_prefix .. "space-telescope-gammaray",
      data_util.mod_prefix .. "space-telescope-radio",
      data_util.mod_prefix .. "aeroframe-scaffold",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-astronomic-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "astronomic-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "dark-energy-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "micro-black-hole-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "zero-point-energy-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "belt-probe" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/astronomic-catalogue-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "astronomic-science-pack-3",
      data_util.mod_prefix .. "space-particle-collider",
      data_util.mod_prefix .. "space-electromagnetics-laboratory",
      data_util.mod_prefix .. "aeroframe-bulkhead",
      data_util.mod_prefix .. "space-probe",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-b" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-combustion-data" },
      --{ type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-spectral-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biomechanical-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biochemical-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-catalogue-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "production-science-pack",
      data_util.mod_prefix .. "space-genetics-laboratory",
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "space-mechanical-laboratory",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-genetic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biochemical-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biomechanical-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-combustion-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-specimen" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-crude-oil" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "thermodynamics-coal" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-catalogue-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "biological-science-pack-1",
      data_util.mod_prefix .. "vitalic-acid",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bioelectrics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "decompression-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cryogenics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-exposure-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "neural-gel-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "significant-specimen" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-catalogue-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "biological-science-pack-2",
      data_util.mod_prefix .. "space-radiation-laboratory",
      data_util.mod_prefix .. "vitalic-reagent",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
       { data_util.mod_prefix .. "biological-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-biological-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "biological-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "comparative-genetic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "decompression-resistance-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "neural-anomaly-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-exposure-resistance-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/biological-catalogue-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "biological-science-pack-3",
      data_util.mod_prefix .. "vitalic-epoxy",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "biological-science-pack-1", 1 },
       { data_util.mod_prefix .. "biological-science-pack-2", 1 },
       { data_util.mod_prefix .. "biological-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-m" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "cold-thermodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "hot-thermodynamics-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "tensile-strength-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "compressive-strength-data" },
      --{ type = "unlock-recipe", recipe = data_util.mod_prefix .. "shear-strength-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-catalogue-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "production-science-pack",
      data_util.mod_prefix .. "space-supercomputer-1",
      data_util.mod_prefix .. "space-mechanical-laboratory",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "rigidity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "impact-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "pressure-containment-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "corrosion-resistance-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-catalogue-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack-1",
      data_util.mod_prefix .. "space-biochemical-laboratory",
      data_util.mod_prefix .. "heavy-girder",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "friction-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "ballistic-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "explosion-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-shielding-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-catalogue-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack-2",
      data_util.mod_prefix .. "space-radiation-laboratory",
      data_util.mod_prefix .. "heavy-bearing",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-material-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "electrical-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "laser-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "particle-beam-shielding-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-alloys-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/material-catalogue-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "material-science-pack-3",
      data_util.mod_prefix .. "space-electromagnetics-laboratory",
      data_util.mod_prefix .. "space-laser-laboratory",
      data_util.mod_prefix .. "space-particle-collider",
      data_util.mod_prefix .. "heavy-composite",
      data_util.mod_prefix .. "space-platform-plating",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
       { data_util.mod_prefix .. "material-science-pack-3", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-1",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-s" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-1" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "conductivity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "electromagnetic-field-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "polarisation-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "radiation-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-1.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "utility-science-pack",
      data_util.mod_prefix .. "space-laser-laboratory",
      data_util.mod_prefix .. "space-radiation-laboratory",
      data_util.mod_prefix .. "space-electromagnetics-laboratory",
      data_util.mod_prefix .. "space-particle-accelerator",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-2",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-2" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "atomic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "subatomic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "quantum-phenomenon-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "forcefield-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-2.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack-1",
      data_util.mod_prefix .. "space-particle-collider",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-3",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-3" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "superconductivity-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "entanglement-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "quark-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lepton-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-3.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack-2",
      data_util.mod_prefix .. "holmium-solenoid",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-energy-4",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-insight-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "energy-catalogue-4" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "boson-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "fusion-test-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "magnetic-monopole-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "star-probe" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/energy-catalogue-4.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack-3",
      data_util.mod_prefix .. "space-supercomputer-2",
      data_util.mod_prefix .. "space-probe",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       { data_util.mod_prefix .. "energy-science-pack-2", 1 },
       { data_util.mod_prefix .. "energy-science-pack-3", 1 },
     }
    },
  },
--[[
  {
    type = "technology",
    name = data_util.mod_prefix .. "space-catalogue-universal",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "universal-catalogue" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/catalogue/universal-catalogue.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-supercomputer-3",
      data_util.mod_prefix .. "astronomic-science-pack-4",
      data_util.mod_prefix .. "energy-science-pack-4",
      data_util.mod_prefix .. "biological-science-pack-4",
      data_util.mod_prefix .. "material-science-pack-4",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "biological-science-pack-4", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
     }
    },
  },
  ]]

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-data-card",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "data-storage-substrate" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "data-storage-substrate-cleaned" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "data-storage-substrate-cleaned-chemical" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "empty-data" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/data-card.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-biochemical-laboratory",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-decontamination-facility",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-decontamination-facility" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-water" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-decontamination" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-water-decontamination" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "scrap-decontamination" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "used-lifesupport-canister-cleaning-space" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/decontamination-facility.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-pipe",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "rocket-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-electromagnetics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-electromagnetics-laboratory", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/electromagnetics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "utility-science-pack",
      "electric-energy-accumulators",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-genetics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-genetics-laboratory" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "experimental-bioculture" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bioculture" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "genetic-data" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "neural-gel" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "specimen" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "specimen-fish" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "specimen-wood" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-canister-specimen" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nutrient-gel" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nutrient-gel-methane" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nutrient-vat" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/genetics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "production-science-pack",
      data_util.mod_prefix .. "space-growth-facility"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-gravimetrics-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-gravimetrics-laboratory" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/gravimetrics-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-astrometrics-laboratory",
      data_util.mod_prefix .. "aeroframe-pole",
      data_util.mod_prefix .. "astronomic-science-pack-1",
    },
    unit = {
     count = 50,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1}
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-growth-facility",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-growth-facility" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-methane-to-crude-oil" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-from-wood" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-from-fish" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/growth-facility.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "production-science-pack"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
     }
    },
  },



  {
    type = "technology",
    name = data_util.mod_prefix .. "space-hypercooling-1",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-hypercooler",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-cold",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/hypercooler.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-radiator-1"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1}
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-hypercooling-2",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-supercooled",
      },
    },
    icon = "__space-exploration-graphics__/graphics/technology/hypercooler.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "utility-science-pack",
      data_util.mod_prefix .. "space-hypercooling-1",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-hypercooling-3",
    effects = {
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-cold-cryonite",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-supercooled-cryonite",
      },
      {
        type = "unlock-recipe",
        recipe = data_util.mod_prefix .. "space-coolant-cryonite",
      }
    },
    icon = "__space-exploration-graphics__/graphics/technology/hypercooler.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-hypercooling-2",
      data_util.mod_prefix .. "energy-science-pack-1",
      data_util.mod_prefix .. "processing-cryonite",
    },
    unit = {
     count = 200,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-laser-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-laser-laboratory" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/laser-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "laser-turret",
      "utility-science-pack",
      "electric-energy-accumulators",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "lifesupport-facility",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-facility" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "canister" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "empty-lifesupport-canister" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-canister-fish" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "lifesupport-canister-coal" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "used-lifesupport-canister-cleaning" },

    },
    icon = "__space-exploration-graphics__/graphics/technology/lifesupport-facility.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "low-density-structure",
      "automation-2",
      "electric-engine",
      data_util.mod_prefix .. "recycling-facility",
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-manufactory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-manufactory" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "material-testing-pack" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-manufactory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "fast-inserter",
      "space-science-pack"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-material-fabricator",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-material-fabricator" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-dirty" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/material-fabricator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "energy-science-pack-4",
      data_util.mod_prefix .. "material-science-pack-2",
      data_util.mod_prefix .. "space-hypercooling-2",
      "speed-module-6",
      "effectivity-module-6",
    },
    unit = {
     count = 250,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-matter-fusion",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-iron" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-copper" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-stone" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-uranium" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-beryllium" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-holmium" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-iridium" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-vulcanite" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "matter-fusion-cryonite" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/material-fabricator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-material-fabricator",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 500,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-2", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "nanomaterial",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "nanomaterial" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/nanomaterial.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-material-fabricator",
      data_util.mod_prefix .. "astronomic-science-pack-4",
      data_util.mod_prefix .. "dynamic-emitter",
      data_util.mod_prefix .. "material-science-pack-4",
      data_util.mod_prefix .. "biological-science-pack-4",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 250,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-4", 1},
       { data_util.mod_prefix .. "energy-science-pack-4", 1 },
       { data_util.mod_prefix .. "material-science-pack-4", 1 },
       { data_util.mod_prefix .. "biological-science-pack-4", 1 }
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-mechanical-laboratory",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-mechanical-laboratory" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/mechanical-laboratory.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "gun-turret",
      "production-science-pack",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "production-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-rail",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-rail" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-rail.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "railway",
      data_util.mod_prefix .. "holmium-cable"
    },
    unit = {
     count = 50,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "energy-science-pack-1", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-blank" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-blank-beryllium" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-visible" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-uv" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-infrared" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-hypercooling-1",
      "utility-science-pack",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-xray",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-xray" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-xray" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-xray.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope",
      data_util.mod_prefix .. "astronomic-science-pack-1",
      data_util.mod_prefix .. "aeroframe-pole",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-microwave",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-microwave" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-microwave" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-microwave.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-telescope",
      data_util.mod_prefix .. "astronomic-science-pack-1",
      data_util.mod_prefix .. "aeroframe-pole",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-gammaray",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-gammaray" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "gammaray-detector" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-gammaray" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-gammaray.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "aeroframe-scaffold",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 50,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-telescope-radio",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-telescope-radio" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "observation-frame-radio" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/telescope-radio.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "astronomic-science-pack-2",
      data_util.mod_prefix .. "space-telescope-microwave",
      data_util.mod_prefix .. "aeroframe-scaffold",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 50,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-particle-accelerator",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-particle-accelerator" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "ion-stream" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/particle-accelerator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "laser-turret",
      data_util.mod_prefix .. "space-plasma-generator",
      data_util.mod_prefix .. "space-laser-laboratory"
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-particle-collider",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-particle-collider" },
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "proton-stream" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "particle-stream" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/particle-collider.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-particle-accelerator",
      data_util.mod_prefix .."energy-science-pack-1",
      data_util.mod_prefix .. "holmium-cable",
      "laser-turret",
    },
    unit = {
     count = 10,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .."energy-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "antimatter-production",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "antimatter-stream" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "antimatter-canister" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "empty-antimatter-canister" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/material-fabricator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack-1",
      data_util.mod_prefix .. "naquium-cube",
      data_util.mod_prefix .. "space-hypercooling-2",
    },
    unit = {
     count = 1000,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .."energy-science-pack-4", 1 },
       { data_util.mod_prefix .."material-science-pack-4", 1 },
       { data_util.mod_prefix .."deep-space-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "antimatter-engine",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "spaceship-antimatter-engine" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "spaceship-antimatter-booster-tank" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/antimatter-engine.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "ion-engine",
      data_util.mod_prefix .. "lattice-pressure-vessel",
      data_util.mod_prefix .. "antimatter-production",
      data_util.mod_prefix .. "heavy-assembly"
    },
    unit = {
     count = 2000,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .."energy-science-pack-4", 1 },
       { data_util.mod_prefix .."material-science-pack-4", 1 },
       { data_util.mod_prefix .."deep-space-science-pack-1", 1 },
     }
    },
  },
  {
    type = "technology",
    name = data_util.mod_prefix .. "teleportation",
    effects = {
    },
    icon = "__space-exploration-graphics__/graphics/technology/teleportation.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "deep-space-science-pack-4",
    },
    unit = {
     count = 10000,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "utility-science-pack", 1 },
       { "production-science-pack", 1 },
       { data_util.mod_prefix .."astronomic-science-pack-4", 1 },
       { data_util.mod_prefix .."energy-science-pack-4", 1 },
       { data_util.mod_prefix .."material-science-pack-4", 1 },
       { data_util.mod_prefix .."deep-space-science-pack-4", 1 },
     }
    },
    enabled = true -- if a mod adds teleportation, enable this tech, add it as a prerequiste, and add "se-deep-space-science-pack-4" as an ingredient
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-plasma-generator",
    effects = {
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-plasma-generator" },
      { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "plasma-stream" },
    },
    icon = "__space-exploration-graphics__/graphics/technology/plasma-generator.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "space-thermodynamics-laboratory",
    },
    unit = {
     count = 100,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },


  {
    type = "technology",
    name = data_util.mod_prefix .. "space-platform-plating",
    effects = {
     {
       type = "unlock-recipe",
       recipe = data_util.mod_prefix .. "space-platform-plating",
     },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-platform-plating.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      data_util.mod_prefix .. "heavy-girder",
      data_util.mod_prefix .. "space-platform-scaffold"
    },
    unit = {
     count = 50,
     time = 60,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { data_util.mod_prefix .. "material-science-pack-1", 1 },
     }
    },
  },

  {
    type = "technology",
    name = data_util.mod_prefix .. "space-platform-scaffold",
    effects = {
      { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-platform-scaffold", },
    },
    icon = "__space-exploration-graphics__/graphics/technology/space-platform-scaffold.png",
    icon_size = 128,
    order = "e-g",
    prerequisites = {
      "space-science-pack"
    },
    unit = {
     count = 100,
     time = 30,
     ingredients = {
       { "automation-science-pack", 1 },
       { "logistic-science-pack", 1 },
       { "chemical-science-pack", 1 },
       { "space-science-pack", 1 },
     }
    },
  },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiation-laboratory",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-radiation-laboratory" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiation-laboratory.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "utility-science-pack",
        "uranium-processing",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "utility-science-pack", 1 },
       }
      },
    },



    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiator-1",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "space-coolant",
        },
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "space-radiator",
        },
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "radiating-space-coolant-normal",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-biochemical-laboratory",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiating-efficiency",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "radiating-space-coolant-slow",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-1.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
       data_util.mod_prefix .. "astronomic-science-pack-1"
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiating-speed",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "radiating-space-coolant-fast",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-3.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "energy-science-pack-1"
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-radiator-2",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "space-radiator-2",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/radiator-blue.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "lattice-pressure-vessel",
        data_util.mod_prefix .. "heavy-assembly"
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
         { data_util.mod_prefix .. "material-science-pack-4", 1 },
       }
      },
    },


    {
      type = "technology",
      name = data_util.mod_prefix .. "recycling-facility",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "recycling-facility" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "scrap-recycling" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "broken-data-scrapping" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "empty-barrel-reprocessing" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-capsule-scrapping" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-capsule-scorched-scrapping" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "cargo-pod-scrapping" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/recycling-facility.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "concrete",
        "advanced-material-processing-2",
        "electric-engine",
      },
      unit = {
       count = 300,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
       }
      },
    },

    -- Space Science
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-science-lab",
      effects = {
       {
         type = "unlock-recipe",
         recipe = data_util.mod_prefix .. "space-science-lab",
       },
      },
      icon = "__space-exploration-graphics__/graphics/technology/space-science-lab.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "electric-lab",
        data_util.mod_prefix .. "space-belt",
      },
      unit = {
       count = 500,
       time = 30,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "rocket-science-pack", 1 },
       }
      },
    },


    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-ab",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-ab"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-dual"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-ab" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "ab"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "astronomic-science-pack-1",
        data_util.mod_prefix .. "biological-science-pack-1",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-as",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-as"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-dual"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-as" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "as"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "astronomic-science-pack-1",
        data_util.mod_prefix .. "energy-science-pack-1",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-am",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-am"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-dual"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-am" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "am"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "astronomic-science-pack-1",
        data_util.mod_prefix .. "material-science-pack-1",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-bm",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-bm"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-dual"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-bm" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "bm"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "biological-science-pack-1",
        data_util.mod_prefix .. "material-science-pack-1",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-sb",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-sb"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-dual"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-sb" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "sb"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "biological-science-pack-1",
        data_util.mod_prefix .. "energy-science-pack-1",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-sm",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-sm"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-dual"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-sm" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "sm"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "energy-science-pack-1",
        data_util.mod_prefix .. "material-science-pack-1",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-abm",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-abm"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-triple"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-abm" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "abm"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-ab",
        data_util.mod_prefix .. "space-simulation-am",
        data_util.mod_prefix .. "space-simulation-bm",
      },
      unit = {
       count = 50,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-asb",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-asb"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-triple"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-asb" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "asb"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-ab",
        data_util.mod_prefix .. "space-simulation-as",
        data_util.mod_prefix .. "space-simulation-sb",
      },
      unit = {
       count = 50,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-asm",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-asm"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-triple"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-asm" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "asm"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-am",
        data_util.mod_prefix .. "space-simulation-as",
        data_util.mod_prefix .. "space-simulation-sm",
      },
      unit = {
       count = 50,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-sbm",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-sbm"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-triple"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-sbm" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-1.png", "sbm"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-bm",
        data_util.mod_prefix .. "space-simulation-sb",
        data_util.mod_prefix .. "space-simulation-sm",
      },
      unit = {
       count = 50,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-simulation-asbm",
      localised_name = {"recipe-name." .. data_util.mod_prefix .. "simulation-asbm"},
      localised_description = {"technology-description."  .. data_util.mod_prefix .. "space-simulation-quad"},
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "simulation-asbm" },
      },
      icons = add_insights_to_tech_icon("__space-exploration-graphics__/graphics/technology/supercomputer-2.png", "asbm"),
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-simulation-abm",
        data_util.mod_prefix .. "space-simulation-asb",
        data_util.mod_prefix .. "space-simulation-asm",
        data_util.mod_prefix .. "space-simulation-sbm",
        data_util.mod_prefix .. "space-supercomputer-2",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .."astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .."biological-science-pack-1", 1 },
         { data_util.mod_prefix .."energy-science-pack-1", 1 },
         { data_util.mod_prefix .."material-science-pack-1", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-solar-panel",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-solar-panel" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/solar-panel.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "solar-energy",
         data_util.mod_prefix .. "space-biochemical-laboratory",
      },
      unit = {
       count = 500,
       time = 30,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-solar-panel-2",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-solar-panel-2" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/solar-panel-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-solar-panel",
        data_util.mod_prefix .. "holmium-cable",
      },
      unit = {
       count = 200,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "space-solar-panel-3",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-solar-panel-3" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/solar-panel-3.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-solar-panel-2",
        data_util.mod_prefix .. "deep-space-science-pack-1",
        data_util.mod_prefix .. "naquium-cube",
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
         { data_util.mod_prefix .. "material-science-pack-4", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack-1", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-1",
      effects = {
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "space-supercomputer-1" },
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "formatting-1" },
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "machine-learning-data" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-1.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-data-card",
        data_util.mod_prefix .. "space-radiator-1",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-2",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-supercomputer-2" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "formatting-2" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "quantum-processor",
        data_util.mod_prefix .. "space-hypercooling-1",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-3", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-3",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-supercomputer-3" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "formatting-3" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-3.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "space-supercomputer-2",
        data_util.mod_prefix .. "superconductive-cable",
        data_util.mod_prefix .. "biological-science-pack-3",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-3", 1 },
         { data_util.mod_prefix .. "material-science-pack-3", 1 },
         { data_util.mod_prefix .. "biological-science-pack-3", 1 },
       }
      },
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "space-supercomputer-4",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-supercomputer-4" },
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "formatting-4" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercomputer-4.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "naquium-processor",
        data_util.mod_prefix .. "space-hypercooling-2",
      },
      unit = {
       count = 1000,
       time = 60,
       ingredients = {
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
         { data_util.mod_prefix .. "biological-science-pack-4", 1},
         { data_util.mod_prefix .. "deep-space-science-pack-3", 1 },
       }
      },
    },


    {
      type = "technology",
      name = data_util.mod_prefix .. "space-thermodynamics-laboratory",
      effects = {
        { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-thermodynamics-laboratory" },
        --{ type = "unlock-recipe",   recipe = data_util.mod_prefix .. "space-coolant" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/thermodynamics-laboratory.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "industrial-furnace",
        data_util.mod_prefix .. "space-manufactory",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "space-science-pack", 1 },
       }
      },
    },

    {
       name = data_util.mod_prefix .. "spaceship",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-console" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-floor" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-wall" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-gate" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-rocket-engine" },
         --{ type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-rocket-engine-burn" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "spaceship-rocket-booster-tank" },
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "astronomic-science-pack-3",
         data_util.mod_prefix .. "aeroframe-bulkhead",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 }
         },
         time = 60
       }
    },

    {
       name = data_util.mod_prefix .. "spaceship-integrity-1",
       effects = {
        { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship",
         data_util.mod_prefix .. "material-science-pack-1",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-1", 1 }
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-2",
       effects = {
        { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship-integrity-1",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-2", 1 }
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-3",
       effects = {
        { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship-integrity-2",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 }
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-4",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship-integrity-3",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 },
           { data_util.mod_prefix .. "energy-science-pack-1", 1 }
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-5",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship-integrity-4",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 },
           { data_util.mod_prefix .. "energy-science-pack-2", 1 },
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-6",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship-integrity-5",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 },
           { data_util.mod_prefix .. "energy-science-pack-3", 1 },
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "spaceship-integrity-7",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 100} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "spaceship-integrity-6",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*50",
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 },
           { data_util.mod_prefix .. "energy-science-pack-3", 1 },
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "factory-spaceship-1",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 500} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "deep-space-science-pack-1",
         data_util.mod_prefix .. "spaceship-integrity-7",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*250",
         time = 60,
         ingredients = {
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-1", 1 }
         },
       },
       upgrade = false
    },
    {
       name = data_util.mod_prefix .. "factory-spaceship-2",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 500} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "factory-spaceship-1",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*250",
         time = 60,
         ingredients = {
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-1", 1 }
         },
       },
       upgrade = false
    },
    {
       name = data_util.mod_prefix .. "factory-spaceship-3",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 500} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "deep-space-science-pack-2",
         data_util.mod_prefix .. "factory-spaceship-2",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*250",
         time = 60,
         ingredients = {
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-2", 1 }
         },
       },
       upgrade = false
    },
    {
       name = data_util.mod_prefix .. "factory-spaceship-4",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 500} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "deep-space-science-pack-3",
         data_util.mod_prefix .. "factory-spaceship-3",
       },
       type = "technology",
       unit = {
         count_formula = "2^L*250",
         time = 60,
         ingredients = {
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-3", 1 }
         },
       },
       upgrade = false
    },
    {
       name = data_util.mod_prefix .. "factory-spaceship-5",
       effects = {
         { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "spaceship-integrity-bonus", 500} }
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-integrity.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "deep-space-science-pack-4",
         data_util.mod_prefix .. "factory-spaceship-4",
       },
       max_level = "infinite",
       type = "technology",
       unit = {
         count_formula = "2^L*250",
         time = 60,
         ingredients = {
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-4", 1 }
         },
       },
       upgrade = false
    },
    {
       name = data_util.mod_prefix .. "spaceship-victory",
       effects = {
         { type = "nothing", effect_description={
          "modifier-description." .. data_util.mod_prefix .. "unlock-spaceship-victory",
           Shared.spaceship_victory_speed,
           Shared.spaceship_victory_duration,
           Shared.spaceship_victory_size
         } },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "distortion-drive" },
       },
       icon = "__space-exploration-graphics__/graphics/technology/spaceship-victory.png",
       icon_size = 128,
       order = "zzzzzzz",
       prerequisites = {
         data_util.mod_prefix .. "deep-space-science-pack-4",
         data_util.mod_prefix .. "antimatter-engine",
         data_util.mod_prefix .. "factory-spaceship-3",
       },
       type = "technology",
       unit = {
         count = 5000,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "utility-science-pack", 1 },
           { "production-science-pack", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "biological-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-4", 1 }
         },
         time = 60
       },
       localised_description = {
         "technology-description." .. data_util.mod_prefix .. "spaceship-victory",
         Shared.spaceship_victory_speed,
         Shared.spaceship_victory_duration,
         Shared.spaceship_victory_size
       }
    },

    {
       name = data_util.mod_prefix .. "superconductive-cable",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "superconductive-cable" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "magnetic-canister", },
         { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "plasma-canister" },
         { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "plasma-canister-empty" },
         { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "ion-canister" },
         { type = "unlock-recipe",   recipe = data_util.mod_prefix .. "ion-canister-empty" },
       },
       icon = "__space-exploration-graphics__/graphics/technology/superconductive-cable.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "material-science-pack-3",
         data_util.mod_prefix .. "energy-science-pack-3",
         data_util.mod_prefix .. "space-hypercooling-2",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 },
           { data_util.mod_prefix .. "energy-science-pack-3", 1 }
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "tesla-gun",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "tesla-gun" },
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "tesla-ammo" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/tesla-gun.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         "military-4",
         data_util.mod_prefix .. "holmium-cable",
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "military-science-pack", 1},
           { data_util.mod_prefix .. "energy-science-pack-1", 1 }
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-orange.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         "modular-armor",
         "jetpack-1",
         data_util.mod_prefix .. "lifesupport-equipment-1"
       },
       type = "technology",
       unit = {
         count = 200,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "rocket-science-pack", 1 }
         },
         time = 30
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit-2",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit-2" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-red.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "thruster-suit",
         data_util.mod_prefix .. "material-science-pack-1",
       },
       type = "technology",
       unit = {
         count = 50,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { data_util.mod_prefix .. "material-science-pack-1", 1 },
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit-3",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit-3" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-blue.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "astronomic-science-pack-3",
         data_util.mod_prefix .. "biological-science-pack-1",
         data_util.mod_prefix .. "superconductive-cable",
         data_util.mod_prefix .. "thruster-suit-2",
         data_util.mod_prefix .. "aeroframe-bulkhead"
       },
       type = "technology",
       unit = {
         count = 300,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "biological-science-pack-1", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
           { data_util.mod_prefix .. "material-science-pack-3", 1 },
           { data_util.mod_prefix .. "energy-science-pack-3", 1 },
         },
         time = 60
       }
    },
    {
       name = data_util.mod_prefix .. "thruster-suit-4",
       effects = {
         { type = "unlock-recipe", recipe = data_util.mod_prefix .. "thruster-suit-4" }
       },
       icon = "__space-exploration-graphics__/graphics/technology/thruster-suit-black.png",
       icon_size = 128,
       order = "g-b-z",
       prerequisites = {
         data_util.mod_prefix .. "antimatter-production",
         data_util.mod_prefix .. "nanomaterial",
         data_util.mod_prefix .. "self-sealing-gel",
         data_util.mod_prefix .. "thruster-suit-3",
         data_util.mod_prefix .. "naquium-processor",
         data_util.mod_prefix .. "lattice-pressure-vessel",
       },
       type = "technology",
       unit = {
         count = 500,
         ingredients = {
           { "automation-science-pack", 1 },
           { "logistic-science-pack", 1 },
           { "chemical-science-pack", 1 },
           { "utility-science-pack", 1 },
           { data_util.mod_prefix .. "biological-science-pack-4", 1 },
           { data_util.mod_prefix .. "astronomic-science-pack-4", 1 },
           { data_util.mod_prefix .. "material-science-pack-4", 1 },
           { data_util.mod_prefix .. "energy-science-pack-4", 1 },
           { data_util.mod_prefix .. "deep-space-science-pack-3", 1 }
         },
         time = 60
       }
    },

    {
      type = "technology",
      name = data_util.mod_prefix .. "vitalic-acid",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitalic-acid", },
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bio-sludge-from-vitamelange" },
      },
      icon = "__space-exploration-graphics__/graphics/technology/vitalic-acid.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "processing-vitamelange",
        data_util.mod_prefix .. "biological-science-pack-1",
      },
      unit = {
       count = 10,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "bioscrubber",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "bioscrubber", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/bioscrubber.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "vitalic-acid",
      },
      unit = {
       count = 20,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "vitalic-reagent",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitalic-reagent", },
        { type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitalic-hydrocarbon-extraction", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/vitalic-reagent.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "biological-science-pack-2",
      },
      unit = {
       count = 100,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack-2", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "vitalic-epoxy",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "vitalic-epoxy", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/vitalic-epoxy.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "vitalic-reagent",
        data_util.mod_prefix .. "biological-science-pack-3",
      },
      unit = {
       count = 200,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack-3", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "self-sealing-gel",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "self-sealing-gel", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/self-sealing-gel.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "vitalic-epoxy",
        data_util.mod_prefix .. "biological-science-pack-4",
      },
      unit = {
       count = 400,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "biological-science-pack-4", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "supercharger",
      effects = {
        {
          type = "unlock-recipe",
          recipe = data_util.mod_prefix .. "supercharger",
        },
      },
      icon = "__space-exploration-graphics__/graphics/technology/supercharger.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
       "construction-robotics",
       data_util.mod_prefix .. "aeroframe-scaffold",
       data_util.mod_prefix .. "heavy-girder",
       data_util.mod_prefix .. "holmium-solenoid",
       data_util.mod_prefix .. "material-science-pack-2"
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-2", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
         { data_util.mod_prefix .. "material-science-pack-2", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "compact-beacon",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "compact-beacon", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/compact-beacon.png",
      icon_size = 256,
      order = "e-g",
      prerequisites = {
        "effect-transmission",
        data_util.mod_prefix .. "holmium-solenoid",
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "production-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-2", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "wide-beacon",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "wide-beacon", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/wide-beacon.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        "effect-transmission",
        data_util.mod_prefix .. "holmium-solenoid",
      },
      unit = {
       count = 500,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "production-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-2", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "compact-beacon-2",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "compact-beacon-2", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/compact-beacon-2.png",
      icon_size = 256,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "compact-beacon",
        data_util.mod_prefix .. "dynamic-emitter",
        data_util.mod_prefix .. "naquium-tessaract",
      },
      unit = {
       count = 1000,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "production-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
       }
      },
      localised_description = {"technology-description."..data_util.mod_prefix .. "compact-beacon-2"}
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "wide-beacon-2",
      effects = {
       { type = "unlock-recipe", recipe = data_util.mod_prefix .. "wide-beacon-2", },
      },
      icon = "__space-exploration-graphics__/graphics/technology/wide-beacon-2.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
        data_util.mod_prefix .. "wide-beacon",
        data_util.mod_prefix .. "dynamic-emitter",
        data_util.mod_prefix .. "naquium-tessaract",
      },
      unit = {
       count = 1000,
       time = 60,
       ingredients = {
         { "automation-science-pack", 1 },
         { "logistic-science-pack", 1 },
         { "chemical-science-pack", 1 },
         { "production-science-pack", 1 },
         { "utility-science-pack", 1 },
         { data_util.mod_prefix .. "energy-science-pack-4", 1 },
         { data_util.mod_prefix .. "deep-space-science-pack-2", 1 },
       }
      },
      localised_description = {"technology-description."..data_util.mod_prefix .. "wide-beacon-2"}
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "zone-discovery-random",
      effects = {
        { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "zone-discovery-random"} }
      },
      icon = "__space-exploration-graphics__/graphics/technology/discovery.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
         data_util.mod_prefix .."astronomic-science-pack-1",
      },
      max_level = "infinite",
      unit = {
       count_formula = "10+L",
       time = 60,
       ingredients = {
         { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "zone-discovery-targeted",
      effects = {
        { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "zone-discovery-targeted"} }
      },
      icon = "__space-exploration-graphics__/graphics/technology/discovery.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
         data_util.mod_prefix .."astronomic-science-pack-2",
      },
      max_level = "infinite",
      unit = {
       count_formula = "20+L",
       time = 60,
       ingredients = {
         { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
       }
      },
    },
    {
      type = "technology",
      name = data_util.mod_prefix .. "zone-discovery-deep",
      effects = {
        { type = "nothing", effect_description={"modifier-description." .. data_util.mod_prefix .. "zone-discovery-deep"} }
      },
      icon = "__space-exploration-graphics__/graphics/technology/discovery.png",
      icon_size = 128,
      order = "e-g",
      prerequisites = {
         data_util.mod_prefix .."astronomic-science-pack-3",
      },
      max_level = "infinite",
      unit = {
       count_formula = "100+L*10",
       time = 60,
       ingredients = {
         { data_util.mod_prefix .. "astronomic-science-pack-1", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-2", 1 },
         { data_util.mod_prefix .. "astronomic-science-pack-3", 1 },
       }
      },
    },
})
