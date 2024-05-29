local boolean = false
local airborneMods = {
	"kj_b17",
	"kj_b2",
	"kj_bf109",
	"kj_ho229",
	"kj_ju52",
	"kj_ju87",
	"kj_jug38",
	"kj_xb35"
}


if data.raw["item"]["kj_compatibility"].stack_size > 3 then
	boolean = true
end


if mods["kj_rattetank"] or mods["kj_utilitarian"] or mods["kj_king_jos_vehicles"] or mods["kj_aventador"] or mods["kj_maustank"] or boolean then
	data:extend(
	{	
		{
			type = "item-group",
			name = "kj_vehicles",
			icon = "__kj_phalanx__/graphics/thumbnail_categories.png",
			icon_size = 560,
			inventory_order = "x",
			order = "kj_vehicles"
		},
	})
	
	data.raw["item-subgroup"]["kj_phalanx"].group = "kj_vehicles"
	data.raw["item-subgroup"]["kj_phalanx"].order = "w-1[buildings]-flak"
	data.raw["ammo"]["kj_apds_normal"].subgroup = "kj_phalanx"
end

if mods["kj_vierling"] then
	table.insert(data.raw["technology"]["kj_phalanx"].prerequisites, "kj_vierling")
end

--Assigning Planes trigger_target_mask
for _, mod in ipairs(airborneMods) do
	if mods[mod] then
		if data.raw["car"][mod] ~= nil then		--If plane exists
			if data.raw["car"][mod].trigger_target_mask ~= nil then		--If masks not empty
				table.insert(data.raw["car"][mod.."-airborne"].trigger_target_mask, "air-unit")
				log("Phalanx added trigger_target_mask to plane "..mod.."-airborne.")
				
			else
				data.raw["car"][mod.."-airborne"].trigger_target_mask = {"air-unit"}
				log("Phalanx assigned trigger_target_mask to plane "..mod.."-airborne.")
			end
		else
			log("Phalanx trying to assign trigger_target_mask to plane "..mod.." failed.")
		end
	end
end