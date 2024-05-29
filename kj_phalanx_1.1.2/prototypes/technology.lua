--Technology
data:extend({
  {
    type = "technology",
    name = "kj_phalanx",
    icon = "__kj_phalanx__/graphics/technology_icon.png",
	icon_size = 256,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_phalanx"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_apds_normal"
      },
    },
    prerequisites = {"military-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 30
    },
    order = "e-c-d"
  },
})