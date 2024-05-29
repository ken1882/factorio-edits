local movement_triggers = require("prototypes.movement_triggers")
local entityLight = require("prototypes.light")
local modname = "__kj_xb35__"
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

--layermaker("xb35_wheels", 1365, 3, 3, 1, 2, 64, false, false, 1.119),
--layermaker("xb35_corpus", 1365, 3, 3, 1, 2, 64, false, false, 1.119),
--layermaker("xb35_rotor" , 955 , 3, 1, 3, 2, 64, false, false, 1),

--layermaker("xb35_wheels", 1365, 3, 3, 1, 2, 64, true, false, 1.119),
--layermaker("xb35_corpus", 1365, 3, 3, 1, 2, 64, true, false, 1.119),
--layermaker("xb35_rotor" , 955 , 3, 1, 3, 2, 64, true, false, 1),
local function layermaker(name, size, fc, mult, framewidth, frameheight, length, shadow, glow, scale)
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
		scale = 1 * scale,
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
			scale = 0.5 * scale,
			stripes = util.multiplystripes(mult,hrstripe),
		},
	}
end

data:extend({
-- Big bomb
  {
    type = "gun",
    name = "kj_xb35_bombs",
	icon = modname.."/graphics/equipment/bomb_500.png",
	icon_size = 128,
    flags = {"hidden"},
    subgroup = "gun",
    order = "xb35[xb35]-b[bombs]",
    attack_parameters =
    {
		type = "projectile",
		ammo_category = "kj_plane_xb35",
		cooldown = 0,
		health_penalty = -10,
		--rotate_penalty = 5,
		projectile_creation_distance = 0,
		projectile_center = {0, 0},
		damage_modifier = 2,
		range = 30,
		sound =
			{
				filename = "__base__/sound/artillery-open.ogg",
				volume = 0.6,
			},
    },
    stack_size = 1
  },
  
 --Flak damage type
  {
    type = "damage-type",
    name = "flak"
  },
  
--Entity
  {
    type = "car",
    name = "kj_xb35",
    icon = modname.."/graphics/icon.png",
    icon_size = 128,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "building-direction-8-way", "not-flammable"},
    minable = {mining_time = 8, result = "kj_xb35"},
    mined_sound = {filename = "__core__/sound/deconstruct-large.ogg",volume = 0.8},
    max_health = 2000,
    corpse = "big-remnants",
    dying_explosion = "massive-explosion",
    immune_to_tree_impacts = false,
    immune_to_rock_impacts = false,
    energy_per_hit_point = 0.1,
	--equipment_grid = "kj_xb35",
	--render_layer = "higher-object-under",
	minimap_representation = {
		filename = modname.."/graphics/plane_icon.png",
		flags = {"icon"},
		size = {128, 128},
		scale = 0.3,
	},
	selected_minimap_representation = {
		filename = modname.."/graphics/plane_icon.png",
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
    collision_box = {{-0.7, -3}, {0.7, 3}},
    selection_box = {{-0.7, -3}, {0.7, 3}},
	trigger_target_mask = nil,
	drawing_box =   {{-19, -8}, {19, 8}},
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
		fuel_inventory_size = 5,
		burnt_inventory_size = 3,
    },
	consumption = "3000kW",
    friction = 0.002,
    light = entityLight,
    animation =
    {
      layers =
      {
		layermaker("xb35_wheels", 1365, 3, 3, 1, 2, 64, false, false, 1.119),
		layermaker("xb35_corpus", 1365, 3, 3, 1, 2, 64, false, false, 1.119),
		layermaker("xb35_rotor" , 955 , 3, 1, 3, 2, 64, false, false, 1),
		
		layermaker("xb35_wheels", 1365, 3, 3, 1, 2, 64, true, false, 1.119),
		layermaker("xb35_corpus", 1365, 3, 3, 1, 2, 64, true, false, 1.119),
		layermaker("xb35_rotor" , 955 , 3, 1, 3, 2, 64, true, false, 1),
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
        filename = modname.."/sounds/motor.ogg",
        volume = 0.6
      },
      activate_sound =
      {
        filename = modname.."/sounds/motor_start.ogg",
        volume = 0.6
      },
      deactivate_sound =
      {
        filename = modname.."/sounds/motor_stop.ogg",
        volume = 0.6
      },
      match_speed_to_activity = true
    },
    sound_no_fuel =
    {
      {
        filename = modname.."/sounds/motor_failure.ogg",
        volume = 0.6
      }
    },
    open_sound = {filename = modname.."/sounds/mouse_door_open.ogg", volume = 0.7},
    close_sound = {filename = modname.."/sounds/mouse_door_close.ogg", volume = 0.7},
    rotation_speed = 0.0030,
    --tank_driving = true,
    guns = {"kj_xb35_bombs"},
    weight = 82000,
    inventory_size = 20,
    turret_rotation_speed = 60,
    turret_return_timeout = 0,
	has_belt_immunity = true,
    --track_particle_triggers = movement_triggers.maustank,
  },
})