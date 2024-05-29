local tile = table.deepcopy(data.raw.tile["mineral-black-dirt-1"])
tile.name = "interior-divider"
tile.layer = 0
--table.insert(tile.collision_mask, spaceship_collision_layer)
-- prevents nukes from removing but also prevents ruin walls from spawning.
-- instead add extra limitation to nukes tile change.
table.insert(tile.collision_mask, flying_collision_layer)
tile.autoplace = nil
tile.localised_name = nil

data:extend(
{
  tile
})
