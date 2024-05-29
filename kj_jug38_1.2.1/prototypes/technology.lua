--Technology
data:extend({
  {
    type = "technology",
    name = "kj_jug38",
    icon = "__kj_jug38__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_jug38"
      },
    },
    prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 20
    },
    order = "e-c-d"
  },
})
