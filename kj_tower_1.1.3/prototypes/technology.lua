--Technology
data:extend({
  {
    type = "technology",
    name = "kj_tower",
    icon = "__kj_tower__/graphics/technology_icon.png",
	icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_tower"
      },
    },
    prerequisites = {"military-3"},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  },
})