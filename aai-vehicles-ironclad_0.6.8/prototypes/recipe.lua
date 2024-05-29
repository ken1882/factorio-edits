data:extend({
  {
    type = "recipe",
    name = "ironclad",
    normal =
    {
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {"engine-unit", 30},
        {"steel-plate", 10},
        {"iron-gear-wheel", 30},
      },
      result = "ironclad"
    },
    expensive =
    {
      enabled = false,
      energy_required = 8,
      ingredients =
      {
        {"engine-unit", 60},
        {"steel-plate", 200},
        {"iron-gear-wheel", 60},
      },
      result = "ironclad"
    }
  },
})
