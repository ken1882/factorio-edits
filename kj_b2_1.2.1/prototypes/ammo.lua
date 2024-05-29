local sounds = require("__base__/prototypes/entity/sounds.lua")

--Medium 250kg
local MAP = 500
local MHE = 750
local MDW = 750
local MR = 10

--Big 500kg
local BAP = 750
local BHE = 1000
local BDW = 1000
local BR = 14

--Huge 1000kg
local HAP = 1000
local HHE = 1250
local HDW = 2000
local HR = 20

local ATOM_DAMAGE = 10000
local ATOM_RADIUS_MUL = 4

local throughPut = 300
data:extend({
	{
		type = "ammo",
		name = "kj_b2_medium",
		icon = "__kj_b2__/graphics/equipment/bomb_250.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_plane_b2",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_b2_medium",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 15,
			  min_range = 4,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_b2_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "b2[b2]-b[medium]",
		stack_size = 80,
		magazine_size = 1,
		reload_time = 7,
	},
	{
		type = "projectile",
		name = "kj_b2_medium",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
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
		name = "kj_b2_big",
		icon = "__kj_b2__/graphics/equipment/bomb_500.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_plane_b2",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_b2_big",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 15,
			  min_range = 5,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_b2_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "b2[b2]-c[big]",
		stack_size = 40,
		magazine_size = 1,
		reload_time = 7,
	},
	{
		type = "projectile",
		name = "kj_b2_big",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
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
		name = "kj_b2_huge",
		icon = "__kj_b2__/graphics/equipment/bomb_1000.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_plane_b2",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_b2_huge",
			  starting_speed = 0.05,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 15,
			  min_range = 7,
			  --[[source_effects =
			  {
				type = "create-explosion",
				entity_name = "kj_b2_shot"
			  }]]
			}
		  }
		},
		subgroup = "ammo",
		order = "b2[b2]-d[huge]",
		stack_size = 16,
		magazine_size = 1,
		reload_time = 7,
	},
	{
		type = "projectile",
		name = "kj_b2_huge",
		flags = {"not-on-map"},
		force_condition = "not-same", 
		--collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		hit_collision_mask = {},
		piercing_damage = HDW,
		--[[action =
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
		},]]
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

	{
		type = "ammo",
		name = "kj_b2_atom",
		icon = "__kj_b2__/graphics/equipment/bomb_atomic.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_plane_b2",
		  target_type = "direction",
		  action =
		  {
			type = "direct",
			action_delivery =
			{
			  type = "projectile",
			  projectile = "kj_b2_atom",
			  starting_speed = 0.03,
			  direction_deviation = 0.3,
			  range_deviation = 0.3,
			  max_range = 25,
			  min_range = 10,
			}
		  }
		},
		subgroup = "ammo",
		order = "b2[b2]-e[atom]",
		stack_size = 16,
		magazine_size = 1,
		reload_time = 30,
	},
	{
		type = "projectile",
		name = "kj_b2_atom",
		flags = {"not-on-map"},
		force_condition = "not-same",
		--collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
		acceleration = 0,
		--turn_speed = 0.003,
		action =
		{
		  type = "direct",
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "set-tile",
				tile_name = "nuclear-ground",
				radius = 12 * ATOM_RADIUS_MUL,
				apply_projection = true,
				tile_collision_mask = { "water-tile" }
			  },
			  {
				type = "destroy-cliffs",
				radius = 9 * ATOM_RADIUS_MUL,
				explosion = "explosion"
			  },
			  {
				type = "create-entity",
				entity_name = "nuke-explosion"
			  },
			  {
				type = "camera-effect",
				effect = "screen-burn",
				duration = 60,
				ease_in_duration = 5,
				ease_out_duration = 60,
				delay = 0,
				strength = 6,
				full_strength_max_distance = 200,
				max_distance = 800
			  },
			  {
				type = "play-sound",
				sound = sounds.nuclear_explosion(0.9),
				play_on_target_position = false,
				-- min_distance = 200,
				max_distance = 1000,
				-- volume_modifier = 1,
				audible_distance_modifier = 3
			  },
			  {
				type = "play-sound",
				sound = sounds.nuclear_explosion_aftershock(0.4),
				play_on_target_position = false,
				-- min_distance = 200,
				max_distance = 1000,
				-- volume_modifier = 1,
				audible_distance_modifier = 3
			  },
			  {
				type = "damage",
				damage = {amount = ATOM_DAMAGE, type = "explosion"}
			  },
			  {
				type = "create-entity",
				entity_name = "huge-scorchmark",
				offsets = {{ 0, -0.5 }},
				check_buildability = true
			  },
			  {
				type = "invoke-tile-trigger",
				repeat_count = 1
			  },
			  {
				type = "destroy-decoratives",
				include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
				include_decals = true,
				invoke_decorative_trigger = true,
				decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
				radius = 24 * ATOM_RADIUS_MUL / 2 -- large radius for demostrative purposes
			  },
			  {
				type = "create-decorative",
				decorative = "nuclear-ground-patch",
				spawn_min_radius = 11.5,
				spawn_max_radius = 12.5,
				spawn_min = 30,
				spawn_max = 40,
				apply_projection = true,
				spread_evenly = true
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 1000,
				  radius = 7 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "projectile",
					projectile = "atomic-bomb-ground-zero-projectile",
					starting_speed = 0.6 * 0.8,
					starting_speed_deviation = 0.075
				  }
				}
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 1000,
				  radius = 42 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "projectile",
					projectile = "atomic-bomb-wave",
					starting_speed = 0.5 * 0.7,
					starting_speed_deviation = 0.075
				  }
				}
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  show_in_tooltip = false,
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 1000,
				  radius = 26 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "projectile",
					projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
					starting_speed = 0.5 * 0.7,
					starting_speed_deviation = 0.075
				  }
				}
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  show_in_tooltip = false,
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 700,
				  radius = 4 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "projectile",
					projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
					starting_speed = 0.5 * 0.65,
					starting_speed_deviation = 0.075
				  }
				}
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  show_in_tooltip = false,
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 1000,
				  radius = 8 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "projectile",
					projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
					starting_speed = 0.5 * 0.65,
					starting_speed_deviation = 0.075
				  }
				}
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  show_in_tooltip = false,
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 300,
				  radius = 26 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "projectile",
					projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
					starting_speed = 0.5 * 0.65,
					starting_speed_deviation = 0.075
				  }
				}
			  },
			  {
				type = "nested-result",
				action =
				{
				  type = "area",
				  show_in_tooltip = false,
				  target_entities = false,
				  trigger_from_target = true,
				  repeat_count = 10,
				  radius = 8 * ATOM_RADIUS_MUL,
				  action_delivery =
				  {
					type = "instant",
					target_effects =
					{
					  {
						type = "create-entity",
						entity_name = "nuclear-smouldering-smoke-source",
						tile_collision_mask = { "water-tile" }
					  }
					}
				  }
				}
			  }
			}
		  }
		},
		--light = {intensity = 0.8, size = 15},
		animation =
		{
		  filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
		  frame_count = 1,
		  width = 64,
		  height = 64,
		  scale = 0.5,
		  priority = "high"
		}
	}
})