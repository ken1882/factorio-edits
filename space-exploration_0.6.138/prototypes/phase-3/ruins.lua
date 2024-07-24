local data_util = require("data_util")

-- Versions of normal items but can't be mined, maybe have higher health.
for _, wall_name in pairs({"stone-wall", "concrete-wall", "steel-wall"}) do
  local wall = table.deepcopy(data.raw.wall[wall_name])
  wall.name = wall_name .. "-ruin"
  wall.localised_name = {"space-exploration.suffix_ruin", {"entity-name."..wall_name}}
  wall.minable = nil
  wall.next_upgrade = nil
  wall.fast_replaceable_group = nil
  wall.placeable_by = {item=wall_name, count = math.ceil((1000 + wall.max_health) / wall.max_health)} -- needed for ruin blueprinting
  wall.max_health = 1000 + wall.max_health
  wall.collision_mask = collision_mask_util_extended.get_mask(wall)
  collision_mask_util_extended.add_layer(wall.collision_mask, spaceship_collision_layer)  -- block from spaceship
  table.insert(wall.flags, "not-deconstructable")
  table.insert(wall.flags, "hidden")
  data:extend({wall})
end

-- convert decals to ruins bits
for _, decal_name in pairs({"sand-decal", "sand-decal-black", "sand-decal-tan", "sand-decal-white", "sand-decal-black", "light-mud-decal", "dark-mud-decal", "puberty-decal", "red-desert-decal", "shroom-decal", "lichen-decal", "enemy-decal"}) do
  data:extend({{
    type = "simple-entity",
    name = decal_name.."-ruin",
    icon = "__space-exploration-graphics__/graphics/icons/stone-rubble.png",
    icon_size = 64,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    order = "a-b-a",
    collision_mask = {},
    selection_box = {{-0.45, -0.45}, {0.45, 0.45}},
    max_health = 50,
    selection_priority = 1,
    selectable_in_game = false,
    render_layer = "decals",
    pictures = data.raw["optimized-decorative"][decal_name].pictures,
  }})
end

data:extend({
  {
    type = "container",
    name = "iron-wood-chest",
    icon = "__space-exploration-graphics__/graphics/icons/iron-wood-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "player-creation", "not-deconstructable"},
    placeable_by = {item="iron-chest", count = 1}, -- blueprintable
    max_health = 1000,
    corpse = "iron-wood-chest-remnants",
    dying_explosion = "iron-chest-explosion",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = table.deepcopy(data.raw.container["wooden-chest"].damaged_trigger_effect),
    inventory_size = 20,
    vehicle_impact_sound = table.deepcopy(data.raw.container["wooden-chest"].vehicle_impact_sound),
    picture =
    {
      layers =
      {
        {
          filename = "__space-exploration-graphics__/graphics/entity/ruins/sr/iron-wood-chest.png",
          priority = "extra-high",
          width = 33,
          height = 38,
          shift = util.by_pixel(0, -0.5),
          hr_version =
          {
            filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/iron-wood-chest.png",
            priority = "extra-high",
            width = 66,
            height = 76,
            shift = util.by_pixel(-0.5, -0.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 56,
          height = 26,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
            priority = "extra-high",
            width = 110,
            height = 50,
            shift = util.by_pixel(10.5, 6),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
  },
  {
    type = "simple-entity",
    name = "iron-wood-chest-remnants",
    icon = "__space-exploration-graphics__/graphics/icons/iron-wood-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    placeable_by = {item="iron-chest", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer", "object-layer"},
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selection_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selectable_in_game = is_debug_mode,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/iron-wood-chest-remnant.png",
        line_length = 1,
        width = 126,
        height = 78,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(12, 0),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "wood-half-chest-left",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    placeable_by = {item="wooden-chest", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer", "object-layer"},
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selection_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selectable_in_game = is_debug_mode,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/wood-half-chest-left.png",
        line_length = 1,
        width = 110,
        height = 73,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(12, 0),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "wood-half-chest-right",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    placeable_by = {item="wooden-chest", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer", "object-layer"},
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selection_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selectable_in_game = is_debug_mode,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/wood-half-chest-right.png",
        line_length = 1,
        width = 110,
        height = 73,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(12, 0),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "vase",
    icon = "__space-exploration-graphics__/graphics/icons/vase.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    placeable_by = {item="wood", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer", "object-layer"},
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
    max_health = 10,
    selectable_in_game = is_debug_mode,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/vase.png",
        line_length = 1,
        width = 32,
        height = 68,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -10),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "wooden-barrel",
    icon = "__space-exploration-graphics__/graphics/icons/wooden-barrel.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    placeable_by = {item="wood", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer", "object-layer"},
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.2, -0.2}, {0.2, 0.2}},
    max_health = 20,
    selectable_in_game = is_debug_mode,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/wooden-barrel.png",
        line_length = 1,
        width = 52,
        height = 86,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -10),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "furnace-ruin",
    icon = "__space-exploration-graphics__/graphics/icons/ruin.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    placeable_by = {item="stone-furnace", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_box = data_util.auto_box(1.5, 1.5, 0.1),
    selection_box = data_util.auto_box(1.5, 1.5),
    selectable_in_game = is_debug_mode,
    max_health = 200,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/furnace-ruin.png",
        line_length = 1,
        width = 128,
        height = 128,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, -6),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "workshop-ruin",
    icon = "__space-exploration-graphics__/graphics/icons/workshop.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    placeable_by = {item="assembling-machine-1", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer"},
    collision_box = {{-1.45, -1.45}, {1.45, 1.45}},
    selection_box = {{-1.45, -1.45}, {1.45, 1.45}},
    selectable_in_game = is_debug_mode,
    max_health = 200,
    final_render_layer = "remnants",
    picture = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/workshop.png",
        line_length = 1,
        width = 255,
        height = 228,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(6, 3),
        scale = 0.5,
    }),
  },
  {
    type = "simple-entity",
    name = "stone-rubble",
    icon = "__space-exploration-graphics__/graphics/icons/stone-rubble.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    placeable_by = {item="stone-wall", count = 1}, -- blueprintable
    subgroup = "storage-remnants",
    order = "a-b-a",
    collision_mask = {"floor-layer", "object-layer"},
    collision_box = {{-0.45, -0.45}, {0.45, 0.45}},
    selection_box = {{-0.45, -0.45}, {0.45, 0.45}},
    max_health = 50,
    selectable_in_game = is_debug_mode,
    final_render_layer = "remnants",
    pictures = data_util.auto_sr_hr({
        filename = "__space-exploration-graphics__/graphics/entity/ruins/hr/stone-rubble.png",
        line_length = 1,
        width = 118,
        height = 912/8,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(0, 0),
        scale = 0.5,
        variation_count = 8
    }),
  },
})
