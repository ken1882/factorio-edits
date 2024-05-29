local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require ("__base__/prototypes/entity/sounds.lua")

local function flak_normal(inputs)
return 
{
	layers = {	
		{
			filename = "__kj_vierling__/graphics/entity/vierling/vierling_raising_spritesheet.png",
			width = 500,
			height = 500,
			direction_count = 4,
			frame_count = inputs.frame_count or 6,
			line_length = inputs.line_length or 0,
			run_mode = inputs.run_mode or "forward",
			axially_symmetrical = false,
			scale = 0.5,
		},
		{
			filename = "__kj_vierling__/graphics/entity/vierling/vierling_raising_spritesheet_shadow.png",
			width = 500,
			height = 500,
			direction_count = 4,
			draw_as_shadow = true,
			frame_count = inputs.frame_count or 6,
			line_length = inputs.line_length or 0,
			run_mode = inputs.run_mode or "forward",
			axially_symmetrical = false,
			scale = 0.5,
		}
	}
}
end

local function flak_attack(inputs)
return
{
  layers =
  {
    {
      width = 500,
      height = 500,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
      direction_count = 64,
	  scale = 0.5,
      stripes =
      {
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet0.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet1.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet2.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet3.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet4.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet5.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet6.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet7.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
      },
    },
    {
      width = 500,
      height = 500,
      frame_count = inputs.frame_count or 2,
      axially_symmetrical = false,
	  draw_as_shadow = true,
      direction_count = 64,
	  scale = 0.5,
      stripes =
      {
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet0_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet1_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet2_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet3_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet4_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet5_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet6_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
        {
          filename = "__kj_vierling__/graphics/entity/vierling/vierling_shooting_spritesheet7_shadow.png",
          width_in_frames = inputs.frame_count or 2,
          height_in_frames = 8
        },
      },
    },
  }
}
end

data:extend({
--Flak damage type
	{
		type = "damage-type",
		name = "flak"
	},
	
	--{
	--	type = "trigger-target-type",
	--	name = "air-unit"
	--},
  
	{
		type = "ammo-turret",
		name = "kj_vierling",
		icon = "__kj_vierling__/graphics/vierling_icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 1, result = "kj_vierling"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 1.6},
		max_health = 1000,
		--attack_target_mask = {"air-unit"},
		--ignore_target_mask = {"ground-unit"},
		--trigger_target_mask = {"air-unit"},
		corpse = "big-remnants", 
		resistances =
		{
		  {
			type = "fire",
			decrease = 20,
			percent = 70,
		  },
		  {
			type = "physical",
			decrease = 14,
			percent = 30,
		  },
		  {
			type = "impact",
			decrease = 10,
			percent = 50,
		  },
		  {
			type = "explosion",
			decrease = 0,
			percent = 20,
		  },
		  {
			type = "acid",
			decrease = 5,
			percent = 30,
		  },
		  {
			type = "electric",
			decrease = 5,
			percent = 40
		  },
		  {
			type = "laser",
			decrease = 5,
			percent = 40
		  },
		  {
			type = "poison",
			decrease = 5,
			percent = 95
		  },
		},
		dying_explosion = "big-explosion",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		drawing_box =   {{-2, -2}, {2, 2}},
		sticker_box = {{-1, -1}, {1, 1}},
		damaged_trigger_effect = hit_effects.entity(),
		
		rotation_speed = 0.005,
		preparing_speed = 0.06,
		folding_speed = 0.06,
		attacking_speed = 0.15,
		
		preparing_sound = sounds.gun_turret_activate,
		folding_sound = sounds.gun_turret_deactivate,
		inventory_size = 2,
		automated_ammo_count = 10,
		alert_when_attacking = true,
		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
		
		folded_animation = flak_normal{frame_count = 1, line_length = 1},
		preparing_animation = flak_normal{},
		folding_animation = flak_normal{run_mode = "backward"},
		
		prepared_animation = flak_attack{frame_count = 1},
		attacking_animation = flak_attack{},
		
		
		base_picture =
		{
		  layers =
		  {
			{
			  filename = "__kj_vierling__/graphics/entity/vierling/vierling_base.png",
			  width = 500,
			  height = 500,
			  axially_symmetrical = false,
			  direction_count = 1,
			  frame_count = 1,
			  shift = util.by_pixel(0, 16),
			  scale = 0.5,
			},
		  },
		},
		integration =
		{
			filename = "__kj_vierling__/graphics/entity/vierling/vierling_base_shadow.png",
			priority = "low",
			width = 500,
			height = 500,
			shift = util.by_pixel(0, 16),
			draw_as_shadow = true,
			scale = 0.5,
		},
		vehicle_impact_sound =  sounds.generic_impact,
		attack_parameters =
		{
			type = "projectile",
			ammo_categories = {"kj_2cmfv_vierling"},
			cooldown = 60/10,
			projectile_creation_distance = 2,
			projectile_center = {0, -1},
			range = 40,
			sound = sounds.tank_gunshot,
			rotate_penalty = 100,
			health_penalty = 10,
		},
		call_for_help_radius = 50,
		prepare_range = 100
	},
})

