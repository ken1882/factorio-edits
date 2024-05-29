local tank_gunshot =
{
  {
    filename = "__kj_pak__/sounds/cannon1.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon2.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon3.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon4.ogg",
    volume = 0.7
  },
  {
    filename = "__kj_pak__/sounds/cannon5.ogg",
    volume = 0.7
  },
}

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
    name = "kj_pak_gun",
    icon = "__kj_pak__/graphics/equipment/pak_icon.png",
    icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[maustank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_pak",
      cooldown = 120,
	  health_penalty = -50,
	  rotate_penalty = 50,
	  fire_penalty = 50,
	  --warmup = 20,
	  cooldown_deviation = 0.5,
      projectile_creation_distance = 4.4,
      projectile_center = {0, -0.8},
      range = 120,
      sound = tank_gunshot,
    },
    stack_size = 5
  },
  
--Entity
  {
    type = "car",
    name = "kj_pak",
    icon = "__kj_pak__/graphics/pak_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 3, result = "kj_pak"},
	mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 1000,
    corpse = "big-remnants",
    dying_explosion = "tank-explosion",
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = false,
    energy_per_hit_point = 0.04,
	render_layer = "lower-object-above-shadow",
    resistances =
    {
      {
        type = "fire",
        decrease = 20,
        percent = 90
      },
      {
        type = "physical",
        decrease = 30,
        percent = 75
      },
      {
        type = "impact",
        decrease = 20,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 50
      },
      {
        type = "acid",
        decrease = 15,
        percent = 50
      }
    },
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.75, -0.75}, {0.75, 0.75}},
    sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
    effectivity = 1,
    braking_power = "600kW", 
	energy_source =
	{
		type = "burner",
		render_no_power_icon = false,
		fuel_inventory_size = 1,
		effectivity = 1,
		fuel_category = "kj_gas_can",
		burnt_inventory_size = 1,
	},
	consumption = "1000kW",
    terrain_friction_modifier = 0.5,
    friction = 1,
    animation =
    {
		width = 1,
		height = 1,
		direction_count = 128,
		shift = {0, 0},
		animation_speed = 1,
		max_advance = 0.2,
		stripes =
		{
			{
			 filename = "__kj_pak__/graphics/empty2x64.png",
			 width_in_frames = 2,
			 height_in_frames = 64,
			},
		},
    },
	turret_animation =
    {
      layers =
      {
        {
          width = 360,
          height = 360,
          frame_count = 1,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 1,
		  max_advance = 0.2,
		  stripes =
          {
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet0.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet1.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 720,
			height = 720,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0},
			animation_speed = 1,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet0.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet1.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
          },
        },
        {
          width = 360,
          height = 360,
          frame_count = 1,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 1,
		  max_advance = 0.2,
		  draw_as_shadow = true,
		  stripes =
          {
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet0_shadow.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet1_shadow.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 720,
			height = 720,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0},
			animation_speed = 1,
			max_advance = 0.2,
			scale = 0.5,
			draw_as_shadow = true,
			stripes =
			{
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet0_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet1_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
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
    working_sound =
    {
      sound =
      {
        filename = "__kj_pak__/sounds/tank-engine.ogg",
        volume = 0
      },
      activate_sound =
      {
        filename = "__kj_pak__/sounds/tank-engine-start.ogg",
        volume = 0
      },
      deactivate_sound =
      {
        filename = "__kj_pak__/sounds/tank-engine-stop.ogg",
        volume = 0
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_pak__/sounds/tank-no-fuel-1.ogg",
        volume = 0
      }
    },
	
    open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
    close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
    rotation_speed = 0.0025,
    tank_driving = true,
    weight = 3000,
    inventory_size = 5,
    guns = {"kj_pak_gun"},
    turret_rotation_speed = 0.14 / 60,
    turret_return_timeout = 36000,
	has_belt_immunity = false,
  },

--Entity
  {
	type = "ammo-turret",
    name = "kj_pak_turret",
    icon = "__kj_pak__/graphics/pak_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 3, result = "kj_pak_turret"},
	mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 1000,
    corpse = "big-remnants",
    resistances =
    {
      {
        type = "fire",
        decrease = 20,
        percent = 90
      },
      {
        type = "physical",
        decrease = 30,
        percent = 75
      },
      {
        type = "impact",
        decrease = 20,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 50
      },
      {
        type = "acid",
        decrease = 15,
        percent = 50
      }
    },
    dying_explosion = "tank-explosion",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-0.75, -0.75}, {0.75, 0.75}},
    sticker_box = {{-0.75, -0.75}, {0.75, 0.75}},
    base_picture =
    {
		width = 1,
		height = 1,
		direction_count = 128,
		shift = {0, 0},
		animation_speed = 1,
		max_advance = 0.2,
		stripes =
		{
			{
			 filename = "__kj_pak__/graphics/empty2x64.png",
			 width_in_frames = 2,
			 height_in_frames = 64,
			},
		},
    },
	folded_animation =
    {
      layers =
      {
        {
          width = 360,
          height = 360,
          frame_count = 1,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 1,
		  max_advance = 0.2,
		  stripes =
          {
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet0.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet1.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 720,
			height = 720,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0},
			animation_speed = 1,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet0.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet1.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
          },
        },
        {
          width = 360,
          height = 360,
          frame_count = 1,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 1,
		  max_advance = 0.2,
		  draw_as_shadow = true,
		  stripes =
          {
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet0_shadow.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_pak__/graphics/entity/pak/pak_spritesheet1_shadow.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 720,
			height = 720,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0},
			animation_speed = 1,
			max_advance = 0.2,
			scale = 0.5,
			draw_as_shadow = true,
			stripes =
			{
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet0_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_pak__/graphics/entity/pak/pak_hr_spritesheet1_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
          },
        },
      }
    },
    vehicle_impact_sound = generic_impact,
    open_sound = {filename = "__base__/sound/artillery-open.ogg", volume = 0.7 },
    close_sound = {filename = "__base__/sound/artillery-close.ogg", volume = 0.7 },
    rotation_speed = 0.08 / 60,
	preparing_speed = 1,
	folding_speed = 1,
	automated_ammo_count = 10,
	attacking_speed = 1,
	alert_when_attacking = true,
    inventory_size = 1,
	attack_parameters =
	{
		type = "projectile",
		ammo_category = "kj_pak",
		cooldown = 120,
		health_penalty = -50,
		rotate_penalty = 50,
		fire_penalty = 50,
		--warmup = 20,
		cooldown_deviation = 0.5,
		projectile_creation_distance = 4.4,
		projectile_center = {0, -0.8},
    min_range = 12,
    turn_range = 0.35,
		range = 120,
		sound = tank_gunshot,
	},
	shoot_in_prepare_state = false,
	has_belt_immunity = false,
	call_for_help_radius = 50,
  },
})