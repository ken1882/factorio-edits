if not data.raw["ammo"]["kj_bolt"] then
	data:extend({
	-- BolterAmmo
		{
			type = "recipe",
			name = "kj_bolt",
			enabled = false,
			energy_required = 15,
			ingredients =
			{
				{"steel-plate", 2},
				{"plastic-bar", 2},
				{"explosives", 2}
			},
			result = "kj_bolt"
		}, 
	  
		{
			type = "ammo-category",
			name = "kj_bolter"
		},
		
		{
			type = "ammo",
			name = "kj_bolt",
			icon = "__kj_40kpredator__/graphics/equipment/bolt100mk2.png",
			icon_size = 32,
			ammo_type =
			{
			  category = "kj_bolter",
			  action =
				{
					type = "direct",
					repeat_count = 1,
					action_delivery =
					{
						type = "projectile",
						projectile = "kj_bolt_projectile",
						starting_speed = 3,
						direction_deviation = 0.1,
						range_deviation = 0.1,
						max_range = 45,
						min_range = 3,
						source_effects =
						{
							type = "create-explosion",
							entity_name = "explosion-gunshot"
						},
					},
				},
			},
			magazine_size = 10,
			subgroup = "kj_fuels",
			order = "a",
			stack_size = 100
		},
		
		{
			type = "projectile",
			name = "kj_bolt_projectile",
			flags = {"not-on-map"},
			force_condition = "not-same", 
			height = 0,
			collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
			acceleration = 0,
			piercing_damage = 550,
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
				  damage = {amount = 40, type = "physical"}
				  },
				  {
				   type = "push-back",
				   distance = 2,
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
					entity_name = "explosion"
				  },
				  {
					type = "nested-result",
					action =
					{
					  type = "area",
					  radius = 3,
					  action_delivery =
					  {
						type = "instant",
						target_effects =
						{
						  {
							type = "damage",
							damage = {amount = 100, type = "explosion"}
						  },
						  {
						   type = "push-back",
						   distance = 2,
						  },
						}
					  }
					}
				  },
				  {
					type = "create-entity",
					entity_name = "small-scorchmark-tintable",
					check_buildability = true
				  },
				}
			  }
			},
			animation =
			{
				filename = "__base__/graphics/entity/bullet/bullet.png",
				draw_as_glow = true,
				frame_count = 1,
				width = 3,
				height = 50,
				priority = "high"
			}
		},
	})
	
	table.insert(data.raw["technology"]["physical-projectile-damage-5"].effects,
		{
			type = "ammo-damage",
			ammo_category = "kj_bolter",
			modifier = 0.3,
		})
	table.insert(data.raw["technology"]["physical-projectile-damage-6"].effects,
		{
			type = "ammo-damage",
			ammo_category = "kj_bolter",
			modifier = 0.4,
		})
	table.insert(data.raw["technology"]["physical-projectile-damage-7"].effects,
		{
			type = "ammo-damage",
			ammo_category = "kj_bolter",
			modifier = 0.5,
		})
	table.insert(data.raw["technology"]["weapon-shooting-speed-5"].effects,
		{
			type = "gun-speed",
			ammo_category = "kj_bolter",
			modifier = 0.5,
		})
	table.insert(data.raw["technology"]["weapon-shooting-speed-6"].effects,
		{
			type = "gun-speed",
			ammo_category = "kj_bolter",
			modifier = 0.5,
		})

	for iterator,value in ipairs(data.raw["recipe"]["kj_bolt"].ingredients) do 
		data.raw["recipe"]["kj_bolt"].ingredients[iterator][2] = value[2] * settings.startup["kj_40kpredatorammo_cost_setting_multiplicator"].value
	end	
end
