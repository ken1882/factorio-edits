--Technology
data:extend({
  {
    type = "technology",
    name = "kj_2a6",
    icon = "__kj_2a6__/graphics/technology_icon.png",
	icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_2a6"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_rh120_penetration"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_mg3_hand"
      },
    },
    prerequisites = {"kj_gasoline"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  },
  
   {
    type = "technology",
    name = "kj_2a6_ammo",
    icon = "__kj_2a6__/graphics/technology_icon.png",
	icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_rh120_highexplosive"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_rh120_penetration_highexplosive"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_rh120_canister"
      },
    },
    prerequisites = {"kj_2a6"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  }, 
})
