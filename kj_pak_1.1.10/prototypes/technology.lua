--Technology
data:extend({
  {
    type = "technology",
    name = "kj_pak",
    icon = "__kj_pak__/graphics/technology/pak_technology_icon.png",
	  icon_size = 128,
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "kj_pak"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_pak_turret"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_pak_penetration"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_pak_highexplosive"
      },
	  {
        type = "unlock-recipe",
        recipe = "kj_pak_incendiary"
      },
    },
    prerequisites = {"military-3"},
    unit =
    {
      count = 600,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 40
    },
    order = "e-c-d"
  },
})