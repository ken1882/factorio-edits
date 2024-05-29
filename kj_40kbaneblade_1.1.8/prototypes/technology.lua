--Technology
data:extend({
  {
    type = "technology",
    name = "kj_40kbaneblade",
    icon = "__kj_40kbaneblade__/graphics/technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_40kbaneblade"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_baneblade_normal"
      },
    },
    prerequisites = {"military-4"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 40
    },
    order = "e-c-d"
  },
})