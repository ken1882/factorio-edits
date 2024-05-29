--Technology
data:extend({
  {
    type = "technology",
    name = "kj_40klemanruss",
    icon = "__kj_40klemanruss__/graphics/technology/40klemanruss_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_40klemanruss"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_lemanruss_normal"
      },
    },
    prerequisites = {},
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