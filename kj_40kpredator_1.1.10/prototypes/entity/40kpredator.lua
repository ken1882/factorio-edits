local movement_triggers = require("prototypes.entity.movement_triggers")

local boltersounds =
{
  {
    filename = "__kj_40kpredator__/sounds/bolter1.ogg",
    volume = 0.57
  },
  {
    filename = "__kj_40kpredator__/sounds/bolter2.ogg",
    volume = 0.57
  },
  {
    filename = "__kj_40kpredator__/sounds/bolter3.ogg",
    volume = 0.57
  },
  {
    filename = "__kj_40kpredator__/sounds/bolter4.ogg",
    volume = 0.57
  },
  {
    filename = "__kj_40kpredator__/sounds//bolter5.ogg",
    volume = 0.57
  }
}

local tank_gunshot =
{
  {
    filename = "__base__/sound/fight/tank-cannon-1.ogg",
    volume = 0.57
  },
  {
    filename = "__base__/sound/fight/tank-cannon-2.ogg",
    volume = 0.57
  },
  {
    filename = "__base__/sound/fight/tank-cannon-3.ogg",
    volume = 0.57
  },
  {
    filename = "__base__/sound/fight/tank-cannon-4.ogg",
    volume = 0.57
  },
  {
    filename = "__base__/sound/fight/tank-cannon-5.ogg",
    volume = 0.57
  }
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
--Bolter
	{
		type = "gun",
		name = "kj_predator_bolter",
		icon = "__kj_40kpredator__/graphics/equipment/bolter.png",
		icon_size = 32,
		flags = {"hidden"},
		subgroup = "gun",
		order = "l[lemanruss]-b[bolter]",
		attack_parameters =
		{
		  type = "projectile",
		  ammo_category = "kj_bolter",
		  cooldown = 15,
		  health_penalty = -5,
		  rotate_penalty = 5,
		  projectile_creation_distance = 1.4,
		  projectile_center = {0, -0.1},
		  --projectile_creation_parameters = shoot_shiftings_bolter(),
		  range = 45,
		  sound = boltersounds,
		},
		stack_size = 5
	},

-- TankGun
  {
    type = "gun",
    name = "kj_predator",
    icon = "__kj_40kpredator__/graphics/equipment/40kpredator_turm_icon.png",
    icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[maustank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_predator",
      cooldown = 120,
      health_penalty = -5,
      rotate_penalty = 5,
      projectile_creation_distance = 3.5,
      projectile_center = {0, -1.4},
      range = 65,
      sound =
      {
        {
          filename = "__kj_40kpredator__/sounds/tank-shot.ogg",
          volume = 0.6
        }
      },
    },
    stack_size = 5
  },
  
--Entity
  {
    type = "car",
    name = "kj_40kpredator",
    icon = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 6.5, result = "kj_40kpredator"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 9000,
    corpse = "big-remnants",
    dying_explosion = "rocket-silo-explosion",
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.2,
	equipment_grid = "kj_40kpredator",
	--render_layer = "higher-object-under",
    resistances =
    {
      {
        type = "fire",
        decrease = 20,
        percent = 80
      },
      {
        type = "physical",
        decrease = 30,
        percent = 75
      },
      {
        type = "impact",
        decrease = 20,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 15,
        percent = 70
      },
      {
        type = "acid",
        decrease = 15,
        percent = 50
      }
    },
    collision_box = {{-1.8, -2}, {1.8, 2}},
    selection_box = {{-1.8, -2}, {1.8, 2}},
    sticker_box = {{-1, -1}, {1, 1}},
    effectivity = 1,
    braking_power = "600kW", 
	burner =
    {
      fuel_category = "kj_gas_barrel",
      effectivity = 1,
      fuel_inventory_size = 2,
	  burnt_inventory_size = 1,
      smoke =
      {
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          --position = {-0.5, 2},
          north_position = {0, -2},
          south_position = {0, -2},
          east_position = {0, -2},
          west_position = {0, -2},
		  --offset = -2,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
	  consumption = "600kW",
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
        shift = {-1.4, -20},
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
        shift = {1.4, -20},
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
          width = 400,
          height = 400,
          frame_count = 2,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 3,
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet0.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet1.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet2.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet3.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet4.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet5.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet6.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet7.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet8.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet9.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet10.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet11.png",
             width_in_frames = 2,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet12.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
          },
		  hr_version =
          {
			width = 800,
			height = 800,
			frame_count = 2,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 3,
			max_advance = 0.2,
			scale = 0.5,
			stripes = 
			{
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet0.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet1.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet2.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet3.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet4.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet5.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet6.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet7.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet8.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet9.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet10.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet11.png",
				 width_in_frames = 2,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet12.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
			},
		  },
        },
        {
          width = 400,
          height = 400,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 3,
          max_advance = 0.2,
		  scale = 1,
          stripes = util.multiplystripes(2,
           {
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet0_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet1_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet2_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet3_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet4_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet5_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet6_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet7_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet8_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet9_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet10_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet11_shadow.png",
             width_in_frames = 1,
             height_in_frames = 10,
            },
            {
             filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_spritesheet12_shadow.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
          }),
		  hr_version =
          {
			width = 800,
			height = 800,
			frame_count = 2,
			draw_as_shadow = true,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 3,
			max_advance = 0.2,
			scale = 0.5,
			stripes = util.multiplystripes(2,
			{
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet0_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet1_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet2_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet3_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet4_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet5_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet6_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet7_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet8_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet9_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet10_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet11_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 10,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_hr_spritesheet12_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
			}),
		  },
        },
      }
    },
	turret_animation =
    {
      layers =
      {
        {
          width = 400,
          height = 400,
          frame_count = 1,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 3,
		  max_advance = 0.2,
		  stripes =
          {
            {
			 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_spritesheet0.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_spritesheet1.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 800,
			height = 800,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 3,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_hr_spritesheet0.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_hr_spritesheet1.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
          },
        },
        {
			width = 400,
			height = 400,
			frame_count = 1,
			draw_as_shadow = true,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 3,
			max_advance = 0.2,
			scale = 1,
			stripes =
			{
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_spritesheet0_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_spritesheet1_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
			hr_version =
			{
				width = 800,
				height = 800,
				frame_count = 1,
				draw_as_shadow = true,
				direction_count = 128,
				shift = {0, 0.5},
				animation_speed = 3,
				max_advance = 0.2,
				scale = 0.5,
				stripes =
				{
					{
					 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_hr_spritesheet0_shadow.png",
					 width_in_frames = 8,
					 height_in_frames = 8,
					},
					{
					 filename = "__kj_40kpredator__/graphics/entity/40kpredator/40kpredator_turm_hr_spritesheet1_shadow.png",
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
            volume = 0.8
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
        filename = "__kj_40kpredator__/sounds/tank-engine.ogg",
        volume = 0.37
      },
      activate_sound =
      {
        filename = "__kj_40kpredator__/sounds/tank-engine-start.ogg",
        volume = 0.37
      },
      deactivate_sound =
      {
        filename = "__kj_40kpredator__/sounds/tank-engine-stop.ogg",
        volume = 0.37
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_40kpredator__/sounds/tank-no-fuel-1.ogg",
        volume = 0.5
      }
    },
    open_sound = { filename = "__kj_40kpredator__/sounds/mouse_door_open.ogg", volume = 0.7 },
    close_sound = { filename = "__kj_40kpredator__/sounds/mouse_door_close.ogg", volume = 0.7 },
    rotation_speed = 0.0038,
    tank_driving = true,
    weight = 100000,
    inventory_size = 40,
    guns = {"kj_predator", "kj_predator_bolter"},
    turret_rotation_speed = 0.22 / 60,
    turret_return_timeout = 300,
	has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.maustank,
  },
})