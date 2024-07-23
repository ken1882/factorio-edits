local movement_triggers = require("prototypes.movement_triggers")

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

-- mg3
local mg3 = table.deepcopy(data.raw["gun"]["tank-machine-gun"])
mg3.name = "kj_mg3"
mg3.icon = "__kj_2a6__/graphics/equipment/mg42_icon.png"
mg3.icon_size = 128
mg3.attack_parameters.projectile_creation_distance = 1
mg3.attack_parameters.projectile_center = {0,0}
mg3.attack_parameters.cooldown = 3
mg3.attack_parameters.range = 50
mg3.order = "[basic-clips]-d[mg3]"
mg3.flags = {}
mg3.attack_parameters.sound = {
	{
		filename = "__kj_2a6__/sounds/mg42_1.ogg",
		volume = 0.4,
	},
	{
		filename = "__kj_2a6__/sounds/mg42_2.ogg",
		volume = 0.4,
	},
	{
		filename = "__kj_2a6__/sounds/mg42_3.ogg",
		volume = 0.4,
	},
	{
		filename = "__kj_2a6__/sounds/mg42_4.ogg",
		volume = 0.4,
	},
	{
		filename = "__kj_2a6__/sounds/mg42_5.ogg",
		volume = 0.4,
	},
	{
		filename = "__kj_2a6__/sounds/mg42_6.ogg",
		volume = 0.4,
	},
}
data:extend({mg3})
	
data:extend({

-- TankGun
  {
    type = "gun",
    name = "kj_rh120",
    icon = "__kj_2a6__/graphics/equipment/turm_icon.png",
    icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "z[leopard]-a[cannon]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_rh120",
      cooldown = 90,
      health_penalty = -5,
      rotate_penalty = 5,
      projectile_creation_distance = 5.5,
      projectile_center = {0, 0},
      range = 112,
      sound =
      {
        {
          filename = "__kj_2a6__/sounds/tank-shot.ogg",
          volume = 0.9
        }
      },
    },
    stack_size = 5
  },
  
--Entity
  {
    type = "car",
    name = "kj_2a6",
    icon = "__kj_2a6__/graphics/2a6_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 4.1, result = "kj_2a6"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 8000,
    corpse = "big-remnants",
    dying_explosion = "oil-refinery-explosion",
    immune_to_tree_impacts = true,
    immune_to_rock_impacts = true,
    energy_per_hit_point = 0.1,
	equipment_grid = "kj_2a6",
	--render_layer = "higher-object-under",
    resistances =
    {
      {
        type = "fire",
        decrease = 60,
        percent = 65
      },
      {
        type = "physical",
        decrease = 40,
        percent = 70
      },
      {
        type = "impact",
        decrease = 30,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 50,
        percent = 65
      },
      {
        type = "acid",
        decrease = 20,
        percent = 60
      }
    },
    collision_box = {{-1.75, -3.5}, {1.75, 3.5}},
    selection_box = {{-1.75, -3}, {1.75, 3}},
	drawing_box =   {{-1.9, -4}, {1.9, 4}},
    sticker_box = {{-1, -1}, {1, 1}},
    effectivity = 1,
    braking_power = "3000kW", 
	burner =
    {
      fuel_category = "kj_gas_can",
      effectivity = 2,
      fuel_inventory_size = 3,
	  burnt_inventory_size = 2,
    },
	consumption = "1600kW",
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
	  {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 1.5,
          width = 200,
          height = 200
        },
        shift = {-1.2, 16},
        size = 3,
        intensity = 0.2,
		rotation_shift = 0.5,
        color = {r = 1, g = 0, b = 0}
      },
	  {
        type = "oriented",
        minimum_darkness = 0.3,
        picture =
        {
          filename = "__core__/graphics/light-cone.png",
          priority = "extra-high",
          flags = { "light" },
          scale = 1.5,
          width = 200,
          height = 200
        },
        shift = {1.2, 16},
        size = 3,
        intensity = 0.2,
		rotation_shift = 0.5,
        color = {r = 1, g = 0, b = 0}
      },
    },
    light_animation =
    {
      layers =
      {
        {
          width = 500,
          height = 500,
          frame_count = 2,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 8,
          max_advance = 0.2,
		  blend_mode = "additive",
		  draw_as_glow = true,
          stripes = util.multiplystripes(2,
          {
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet0.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet1.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet2.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet3.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet4.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet5.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet6.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet7.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet8.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet9.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet10.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet11.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet12.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet13.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet14.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_light_spritesheet15.png",
             width_in_frames = 1,
             height_in_frames = 8,
            },
          }),
		  hr_version =
          {
			width = 1000,
			height = 1000,
			frame_count = 2,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			blend_mode = "additive",
			draw_as_glow = true,
			scale = 0.5,
			stripes =  util.multiplystripes(2,
			{
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet0.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet1.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet2.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet3.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet4.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet5.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet6.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet7.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet8.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet9.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet10.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet11.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet12.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet13.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet14.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_light_hr_spritesheet15.png",
				 width_in_frames = 1,
				 height_in_frames = 8,
				},
			}),
		  },
        },
	  },
	},
    animation =
    {
      layers =
      {
        {
          width = 500,
          height = 500,
          frame_count = 2,
          direction_count = 128,
          shift = {0, 0.5},
          animation_speed = 8,
          max_advance = 0.2,
          stripes =
          {
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet0.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet1.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet2.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet3.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet4.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet5.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet6.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet7.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet8.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet9.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet10.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet11.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet12.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet13.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet14.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
            {
             filename = "__kj_2a6__/graphics/entity/2a6_spritesheet15.png",
             width_in_frames = 2,
             height_in_frames = 8,
            },
          },
		  hr_version =
          {
			width = 1000,
			height = 1000,
			frame_count = 2,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes = 
			{
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet0.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet1.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet2.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet3.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet4.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet5.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet6.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet7.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet8.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet9.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet10.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet11.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet12.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet13.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet14.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_hr_spritesheet15.png",
				 width_in_frames = 2,
				 height_in_frames = 8,
				},
			},
		  },
        },
        {
          width = 500,
          height = 500,
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
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet0_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet1_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet2_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet3_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet4_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet5_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet6_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet7_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet8_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet9_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet10_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet11_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet12_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet13_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet14_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet15_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet16_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet17_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet18_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet19_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet20_shadow.png",
             width_in_frames = 1,
             height_in_frames = 6,
            },
            {
             filename = "__kj_2a6__/graphics/entity/shadow/2a6_spritesheet21_shadow.png",
             width_in_frames = 1,
             height_in_frames = 2,
            },
          }),
		  hr_version =
          {
			width = 1000,
			height = 1000,
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
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet0_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet1_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet2_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet3_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet4_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet5_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet6_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet7_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet8_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet9_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet10_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet11_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet12_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet13_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet14_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet15_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet16_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet17_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet18_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet19_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet20_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 6,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_hr_spritesheet21_shadow.png",
				 width_in_frames = 1,
				 height_in_frames = 2,
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
          width = 500,
          height = 500,
          frame_count = 1,
          direction_count = 128,
		  shift = {0, 0.5},
          animation_speed = 8,
		  max_advance = 0.2,
		  stripes =
          {
            {
			 filename = "__kj_2a6__/graphics/entity/2a6_turm_spritesheet0.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
            {
			 filename = "__kj_2a6__/graphics/entity/2a6_turm_spritesheet1.png",
             width_in_frames = 8,
             height_in_frames = 8,
            },
          },
          hr_version =
          {
			width = 1000,
			height = 1000,
			frame_count = 1,
			direction_count = 128,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes =
			{
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_turm_hr_spritesheet0.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/hr/2a6_turm_hr_spritesheet1.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
          }
        },
        {
			width = 500,
			height = 500,
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
				 filename = "__kj_2a6__/graphics/entity/shadow/2a6_turm_spritesheet0_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
				{
				 filename = "__kj_2a6__/graphics/entity/shadow/2a6_turm_spritesheet1_shadow.png",
				 width_in_frames = 8,
				 height_in_frames = 8,
				},
			},
			hr_version =
			{
				width = 1000,
				height = 1000,
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
					 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_turm_hr_spritesheet0_shadow.png",
					 width_in_frames = 8,
					 height_in_frames = 8,
					},
					{
					 filename = "__kj_2a6__/graphics/entity/shadow/hr/2a6_turm_hr_spritesheet1_shadow.png",
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
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.2,
    vehicle_impact_sound =  generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__kj_2a6__/sounds/tank-engine.ogg",
        volume = 0.37
      },
      activate_sound =
      {
        filename = "__kj_2a6__/sounds/tank-engine-start.ogg",
        volume = 0.37
      },
      deactivate_sound =
      {
        filename = "__kj_2a6__/sounds/tank-engine-stop.ogg",
        volume = 0.37
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_2a6__/sounds/tank-no-fuel-1.ogg",
        volume = 0.5
      }
    },
    open_sound = { filename = "__kj_2a6__/sounds/mouse_door_open.ogg", volume = 0.7 },
    close_sound = { filename = "__kj_2a6__/sounds/mouse_door_close.ogg", volume = 0.7 },
    rotation_speed = 0.0048,
    tank_driving = true,
    weight = 62000,
    inventory_size = 60,
    guns = {"kj_rh120", "kj_mg3"},
    turret_rotation_speed = 0.22 / 60,
    turret_return_timeout = 300,
	  has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.maustank,
  },
})