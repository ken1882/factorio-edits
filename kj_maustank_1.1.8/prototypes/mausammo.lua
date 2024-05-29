local APAP = 750
local APHE = 375
local APDW = 1100

local HEAP = 563
local HEHE = 506
local HEDW = 275

local APHEAP = 450
local APHEHE = 405
local APHEDW = 688

data:extend({
	{
		type = "ammo",
		name = "kj_120kwk_penetration",
		icon = "__kj_maustank__/graphics/equipment/ap_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_128kwk",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_120kwk_penetration_projectile",
			  starting_speed = 1.5,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 10,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "explosion-gunshot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "m[maustank]-a[penetration]",
		stack_size = 50
	},
	{
		type = "ammo",
		name = "kj_120kwk_highexplosive",
		icon = "__kj_maustank__/graphics/equipment/he_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_128kwk",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_120kwk_highexplosive_projectile",
			  starting_speed = 1.5,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 10,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "explosion-gunshot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "m[maustank]-b[highexplosive]",
		stack_size = 50
	},
	{
		type = "ammo",
		name = "kj_120kwk_penetration_highexplosive",
		icon = "__kj_maustank__/graphics/equipment/aphe_cannon_shell.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_128kwk",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_120kwk_penetration_highexplosive_projectile",
			  starting_speed = 1.5,
			  direction_deviation = 0.1,
			  range_deviation = 0.1,
			  max_range = 150,
			  min_range = 10,
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "explosion-gunshot"
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "m[maustank]-c[penetration-highexplosive]",
		stack_size = 50
	},
	
	{
		type = "projectile",
		name = "kj_120kwk_penetration_projectile",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		height = 0,
		collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		direction_only = true,
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
		  filename = "__base__/graphics/entity/bullet/bullet.png",
		  frame_count = 1,
		  width = 3,
		  height = 50,
		  priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_120kwk_highexplosive_projectile",
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
				{
					type = "destroy-cliffs",
					radius = 6,
					explosion = "explosion"
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
				  radius = 6,
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
		  filename = "__base__/graphics/entity/bullet/bullet.png",
		  frame_count = 1,
		  width = 3,
		  height = 50,
		  priority = "high"
		}
	},
	{
		type = "projectile",
		name = "kj_120kwk_penetration_highexplosive_projectile",
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
					damage = {amount = APHEAP , type = "physical"}
				},
				{
					type = "create-entity",
					entity_name = "explosion"
				},
				{
					type = "destroy-cliffs",
					radius = 6,
					explosion = "explosion"
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
				  radius = 6,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = APHEHE, type = "explosion"}
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
		  filename = "__base__/graphics/entity/bullet/bullet.png",
		  frame_count = 1,
		  width = 3,
		  height = 50,
		  priority = "high"
		}
	},
})