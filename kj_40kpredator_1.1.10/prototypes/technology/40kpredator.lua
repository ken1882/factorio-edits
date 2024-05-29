--Technology
data:extend({
  {
    type = "technology",
    name = "kj_40kpredator",
    icon = "__kj_40kpredator__/graphics/technology/40kpredator_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_40kpredator"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_predator_normal"
      },
    },
    prerequisites = {"tank", "kj_gasoline"},
    unit =
    {
      count = 750,
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