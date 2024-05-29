--Technology
data:extend({
  {
    type = "technology",
    name = "kj_vierling",
    icon = "__kj_vierling__/graphics/technology/vierling_technology_icon.png",
	icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_vierling"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_2cmfv_normal_vierling"
      },
    },
    prerequisites = {"military-3"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  },
})