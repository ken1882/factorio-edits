--Normal 50kg
local NP = 24
local NF = 24
data:extend({
	{
		type = "ammo",
		name = "kj_bf109_normal",
		icon = "__kj_bf109__/graphics/equipment/mg17_rounds.png",
		icon_size = 64,
		ammo_type =
		{
		  category = "kj_plane_mg17",
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
		order = "bf109[bf109]-a[normal]",
		stack_size = 100,
		magazine_size = 5,
	},
})