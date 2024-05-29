--Technology
data:extend({
  {
    type = "technology",
    name = "kj_maustank",
    icon = "__kj_maustank__/graphics/technology/maustank_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_maustank"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_120kwk_penetration"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_mg42_hand"
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
    name = "kj_maustank_ammo",
    icon = "__kj_maustank__/graphics/technology/maustank_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_120kwk_highexplosive"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_120kwk_penetration_highexplosive"
      },
    },
    prerequisites = {"kj_maustank"},
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
