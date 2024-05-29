local phalanx = table.deepcopy(data.raw["ammo-turret"]["kj_phalanx"])
phalanx.name = "kj_phalanx_nonAA"
phalanx.prepare_range = 0.5 * phalanx.prepare_range --100
phalanx.call_for_help_radius = 0.5 * phalanx.call_for_help_radius --75
phalanx.attack_parameters.range = 0.5 * phalanx.attack_parameters.range --70
phalanx.attack_parameters.rotate_penalty = nil
phalanx.attack_parameters.health_penalty = nil
phalanx.localised_name = {"", {"entity-name.kj_phalanx"}}
phalanx.localised_description = {"", {"entity-description.kj_phalanx"}}
phalanx.base_picture.tint = {r=0.5, g=0.73, b=1, a=1}
phalanx.base_picture.hr_version.tint = {r=0.5, g=0.73, b=1, a=1}

local phalanxItem = table.deepcopy(data.raw["item-with-entity-data"]["kj_phalanx"])
phalanxItem.name = "kj_phalanx_nonAA"
phalanxItem.icons = {{icon = phalanxItem.icon, tint = {r=0.5, g=0.73, b=1, a=1}}}
phalanxItem.order = "p2[phalanxnonAA]"
phalanxItem.place_result = "kj_phalanx_nonAA"
phalanxItem.localised_name = {"", {"item-name.kj_phalanx"}}
phalanxItem.localised_description = {"", {"item-description.kj_phalanx"}}

local icon = data.raw["item-with-entity-data"]["kj_phalanx"].icon
data.raw["item-with-entity-data"]["kj_phalanx"].icons = {{icon = icon, tint = {r=1, g=0.5, b=0.5, a=1}}}

data.raw["technology"]["kj_phalanx"].localised_description = {"", {"technology-description.kj_phalanx_nonAA"}}

data:extend({phalanx, phalanxItem,
	{
		type = "recipe",
		name = "kj_phalanx_nonAA",
		enabled = false,
		ingredients =
		{
			{type = "item", name = "kj_phalanx", amount = 1},
		},
		energy_required = 1,
		result = "kj_phalanx_nonAA"
	},
})

table.insert(data.raw["technology"]["kj_phalanx"].effects, {type = "unlock-recipe", recipe = "kj_phalanx_nonAA"})
