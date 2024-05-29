local Migrate = {}

function Migrate.migrations()
  if not global.version then global.version = 0 end
  if global.version < Version then
    if global.version < 0003006 then Migrate.v0_3_006() end
    if global.version < 0003012 then Migrate.v0_3_012() end
  end
end

function Migrate.v0_3_006()
  global.player_toggle_cooldown = {}
  global.current_fuel_by_character = {}
  if global.players then
    for player_index, playerdata in pairs(global.players) do
      local player = game.get_player(player_index)
      if player and player.character and player.character.valid and playerdata.saved_fuel then
        global.current_fuel_by_character[player.character.unit_number] = playerdata.saved_fuel
        -- This will miss players who are in the middle of remote view, but whatever.
      end
    end
    global.players = nil
  end
end

function Migrate.v0_3_012()
  global.robot_collections = global.robot_collections or {}
  global.disabled_on = global.disabled_on or {}
  global.last_printed_thrust = global.last_printed_thrust or {}

  for _, jetpack in pairs(global.jetpacks) do
    jetpack.speed = util.vector_length(jetpack.velocity)
    jetpack.flame_timer = 0
    jetpack.smoke_timer = 0
  end
end

return Migrate