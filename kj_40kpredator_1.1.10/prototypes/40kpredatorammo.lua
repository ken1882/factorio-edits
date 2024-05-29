local APAP = 0
local APHE = 0
local APDW = 0

local HEAP = 375
local HEHE = 338
local HEDW = 200

local APHEAP = 0
local APHEHE = 0
local APHEDW = 0

data:extend({

	{
	type = "explosion",
	name = "kj_predator_shot",
	flags = {"not-on-map"},
	subgroup = "explosions",
	animations = 
		{
		  filename = "__kj_40kpredator__/graphics/flash_hr_spritesheet.png",
		  line_length = 7,
		  width = 552,
		  height = 382,
		  frame_count = 21,
		  scale = 0.06,
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
		name = "kj_predator_normal",
		icon = "__kj_40kpredator__/graphics/equipment/he_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_predator",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_predator",
			  starting_speed = 1.5,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 8,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_predator_shot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "p[predator]-n[normal]",
		stack_size = 100
	},
	
	{
		type = "projectile",
		name = "kj_predator",
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
				entity_name = "explosion"
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
				entity_name = "medium-explosion"
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  radius = 5,
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
						entity_name = "explosion"
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
		  filename = "__kj_40kpredator__/graphics/40kpredator_projectile.png",
		  frame_count = 1,
		  width = 94,
		  height = 156,
		  scale = 0.5,
		  priority = "high"
		}
	},
})