--Technology
data:extend({
  {
    type = "technology",
    name = "kj_ju87",
    icon = "__kj_ju87__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_ju87"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_ju87_gunner_normal"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_ju87_normal"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_ju87_medium"
      },
    },
    prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
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
})

data:extend({
  {
    type = "technology",
    name = "kj_ju87_ammo",
    icon = "__kj_ju87__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_ju87_big"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_ju87_huge"
      },
    },
    prerequisites = {"kj_ju87", "production-science-pack"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  },
})