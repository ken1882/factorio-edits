local movement_triggers = require("prototypes.movement_triggers")
local smoke_animations = require("__base__/prototypes/entity/smoke-animations")
local entityLight = require("prototypes.light")
local modname = "__kj_b2__"
local trivial_smoke = smoke_animations.trivial_smoke
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

local function layermaker(name, size, fc, mult, framewidth, frameheight, length, shadow, glow)
local shdw = ""
local shdw2 = ""
local glw = "normal"
local stripe = {}
local hrstripe = {}
if shadow == true then
	shdw = "_shadow"
	shdw2 = "shadow/"
end
if glow == true then
	glw = "additive"
end
for i = 0, length - 1, 1
do
	stripe[i+1] = 
	{
		filename = modname.."/graphics/entity/"..shdw2..name.."_spritesheet"..i..shdw..".png",
		width_in_frames = framewidth,
		height_in_frames = frameheight,
	}
	hrstripe[i+1] = 
	{
		filename = modname.."/graphics/entity/"..shdw2..name.."_hr_spritesheet"..i..shdw..".png",
		width_in_frames = framewidth,
		height_in_frames = frameheight,
	}
end

return {
		width = size,
		height = size,
		frame_count = fc,
		direction_count = 128,
		draw_as_shadow = shadow,
		draw_as_glow = glow,
		blend_mode = glw,
		shift = {0, 0.5},
		animation_speed = 8,
		max_advance = 0.2,
		scale = 1,
		stripes = util.multiplystripes(mult,stripe),
		hr_version =
		{
			width = 2 * size,
			height = 2 * size,
			frame_count = fc,
			direction_count = 128,
			draw_as_shadow = shadow,
			draw_as_glow = glow,
			blend_mode = glw,
			shift = {0, 0.5},
			animation_speed = 8,
			max_advance = 0.2,
			scale = 0.5,
			stripes = util.multiplystripes(mult,hrstripe),
		},
	}
end

data:extend({
-- B2 Bbomb
  {
    type = "gun",
    name = "kj_b2_bombs",
	icon = "__kj_b2__/graphics/equipment/bomb_500.png",
	icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "b[b2]-b[bombs]",
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "kj_plane_b2",
      cooldown = 0,
	  health_penalty = -10,
	  --rotate_penalty = 5,
      projectile_creation_distance = 0,
      projectile_center = {0, 0},
	  damage_modifier = 2,
      range = 30,
	  sound = {
		filename = "__base__/sound/artillery-open.ogg",
		volume = 0.6,
	  },
    },
    stack_size = 1
  },
  
  trivial_smoke
  {
    name = "kj_b2_smoke",
    color = {r = 0.01, g = 0.01, b = 0.01, a = 1},
    duration = 10,
    spread_duration = 10,
    fade_away_duration = 10,
    start_scale = 0.1,
    end_scale = 0.5
  },
 
--Flak damage type
  {
    type = "damage-type",
    name = "flak"
  },
  
--Entity
  {
    type = "car",
    name = "kj_b2",
    icon = "__kj_b2__/graphics/b2_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 10, result = "kj_b2"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 3000,
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    immune_to_tree_impacts = false,
    immune_to_rock_impacts = false,
    energy_per_hit_point = 0.1,
	--equipment_grid = "kj_b2",
	--render_layer = "higher-object-under",
	minimap_representation = {
		filename = "__kj_b2__/graphics/plane_icon.png",
		flags = {"icon"},
		size = {128, 128},
		scale = 0.3,
	},
	selected_minimap_representation = {
		filename = "__kj_b2__/graphics/plane_icon.png",
		flags = {"icon"},
		size = {128, 128},
		scale = 0.3,
	},
    resistances =
    {
      {
        type = "fire",
        decrease = 20,
        percent = 80
      },
      {
        type = "physical",
        decrease = 25,
        percent = 60
      },
      {
        type = "impact",
        decrease = 15,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 20,
        percent = 65
      },
      {
        type = "acid",
        decrease = 20,
        percent = 60
      },
      {
        type = "electric",
        decrease = 50,
        percent = 60
      },
      {
        type = "laser",
        decrease = 20,
        percent = 60
      },
      {
        type = "poison",
        decrease = 5,
        percent = 95
      },
    },
    collision_box = {{-0.9, -2.5}, {0.9, 2.5}},
    selection_box = {{-0.9, -2.5}, {0.9, 2.5}},
	drawing_box =   {{-13, -3}, {13, 5}},
	--collision_mask = {},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
	render_layer = "air-object", 
	final_render_layer = "air-object",
    effectivity = 1,
    braking_power = "2000kW", 
	burner =
    {
      fuel_category = "kj_kerosine",
      effectivity = 1,
      fuel_inventory_size = 3,
	  burnt_inventory_size = 2,
      smoke =
      {
        {
          name = "kj_b2_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-0.5, -2.7},
		  --offset = -2,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_b2_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {0.5, -2.7},
		  --offset = -2,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      }
    },
	consumption = "1000kW",
    friction = 0.001,
    light = entityLight,
    animation =
    {
      layers =
      {
		layermaker("b2_ground", 1000, 1, 1, 4, 4, 8, false, false), 
		layermaker("b2_ground", 1000, 1, 1, 4, 4, 8, true, false),
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
            volume = 0.8
          },
        }
      },
    },
    sound_minimum_speed = 0.1,
    sound_scaling_ratio = 0.03,
    vehicle_impact_sound =  generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__kj_b2__/sounds/motor.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__kj_b2__/sounds/motor_start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__kj_b2__/sounds/motor_stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_b2__/sounds/motor_failure.ogg",
        volume = 0.6
      }
    },
    open_sound = { filename = "__base__/sound/train-door-open.ogg", volume = 0.7 },
    close_sound = { filename = "__base__/sound/train-door-close.ogg", volume = 0.7 },
    rotation_speed = 0.0025,
    --tank_driving = true,
    weight = 72000,
    inventory_size = 10,
    guns = {"kj_b2_bombs"},
    turret_rotation_speed = 1,
    turret_return_timeout = 0,
	has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.maustank,
  },
})