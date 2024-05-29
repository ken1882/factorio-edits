--Normal 50kg
local NAP = 250
local NHE = 250
local NDW = 500
local NR = 6

--Medium 250kg
local MAP = 500
local MHE = 500
local MDW = 750
local MR = 10

--Big 500kg
local BAP = 750
local BHE = 750
local BDW = 1000
local BR = 14

--Huge 1000kg
local HAP = 1000
local HHE = 1000
local HDW = 2000
local HR = 20

--Gunner
local NP = 24
local NF = 15

local throughPut = 300
data:extend({
	{
		type = "ammo",
		name = "kj_ju87_gunner_normal",
		icon = "__kj_ju87__/graphics/equipment/mg15_rounds.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_plane_mg15",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "instant",
			  source_effects =
			  {
				type = "create-explosion",
				entity_name = "explosion-gunshot"
			  },
			  target_effects =
			  {
				{
				  type = "create-entity",
				  entity_name = "explosion-hit",
				  offsets = {{0, 1}},
				  offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
				},
				{
				  type = "damage",
				  damage = { amount = NP, type = "physical"}
				},
				{
				  type = "damage",
				  damage = { amount = NF, type = "flak"}
				}
			  }
			}
		  }
		},
		subgroup = "ammo",
		order = "ju87[ju87]-1[gunner]",
		stack_size = 100,
		magazine_size = 5,
	},
	
	{
		type = "ammo",
		name = "kj_ju87_normal",
		icon = "__kj_ju87__/graphics/equipment/bomb_50.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_ju87_small",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_ju87_normal",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 6,
			  min_range = 3,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_ju87_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "ju87[ju87]-a[normal]",
		stack_size = 16,
		magazine_size = 1,
		reload_time = 15,
	},
	{
		type = "projectile",
		name = "kj_ju87_normal",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -0.5}, {0.3, 0.5}},
		acceleration = 0,
		hit_collision_mask = {},
		piercing_damage = NDW,
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
				damage = {amount = throughPut , type = "physical"}
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
				entity_name = "big-explosion"
			  },
			  {
				type = "destroy-cliffs",
				radius = NR,
				explosion = "explosion"
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  radius = NR,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = NHE, type = "explosion"}
					  },
					  {
						type = "damage",
						damage = {amount = NAP , type = "physical"}
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
		type = "ammo",
		name = "kj_ju87_medium",
		icon = "__kj_ju87__/graphics/equipment/bomb_250.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_ju87_big",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_ju87_medium",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 8,
			  min_range = 8,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_ju87_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "ju87[ju87]-b[medium]",
		stack_size = 8,
		magazine_size = 1,
		reload_time = 15,
	},
	{
		type = "projectile",
		name = "kj_ju87_medium",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -0.5}, {0.3, 0.5}},
		acceleration = 0,
		hit_collision_mask = {},
		piercing_damage = MDW,
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
				damage = {amount = throughPut , type = "physical"}
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
				type = "destroy-cliffs",
				radius = MR,
				explosion = "explosion"
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  radius = MR,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = MHE, type = "explosion"}
					  },
					  {
						type = "damage",
						damage = {amount = MAP , type = "physical"}
					  },
					  {
						type = "create-entity",
						entity_name = "big-explosion"
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
		type = "ammo",
		name = "kj_ju87_big",
		icon = "__kj_ju87__/graphics/equipment/bomb_500.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_ju87_big",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_ju87_big",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 10,
			  min_range = 5,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_ju87_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "ju87[ju87]-c[big]",
		stack_size = 4,
		magazine_size = 1,
		reload_time = 15,
	},
	{
		type = "projectile",
		name = "kj_ju87_big",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -0.5}, {0.3, 0.5}},
		acceleration = 0,
		hit_collision_mask = {},
		piercing_damage = BDW,
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
				damage = {amount = throughPut , type = "physical"}
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
				entity_name = "big-artillery-explosion"
			  },
			  {
				type = "destroy-cliffs",
				radius = BR,
				explosion = "explosion"
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  radius = BR,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = BHE, type = "explosion"}
					  },
					  {
						type = "damage",
						damage = {amount = BAP , type = "physical"}
					  },
					  {
						type = "create-entity",
						entity_name = "massive-explosion"
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
		type = "ammo",
		name = "kj_ju87_huge",
		icon = "__kj_ju87__/graphics/equipment/bomb_1000.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_ju87_big",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_ju87_huge",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 15,
			  min_range = 7,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_ju87_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "ju87[ju87]-d[huge]",
		stack_size = 1,
		magazine_size = 1,
		reload_time = 15,
	},
	{
		type = "projectile",
		name = "kj_ju87_huge",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -0.5}, {0.3, 0.5}},
		acceleration = 0,
		hit_collision_mask = {},
		piercing_damage = HDW,
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
				damage = {amount = throughPut , type = "physical"}
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
				entity_name = "nuke-explosion"
			  },
			  {
				type = "destroy-cliffs",
				radius = HR,
				explosion = "explosion"
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  radius = HR,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "damage",
						damage = {amount = HHE, type = "explosion"}
					  },
					  {
						type = "damage",
						damage = {amount = HAP , type = "physical"}
					  },
					  {
						type = "create-entity",
						entity_name = "big-artillery-explosion"
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

})