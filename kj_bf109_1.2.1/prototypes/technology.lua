--Technology
data:extend({
  {
    type = "technology",
    name = "kj_bf109",
    icon = "__kj_bf109__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_bf109"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_bf109_normal"
      },
    },
    prerequisites = {"military-4", "kj_gasoline", "low-density-structure"},
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
      time = 30
    },
    order = "e-c-d"
  },
})
