local data_util = require("data_util")

-- utility sprites don't work right now so use hidden signals
data:extend({
  {
    type = "virtual-signal",
    name = "signal-speed",
    icon = "__space-exploration-graphics__/graphics/icons/signal/signal-speed.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "aai-speed"
  },
  {
    type = "virtual-signal",
    name = "signal-distance",
    icon = "__space-exploration-graphics__/graphics/icons/signal/signal-distance.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "aai-distance"
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "star",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/star.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-a",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "planet",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/planet-small.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "planet-orbit",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/planet-orbit.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "moon",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/moon-small.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-c",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "moon-orbit",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/moon-orbit.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-c",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "asteroid-belt",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/asteroid-belt.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-d",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "asteroid-field",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/asteroid-field.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-e",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "anomaly",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/anomaly.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-f",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "meteor",
    icon = "__space-exploration-graphics__/graphics/icons/astronomic/meteor.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "cargo-rocket",
    icon = "__space-exploration-graphics__/graphics/icons/cargo-rocket.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "spaceship",
    icon = "__space-exploration-graphics__/graphics/icons/spaceship.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "spaceship-launch",
    icon = "__space-exploration-graphics__/graphics/icons/spaceship-launch.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g-b-a",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "anchor-using-left-clamp",
    icon = "__space-exploration-graphics__/graphics/icons/anchor-using-left-clamp.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g-b-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "anchor-using-right-clamp",
    icon = "__space-exploration-graphics__/graphics/icons/anchor-using-right-clamp.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g-b-c",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "anchor-to-left-clamp",
    icon = "__space-exploration-graphics__/graphics/icons/anchor-to-left-clamp.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g-b-d",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "anchor-to-right-clamp",
    icon = "__space-exploration-graphics__/graphics/icons/anchor-to-right-clamp.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-a-g-b-e",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "remote-view",
    icon = "__space-exploration-graphics__/graphics/icons/uplink.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-f",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "death",
    icon = "__space-exploration-graphics__/graphics/icons/scull.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-g",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "character-corpse",
    icon = "__space-exploration-graphics__/graphics/icons/character-corpse.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-h",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "ruin",
    icon = "__space-exploration-graphics__/graphics/icons/ruin.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-h-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "accolade",
    icon = "__space-exploration-graphics__/graphics/icons/accolade.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-i",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "pin",
    icon = "__space-exploration-graphics__/graphics/icons/signal/pin.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-i-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "remove",
    icon = "__space-exploration-graphics__/graphics/icons/remove.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-j",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "radius",
    icon = "__space-exploration-graphics__/graphics/icons/radius.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-k",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "hierarchy",
    icon = "__space-exploration-graphics__/graphics/icons/hierarchy.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-l",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "beacon-overload",
    icon = "__space-exploration-graphics__/graphics/icons/alerts/beacon-overload.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-m",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "warning",
    icon = "__core__/graphics/icons/alerts/warning-icon.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-m-a",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "danger",
    icon = "__space-exploration-graphics__/graphics/icons/alerts/danger.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-m-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "core-seam",
    icon = "__space-exploration-graphics__/graphics/icons/alerts/core-seam-icon.png",
    icon_size = 256,
    subgroup = "virtual-signal-utility",
    order = "z-z-m-c",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "heat",
    icon = "__space-exploration-graphics__/graphics/icons/heat.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-n",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "select-icon",
    icon = "__core__/graphics/icons/mip/select-icon-black.png",
    icon_size = 40,
    subgroup = "virtual-signal-utility",
    order = "z-z-o"
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrow-land",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrow_land_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-a",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrow-launch",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrow_launch_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-b",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrow-up-left",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrow_up_left_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-c",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrow-up-right",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrow_up_right_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-d",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrow-left-up",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrow_left_up_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-e",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrow-left-down",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrow_left_down_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-f",
  },
  {
    type = "virtual-signal",
    name = data_util.mod_prefix .. "nav-arrows-cross",
    icon = "__space-exploration-graphics__/graphics/icons/arrows/arrows_cross_white.png",
    icon_size = 64,
    subgroup = "virtual-signal-utility",
    order = "z-z-z-g",
  },
})