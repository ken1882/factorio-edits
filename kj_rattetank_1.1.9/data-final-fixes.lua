local boolean = false

if data.raw["item"]["kj_compatibility"].stack_size > 3 then
	boolean = true
end

if boolean == true then
	if not data.raw["item-group"]["kj_vehicles"] then
		data:extend(
		{	
			{
				type = "item-group",
				name = "kj_vehicles",
				icon = "__kj_rattetank__/graphics/thumbnail_categories.png",
				icon_size = 560,
				inventory_order = "x",
				order = "kj_vehicles"
			},
		})
	end
	
	data.raw["item-subgroup"]["kj_rattetank"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_rattetank"].order = "p"
	data.raw["item-with-entity-data"]["kj_rattetank"].subgroup = "kj_rattetank"
	data.raw["ammo"]["kj_280SKC34_incendiary"].subgroup = "kj_rattetank"
	data.raw["ammo"]["kj_280SKC34_penetration"].subgroup = "kj_rattetank"
	data.raw["ammo"]["kj_280SKC34_highexplosive"].subgroup = "kj_rattetank"
end
--[[
data.raw["sticker"]["acid-sticker-small"].trigger_target_mask = {"test1"}
data.raw["sticker"]["acid-sticker-medium"].trigger_target_mask = {"test1"}
data.raw["sticker"]["acid-sticker-big"].trigger_target_mask = {"test1"}
data.raw["sticker"]["acid-sticker-behemoth"].trigger_target_mask = {"test1"}

data.raw["fire"]["acid-splash-fire-worm-small"].on_damage_tick_effect.trigger_target_mask = nil
data.raw["fire"]["acid-splash-fire-worm-medium"].on_damage_tick_effect.trigger_target_mask = nil
data.raw["fire"]["acid-splash-fire-worm-big"].on_damage_tick_effect.trigger_target_mask = nil
data.raw["fire"]["acid-splash-fire-worm-behemoth"].on_damage_tick_effect.trigger_target_mask = nil

data.raw["fire"]["acid-splash-fire-spitter-small"].on_damage_tick_effect.trigger_target_mask = nil
data.raw["fire"]["acid-splash-fire-spitter-medium"].on_damage_tick_effect.trigger_target_mask = nil
data.raw["fire"]["acid-splash-fire-spitter-big"].on_damage_tick_effect.trigger_target_mask = nil
data.raw["fire"]["acid-splash-fire-spitter-behemoth"].on_damage_tick_effect.trigger_target_mask = nil
]]