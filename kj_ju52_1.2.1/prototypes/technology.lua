--Technology
data:extend({
  {
    type = "technology",
    name = "kj_ju52",
    icon = "__kj_ju52__/graphics/technology_icon.png",
	icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_ju52"
      },
    },
    prerequisites = {"low-density-structure", "kj_gasoline", "lubricant"},
    unit =
    {
      count = 350,
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
