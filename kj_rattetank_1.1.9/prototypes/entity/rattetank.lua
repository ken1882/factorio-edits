local movement_triggers = require("prototypes.entity.movement_triggers")

local base
local baseShadow
local turret
local turretShadow

base = {
	width = 2000,
	height = 2000,
	frame_count = 1,
	direction_count = 128,
	shift = {0, 0.5},
	animation_speed = 8,
	max_advance = 0.2,
	scale = 1,
	stripes =
	{
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet0.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet1.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet2.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet3.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet4.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet5.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet6.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet7.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet8.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet9.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet10.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet11.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet12.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet13.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet14.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet15.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet16.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet17.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet18.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet19.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet20.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet21.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet22.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet23.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet24.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet25.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet26.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet27.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet28.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet29.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet30.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet31.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
  },
}
baseShadow = {
	width = 2000,
	height = 2000,
	frame_count = 1,
	draw_as_shadow = true,
	direction_count = 128,
	shift = {0, 0},
	animation_speed = 8,
	max_advance = 0.2,
	scale = 1,
	stripes =
	{
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet0_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet1_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet2_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet3_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet4_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet5_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet6_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet7_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet8_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet9_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet10_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet11_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet12_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet13_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet14_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet15_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet16_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet17_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet18_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet19_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet20_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet21_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet22_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet23_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet24_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet25_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet26_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet27_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet28_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet29_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet30_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet31_shadow.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
  },
}
turret = {
	width = 2000,
	height = 2000,
	frame_count = 1,
	direction_count = 128,
	shift = {0, 0.5},
	animation_speed = 8,
	max_advance = 0.2,
	stripes =
	{
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet0.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet1.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet2.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet3.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet4.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet5.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet6.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet7.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet8.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet9.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet10.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet11.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet12.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet13.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet14.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet15.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet16.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet17.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet18.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet19.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet20.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet21.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet22.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet23.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet24.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet25.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet26.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet27.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet28.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet29.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet30.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
	{
	 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet31.png",
	 width_in_frames = 2,
	 height_in_frames = 2,
	},
  },
}
turretShadow = {
	width = 2000,
	height = 2000,
	frame_count = 1,
	draw_as_shadow = true,
	direction_count = 128,
	shift = {0, 0.5},
	animation_speed = 8,
	max_advance = 0.2,
	scale = 1,
	stripes =
	{
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet0_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet1_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet2_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet3_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet4_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet5_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet6_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet7_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet8_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet9_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet10_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet11_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet12_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet13_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet14_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet15_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet16_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet17_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet18_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet19_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet20_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet21_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet22_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet23_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet24_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet25_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet26_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet27_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet28_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet29_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet30_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
		{
		 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet31_shadow.png",
		 width_in_frames = 2,
		 height_in_frames = 2,
		},
	},
}

if mods["kj_rattetank_graphics"] and settings.startup["kj_rattetank_hr"].value == true then
	base =
	  {
		width = 4000,
		height = 4000,
		frame_count = 1,
		direction_count = 128,
		shift = {0, 0.5},
		animation_speed = 8,
		max_advance = 0.2,
		scale = 0.5,
		stripes = 
		{
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet0.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet1.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet2.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet3.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet4.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet5.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet6.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet7.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet8.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet9.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet10.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet11.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet12.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet13.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet14.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet15.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet16.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet17.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet18.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet19.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet20.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet21.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet22.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet23.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet24.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet25.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet26.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet27.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet28.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet29.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet30.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet31.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
		},
	  }
	baseShadow = 
	  {
		width = 4000,
		height = 4000,
		frame_count = 1,
		draw_as_shadow = true,
		direction_count = 128,
		shift = {0, 0.5},
		animation_speed = 8,
		max_advance = 0.2,
		scale = 0.5,
		stripes =
		{
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet0_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet1_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet2_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet3_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet4_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet5_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet6_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet7_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet8_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet9_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet10_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet11_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet12_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet13_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet14_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet15_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet16_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet17_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet18_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet19_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet20_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet21_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet22_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet23_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet24_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet25_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet26_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet27_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet28_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet29_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet30_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/ratte_hr_spritesheet31_shadow.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
		},
	  }
	turret  =
	  {
		width = 4000,
		height = 4000,
		frame_count = 1,
		direction_count = 128,
		shift = {0, 0.5},
		animation_speed = 8,
		max_advance = 0.2,
		scale = 0.5,
		stripes =
		{
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet0.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet1.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet2.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet3.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet4.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet5.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet6.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet7.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet8.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet9.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet10.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet11.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet12.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet13.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet14.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet15.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet16.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet17.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet18.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet19.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet20.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet21.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet22.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet23.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet24.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet25.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet26.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet27.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet28.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet29.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet30.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
			{
				filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet31.png",
				width_in_frames = 2,
				height_in_frames = 2,
			},
		},
	  }
	turretShadow =
		{
			width = 4000,
			height = 4000,
			frame_count = 1,
			draw_as_shadow = true,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet0_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet1_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet2_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet3_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet4_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet5_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet6_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet7_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet8_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet9_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet10_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet11_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet12_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet13_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet14_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet15_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet16_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet17_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet18_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet19_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet20_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet21_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet22_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet23_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet24_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet25_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet26_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet27_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet28_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet29_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet30_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
				{
					filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_hr_spritesheet31_shadow.png",
					width_in_frames = 2,
					height_in_frames = 2,
				},
			},
		}
		
end

local generic_impact =
{
  {
    filename = "__base__/sound/car-metal-impact-2.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-3.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-4.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-5.ogg", volume = 0.5
  },
  {
    filename = "__base__/sound/car-metal-impact-6.ogg", volume = 0.5
  }
}

--[[
data:extend({
  {
	type = "trigger-target-type",
	name = "test1",
  },
})]]

data:extend({
-- TankGun
  {
    type = "gun",
    name = "kj_280SKC34",
    icon = "__kj_rattetank__/graphics/equipment/ratte_turm_icon.png",
    icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[maustank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_280SKC34",
      cooldown = 150,
	  health_penalty = -5,
	  rotate_penalty = 5,
      projectile_creation_distance = 19.2,
      projectile_center = {0, -5},
      range = 150,
      sound =
      {
        {
          filename = "__kj_rattetank__/sounds/ratte_shot.ogg",
          volume = 1
        }
      },
    },
    stack_size = 5
  },
  
--Entity
  {
    type = "car",
    name = "kj_rattetank",
    icon = "__kj_rattetank__/graphics/ratte_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 66.5, result = "kj_rattetank"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 100000,
    corpse = "big-remnants",
    dying_explosion = "rocket-silo-explosion",
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.05,
	equipment_grid = "kj_rattetank",
	--trigger_target_mask = {"test1"},
	--render_layer = "higher-object-under",
    resistances =
    {
      {
        type = "fire",
        decrease = 30,
        percent = 80
      },
      {
        type = "physical",
        decrease = 50,
        percent = 80
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 50,
        percent = 70
      },
      {
        type = "acid",
        decrease = 25,
        percent = 70
      }
    },
    collision_box = {{-6.1, -10}, {6.1, 10}},
    selection_box = {{-6.0, -10}, {6.0, 10}},
    sticker_box = {{-3, -3}, {3, 3}},
    effectivity = 1,
    braking_power = "6000kW", 
	burner =
    {
      fuel_category = "kj_gas_barrel",
      effectivity = 1,
      fuel_inventory_size = 4,
	  burnt_inventory_size = 2,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-2, 5},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {2, 5},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },	
	consumption = "6000kW",
    terrain_friction_modifier = 0.2,
    friction = 0.002,
    light =
    {
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {-0.9, -20},
        size = 3,
        intensity = 1,
        color = {r = 1, g = 1, b = 1}
      },
      {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 2,
          width = 200,
          height = 200
        },
        shift = {0.9, -20},
        size = 3,
        intensity = 1,
        color = {r = 1, g = 1, b = 1}
      },
    },
    animation =
    {
      layers =
      {
        {
          width = 2000,
          height = 2000,
          frame_count = 1,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 8,
          max_advance = 0.2,
		  scale = 1,
          stripes =
          {
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet0.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet1.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet2.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet3.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet4.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet5.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet6.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet7.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet8.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet9.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet10.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet11.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet12.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet13.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet14.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet15.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet16.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet17.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet18.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet19.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet20.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet21.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet22.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet23.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet24.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet25.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet26.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet27.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet28.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet29.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet30.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet31.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
          },
		  hr_version = base,
        },
        {
          width = 2000,
          height = 2000,
          frame_count = 1,
          draw_as_shadow = true,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 8,
          max_advance = 0.2,
		  scale = 1,
          stripes =
           {
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet0_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet1_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet2_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet3_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet4_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet5_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet6_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet7_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet8_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet9_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet10_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet11_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet12_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet13_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet14_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet15_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet16_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet17_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet18_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet19_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet20_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet21_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet22_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet23_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet24_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet25_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet26_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet27_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet28_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet29_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet30_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank__/graphics/entity/rattetank/ratte_spritesheet31_shadow.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
          },
		  hr_version = baseShadow,
        }
      }
    },
	turret_animation =
    {
      layers =
      {
        {
          width = 2000,
          height = 2000,
          frame_count = 1,
          direction_count = 128,
		  shift = {0, 0.5},
          animation_speed = 8,
		  max_advance = 0.2,
		  stripes =
          {
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet0.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet1.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet2.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet3.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet4.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet5.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet6.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet7.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet8.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet9.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet10.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet11.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet12.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet13.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet14.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet15.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet16.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet17.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet18.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet19.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet20.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet21.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet22.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet23.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet24.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet25.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet26.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet27.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet28.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet29.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet30.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
			{
			 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet31.png",
			 width_in_frames = 2,
			 height_in_frames = 2,
			},
          },
          hr_version = turret,
        },
        {
			width = 2000,
			height = 2000,
			frame_count = 1,
			draw_as_shadow = true,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 1,
			stripes =
			{
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet0_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet1_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet2_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet3_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet4_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet5_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet6_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet7_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet8_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet9_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet10_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet11_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet12_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet13_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet14_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet15_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet16_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet17_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet18_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet19_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet20_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet21_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet22_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet23_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet24_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet25_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet26_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet27_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet28_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet29_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet30_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
				{
				 filename = "__kj_rattetank_graphics__/graphics/entity/rattetank/turm/ratte_turm_spritesheet31_shadow.png",
				 width_in_frames = 2,
				 height_in_frames = 2,
				},
			},
			hr_version = turretShadow,
        },
      }
    },
    stop_trigger_speed = 0.1,
    stop_trigger =
    {
      {
        type = "play-sound",
        sound =
        {
          {
            filename = "__base__/sound/fight/tank-brakes.ogg",
            volume = 0.8
          },
        }
      },
    },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.4,
    vehicle_impact_sound =  generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__kj_rattetank__/sounds/ratte_engine.ogg",
        volume = 0.8
      },
      activate_sound =
      {
        filename = "__kj_rattetank__/sounds/ratte_engine_start.ogg",
        volume = 0.8
      },
      deactivate_sound =
      {
        filename = "__kj_rattetank__/sounds/ratte_engine_stop.ogg",
        volume = 0.8
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_rattetank__/sounds/ratte_no_fuel_1.ogg",
        volume = 0.7
      }
    },
    open_sound = { filename = "__kj_rattetank__/sounds/mouse_door_open.ogg", volume = 0.7 },
    close_sound = { filename = "__kj_rattetank__/sounds/mouse_door_close.ogg", volume = 0.7 },
    rotation_speed = 0.0012,
    tank_driving = true,
    weight = 1000000,
    inventory_size = 140,
    guns = {"kj_280SKC34"},
    turret_rotation_speed = 0.15 / 60,
    turret_return_timeout = 600,
	has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.rattetank,
  },
})
