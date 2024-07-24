--[[ shorthand definitions possible for:
 surfaces: index or name
 positions: array with two elements
]]
remote.add_interface("subsurface", {
	
	is_subsurface = function(surface) return is_subsurface(get_surface_object(surface)) end,
	get_subsurface = function(surface) return get_subsurface(get_surface_object(surface), false) end,
	get_oversurface = function(surface) return get_oversurface(get_surface_object(surface), false) end,
	
	expose = function(surface, pos, radius, clearing_radius)
		clear_subsurface(get_surface_object(surface), math2d.position.ensure_xy(pos), radius, clearing_radius)
	end,
	
})

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
	elseif params[1] == "set" then
		global.a = global.a or {}
		global.a["b"] = 10
	elseif params[1] == "get" then
		if global.a then game.print(global.a.b or 0) end
	elseif params[1] == "b" then
		global.next_burrowing = game.tick + 10
	end
end)