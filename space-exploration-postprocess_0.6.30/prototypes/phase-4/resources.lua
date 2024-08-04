local data_util = require("data_util")

local whitelist = {
  -- only natural tiles,
  -- can't rely on tile autoplace due to ruins.
  -- can't rely on item place as due to decorative mods
  "deepwater",
  "water",
  "water-shallow",
  "water-mud",
  "grass-1",
  "mineral-purple-dirt-1",
  "mineral-purple-dirt-2",
  "mineral-purple-dirt-3",
  "mineral-purple-dirt-4",
  "mineral-purple-dirt-5",
  "mineral-purple-dirt-6",
  "mineral-purple-sand-1",
  "mineral-purple-sand-2",
  "mineral-purple-sand-3",
  "mineral-violet-dirt-1",
  "mineral-violet-dirt-2",
  "mineral-violet-dirt-3",
  "mineral-violet-dirt-4",
  "mineral-violet-dirt-5",
  "mineral-violet-dirt-6",
  "mineral-violet-sand-1",
  "mineral-violet-sand-2",
  "mineral-violet-sand-3",
  "mineral-red-dirt-1",
  "mineral-red-dirt-2",
  "mineral-red-dirt-3",
  "mineral-red-dirt-4",
  "mineral-red-dirt-5",
  "mineral-red-dirt-6",
  "mineral-red-sand-1",
  "mineral-red-sand-2",
  "mineral-red-sand-3",
  "mineral-brown-dirt-1",
  "mineral-brown-dirt-2",
  "mineral-brown-dirt-3",
  "mineral-brown-dirt-4",
  "mineral-brown-dirt-5",
  "mineral-brown-dirt-6",
  "mineral-brown-sand-1",
  "mineral-brown-sand-2",
  "mineral-brown-sand-3",
  "mineral-tan-dirt-1",
  "mineral-tan-dirt-2",
  "mineral-tan-dirt-3",
  "mineral-tan-dirt-4",
  "mineral-tan-dirt-5",
  "mineral-tan-dirt-6",
  "mineral-tan-sand-1",
  "mineral-tan-sand-2",
  "mineral-tan-sand-3",
  "mineral-aubergine-dirt-1",
  "mineral-aubergine-dirt-2",
  "mineral-aubergine-dirt-3",
  "mineral-aubergine-dirt-4",
  "mineral-aubergine-dirt-5",
  "mineral-aubergine-dirt-6",
  "mineral-aubergine-sand-1",
  "mineral-aubergine-sand-2",
  "mineral-aubergine-sand-3",
  "mineral-dustyrose-dirt-1",
  "mineral-dustyrose-dirt-2",
  "mineral-dustyrose-dirt-3",
  "mineral-dustyrose-dirt-4",
  "mineral-dustyrose-dirt-5",
  "mineral-dustyrose-dirt-6",
  "mineral-dustyrose-sand-1",
  "mineral-dustyrose-sand-2",
  "mineral-dustyrose-sand-3",
  "mineral-beige-dirt-1",
  "mineral-beige-dirt-2",
  "mineral-beige-dirt-3",
  "mineral-beige-dirt-4",
  "mineral-beige-dirt-5",
  "mineral-beige-dirt-6",
  "mineral-beige-sand-1",
  "mineral-beige-sand-2",
  "mineral-beige-sand-3",
  "mineral-cream-dirt-1",
  "mineral-cream-dirt-2",
  "mineral-cream-dirt-3",
  "mineral-cream-dirt-4",
  "mineral-cream-dirt-5",
  "mineral-cream-dirt-6",
  "mineral-cream-sand-1",
  "mineral-cream-sand-2",
  "mineral-cream-sand-3",
  "mineral-black-dirt-1",
  "mineral-black-dirt-2",
  "mineral-black-dirt-3",
  "mineral-black-dirt-4",
  "mineral-black-dirt-5",
  "mineral-black-dirt-6",
  "mineral-black-sand-1",
  "mineral-black-sand-2",
  "mineral-black-sand-3",
  "mineral-grey-dirt-1",
  "mineral-grey-dirt-2",
  "mineral-grey-dirt-3",
  "mineral-grey-dirt-4",
  "mineral-grey-dirt-5",
  "mineral-grey-dirt-6",
  "mineral-grey-sand-1",
  "mineral-grey-sand-2",
  "mineral-grey-sand-3",
  "mineral-white-dirt-1",
  "mineral-white-dirt-2",
  "mineral-white-dirt-3",
  "mineral-white-dirt-4",
  "mineral-white-dirt-5",
  "mineral-white-dirt-6",
  "mineral-white-sand-1",
  "mineral-white-sand-2",
  "mineral-white-sand-3",
  "vegetation-turquoise-grass-1",
  "vegetation-turquoise-grass-2",
  "vegetation-green-grass-1",
  "vegetation-green-grass-2",
  "vegetation-green-grass-3",
  "vegetation-green-grass-4",
  "vegetation-olive-grass-1",
  "vegetation-olive-grass-2",
  "vegetation-yellow-grass-1",
  "vegetation-yellow-grass-2",
  "vegetation-orange-grass-1",
  "vegetation-orange-grass-2",
  "vegetation-red-grass-1",
  "vegetation-red-grass-2",
  "vegetation-violet-grass-1",
  "vegetation-violet-grass-2",
  "vegetation-purple-grass-1",
  "vegetation-purple-grass-2",
  "vegetation-mauve-grass-1",
  "vegetation-mauve-grass-2",
  "vegetation-blue-grass-1",
  "vegetation-blue-grass-2",
  "volcanic-orange-heat-1",
  "volcanic-orange-heat-2",
  "volcanic-orange-heat-3",
  "volcanic-orange-heat-4",
  "volcanic-green-heat-1",
  "volcanic-green-heat-2",
  "volcanic-green-heat-3",
  "volcanic-green-heat-4",
  "volcanic-blue-heat-1",
  "volcanic-blue-heat-2",
  "volcanic-blue-heat-3",
  "volcanic-blue-heat-4",
  "volcanic-purple-heat-1",
  "volcanic-purple-heat-2",
  "volcanic-purple-heat-3",
  "volcanic-purple-heat-4",
  "frozen-snow-0",
  "frozen-snow-1",
  "frozen-snow-2",
  "frozen-snow-3",
  "frozen-snow-4",
  "frozen-snow-5",
  "frozen-snow-6",
  "frozen-snow-7",
  "frozen-snow-8",
  "frozen-snow-9",
  "se-regolith",
  "se-asteroid",
}

for _, resource in pairs(data.raw.resource) do
  if resource.autoplace then
    if resource.autoplace.tile_restriction then
      for i, restriction in pairs(resource.autoplace.tile_restriction) do
        if not data_util.table_contains(whitelist, restriction) then
          resource.autoplace.tile_restriction[i] = nil
        end
      end
      if table_size( resource.autoplace.tile_restriction ) == 0 then
        resource.autoplace = nil
      end
    else
      resource.autoplace.tile_restriction = table.deepcopy(whitelist)
    end
  end
end
--log(serpent.block(data.raw.resource))