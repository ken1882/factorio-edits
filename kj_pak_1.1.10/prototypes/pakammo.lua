local APAP = 900
local APHE = 450
local APDW = 1300

local HEAP = 675
local HEHE = 300
local HEDW = 325

local APHEAP = 480
local APHEHE = 432
local APHEDW = 400

require "util"

local fireutil = {}

local function make_color(red, green, blue, alpha)
  return { r = red * alpha, g = green * alpha, b = blue * alpha, a = alpha }
end

function fireutil.foreach(table_, fun_)
  for k, tab in pairs(table_) do fun_(tab) end
  return table_
end
-----------------------------------------------------------------------------------
function fireutil.create_fire_pictures(opts)
  local returnValue = {
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-13.png",
      line_length = 8,
      width = 60,
      height = 118,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.0390625, -0.90625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-12.png",
      line_length = 8,
      width = 63,
      height = 116,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.015625, -0.914065 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-11.png",
      line_length = 8,
      width = 61,
      height = 122,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.0078125, -0.90625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-10.png",
      line_length = 8,
      width = 65,
      height = 108,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.0625, -0.64844 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-09.png",
      line_length = 8,
      width = 64,
      height = 101,
      frame_count = 25,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.03125, -0.695315 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-08.png",
      line_length = 8,
      width = 50,
      height = 98,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.0546875, -0.77344 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-07.png",
      line_length = 8,
      width = 54,
      height = 84,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { 0.015625, -0.640625 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-06.png",
      line_length = 8,
      width = 65,
      height = 92,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { 0, -0.83594 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-05.png",
      line_length = 8,
      width = 59,
      height = 103,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { 0.03125, -0.882815 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
      line_length = 8,
      width = 67,
      height = 130,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { 0.015625, -1.109375 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-03.png",
      line_length = 8,
      width = 74,
      height = 117,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { 0.046875, -0.984375 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-02.png",
      line_length = 8,
      width = 74,
      height = 114,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { 0.0078125, -0.96875 }
    },
    {
      filename = "__base__/graphics/entity/fire-flame/fire-flame-01.png",
      line_length = 8,
      width = 66,
      height = 119,
      frame_count = 32,
      axially_symmetrical = false,
      direction_count = 1,
      blend_mode = "normal",
      animation_speed = 1,
      scale = 0.5,
      tint = {r=1,g=1,b=1,a=1},
      flags = {"compressed"},
      shift = { -0.0703125, -1.039065 }
    },
  }
  return fireutil.foreach(returnValue, function(tab)
    if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
  end)
end

function fireutil.create_burnt_patch_pictures()
  local base = {
    filename = "__base__/graphics/entity/fire-flame/burnt-patch.png",
    line_length = 3,
    width = 115,
    height = 56,
    frame_count = 9,
    axially_symmetrical = false,
    direction_count = 1,
    shift = {-0.09375, 0.125},
  }

  local variations = {}

  for y=1,(base.frame_count / base.line_length) do
    for x=1,base.line_length do
      table.insert(variations,
      {
        filename = base.filename,
        width = base.width,
        height = base.height,
        tint = base.tint,
        shift = base.shift,
        x = (x-1) * base.width,
        y = (y-1) * base.height,
      })
    end
  end

  return variations
end

data:extend({
	{
		type = "fire",
		name = "incend_flame",
		flags = {"placeable-off-grid", "not-on-map"},
		color = {r=0, g=0.5, b=0.7, a=0.9},
		damage_per_tick = {amount = 2, type = "fire"},
		maximum_damage_multiplier = 6,
		damage_multiplier_increase_per_added_fuel = 1,
		damage_multiplier_decrease_per_tick = 0.005,
		
		spawn_entity = "fire-flame-on-tree",
		
		spread_delay = 300,
		spread_delay_deviation = 180,
		maximum_spread_count = 100,
		
		flame_alpha = 0.35,
		flame_alpha_deviation = 0.05,
		
		emissions_per_tick = 0.005,
		
		add_fuel_cooldown = 10,
		fade_in_duration = 30,
		fade_out_duration = 30,
		
		initial_lifetime = 60*3,
		lifetime_increase_by = 150,
		lifetime_increase_cooldown = 4,
		maximum_lifetime = 180,
		delay_between_initial_flames = 10,
		burnt_patch_lifetime = 180,

		
		pictures = fireutil.create_fire_pictures({ blend_mode = "normal", animation_speed = 1, scale = 0.5}),
		
		smoke_source_pictures = 
		{
			{ 
				filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-1.png",
				line_length = 8,
				width = 101,
				height = 138,
				frame_count = 31,
				axially_symmetrical = false,
				direction_count = 1,
				shift = {-0.109375, -1.1875},
				animation_speed = 0.5,
				tint = make_color(1, 0.5, 1, 0.75),
			},
			{ 
				filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-2.png",
				line_length = 8,
				width = 99,
				height = 138,
				frame_count = 31,
				axially_symmetrical = false,
				direction_count = 1,
				shift = {-0.203125, -1.21875},
				animation_speed = 0.5,
				tint = make_color(1, 0.5, 1, 0.75),
			},
		},
		
		burnt_patch_pictures = fireutil.create_burnt_patch_pictures(),
		burnt_patch_alpha_default = 0.4,
		burnt_patch_alpha_variations = 
		{
			{ tile = "stone-path", alpha = 0.26 },
			{ tile = "concrete", alpha = 0.24 },
		},

		light = {intensity = 1, size = 20},
		
		working_sound =
		{
			sound = { filename = "__base__/sound/furnace.ogg" },
			max_sounds_per_type = 3
		},
	},
	{
	type = "explosion",
	name = "kj_pak_shot",
	flags = {"not-on-map"},
	subgroup = "explosions",
	animations = 
		{
		  filename = "__base__/graphics/entity/artillery-cannon-muzzle-flash/hr-muzzle-flash.png",
		  line_length = 7,
		  width = 276,
		  height = 382,
		  frame_count = 21,
		  scale = 0.1,
		  shift = {0, 0},
		  animation_speed = 2,
		},
	rotate = true,
	height = 0,
	correct_rotation = true,
	light = {intensity = 1, size = 5, color = {r=1.0, g=1.0, b=1.0}},
	smoke = "smoke-fast",
	smoke_count = 1,
	smoke_slow_down_factor = 1
	},
	
	{
		type = "ammo",
		name = "kj_pak_penetration",
		icon = "__kj_pak__/graphics/equipment/ap_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_pak",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_pak_penetration_projectile",
			  starting_speed = 1.5,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 8,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_pak_shot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "n[pak]-a[penetration]",
		stack_size = 30
	},
	{
		type = "ammo",
		name = "kj_pak_highexplosive",
		icon = "__kj_pak__/graphics/equipment/he_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_pak",
		  target_type = "direction",
		  consumption_modifier = 2,
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_pak_highexplosive_projectile",
			  starting_speed = 2,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 8,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_pak_shot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "n[pak]-b[highexplosive]",
		stack_size = 30
	},
	{
		type = "ammo",
		name = "kj_pak_incendiary",
		icon = "__kj_pak__/graphics/equipment/hei_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_pak",
		  target_type = "direction",
		  consumption_modifier = 2,
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_pak_incendiary_projectile",
			  starting_speed = 2,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 8,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_pak_shot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "n[pak]-c[incendiary]",
		stack_size = 30
	},
	
	
	{
		type = "projectile",
		name = "kj_pak_penetration_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = APDW,
		action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "damage",
				damage = {amount = APAP , type = "physical"}
			  },
			  {
				type = "damage",
				damage = {amount = APHE , type = "explosion"}
			  },
			  {
				type = "create-entity",
				entity_name = "explosion"
			  }
			}
		  }
		},
		final_action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "create-entity",
				entity_name = "small-scorchmark-tintable",
				check_buildability = true
			  }
			}
		  }
		},
		animation =
		{
		  filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
		  frame_count = 1,
		  width = 64,
		  height = 64,
		  scale = 0.5,
		  priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_pak_highexplosive_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = HEDW,
		action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
				{
					type = "damage",
					damage = {amount = HEAP , type = "physical"}
				},
				{
					type = "create-entity",
					entity_name = "medium-explosion"
				},
			}
		  }
		},
		final_action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "create-entity",
				entity_name = "massive-explosion"
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  radius = 4,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = HEHE, type = "explosion"}
					  },
					  {
						type = "create-entity",
						entity_name = "medium-explosion"
					  }
					}
				  }
				}
			  },
			  {
				type = "create-entity",
				entity_name = "medium-scorchmark-tintable",
				check_buildability = true
			  },
			  {
				type = "invoke-tile-trigger",
				repeat_count = 1,
			  },
			  {
				type = "destroy-decoratives",
				from_render_layer = "decorative",
				to_render_layer = "object",
				include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
				include_decals = false,
				invoke_decorative_trigger = true,
				decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
				radius = 3.25 -- large radius for demostrative purposes
			  }
			}
		  }
		},
		animation =
		{
		  filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
		  frame_count = 1,
		  width = 64,
		  height = 64,
		  scale = 0.5,
		  priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_pak_incendiary_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = APHEDW,
		action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
				{
					type = "damage",
					damage = {amount = APHEHE , type = "explosion"}
				},
				{
					type = "create-entity",
					entity_name = "explosion"
				},
			},
		  },
		},
		final_action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
				{
					type = "create-entity",
					entity_name = "small-scorchmark-tintable",
					check_buildability = true
				},
				{
					type = "create-entity",
					entity_name = "medium-explosion"
				},
				{
					type = "nested-result",
					show_in_tooltip = true,
					action =
					{
						type = "area",
						target_entities = false,
						trigger_from_target = true,
						repeat_count = 10,				
						radius = 3,
						action_delivery =
						{
							type = "projectile",
							projectile = "incend_projectile",
							starting_speed = 0.5
						},
					},
				},
			}
		  }
		},
		animation =
		{
		  filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
		  frame_count = 1,
		  width = 64,
		  height = 64,
		  scale = 0.5,
		  priority = "high"
		}
	},
	{
		type = "projectile",
		name = "incend_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		piercing_damage = APHEDW,
		action =
		{
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  target_effects =
			  {
				{
					type = "create-entity",
					show_in_tooltip = true,
					entity_name = "incend_flame"
				},
				{
					type = "damage",
					damage = {amount = APHEAP , type = "physical"}
				},
				{
					type = "damage",
					damage = {amount = APHEHE , type = "explosion"}
				},	
			  }
			}
		  },
		},
		animation =
		{
		  filename = "__core__/graphics/empty.png",
		  frame_count = 1,
		  width = 1,
		  height = 1,
		  priority = "high"
		},
		shadow =
		{
		  filename = "__core__/graphics/empty.png",
		  frame_count = 1,
		  width = 1,
		  height = 1,
		  priority = "high"
		}
	},
  
})