local movement_triggers = require("prototypes.movement_triggers")
local smoke_animations = require("__base__/prototypes/entity/smoke-animations.lua")
local entityLight = require("prototypes.light")
local modname = "__kj_jug38__"
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
  trivial_smoke
  {
    name = "kj_jug38_smoke",
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
    name = "kj_jug38",
    icon = "__kj_jug38__/graphics/jug38_icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 7, result = "kj_jug38"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 2000,
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    immune_to_tree_impacts = false,
    immune_to_rock_impacts = false,
    energy_per_hit_point = 0.1,
	--equipment_grid = "kj_jug38",
	--render_layer = "higher-object-under",
	minimap_representation = {
		filename = "__kj_jug38__/graphics/plane_icon.png",
		flags = {"icon"},
		size = {128, 128},
		scale = 0.3,
	},
	selected_minimap_representation = {
		filename = "__kj_jug38__/graphics/plane_icon.png",
		flags = {"icon"},
		size = {128, 128},
		scale = 0.3,
	},
    resistances =
    {
      {
        type = "fire",
        decrease = 20,
        percent = 70
      },
      {
        type = "physical",
        decrease = 5,
        percent = 45
      },
      {
        type = "impact",
        decrease = 12,
        percent = 50
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 50
      },
      {
        type = "acid",
        decrease = 15,
        percent = 60
      },
      {
        type = "electric",
        decrease = 5,
        percent = 40
      },
      {
        type = "laser",
        decrease = 5,
        percent = 50
      },
      {
        type = "poison",
        decrease = 5,
        percent = 95
      },
    },
    collision_box = {{-0.7, -7}, {0.7, 7}},
    selection_box = {{-0.7, -7}, {0.7, 7}},
	trigger_target_mask = nil,
	drawing_box =   {{-17, -8}, {17, 8}},
	--collision_mask = {},
    sticker_box = {{-0.5, -0.5}, {0.5, 0.5}},
	render_layer = "air-object", 
	final_render_layer = "air-object",
    effectivity = 1,
    braking_power = "750kW", 
	burner =
    {
      fuel_category = "kj_kerosine",
      effectivity = 1,
      fuel_inventory_size = 4,
	  burnt_inventory_size = 4,
      smoke =
      {
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-2.3, -7},
		  offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {2.3, -7},
		  offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {-5.8, -5},
		  offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
        {
          name = "kj_jug38_smoke",
          deviation = {0.25, 0.25},
          frequency = 50,
          position = {5.8, -5},
		  offset = -1,
          starting_frame = 0,
          starting_frame_deviation = 60
        },
      },
    },
	consumption = "1500kW",
    friction = 0.002,
    light = entityLight,
    animation =
    {
      layers =
      {
		layermaker("jug38_corpus", 1365, 3, 3, 1, 2, 64, false, false),
		layermaker("jug38_rotor" , 1365, 3, 1, 3, 2, 64, false, false),
		
		layermaker("jug38_corpus", 1365, 3, 3, 1, 2, 64, true, false),
		layermaker("jug38_rotor" , 1365, 3, 1, 3, 2, 64, true, false)
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
    sound_minimum_speed = 0.3,
    sound_scaling_ratio = 0.03,
    vehicle_impact_sound =  generic_impact,
    working_sound =
    {
      sound =
      {
        filename = "__kj_jug38__/sounds/motor.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = "__kj_jug38__/sounds/motor_start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = "__kj_jug38__/sounds/motor_stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = "__kj_jug38__/sounds/motor_failure.ogg",
        volume = 0.6
      }
    },
    open_sound = {filename = "__kj_jug38__/sounds/mouse_door_open.ogg", volume = 0.7},
    close_sound = {filename = "__kj_jug38__/sounds/mouse_door_close.ogg", volume = 0.7},
    rotation_speed = 0.0038,
    --tank_driving = true,
    weight = 24000,
    inventory_size = 180,
    turret_rotation_speed = 60,
    turret_return_timeout = 0,
	has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.maustank,
  },
})