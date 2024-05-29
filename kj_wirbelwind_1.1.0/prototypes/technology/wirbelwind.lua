--Technology
data:extend({
  {
    type = "technology",
    name = "kj_wirbelwind",
    icon = "__kj_wirbelwind__/graphics/technology/wirbelwind_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_wirbelwind"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_2cmfv_normal"
      },
    },
    prerequisites = {"kj_panzer4"},
    unit =
    {
      count = 500,
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