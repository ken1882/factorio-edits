--[[ shorthand definitions possible for:
 surfaces: index or name
 positions: array with two elements
]]
remote.add_interface("subsurface", {
	
	expose = function(surface, pos, radius, clearing_radius)
		clear_subsurface(get_surface_object(surface), math2d.position.ensure_xy(pos), radius, clearing_radius)
	end,
	expose_patches = function(surface, resource, position, radius)
		local surface = get_surface_object(surface)
		local pos = get_area_positions(get_area(position, radius))
		local calcresult = surface.calculate_tile_properties({"entity:"..resource..":richness"}, pos)
		for i,v in ipairs(calcresult["entity:"..resource..":richness"] or {}) do
			if v > 0 then
				clear_subsurface(surface, {x=pos[i][1], y=pos[i][2]}, 1)
			end
		end
	end,
})

--[[
Events:
Mods that want to register to specific events have to implement a remote function in their own interface.

remote.add_interface(interface_name, {
	subsurface_make_autoplace_controls = function(res_table, topname, depth)
		-- return the manipulated res_table (format is {[resource-name] = {frequency = x, size = x, richness = x}})
		-- topname is the topmost surface name
		-- depth is the subsurface depth this autoplace controls are generated for
	end
})

]]

commands.add_command("ss", nil, function(cmd)
	local params = {}
	for i in string.gmatch(cmd.parameter or "", "%S+") do
		table.insert(params, i)
	end
	
	if params[1] == "exp" and cmd.player_index and tonumber(params[2]) > 0 then -- expose
		local player = game.get_player(cmd.player_index)
		if is_subsurface(player.surface) then clear_subsurface(player.surface, player.position, tonumber(params[2])) end
	elseif params[1] == "ce" and cmd.player_index then -- create entry
		local player = game.get_player(cmd.player_index)
		local pos = {x=player.position.x, y=player.position.y-3}
		local ore = player.surface.create_entity{name="subsurface-hole", position=pos, amount=10}
		local drill = player.surface.create_entity{name="surface-drill", position=pos, force=player.force}
		local ss = get_subsurface(drill.surface)
		ss.request_to_generate_chunks(drill.position, 3)
		ss.force_generate_chunk_requests()
		ss.daytime = 1
		ore.deplete()
		drill.destroy()
		
	elseif params[1] == "gen" and cmd.player_index then -- chart chunks
		local player = game.get_player(cmd.player_index)
		local radius = tonumber(params[2]) or 20
		player.surface.request_to_generate_chunks(player.position, radius)
		player.surface.force_generate_chunk_requests()
		clear_subsurface(player.surface, player.position, radius*32)
		player.force.chart_all()
	elseif params[1] == "p" and cmd.player_index then -- calculate propierties
		local player = game.get_player(cmd.player_index)
		local radius = tonumber(params[4] or params[2]) or 1
		local pos_arr = get_area_positions(get_area(player.position, radius*32))
		local props = {}
		if not params[3] and not params[4] then table.insert(props, "tile:caveground:probability")
		else table.insert(props, params[2]..":"..params[3]..":probability") end
		local calcresult = player.surface.calculate_tile_properties(props, pos_arr)
		--game.print(dump(calcresult))
		for i,pos in ipairs(pos_arr) do
			rendering.draw_text{text=string.format("%.2f", calcresult[props[1]][i]), color={1, 1, 1}, surface=player.surface, target=pos, scale=0.5, time_to_live=600}
			--rendering.draw_text{text=string.format("%.2f", calcresult["decorative:rock-small:richness"][i]), color={1, 1, 0}, scale=0.3, surface=player.surface, target={pos[1], pos[2]+0.2}}
		end
	end
end)