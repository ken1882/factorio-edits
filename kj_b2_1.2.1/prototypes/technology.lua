--Technology
data:extend({
  {
    type = "technology",
    name = "kj_b2",
    icon = "__kj_b2__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_b2"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b2_medium"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b2_big"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b2_huge"
      },
    },
    prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
    unit =
    {
      count = 1500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 50
    },
    order = "e-c-d"
  },
})

data:extend({
  {
    type = "technology",
    name = "kj_b2_atom",
    icon = "__kj_b2__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_b2_atom"
      },
    },
    prerequisites = {"kj_b2", "atomic-bomb"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 50
    },
    order = "e-c-d"
  },
})