local data_util = require("data_util")

-- stop nukes making land in space.
local max_depth = 20
local function set_tiles_mask_recursive(object, depth)
  if type(object) == "table" and depth < max_depth then
    for _, child in pairs(object) do
      set_tiles_mask_recursive(child, depth + 1)
    end
    if object.type == "set-tile" then
      object.tile_collision_mask = object.tile_collision_mask or {}
      table.insert(object.tile_collision_mask, space_collision_layer)
      table.insert(object.tile_collision_mask, spaceship_collision_layer)
    end
  end
end
set_tiles_mask_recursive(data.raw, 0)

-- all space tiles have space_collision_layer ("space-tile")
-- if there is "space-tile" on planet, except spaceship tile, we can remove that.
-- we need the same for planet tiles, but for it to NOT be on out-of-map tiles.
-- IMPORTANT: never use this on a space tile or out-of-map, it WILL horribly break the fix tiles code.
planet_collision_layer = collision_mask_util_extended.get_make_named_collision_mask("planet-tile")
for _, tile in pairs(data.raw.tile) do
  tile.check_collision_with_entities = true
  if tile.name ~= "out-of-map" and not data_util.table_contains(tile.collision_mask, space_collision_layer) then
    table.insert(tile.collision_mask, planet_collision_layer)
  end
end
