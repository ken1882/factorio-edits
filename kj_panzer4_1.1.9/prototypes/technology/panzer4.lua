--Technology
data:extend({
  {
    type = "technology",
    name = "kj_panzer4",
    icon = "__kj_panzer4__/graphics/technology/panzer4_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_panzer4"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_75kwk40_penetration"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_mg34_hand"
      },
    },
    prerequisites = {"tank", "kj_gasoline"},
    unit =
    {
      count = 500,
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
    name = "kj_panzer4_ammo",
    icon = "__kj_panzer4__/graphics/technology/panzer4_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_75kwk40_highexplosive"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_75kwk40_penetration_highexplosive"
      },
    },
    prerequisites = {"kj_panzer4"},
    unit =
    {
      count = 200,
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