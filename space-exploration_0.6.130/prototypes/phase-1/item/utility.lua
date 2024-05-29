local data_util = require("data_util")
data:extend{
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-settings",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden"},
      stack_size = 50,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-input",
      --icon = "__space-exploration-graphics__/graphics/icon/generic-input.png",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden"},
      stack_size = 50,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-output",
      --icon = "__space-exploration-graphics__/graphics/icon/generic-output.png",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden"},
      stack_size = 50,
  },
  {
      type = "item",
      name = data_util.mod_prefix .. "struct-generic-clamp-west",
      icon = "__space-exploration-graphics__/graphics/icons/settings.png",
      icon_size = 64, icon_mipmaps = 1,
      flags = { "hidden" },
      stack_size = 50,
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "struct-generic-clamp-east",
    icon = "__space-exploration-graphics__/graphics/icons/settings.png",
    icon_size = 64, icon_mipmaps = 1,
    flags = { "hidden" },
    stack_size = 50,
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "train-gui-targeter",
    icon = "__space-exploration-graphics__/graphics/icons/target.png",
    icon_mipmaps = 1,
    icon_size = 64,
    subgroup = "tool",
    order = "c[automated-construction]-e[unit-remote-control]",
    stack_size = 1,
    hidden = true,
    flags = {"hidden", "only-in-cursor"}
  },
}
