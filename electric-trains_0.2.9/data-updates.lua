------------------------------------------
-- Startup Settings handling happens here.
------------------------------------------
if settings.startup["electric-locomotive-speed-setting"].value == "238 km/h (Vanilla)" then
  data.raw["locomotive"]["electric-locomotive"].max_speed = 1.1
  data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 1.1
  data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 1.1
elseif settings.startup["electric-locomotive-speed-setting"].value == "378 km/h" then
  data.raw["locomotive"]["electric-locomotive"].max_speed = 1.75
  data.raw["cargo-wagon"]["electric-cargo-wagon"].max_speed = 1.75
  data.raw["fluid-wagon"]["electric-fluid-wagon"].max_speed = 1.75
end

if settings.startup["electric-cargo-wagon-capacity-setting"].value == "40 Slots (Vanilla)" then
  data.raw["cargo-wagon"]["electric-cargo-wagon"].inventory_size = 40
elseif settings.startup["electric-cargo-wagon-capacity-setting"].value == "120 Slots (Extended)" then
  data.raw["cargo-wagon"]["electric-cargo-wagon"].inventory_size = 120
end

if settings.startup["electric-fluid-wagon-capacity-setting"].value == "25.000 (Vanilla)" then
  data.raw["fluid-wagon"]["electric-fluid-wagon"].capacity = 25000
end

if settings.startup["train-battery-pack-energy-density-setting"].value == "80 MJ" then
  data.raw["assembling-machine"]["electric-train-battery-charging-station"].energy_usage = "3.3MW"
  data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"].energy_usage = "33MW"
  data.raw["item"]["electric-train-battery-pack"].fuel_value = "80MJ"
  -- Update the other battery packs too.
  data.raw["item"]["speed-battery-pack"].fuel_value = "64MJ"
  data.raw["item"]["acceleration-battery-pack"].fuel_value = "64MJ"
  data.raw["item"]["efficiency-battery-pack"].fuel_value = "240MJ"
  data.raw["item"]["electric-train-alkaline-battery-pack"].fuel_value = "240MJ"
end

if settings.startup["train-battery-decay-enable-setting"].value then
  data:extend({{
    type = "item",
    name = "electric-train-destroyed-battery-pack",
    icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "electric-train-discharged-battery-pack",
    subgroup = "intermediate-product",
    order = "s-a[destroyed-battery-pack]",
    stack_size = 20
  }, -- Destroyed speed, acceleration and efficiency battery-packs
  {
    type = "item",
    name = "destroyed-speed-battery-pack",
    icon = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "discharged-speed-battery-pack",
    subgroup = "intermediate-product",
    order = "s-d[destroyed-battery-pack]",
    stack_size = 20
  },{
    type = "item",
    name = "destroyed-acceleration-battery-pack",
    icon = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "discharged-acceleration-battery-pack",
    subgroup = "intermediate-product",
    order = "s-b[destroyed-battery-pack]",
    stack_size = 20
  }, {
    type = "item",
    name = "destroyed-efficiency-battery-pack",
    icon = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
    icon_size = 128,
    pictures = {
      layers = {{
        size = 128,
        filename = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
        scale = 0.125
      }, {
        draw_as_light = true,
        flags = {"light"},
        size = 128,
        filename = "__electric-trains__/graphics/icons/destroyed-battery_light.png",
        scale = 0.125
      }}
    },
    burnt_result = "discharged-efficiency-battery-pack",
    subgroup = "intermediate-product",
    order = "s-c[destroyed-battery-pack]",
    stack_size = 20
  }, -- Refurb for speed, acceleration and efficiency battery-packs
  {
    type = "recipe",
    name = "speed-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"destroyed-speed-battery-pack", 1}, {"battery", 5}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/speed-battery/destroyed-speed-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.speed-battery-pack-refurbish-desc"},
    result = "discharged-speed-battery-pack",
    order = "s-[battery-refurbish-d]"
  },{
    type = "recipe",
    name = "acceleration-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"destroyed-acceleration-battery-pack", 1}, {"battery", 5}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/acceleration-battery/destroyed-acceleration-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.acceleration-battery-pack-refurbish-desc"},
    result = "discharged-acceleration-battery-pack",
    order = "s-[battery-refurbish-b]"
  },{
    type = "recipe",
    name = "efficiency-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"destroyed-efficiency-battery-pack", 1}, {"battery", 5}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/efficiency-battery/destroyed-efficiency-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.efficiency-battery-pack-refurbish-desc"},
    result = "discharged-efficiency-battery-pack",
    order = "s-[battery-refurbish-c]"
  },
    
  
  {
    type = "recipe",
    name = "electric-train-battery-pack-refurbish",
    energy_required = 120,
    enabled = false,
    category = "chemistry",
    ingredients = {{"electric-train-destroyed-battery-pack", 1}, {
      type = "fluid",
      name = "sulfuric-acid",
      amount = 200
    }},
    icon = "__electric-trains__/graphics/icons/destroyed-battery.png",
    icon_size = 128,
    allow_as_intermediate = false,
    localised_name = {"recipe-name.electric-train-battery-pack-refurbish-desc"},
    result = "electric-train-discharged-battery-pack",
    order = "s-[battery-refurbish-a]"
  }, -- Speed, acceleration and efficiency battery-pack ref

})
else
  data.raw["recipe"]["electric-train-battery-pack-recharge"].results = {{
    name = "electric-train-battery-pack",
    amount = 1
  }}
  data.raw["recipe"]["faster-electric-train-battery-pack-recharge"].results = {{
    name = "electric-train-battery-pack",
    amount = 1
  }}
  -- Same for faster speed, acceleration and efficiency battery-packs
  data.raw["recipe"]["speed-battery-pack-recharge"].results = {{
    name = "speed-battery-pack",
    amount = 1
  }}
  data.raw["recipe"]["acceleration-battery-pack-recharge"].results = {{
    name = "acceleration-battery-pack",
    amount = 1
  }}
  data.raw["recipe"]["efficiency-battery-pack-recharge"].results = {{
    name = "efficiency-battery-pack",
    amount = 1
  }}
end
------------------------------------------
-- Changes to recipes and technologies.
------------------------------------------

  table.insert(data.raw["recipe"]["recipe-electric-locomotive"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive"].ingredients, {"rocket-control-unit", 10})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive"].ingredients, {"electric-engine-unit", 50})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients, {"rocket-control-unit", 10})
  table.insert(data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients, {"electric-engine-unit", 50})
  table.insert(data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients, {"electric-engine-unit", 5})
  table.insert(data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients, {"steel-plate", 40})
  table.insert(data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients, {"electric-engine-unit", 5})

data:extend({ 
{
  type = "technology",
  name = "tech-electric-trains",
  mod = "space-trains",
  icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
  icon_size = 256,
  icon_mipmaps = 4,
  effects = {{
    type = "unlock-recipe",
    recipe = "recipe-electric-locomotive"
  }, {
    type = "unlock-recipe",
    recipe = "recipe-electric-fluid-wagon"
  }, {
    type = "unlock-recipe",
    recipe = "recipe-electric-cargo-wagon"
  }, {
    type = "unlock-recipe",
    recipe = "electric-train-battery-charging-station"
  }, {
    type = "unlock-recipe",
    recipe = "electric-train-battery-pack"
  }, {
    type = "unlock-recipe",
    recipe = "electric-train-battery-pack-recharge"
  }},
  prerequisites = {"steel-processing", "advanced-electronics-2", "battery", "railway", "production-science-pack", "utility-science-pack", "electric-engine", "rocket-control-unit"},
  unit = {
    count = 2000,
    ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
                    {"production-science-pack", 1}, {"utility-science-pack", 1}},
    time = 60
  }
}})

-- New research for alkaline battery packs.
data:extend({
  {
    type = "technology",
    name = "tech-alkaline-battery-pack",
    mod = "space-trains",
    icon = "__electric-trains__/graphics/icons/alkaline-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects =  {{
      type = "unlock-recipe",
      recipe = "recipe-electric-train-alkaline-battery-pack"  
    }
    },
    prerequisites = {"tech-electric-trains"},
    unit = {
      count = 2000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})
-- Add new research for experimental chargers that unlock the experimental charging station.
data:extend({
  {
    type = "technology",
    name = "tech-electric-trains-experimental-charging",
    mod = "space-trains",
    icon = "__electric-trains__/graphics/icons/experimental-electric-train-charging-station.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "experimental-electric-train-battery-charging-station"
    }, {
      type = "unlock-recipe",
      recipe = "faster-electric-train-battery-pack-recharge"
    }},
    prerequisites = {"tech-electric-trains", "tech-electric-locomotive-wagon"},
    unit = {
      count = 20000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  -- Add infinite techs for increasing the braking force of the trains. (Would love to have a TechnologyModifier for top speed too, but that's not possible yet.)
  data:extend({  
    {
    type = "technology",
    name = "tech-electric-trains-braking-force-1",
    icon_size = 256, icon_mipmaps = 4,
    icons = 
    {
      {
        icon = "__electric-trains__/graphics/icons/space-trains-tech.png",
        icon_size = 256, icon_mipmaps = 4
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-braking-force.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = {100, 100}
      }
    },
    effects =
    {
      {
        type = "train-braking-force-bonus",
        modifier = 0.05
      } 
    },
    prerequisites = {"space-science-pack", "tech-electric-trains", "tech-electric-trains-experimental-charging"}, 
    unit =
    {
      count_formula = "2^L*1000", 
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    },
    max_level = "infinite",
    order = "e-k-d"
  }})

  -- Electric Wagon Locomotive
  data:extend({{
    type = "technology",
    name = "tech-electric-locomotive-wagon",
    icon = "__electric-trains__/graphics/icons/electric-locomotive-wagon.png",
    icon_size = 64, 
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "recipe-electric-locomotive-wagon"
      } 
    },
    prerequisites = {"tech-electric-trains"}, 
    unit =
    {
      count = 2000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}   
      },
      time = 60
    },
  }})

  -- Speed battery packs
  data:extend({{
    type = "technology",
    name = "tech-speed-battery-pack",
    icon = "__electric-trains__/graphics/icons/speed-battery/speed-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "speed-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "speed-battery-pack-recharge"
    }},
    prerequisites = {"tech-electric-trains", "tech-electric-trains-experimental-charging"},
    unit = {
      count = 40000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  -- Acceleration battery packs
  data:extend({{
    type = "technology",
    name = "tech-acceleration-battery-pack",
    icon = "__electric-trains__/graphics/icons/acceleration-battery/acceleration-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "acceleration-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "acceleration-battery-pack-recharge"
    }},
    prerequisites = {"tech-electric-trains", "tech-electric-trains-experimental-charging"},
    unit = {
      count = 40000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  -- Efficiency battery packs
  data:extend({{
    type = "technology",
    name = "tech-efficiency-battery-pack",
    icon = "__electric-trains__/graphics/icons/efficiency-battery/efficiency-battery.png",
    icon_size = 128,
    icon_mipmaps = 4,
    effects = {{
      type = "unlock-recipe",
      recipe = "efficiency-battery-pack"
    }, {
      type = "unlock-recipe",
      recipe = "efficiency-battery-pack-recharge"
    }},
    prerequisites = {"tech-electric-trains", "tech-electric-trains-experimental-charging"},
    unit = {
      count = 40000,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1},
      {"production-science-pack", 1}, {"utility-science-pack", 1}},
      time = 60
    }
  }})

  if settings.startup["train-battery-decay-enable-setting"].value then
    table.insert(data.raw["technology"]["tech-electric-trains"].effects, {
      type = "unlock-recipe",
      recipe = "electric-train-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-speed-battery-pack"].effects, {
      type = "unlock-recipe",
      recipe = "speed-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-acceleration-battery-pack"].effects, {
      type = "unlock-recipe",
      recipe = "acceleration-battery-pack-refurbish"
    })
    table.insert(data.raw["technology"]["tech-efficiency-battery-pack"].effects, {
      type = "unlock-recipe",
      recipe = "efficiency-battery-pack-refurbish"
    })
  end


  -- If the Space Exploration mod is installed, make compatibility changes.
  if mods["space-exploration"] then
    -- Update the tech-electric-trains technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-trains"].unit.ingredients = {}
    data.raw["technology"]["tech-electric-trains"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-electric-trains"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-trains"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-trains"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "rocket-control-unit", "electric-engine"}


    -- Update alkaline battery pack tech.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-alkaline-battery-pack"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-alkaline-battery-pack"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "tech-electric-trains"}
    
    -- Update the tech-electric-trains-experimental-charging technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit.ingredients = {}
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-electric-trains-experimental-charging"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-trains-experimental-charging"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-trains-experimental-charging"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "tech-electric-trains"}

    -- Update the tech-electric-locomotive-wagon technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients = {}
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-electric-locomotive-wagon"].unit.count = 2000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-electric-locomotive-wagon"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "tech-electric-trains"}  

    -- Update the tech-speed-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-speed-battery-pack"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-speed-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-speed-battery-pack"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "tech-electric-trains", "tech-electric-trains-experimental-charging"}

    -- Update the tech-acceleration-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-acceleration-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-acceleration-battery-pack"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "tech-electric-trains", "tech-electric-trains-experimental-charging"}

    -- Update the tech-efficiency-battery-pack technology.
    -- Empty the ingredients table.
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = {}
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}}
    data.raw["technology"]["tech-efficiency-battery-pack"].unit.count = 4000
    -- Remove the old science prerequisites.
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {}
    -- Add the new science prerequisites.
    data.raw["technology"]["tech-efficiency-battery-pack"].prerequisites = {"logistic-science-pack", "chemical-science-pack", "tech-electric-trains", "tech-electric-trains-experimental-charging"}

    -- Just remove the braking force infinite techs.
    data.raw["technology"]["tech-electric-trains-braking-force-1"] = nil

    -- Make the new powerpacks only need tier one module
    data.raw["recipe"]["speed-battery-pack"].ingredients = {{"speed-module", 1}, {"battery", 5}}
    data.raw["recipe"]["acceleration-battery-pack"].ingredients = {{"productivity-module", 1}, {"battery", 5}}
    data.raw["recipe"]["efficiency-battery-pack"].ingredients = {{"effectivity-module", 1}, {"battery", 5}}

    -- Replace all processing units with advanced circuits, since blue chips are much  harder to get in SE.
    data.raw["recipe"]["recipe-electric-locomotive"].ingredients = {{"steel-plate", 40}, {"advanced-circuit", 10}, {"electric-engine-unit", 50}, {"locomotive", 1}, {"rocket-control-unit", 10}}
    data.raw["recipe"]["recipe-electric-locomotive-wagon"].ingredients = {{"steel-plate", 40}, {"advanced-circuit", 10}, {"electric-engine-unit", 50}, {"locomotive", 1}, {"rocket-control-unit", 10}}
    data.raw["recipe"]["recipe-electric-cargo-wagon"].ingredients = {{"steel-plate", 40}, {"advanced-circuit", 10}, {"electric-engine-unit", 5}, {"cargo-wagon", 1}}
    data.raw["recipe"]["recipe-electric-fluid-wagon"].ingredients = {{"steel-plate", 40}, {"advanced-circuit", 10}, {"electric-engine-unit", 5}, {"fluid-wagon", 1}}
    -- Change the charging station recipe to use advanced circuits instead of processing units.
    data.raw["recipe"]["electric-train-battery-charging-station"].ingredients = {{"steel-plate", 40}, {"advanced-circuit", 10}, {"copper-cable", 50}}
    data.raw["recipe"]["experimental-electric-train-battery-charging-station"].ingredients = {{"steel-plate", 40}, {"advanced-circuit", 50}, {"copper-cable", 200}}

    -- Allow charging in space
    data.raw["assembling-machine"]["electric-train-battery-charging-station"].se_allow_in_space = true
    data.raw["assembling-machine"]["experimental-electric-train-battery-charging-station"].se_allow_in_space = true

    -- Check for the installed version of Space Exploration and handle it.
    old_version = util.split(mods["space-exploration"], ".")
    -- Check if the mod settings for decay are enabled.
    if settings.startup["train-battery-decay-enable-setting"].value then
      -- Check if this is pre v0.6.0 SE
      if tonumber(old_version[2]) <= 5 then
        -- Add the new recipes to the recycling category.
        data.raw["recipe"]["electric-train-battery-pack-refurbish"].subgroup = "space-recycling"
        data.raw["recipe"]["speed-battery-pack-refurbish"].subgroup = "space-recycling"
        data.raw["recipe"]["acceleration-battery-pack-refurbish"].subgroup = "space-recycling"
        data.raw["recipe"]["efficiency-battery-pack-refurbish"].subgroup = "space-recycling"
      else
        -- Add the new recipes to the recycling category.
        data.raw["recipe"]["electric-train-battery-pack-refurbish"].subgroup = "recycling"
        data.raw["recipe"]["speed-battery-pack-refurbish"].subgroup = "recycling"
        data.raw["recipe"]["acceleration-battery-pack-refurbish"].subgroup = "recycling"
        data.raw["recipe"]["efficiency-battery-pack-refurbish"].subgroup = "recycling"
      end
      -- Recyling stuff
      data.raw["recipe"]["electric-train-battery-pack-refurbish"].category = "hard-recycling"
      data.raw["recipe"]["speed-battery-pack-refurbish"].category = "hard-recycling"
      data.raw["recipe"]["acceleration-battery-pack-refurbish"].category = "hard-recycling"
      data.raw["recipe"]["efficiency-battery-pack-refurbish"].category = "hard-recycling"
    end
  end