local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require ("__base__/prototypes/entity/sounds.lua")
local COLLISIONBOX = {{-2.2, -2.2}, {2.2, 2.2}}

if settings.startup["kj_tower_collision_box"].value == true then
	COLLISIONBOX = {{-0.05, -0.05}, {0.05, 0.05}}
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
	
data:extend({
  
	{
		type = "ammo-turret",
		name = "kj_tower",
		icon = "__kj_tower__/graphics/tower_icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 5, result = "kj_tower"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 1.6},
		max_health = 2500,
		corpse = "big-remnants", 
		resistances =
		{
		  {
			type = "fire",
			decrease = 50,
			percent = 100,
		  },
		  {
			type = "physical",
			decrease = 14,
			percent = 75,
		  },
		  {
			type = "impact",
			decrease = 50,
			percent = 50,
		  },
		  {
			type = "explosion",
			decrease = 40,
			percent = 20,
		  },
		  {
			type = "acid",
			decrease = 15,
			percent = 30,
		  }
		},
		dying_explosion = "big-explosion",
		collision_box = COLLISIONBOX,
		selection_box = {{-2.5, -1.5}, {2.5, 2.5}},
		drawing_box =   {{-1.6, -8.8}, {1.6, 1.8}},
		sticker_box = {{-1.6, -1.6}, {1.6, 1.6}},
		damaged_trigger_effect = hit_effects.entity(),
		rotation_speed = 1,
		preparing_speed = 1,
		folding_speed = 1,
		inventory_size = 5,
		automated_ammo_count = 10,
		attacking_speed = 0.5,
		alert_when_attacking = true,
		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
		base_picture =
		{
		  layers =
		  {
			{
				width = 1,
				height = 1,
				frame_count = 1,
				direction_count = 8,
				shift = {0, 0},
				animation_speed = 1,
				stripes =
				{
					{
					 filename = "__kj_tower__/graphics/entity/empty1x8.png",
					 width_in_frames = 1,
					 height_in_frames = 8,
					},
				},
				hr_version =
				{
					width = 1,
					height = 1,
					frame_count = 1,
					direction_count = 8,
					shift = {0, 0},
					animation_speed = 1,
					stripes =
					{
						{
						 filename = "__kj_tower__/graphics/entity/empty1x8.png",
						 width_in_frames = 1,
						 height_in_frames = 8,
						},
					},
				},
			},
		  }
		},
		folded_animation =
		{
			layers =
			{
				{
					width = 900,
					height = 900,
					frame_count = 1,
					direction_count = 4,
					shift = {0, 0.5},
					animation_speed = 1,
					stripes =
					{
						{
						 filename = "__kj_tower__/graphics/entity/tower/0000.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_tower__/graphics/entity/tower/0001.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_tower__/graphics/entity/tower/0002.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_tower__/graphics/entity/tower/0003.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
					},
					hr_version =
					{
						width = 1800,
						height = 1800,
						frame_count = 1,
						direction_count = 4,
						shift = {0, 0.5},
						animation_speed = 1,
						scale = 0.5,
						stripes =
						{
							{
							 filename = "__kj_tower__/graphics/entity/tower/0000_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_tower__/graphics/entity/tower/0001_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_tower__/graphics/entity/tower/0002_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_tower__/graphics/entity/tower/0003_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
						},
					},
				},
				{
					width = 900,
					height = 900,
					frame_count = 1,
					direction_count = 4,
					draw_as_shadow = true,
					shift = {0, 0.5},
					animation_speed = 1,
					stripes =
					{
						{
						 filename = "__kj_tower__/graphics/entity/tower/0000_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_tower__/graphics/entity/tower/0001_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_tower__/graphics/entity/tower/0002_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_tower__/graphics/entity/tower/0003_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
					},
					hr_version =
					{
						width = 1800,
						height = 1800,
						frame_count = 1,
						direction_count = 4,
						draw_as_shadow = true,
						shift = {0, 0.5},
						animation_speed = 1,
						scale = 0.5,
						stripes =
						{
							{
							 filename = "__kj_tower__/graphics/entity/tower/0000_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_tower__/graphics/entity/tower/0001_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_tower__/graphics/entity/tower/0002_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_tower__/graphics/entity/tower/0003_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
						},
					},
				},
			},
		},
		vehicle_impact_sound =  generic_impact,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 8,
			turn_range = 0.24,
			movement_slow_down_factor = 0.7,
			projectile_creation_distance = 1.5,
			projectile_center = {0, -6},
			range = 68,
			sound = sounds.heavy_gunshot,
			shell_particle =
			{
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.15,
				speed_deviation = 0.03,
				center = {0, 0},
				creation_distance = 0,
				starting_frame_speed = 0.2,
				starting_frame_speed_deviation = 0.1
			},
		},
		shoot_in_prepare_state = false,
		turret_base_has_direction = true,
		call_for_help_radius = 40,
	},
})
