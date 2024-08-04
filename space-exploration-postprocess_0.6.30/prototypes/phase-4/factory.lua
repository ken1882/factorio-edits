local data_util = require("data_util")

for name, prototype in pairs(data.raw["storage-tank"]) do
  if string.find(name, "factory", 1, true) or string.find(name, "Factory", 1, true) then
    prototype.collision_mask = collision_mask_util_extended.get_mask(prototype)
    collision_mask_util_extended.add_layer(prototype.collision_mask, spaceship_collision_layer)  -- block from spaceship
  end
end
