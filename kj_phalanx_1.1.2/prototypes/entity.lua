local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require ("__base__/prototypes/entity/sounds.lua")
local volume = 0.01 * settings.startup["kj_phalanx_volume"].value
local globalScale = 1

local function flak_normal(inputs)
return
{
	layers =
	{
		{
			filename = "__kj_phalanx__/graphics/entity/phalanx_raising_spritesheet.png",
			width = 350,
			height = 350,
			direction_count = 4,
			frame_count = inputs.frame_count or 16,
			line_length = inputs.line_length or 8,
			run_mode = inputs.run_mode or "forward",
			axially_symmetrical = false,
			scale = globalScale,
			hr_version = {
				filename = "__kj_phalanx__/graphics/entity/phalanx_raising_hr_spritesheet.png",
				width = 700,
				height = 700,
				direction_count = 4,
				frame_count = inputs.frame_count or 16,
				line_length = inputs.line_length or 8,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			},
		},
		{
			filename = "__kj_phalanx__/graphics/entity/phalanx_raising_spritesheet_shadow.png",
			width = 350,
			height = 350,
			direction_count = 4,
			draw_as_shadow = true,
			frame_count = inputs.frame_count or 16,
			line_length = inputs.line_length or 8,
			run_mode = inputs.run_mode or "forward",
			axially_symmetrical = false,
			scale = globalScale,
			hr_version = {
				filename = "__kj_phalanx__/graphics/entity/phalanx_raising_hr_spritesheet_shadow.png",
				width = 700,
				height = 700,
				direction_count = 4,
				draw_as_shadow = true,
				frame_count = inputs.frame_count or 16,
				line_length = inputs.line_length or 8,
				run_mode = inputs.run_mode or "forward",
				axially_symmetrical = false,
				scale = 0.5,
			},
		}
	}
}
end

local function flak_attack(inputs)
if inputs.version then
	version = inputs.version
else
	version = ""
end

return
{
  layers =
  {
    {
		width = 350,
		height = 350,
		frame_count = inputs.frame_count or 3,
		run_mode = inputs.run_mode or "forward",
		axially_symmetrical = false,
		direction_count = 64,
		animation_speed = 1,
		scale = globalScale,
		stripes =
		{
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet0.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet1.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet2.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet3.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet4.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet5.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet6.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet7.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
		},
		hr_version = {
			width = 700,
			height = 700,
			frame_count = inputs.frame_count or 3,
			run_mode = inputs.run_mode or "forward",
			axially_symmetrical = false,
			direction_count = 64,
			animation_speed = 1,
			scale = 0.5,
			stripes =
			{
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet0.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet1.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet2.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet3.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet4.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet5.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet6.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet7.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
			},
		},
    },
    {
		width = 350,
		height = 350,
		frame_count = inputs.frame_count or 3,
		run_mode = inputs.run_mode or "forward",
		axially_symmetrical = false,
		draw_as_shadow = true,
		direction_count = 64,
		animation_speed = 1,
		scale = globalScale,
		stripes =
		{
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet0_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet1_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet2_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet3_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet4_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet5_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet6_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
			{
			  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_spritesheet7_shadow.png",
			  width_in_frames = inputs.frame_count or 3,
			  height_in_frames = 8
			},
		},
		hr_version = {
			width = 700,
			height = 700,
			frame_count = inputs.frame_count or 3,
			run_mode = inputs.run_mode or "forward",
			axially_symmetrical = false,
			draw_as_shadow = true,
			direction_count = 64,
			animation_speed = 1,
			scale = 0.5,
			stripes =
			{
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet0_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet1_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet2_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet3_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet4_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet5_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet6_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
				{
				  filename = "__kj_phalanx__/graphics/entity/phalanx_shooting"..version.."_hr_spritesheet7_shadow.png",
				  width_in_frames = inputs.frame_count or 3,
				  height_in_frames = 8
				},
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
		name = "kj_phalanx",
		icon = "__kj_phalanx__/graphics/phalanx_icon.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation", "not-flammable"},
		minable = {mining_time = 1, result = "kj_phalanx"},
		mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 1.6},
		max_health = 1000,
		localised_name = {"", {"entity-name.kj_phalanxAA"}},
		localised_description = {"", {"entity-description.kj_phalanxAA"}},
		--attack_target_mask = {"air-unit"},
		--ignore_target_mask = {"ground-unit"},
		--trigger_target_mask = {"air-unit"},
		corpse = "big-remnants", 
		resistances =
		{
		  {
			type = "fire",
			decrease = 20,
			percent = 65,
		  },
		  {
			type = "physical",
			decrease = 14,
			percent = 30,
		  },
		  {
			type = "impact",
			decrease = 10,
			percent = 40,
		  },
		  {
			type = "explosion",
			decrease = 0,
			percent = 15,
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
		collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		drawing_box =   {{-2, -2}, {2, 2}},
		sticker_box = {{-1, -1}, {1, 1}},
		damaged_trigger_effect = hit_effects.entity(),
		
		rotation_speed = 0.01,
		preparing_speed = 0.06,
		folding_speed = 0.06,
		prepared_speed = 0.4,
		attacking_speed = 0.4,
		--ending_attack_speed = 0.4,
		
		inventory_size = 1,
		automated_ammo_count = 100,
		alert_when_attacking = true,
		
		open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
		close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
		--preparing_sound = sounds.gun_turret_activate,
		preparing_sound = {filename = "__kj_phalanx__/sounds/turn.ogg", volume = 0.5, speed = 1},
		--folding_sound = sounds.gun_turret_deactivate,
		folding_sound = {filename = "__kj_phalanx__/sounds/turn.ogg", volume = 0.5, speed = 1},
		
		prepared_sound = {
			{
				filename = "__kj_phalanx__/sounds/spinning_1.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_2.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_3.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_4.ogg",
				volume = 0.3 * volume
			},
			{
				filename = "__kj_phalanx__/sounds/spinning_5.ogg",
				volume = 0.3 * volume
			},
		},
		
		folded_animation = {
			layers =
			{
				{
					filename = "__kj_phalanx__/graphics/entity/phalanx_folded_spritesheet.png",
					width = 350,
					height = 350,
					direction_count = 4,
					frame_count = 1,
					axially_symmetrical = false,
					scale = globalScale,
					hr_version = {
						filename = "__kj_phalanx__/graphics/entity/phalanx_folded_hr_spritesheet.png",
						width = 700,
						height = 700,
						direction_count = 4,
						frame_count = 1,
						axially_symmetrical = false,
						scale = 0.5,
					},
				},
				{
					filename = "__kj_phalanx__/graphics/entity/phalanx_folded_spritesheet_shadow.png",
					width = 350,
					height = 350,
					direction_count = 4,
					draw_as_shadow = true,
					frame_count = 1,
					axially_symmetrical = false,
					scale = globalScale,
					hr_version = {
						filename = "__kj_phalanx__/graphics/entity/phalanx_folded_hr_spritesheet_shadow.png",
						width = 700,
						height = 700,
						direction_count = 4,
						frame_count = 1,
						axially_symmetrical = false,
						draw_as_shadow = true,
						scale = 0.5,
					},
				}
			}
		},
		folding_animation = flak_normal{run_mode = "backward"},
		
		prepared_animation = flak_attack{},
		preparing_animation = flak_normal{},
		
		attacking_animation = flak_attack{version = 2, frame_count = 2},
		--ending_attack_animation = flak_attack{version = 2, frame_count = 2, run_mode = "backward"},
		
		base_picture =
		{
			filename = "__kj_phalanx__/graphics/entity/phalanx_base.png",
			width = 350,
			height = 350,
			axially_symmetrical = false,
			direction_count = 1,
			frame_count = 1,
			scale = globalScale,
			tint = {r=1, g=0.5, b=0.5, a=1},
			hr_version = {
				filename = "__kj_phalanx__/graphics/entity/phalanx_base_hr.png",
				width = 700,
				height = 700,
				axially_symmetrical = false,
				direction_count = 1,
				frame_count = 1,
				scale = 0.5,
				tint = {r=1, g=0.5, b=0.5, a=1},
			},
		},
		integration =
		{
			filename = "__kj_phalanx__/graphics/entity/phalanx_base_shadow.png",
			--priority = "low",
			width = 350,
			height = 350,
			draw_as_shadow = true,
			scale = globalScale,
			hr_version = {
				filename = "__kj_phalanx__/graphics/entity/phalanx_base_hr_shadow.png",
				--priority = "low",
				width = 700,
				height = 700,
				draw_as_shadow = true,
				scale = 0.5,
			},
		},
		vehicle_impact_sound =  sounds.generic_impact,
		attack_parameters =
		{
			type = "projectile",
			ammo_categories = {"kj_apds_phalanx"},
			cooldown = 3,
			projectile_creation_distance = 2.5,
			projectile_center = {0, -1.6},
			range = 70,
			min_range = 5,
			sound = {
				{
					filename = "__kj_phalanx__/sounds/minigun_1.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_2.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_3.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_4.ogg",
					volume = 0.3 * volume
				},
				{
					filename = "__kj_phalanx__/sounds/minigun_5.ogg",
					volume = 0.3 * volume
				},
			},
			rotate_penalty = 50,
			health_penalty = 10,
			--[[shell_particle = {
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.1,
				speed_deviation = 0.03,
				--center = {-0.5, 0},
				--creation_distance = 1,
				starting_frame_speed = 0.4,
				starting_frame_speed_deviation = 0.1,
			},]]
		},
		call_for_help_radius = 75,
		prepare_range = 100
	},
})

