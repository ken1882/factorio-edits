local movement_triggers = require("prototypes.entity.movement_triggers")

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

-- MG42
	local mg42 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
	mg42.name = "kj_mg42"
	mg42.icon = "__kj_maustank__/graphics/equipment/mg42_icon.png"
	mg42.icon_size = 128
	mg42.attack_parameters.projectile_creation_distance = 3
	mg42.attack_parameters.projectile_center = {0,0}
	mg42.attack_parameters.cooldown = 3
	mg42.attack_parameters.range = 50
	mg42.order = "[basic-clips]-d[mg42]"
	mg42.flags = {}
	mg42.attack_parameters.sound = {
		{
			filename = "__kj_maustank__/sounds/mg42_1.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_2.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_3.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_4.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_5.ogg",
			volume = 0.4,
		},
		{
			filename = "__kj_maustank__/sounds/mg42_6.ogg",
			volume = 0.4,
		},
	}
	data:extend({mg42})
	
data:extend({

-- TankGun
  {
    type = "gun",
    name = "kj_128kwk",
    icon = "__kj_maustank__/graphics/equipment/maustank_turm_icon.png",
    icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[maustank]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_128kwk",
      cooldown = 150,
      health_penalty = -5,
      rotate_penalty = 5,
      projectile_creation_distance = 7.2,
      projectile_center = {0, -0.8},
      range = 120,
      sound =
      {
        {
          filename = "__kj_maustank__/sounds/tank-shot.ogg",
          volume = 0.9
        }
      },
    },
    stack_size = 5
  },
  
--Entity
  {
    type = "car",
    name = "kj_maustank",
    icon = "__kj_maustank__/graphics/entity/maustank/maustank_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 6.5, result = "kj_maustank"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 10000,
    corpse = "big-remnants",
    dying_explosion = "oil-refinery-explosion",
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.2,
	equipment_grid = "kj_maustank",
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
        decrease = 40,
        percent = 85
      },
      {
        type = "impact",
        decrease = 30,
        percent = 80
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 75
      },
      {
        type = "acid",
        decrease = 10,
        percent = 50
      }
    },
    collision_box = {{-1.9, -4}, {1.9, 4}},
    selection_box = {{-1.4, -3}, {1.4, 3}},
    sticker_box = {{-2, -2}, {2, 2}},
    effectivity = 1,
    braking_power = "1200kW", 
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
          position = {-0.5, 0.5},
			  --north_position = {-1.9, -3.1},
			  --south_position = {-1.9, 0.1},
			  --weast_position = {2.2, -0.1},
			  --west_position = {-2.2, -0.1},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "tank-smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0.5, 0.5},
			  --north_position = {1.9, -3.1},
			  --south_position = {1.9, 0.1},
			  --east_position = {2.2, -2.8},
			  --west_position = {-2.2, -2.8},
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
	  consumption = "1200kW",
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
          width = 625,
          height = 625,
          frame_count = 2,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet0.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet1.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet2.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet3.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet4.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet5.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet6.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet7.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet8.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet9.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet10.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet11.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet12.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet13.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet14.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet15.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet16.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet17.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet18.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet19.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet20.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet21.png",
             width_in_frames = 2,
             height_in_frames = 6,
            },
          },
		  hr_version =
          {
			width = 1250,
			height = 1250,
			frame_count = 2,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes = 
			{
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet0.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet1.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet2.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet3.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet4.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet5.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet6.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet7.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet8.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet9.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet10.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet11.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet12.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet13.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet14.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet15.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet16.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet17.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet18.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet19.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet20.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet21.png",
				 width_in_frames = 2,
				 height_in_frames = 6,
				},
			},
		  },
        },
        {
          width = 625,
          height = 625,
          frame_count = 2,
          draw_as_shadow = true,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 8,
          max_advance = 0.2,
		  scale = 1,
          stripes = util.multiplystripes(2,
           {
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet0_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet1_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet2_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet3_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet4_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet5_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet6_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet7_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet8_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet9_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet10_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet11_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet12_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet13_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet14_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet15_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet16_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet17_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet18_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet19_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet20_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_maustank__/graphics/entity/maustank/maustank_spritesheet21_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
          }),
		  hr_version =
          {
			width = 1250,
			height = 1250,
			frame_count = 2,
			draw_as_shadow = true,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes = util.multiplystripes(2,
			{
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet0_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet1_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet2_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet3_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet4_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet5_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet6_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet7_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet8_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet9_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet10_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet11_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet12_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet13_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet14_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet15_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet16_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet17_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet18_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet19_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet20_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_hr_spritesheet21_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
			}),
		  }
        }
      }
    },
	turret_animation =
    {
      layers =
      {
        {
          width = 625,
          height = 625,
          frame_count = 1,
          direction_count = 128,
		  shift = {0, 0.5},
          --shift = util.by_pixel(-20, 0),
          --shift = util.by_pixel(2-2, -40.5 + tank_shift_y),
          animation_speed = 8,
		  max_advance = 0.2,
		  stripes =
          {
            {
			 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_spritesheet0.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_spritesheet1.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 1250,
			height = 1250,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0.5},
			--shift = util.by_pixel(-20, 0),
			--shift = util.by_pixel(2-2, -40.5 + tank_shift_y),
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet0.png",
				 width_in_frames = 6,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet1.png",
				 width_in_frames = 6,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet2.png",
				 width_in_frames = 6,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet3.png",
				 width_in_frames = 5,
				 height_in_frames = 4,
				},
			},
          }
        },
        {
			width = 625,
			height = 625,
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
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_spritesheet0_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_spritesheet1_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
			hr_version =
			{
				width = 1250,
				height = 1250,
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
					 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet0_shadow.png",
					 width_in_frames = 6,
					 height_in_frames = 6,
					},
					{
					 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet1_shadow.png",
					 width_in_frames = 6,
					 height_in_frames = 6,
					},
					{
					 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet2_shadow.png",
					 width_in_frames = 6,
					 height_in_frames = 6,
					},
					{
					 filename = "__kj_maustank__/graphics/entity/maustank/maustank_turm_hr_spritesheet3_shadow.png",
					 width_in_frames = 5,
					 height_in_frames = 4,
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
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.4,
    vehicle_impact_sound =  generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__kj_maustank__/sounds/tank-engine.ogg",
        volume = 0.37
      },
      activate_sound =
      {
        filename = "__kj_maustank__/sounds/tank-engine-start.ogg",
        volume = 0.37
      },
      deactivate_sound =
      {
        filename = "__kj_maustank__/sounds/tank-engine-stop.ogg",
        volume = 0.37
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_maustank__/sounds/tank-no-fuel-1.ogg",
        volume = 0.5
      }
    },
    open_sound = { filename = "__kj_maustank__/sounds/mouse_door_open.ogg", volume = 0.7 },
    close_sound = { filename = "__kj_maustank__/sounds/mouse_door_close.ogg", volume = 0.7 },
    rotation_speed = 0.0042,
    tank_driving = true,
    weight = 100000,
    inventory_size = 80,
    guns = {"kj_128kwk", "kj_mg42"},
    -- turret_rotation_speed = 0.09 / 60,
    turret_rotation_speed = 0.21 / 60,
    turret_return_timeout = 600,
	  has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.maustank,
  },
})