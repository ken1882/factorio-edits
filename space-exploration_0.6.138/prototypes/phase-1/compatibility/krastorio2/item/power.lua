
data.raw.item["charged-antimatter-fuel-cell"].fuel_value = "100GJ" --same as antimatter cell

data:extend({
  {
    type = "item",
    name = "se-kr-advanced-condenser-turbine",
    icon = "__space-exploration-graphics__/graphics/compatability/icons/advanced-condenser-turbine.png",
    icon_size = 64,
    icon_mipmaps = 4,
    order = "f[nuclear-energy]-e1[advanced-condenser-turbine]",
    place_result = "se-kr-advanced-condenser-turbine",
    stack_size = 10,
    subgroup = "energy"
  }
})