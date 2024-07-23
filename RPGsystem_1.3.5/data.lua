require("prototypes.fonts")
require("prototypes.sprites")
require("prototypes.potions")
require("prototypes.magic")
require("controls")


data.raw["gui-style"]["default"]["ic_title_frame"] = {
  type = "frame_style",
  graphical_set = {},
  horizontally_stretchable = "on",
  padding = 0,
  right_margin = 6,
  top_margin = 4,
  vertical_align = "center"}


data:extend({

	{
		type = "sound",
		name = "hadouken",
		filename ="__RPGsystem__/sound/hadouken.ogg",
		volume = 1
	},  
	
})