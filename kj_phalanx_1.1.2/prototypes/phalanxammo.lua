local sounds = require ("__base__/prototypes/entity/sounds.lua")
local NF = 10
local NP = 15

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
		name = "kj_apds_normal",
		icon = "__kj_phalanx__/graphics/flak_muni.png",
		icon_size = 128,
		ammo_type =
		{
		  category = "kj_apds_phalanx",
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
					  --offset_deviation = {{-0.5, -0.1}, {0.5, 0.1}}
					}
				  },
				  target_effects =
				  {
					{
					  type = "create-entity",
					  entity_name = "explosion-hit",
					  offsets = {{0, 1}},
					  offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
					},
					{
					  type = "play-sound",
					  sound = sounds.small_explosion(0.1),
					  play_on_target_position = true,
					},

					{
					  type = "damage",
					  damage = { amount = NF , type = "flak"}
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
		magazine_size = 1550,
		subgroup = "ammo",
		order = "p[phalanx]-a[normal]",
		stack_size = 1,
	},
})