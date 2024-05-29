local sounds = require ("__base__/prototypes/entity/sounds.lua")
local hit_effects = require ("__base__/prototypes/entity/hit-effects")

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

-- TankGun
	{
		type = "gun",
		name = "kj_40kbunker_gun",
		icon = "__kj_40kbunker__/graphics/bunker_icon.png",
		icon_size = 128,
		flags = {"hidden"},
		subgroup = "gun",
		order = "z[maustank]-a[cannon]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "bullet",
			cooldown = 4,
			movement_slow_down_factor = 0.7,
			--turn_range = 1/7,
			--health_penalty = -50,
			--rotate_penalty = 50,
			--fire_penalty = 50,
			--warmup = 20,
			--cooldown_deviation = 0.5,
			projectile_creation_distance = 4.4,
			projectile_center = {0, 0},
			range = 45,
			sound = sounds.heavy_gunshot,
		},
		stack_size = 5
	},
  
--Entity
	{
		type = "car",
		name = "kj_40kbunker",
		icon = "__kj_40kbunker__/graphics/bunker_icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "building-direction-8-way", "not-flammable"},
		minable = {mining_time = 15, result = "kj_40kbunker"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
		max_health = 20000,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		immune_to_tree_impacts = true,
		immune_to_rock_impacts = true,
		energy_per_hit_point = 0.04,
		--render_layer = "lower-object-above-shadow",
		resistances =
		{
		  {
			type = "fire",
			decrease = 50,
			percent = 100
		  },
		  {
			type = "physical",
			decrease = 30,
			percent = 75
		  },
		  {
			type = "impact",
			decrease = 100,
			percent = 95
		  },
		  {
			type = "explosion",
			decrease = 50,
			percent = 70
		  },
		  {
			type = "acid",
			decrease = 40,
			percent = 70
		  }
		},
		collision_box = {{-4.5, -3.7}, {4.5, 3.7}},
		selection_box = {{-4.5, -3.7}, {4.5, 3.7}},
		drawing_box =   {{-4.5, -3.7}, {4.5, 3.7}},
		sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
		effectivity = 1,
		braking_power = "10kW", 
		energy_source =
		{
			type = "burner",
			render_no_power_icon = false,
			fuel_inventory_size = 1,
			fuel_category = "chemical",
		},
		consumption = "10kW",
		terrain_friction_modifier = 0.5,
		friction = 1,
		light =
		{
		  {
			type = "basic",
			minimum_darkness = 0,
			shift = {0, 0},
			size = 15,
			intensity = 0.8,
			color = {r = 1, g = 1, b = 1},
			source_orientation_offset = 1,
			add_perspective = true,
		  },
		},
		animation =
		{
			layers =
			{
				{
					width = 600,
					height = 600,
					frame_count = 1,
					direction_count = 8,
					shift = {0, 0.5},
					animation_speed = 1,
					max_advance = 0.2,
					stripes =
					{
						{
						 filename = "__kj_40kbunker__/graphics/entity/40kbunker_spritesheet0.png",
						 width_in_frames = 2,
						 height_in_frames = 2,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/40kbunker_spritesheet1.png",
						 width_in_frames = 2,
						 height_in_frames = 2,
						},
					},
					hr_version =
					{
						width = 1200,
						height = 1200,
						frame_count = 1,
						direction_count = 8,
						shift = {0, 0.5},
						animation_speed = 1,
						max_advance = 0.2,
						scale = 0.5,
						stripes =
						{
							{
							 filename = "__kj_40kbunker__/graphics/entity/40kbunker_hr_spritesheet0.png",
							 width_in_frames = 2,
							 height_in_frames = 2,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/40kbunker_hr_spritesheet1.png",
							 width_in_frames = 2,
							 height_in_frames = 2,
							},
						},
					},
				},
				{
					width = 600,
					height = 600,
					frame_count = 1,
					direction_count = 8,
					draw_as_shadow = true,
					shift = {0, 0.5},
					animation_speed = 1,
					max_advance = 0.2,
					stripes =
					{
						{
						 filename = "__kj_40kbunker__/graphics/entity/40kbunker_spritesheet0_shadow.png",
						 width_in_frames = 2,
						 height_in_frames = 2,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/40kbunker_spritesheet1_shadow.png",
						 width_in_frames = 2,
						 height_in_frames = 2,
						},
					},
					hr_version =
					{
						width = 1200,
						height = 1200,
						frame_count = 1,
						direction_count = 8,
						draw_as_shadow = true,
						shift = {0, 0.5},
						animation_speed = 1,
						max_advance = 0.2,
						scale = 0.5,
						stripes =
						{
							{
							 filename = "__kj_40kbunker__/graphics/entity/40kbunker_hr_spritesheet0_shadow.png",
							 width_in_frames = 2,
							 height_in_frames = 2,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/40kbunker_hr_spritesheet1_shadow.png",
							 width_in_frames = 2,
							 height_in_frames = 2,
							},
						},
					},
				},
			},
		},
		turret_animation =
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
			  max_advance = 0.2,
			  stripes =
			  {
				{
				 filename = "__kj_40kbunker__/graphics/entity/empty1x8.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
			  },
			},
		  }
		},

		light_animation =
		{
		  layers =
		  {
			{
				width = 600,
				height = 600,
				frame_count = 1,
				direction_count = 8,
				shift = {0, 0.5},
				animation_speed = 1,
				max_advance = 0.2,
				blend_mode = "additive",
				tint = {r = 0, g = 1, b = 0, a = 1},
				stripes =
				{
					{
					 filename = "__kj_40kbunker__/graphics/entity/40kbunker_lights_spritesheet0.png",
					 width_in_frames = 2,
					 height_in_frames = 2,
					},
					{
					 filename = "__kj_40kbunker__/graphics/entity/40kbunker_lights_spritesheet1.png",
					 width_in_frames = 2,
					 height_in_frames = 2,
					},
				},
				hr_version =
				{
					width = 1200,
					height = 1200,
					frame_count = 1,
					direction_count = 8,
					shift = {0, 0.5},
					animation_speed = 1,
					max_advance = 0.2,
					blend_mode = "additive",
					scale = 0.5,
					tint = {r = 0, g = 1, b = 0, a = 1},
					stripes =
					{
						{
						 filename = "__kj_40kbunker__/graphics/entity/40kbunker_lights_hr_spritesheet0.png",
						 width_in_frames = 2,
						 height_in_frames = 2,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/40kbunker_lights_hr_spritesheet1.png",
						 width_in_frames = 2,
						 height_in_frames = 2,
						},
					},
				},
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
				volume = 0
			  },
			}
		  },
		},
		sound_minimum_speed = 0.05,
		sound_scaling_ratio = 0.3,
		vehicle_impact_sound =  generic_impact,
		--[[working_sound =
		{
		  sound =
		  {
			filename = "__kj_40kbunker__/sounds/tank-engine.ogg",
			volume = 0
		  },
		  activate_sound =
		  {
			filename = "__kj_40kbunker__/sounds/tank-engine-start.ogg",
			volume = 0
		  },
		  deactivate_sound =
		  {
			filename = "__kj_40kbunker__/sounds/tank-engine-stop.ogg",
			volume = 0
		  },
		  match_speed_to_activity = true
		},
		sound_no_fuel =
		{
		  {
			filename = "__kj_40kbunker__/sounds/tank-no-fuel-1.ogg",
			volume = 0
		  }
		},]]

		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
		rotation_speed = 0.000,
		--tank_driving = true,
		weight = 230000,
		inventory_size = 20,
		guns = {"kj_40kbunker_gun"},
		turret_rotation_speed = 1,
		turret_return_timeout = 60,
		has_belt_immunity = true,
	},

	{
		type = "ammo-turret",
		name = "kj_40kbunker_turret",
		icon = "__kj_40kbunker__/graphics/bunker_icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 15, result = "kj_40kbunker"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
		max_health = 20000,
		corpse = "big-remnants", 
		resistances =
		{
		  {
			type = "fire",
			decrease = 50,
			percent = 100
		  },
		  {
			type = "physical",
			decrease = 30,
			percent = 75
		  },
		  {
			type = "impact",
			decrease = 100,
			percent = 95
		  },
		  {
			type = "explosion",
			decrease = 50,
			percent = 70
		  },
		  {
			type = "acid",
			decrease = 40,
			percent = 70
		  }
		},
		dying_explosion = "massive-explosion",
		--collision_box = {{-4.5, -3.7}, {4.5, 3.7}},
		collision_box = {{-4.5, -4.5}, {4.5, 4.5}},
		selection_box = {{-4.5, -3.7}, {4.5, 3.7}},
		drawing_box =   {{-4.5, -3.7}, {4.5, 3.7}},
		sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
		damaged_trigger_effect = hit_effects.entity(),
		rotation_speed = 1,
		preparing_speed = 1,
		folding_speed = 1,
		inventory_size = 6,
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
			  max_advance = 0.2,
			  stripes =
			  {
				{
				 filename = "__kj_40kbunker__/graphics/entity/empty1x8.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
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
					width = 600,
					height = 600,
					frame_count = 1,
					direction_count = 4,
					shift = {0, 0.5},
					animation_speed = 1,
					max_advance = 0.2,
					stripes =
					{
						{
						 filename = "__kj_40kbunker__/graphics/entity/north_base.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/east_base.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/south_base.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/west_base.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
					},
					hr_version =
					{
						width = 1200,
						height = 1200,
						frame_count = 1,
						direction_count = 4,
						shift = {0, 0.5},
						animation_speed = 1,
						max_advance = 0.2,
						scale = 0.5,
						stripes =
						{
							{
							 filename = "__kj_40kbunker__/graphics/entity/north_base_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/east_base_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/south_base_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/west_base_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
						},
					},
				},
				{
					width = 600,
					height = 600,
					frame_count = 1,
					direction_count = 4,
					draw_as_shadow = true,
					shift = {0, 0.5},
					animation_speed = 1,
					max_advance = 0.2,
					stripes =
					{
						{
						 filename = "__kj_40kbunker__/graphics/entity/north_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/east_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/south_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
						{
						 filename = "__kj_40kbunker__/graphics/entity/west_shadow.png",
						 width_in_frames = 1,
						 height_in_frames = 1,
						},
					},
					hr_version =
					{
						width = 1200,
						height = 1200,
						frame_count = 1,
						direction_count = 4,
						draw_as_shadow = true,
						shift = {0, 0.5},
						animation_speed = 1,
						max_advance = 0.2,
						scale = 0.5,
						stripes =
						{
							{
							 filename = "__kj_40kbunker__/graphics/entity/north_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/east_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/south_shadow_hr.png",
							 width_in_frames = 1,
							 height_in_frames = 1,
							},
							{
							 filename = "__kj_40kbunker__/graphics/entity/west_shadow_hr.png",
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
			cooldown = 4,
			turn_range = 1/4,
			movement_slow_down_factor = 0.7,
			projectile_creation_distance = 4.4,
			projectile_center = {0, 0},
			range = 45,
			sound = sounds.heavy_gunshot,
		},
		shoot_in_prepare_state = false,
		turret_base_has_direction = true,
		call_for_help_radius = 40,
	},
})
