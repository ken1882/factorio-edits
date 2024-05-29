--Technology
data:extend({
  {
    type = "technology",
    name = "kj_b17",
    icon = "__kj_b17__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_b17"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b17_gunner_normal"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b17_normal"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b17_medium"
      },
	  --[[{
        type = "unlock-recipe",
        recipe = "kj_b17_napalm"
      },]]
    },
    prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
    unit =
    {
      count = 650,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 40
    },
    order = "e-c-d"
  },
})

data:extend({
  {
    type = "technology",
    name = "kj_b17_ammo",
    icon = "__kj_b17__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_b17_big"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_b17_huge"
      },
    },
    prerequisites = {"kj_b17", "production-science-pack"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 40
    },
    order = "e-c-d"
  },
})

data:extend({
  {
    type = "technology",
    name = "kj_b17_atom",
    icon = "__kj_b17__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_b17_atom"
      },
    },
    prerequisites = {"kj_b17_ammo", "atomic-bomb"},
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
      time = 40
    },
    order = "e-c-d"
  },
})