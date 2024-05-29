--Technology
data:extend({
  {
    type = "technology",
    name = "kj_rattetank",
    icon = "__kj_rattetank__/graphics/technology/ratte_technology_icon.png",
	icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_rattetank"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_280SKC34_penetration"
      },
    },
    prerequisites = {"kj_gasoline"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
        {"military-science-pack", 10},
        {"production-science-pack", 10},
        {"utility-science-pack", 10},
        {"space-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  },
  
   {
    type = "technology",
    name = "kj_rattetank_ammo",
    icon = "__kj_rattetank__/graphics/technology/ratte_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_280SKC34_highexplosive"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_280SKC34_incendiary"
      },
    },
    prerequisites = {"kj_rattetank"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
        {"military-science-pack", 10},
        {"production-science-pack", 10},
        {"utility-science-pack", 10},
        {"space-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  }, 
})
