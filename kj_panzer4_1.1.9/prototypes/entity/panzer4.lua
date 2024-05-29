local movement_triggers = require("prototypes.entity.movement_triggers")

tank_gunshot =
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

--MG 34
	local mg34 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
	mg34.name = "kj_mg34"
	mg34.icon = "__kj_panzer4__/graphics/equipment/mg34_icon.png"
	mg34.icon_size = 128
	mg34.attack_parameters.cooldown = 3.5
	mg34.projectile_center = {}
	mg34.order = "[basic-clips]-e[mg34]"
	mg34.flags = {}
	mg34.attack_parameters.range = 50
	mg34.attack_parameters.sound = {
		{
			filename = "__kj_panzer4__/sounds/mg34_1.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_2.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_3.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_4.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_5.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_panzer4__/sounds/mg34_6.ogg",
			volume = 0.4,
		},
	}
	data:extend({mg34})

data:extend({
  
-- TankGun
  {
    type = "gun",
    name = "kj_75kwk40",
    icon = "__kj_panzer4__/graphics/equipment/panzer4_turm_icon.png",
    icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[panzer4]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_75kwk40",
    --   cooldown = 180,
	  cooldown = 90,
	  health_penalty = -5,
	  rotate_penalty = 5,
      projectile_creation_distance = 4.2,
      projectile_center = {0, -0.2},
    --   range = 40,
	  range = 95,
      sound = tank_gunshot,
    },
    stack_size = 5
  },
  
--Entity
  {
    type = "car",
    name = "kj_panzer4",
    icon = "__kj_panzer4__/graphics/entity/panzer4/panzer4_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 1.5, result = "kj_panzer4"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 5000,
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.1,
	equipment_grid = "kj_panzer4",
	--render_layer = "higher-object-under",
    resistances =
    {
      {
        type = "fire",
        decrease = 25,
        percent = 70
      },
      {
        type = "physical",
        decrease = 20,
        percent = 60
      },
      {
        type = "impact",
        decrease = 50,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 30,
        percent = 70
      },
      {
        type = "acid",
        decrease = 10,
        percent = 40
      }
    },
    collision_box = {{-1.2, -2}, {1.2, 2}},
    selection_box = {{-1.2, -2}, {1.2, 2}},
    sticker_box = {{-1, -1}, {1, 1}},
    effectivity = 0.9,
    braking_power = "500kW", 
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
          position = {0, 0.9},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },	
	  consumption = "500kW",
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
          width = 360,
          height = 360,
          frame_count = 2,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 8,
          max_advance = 0.2,
		  scale = 1,
          stripes =
          {
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet0.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet1.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet2.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet3.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet4.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet5.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet6.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet7.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet8.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet9.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet10.png",
			 width_in_frames = 2,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet11.png",
			 width_in_frames = 2,
			 height_in_frames = 7,
			},
          },
		  hr_version =
          {
			width = 720,
			height = 720,
			frame_count = 2,
			direction_count = 128,
			shift = {0, 0},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes = 
			{
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet0.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet1.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet2.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet3.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet4.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet5.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet6.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet7.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet8.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet9.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet10.png",
				 width_in_frames = 2,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet11.png",
				 width_in_frames = 2,
				 height_in_frames = 7,
				},
			},
		  },
        },
        {
          width = 360,
          height = 360,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 128,
          shift = {0, 0},
          animation_speed = 8,
          max_advance = 0.2,
		  scale = 1,
          stripes = util.multiplystripes(2,
          {
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet0_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet1_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet2_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet3_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet4_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet5_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet6_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet7_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet8_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet9_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet10_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 11,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_spritesheet11_shadow.png",
			 width_in_frames = 1,
			 height_in_frames = 7,
			},
          }),
		  hr_version =
          {
			width = 720,
			height = 720,
			frame_count = 2,
			direction_count = 128,
			draw_as_shadow = true,
			shift = {0, 0},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes = util.multiplystripes(2,
			{
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet0_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet1_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet2_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet3_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet4_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet5_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet6_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet7_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet8_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet9_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet10_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 11,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/panzer4_hr_spritesheet11_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 7,
				},
			}),
		  },
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
          animation_speed = 8,
		  max_advance = 0.2,
		  scale = 1,
		  stripes =
          {
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_spritesheet0.png",
			 width_in_frames = 8,
			 height_in_frames = 8,
			},
			{
			 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_spritesheet1.png",
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
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_hr_spritesheet0.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_hr_spritesheet1.png",
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
			draw_as_shadow = true,
			direction_count = 128,
			shift = {0, 0},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 1,
			stripes =
			{
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_spritesheet0_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_spritesheet1_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
			hr_version =
			{
				width = 720,
				height = 720,
				frame_count = 1,
				draw_as_shadow = true,
				direction_count = 128,
				shift = {0, 0},
				animation_speed = 8,
				max_advance = 0.2,
				scale = 0.5,
				stripes =
				{
					{
					 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_hr_spritesheet0_shadow.png",
					 width_in_frames = 8,
					 height_in_frames = 8,
					},
					{
					 filename = "__kj_panzer4__/graphics/entity/panzer4/turm/panzer4_turm_hr_spritesheet1_shadow.png",
					 width_in_frames = 8,
					 height_in_frames = 8,
					},
				},
			},
        },
      },
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
            volume = 0.3
          },
        }
      },
    },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.8,
    vehicle_impact_sound =  generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/fight/tank-engine.ogg",
        volume = 0.37
      },
      activate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-start.ogg",
        volume = 0.37
      },
      deactivate_sound =
      {
        filename = "__base__/sound/fight/tank-engine-stop.ogg",
        volume = 0.37
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
        volume = 0.4
      }
    },
    open_sound = { filename = "__base__/sound/fight/tank-door-open.ogg", volume=0.48 },
    close_sound = { filename = "__base__/sound/fight/tank-door-close.ogg", volume = 0.43 },
    rotation_speed = 0.0058,
    tank_driving = true,
    weight = 25000,
    inventory_size = 70,
    guns = {"kj_75kwk40", "kj_mg34"},
    turret_rotation_speed = 0.25 / 60,
    turret_return_timeout = 360,
	has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.panzertank,
  },
})