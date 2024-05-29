local NF = 20
local NP = 24
local NE = 30

local flak_impact =
{
  {
    filename = "__base__/sound/fight/poison-capsule-explosion-1.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/fight/poison-capsule-explosion-2.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/fight/poison-capsule-explosion-3.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/fight/poison-capsule-explosion-4.ogg",
    volume = 0.6
  },
  {
    filename = "__base__/sound/fight/poison-capsule-explosion-5.ogg",
    volume = 0.6
  },
}

data:extend({

	{
		type = "ammo",
		name = "kj_2cmfv_normal_vierling",
		icon = "__kj_vierling__/graphics/equipment/flak_muni.png",
		icon_size = 80,
		ammo_type =
		{
		  category = "kj_2cmfv_vierling",
		  action =
		  {
			{
			  type = "direct",
			  --trigger_target_mask = {"air-unit"},
			  action_delivery =
			  {
				{
				  type = "instant",
				  source_effects =
				  {
					{
					  type = "create-explosion",
					  entity_name = "explosion-gunshot",
					  offset_deviation = {{-0.5, -0.1}, {0.5, 0.1}}
					}
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
					  type = "play-sound",
					  sound = flak_impact,
					  play_on_target_position = true,
					},

					{
					  type = "damage",
					  damage = { amount = NF , type = "flak"}
					},
					{
					  type = "damage",
					  damage = { amount = NE , type = "explosion"}
					},
					{
					  type = "damage",
					  damage = { amount = NP , type = "physical"}
					},
				  }
				}
			  }
			}
		  }
		},
		magazine_size = 5,
		subgroup = "ammo",
		order = "v[vierling]-a[normal]",
		stack_size = 200
	},
})