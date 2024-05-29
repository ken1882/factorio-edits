--Technology
data:extend({
  {
    type = "technology",
    name = "kj_747",
    icon = "__kj_747__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_747"
      },
    },
    prerequisites = {"kj_gasoline", "low-density-structure"},
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
