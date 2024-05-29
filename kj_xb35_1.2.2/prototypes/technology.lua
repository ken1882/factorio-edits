--Technology
data:extend({
  {
    type = "technology",
    name = "kj_xb35",
    icon = "__kj_xb35__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_xb35"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_xb35_medium"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_xb35_big"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_xb35_huge"
      },
    },
    prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
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
      time = 50
    },
    order = "e-c-d"
  },
})

data:extend({
  {
    type = "technology",
    name = "kj_xb35_atom",
    icon = "__kj_xb35__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_xb35_atom"
      },
    },
    prerequisites = {"kj_xb35", "atomic-bomb"},
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