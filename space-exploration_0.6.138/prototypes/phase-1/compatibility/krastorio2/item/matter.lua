

-- Basic Stabilizer
local basic_stabilizer = table.deepcopy(data.raw.item["matter-stabilizer"])
basic_stabilizer.name = "se-kr-basic-stabilizer"
basic_stabilizer.localised_name = {"item-name.se-kr-basic-stabilizer"}
basic_stabilizer.order = "w1[matter-stabilizers]-a1[basic-matter-stabilizer]"
basic_stabilizer.icons = {
  {icon = "__Krastorio2Assets__/icons/items/matter-stabilizer.png", icon_size = 64},
  {icon = "__space-exploration-graphics__/graphics/compatability/icons/basic-matter-stabilizer-layer.png", icon_size = 64}
}
data:extend({basic_stabilizer})

local basic_stabilizer_charged = table.deepcopy(data.raw.item["charged-matter-stabilizer"])
basic_stabilizer_charged.name = "se-kr-charged-basic-stabilizer"
basic_stabilizer_charged.localised_name = {"item-name.se-kr-charged-basic-stabilizer"}
basic_stabilizer_charged.order = "w1[matter-stabilizers]-a2[charged-basic-matter-stabilizer]"
basic_stabilizer_charged.icons = {
  {icon = "__Krastorio2Assets__/icons/items/charged-matter-stabilizer.png", icon_size = 64},
  {icon = "__space-exploration-graphics__/graphics/compatability/icons/basic-matter-stabilizer-layer.png", icon_size = 64}
}
basic_stabilizer_charged.stack_size = 20
basic_stabilizer_charged.pictures.layers = {
  {
    size = 64,
    filename = "__Krastorio2Assets__/icons/items/charged-matter-stabilizer.png",
    scale = 0.25,
  },
  {
    size = 64,
    filename = "__space-exploration-graphics__/graphics/compatability/icons/basic-matter-stabilizer-layer.png",
    scale = 0.25,
  }
}
data:extend({basic_stabilizer_charged})