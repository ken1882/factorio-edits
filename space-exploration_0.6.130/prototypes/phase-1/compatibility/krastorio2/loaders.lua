local data_util = require("data_util")
local k2_graphics_path = mods["Krastorio2Assets"] and "__Krastorio2Assets__" or "__Krastorio2__/graphics"

if krastorio.general.getSafeSettingValue("kr-loaders") then
  local kr_se_graphic_path = k2_graphics_path .. "/compatibility/space-exploration"
  local kr_entities_path = k2_graphics_path .. "/entities"

  -- Space Loader Item
  local kr_se_loader_item = {
      type = "item",
      name = "kr-se-loader",
      icon = kr_se_graphic_path .. "/kr-se-loader.png",
      icon_size = 32,
      order = "d[loader]-a5[se-loader]",
      subgroup = "belt",
      place_result = "kr-se-loader",
      stack_size = 50,
  }

  -- Space Loader Entity
  local kr_se_loader_tint = { r = 240 / 255, g = 240 / 255, b = 240 / 255, a = 125 / 255 }
  local kr_se_loader = {
    type = "loader-1x1",
    name = "kr-se-loader",
    icon = kr_se_graphic_path .. "/kr-se-loader.png",
    icon_size = 32,
    flags = { "placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = { mining_time = 0.25, result = "kr-se-loader"},
    placeable_by = {item = "kr-se-loader", count = 1},
    max_health = 300,
    filter_count = 5,
    corpse = "small-remnants",
    resistances = {
      {type = "fire", percent = 90},
    },
    collision_box = { { -0.4, -0.45}, { 0.4, 0.45} },
    selection_box = { { -0.5, -0.5}, { 0.5, 0.5} },
    drawing_box = { { -0.4, -0.4}, { 0.4, 0.4} },
    animation_speed_coefficient = 32,
    container_distance = 0.75,
    belt_length = 0.20,
    structure_render_layer = "object",
    belt_animation_set = data.raw["transport-belt"]["se-space-transport-belt"].belt_animation_set,
    fast_replaceable_group = data.raw["transport-belt"]["se-space-transport-belt"].fast_replaceable_group,
    speed = data.raw["transport-belt"]["se-space-transport-belt"].speed,
    se_allow_in_space = true,
    structure = {
      direction_in = {
        sheets = {
          {
            filename = kr_entities_path .. "/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              y = 85,
              scale = 0.5,
            },
          },
          {
            filename = kr_entities_path .. "/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            tint = kr_se_loader_tint,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader-mask.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              y = 85,
              scale = 0.5,
              tint = kr_se_loader_tint,
            },
          },
        },
      },
      direction_out = {
        sheets = {
          {
            filename = kr_entities_path .. "/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              scale = 0.5,
            },
          },
          {
            filename = kr_entities_path .. "/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            tint = kr_se_loader_tint,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader-mask.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              scale = 0.5,
              tint = kr_se_loader_tint,
            },
          },
        },
      },
    },
    order = "z-l[loader]-z[loader]",
  }

  -- Space Loader Recipe
  local kr_se_loader_recipe = {
    type = "recipe",
    name = "kr-se-loader",
    category = data.raw.recipe["se-space-splitter"].category,
    energy_required = data.raw.recipe["se-space-splitter"].energy_required,
    ingredients = {
      {"low-density-structure", 50},
      {"electric-engine-unit", 50},
      {"processing-unit",50},
      {type="fluid", name="lubricant", amount=500},
      {"se-space-transport-belt",1},
    },
    result = "kr-se-loader",
    subgroup = "belt",
  }

  -- Deep Space Loader Item
  local kr_se_deep_loader_item = {
    type = "item",
    name = "kr-se-deep-space-loader-black",
    icon = kr_se_graphic_path .. "/kr-se-deep-space-loader-black.png",
    icon_size = 64,
    order = "e-g",
    subgroup = "belt",
    place_result = "kr-se-deep-space-loader-black",
    stack_size = 50,
  }

  -- Space Loader Entity
  local kr_se_deep_loader_tint = { r = 25 / 255, g = 25 / 255, b = 25 / 255, a = 200 / 255 }
  local kr_se_deep_loader = {
    type = "loader-1x1",
    name = "kr-se-deep-space-loader-black",
    localised_name = {"entity-name.kr-se-deep-space-loader"},
    icon = kr_se_graphic_path .. "/kr-se-deep-space-loader-black.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = { mining_time = 0.25, result = "kr-se-deep-space-loader-black"},
    placeable_by = {item = "kr-se-deep-space-loader-black", count = 1},
    max_health = 300,
    filter_count = 5,
    corpse = "small-remnants",
    resistances = {
      {type = "fire", percent = 90},
    },
    collision_box = { { -0.4, -0.45}, { 0.4, 0.45} },
    selection_box = { { -0.5, -0.5}, { 0.5, 0.5} },
    drawing_box = { { -0.4, -0.4}, { 0.4, 0.4} },
    animation_speed_coefficient = 32,
    container_distance = 0.75,
    belt_length = 0.20,
    structure_render_layer = "object",
    belt_animation_set = data.raw["transport-belt"]["se-deep-space-transport-belt-black"].belt_animation_set,
    fast_replaceable_group = data.raw["transport-belt"]["se-deep-space-transport-belt-black"].fast_replaceable_group,
    speed = data.raw["transport-belt"]["se-deep-space-transport-belt-black"].speed,
    se_allow_in_space = true,
    structure = {
      direction_in = {
        sheets = {
          {
            filename = kr_entities_path .. "/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              y = 85,
              scale = 0.5,
            },
          },
          {
            filename = kr_entities_path .. "/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            tint = kr_se_deep_loader_tint,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader-mask.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              y = 85,
              scale = 0.5,
              tint = kr_se_deep_loader_tint,
            },
          },
        },
      },
      direction_out = {
        sheets = {
          {
            filename = kr_entities_path .. "/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              scale = 0.5,
            },
          },
          {
            filename = kr_entities_path .. "/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            tint = kr_se_deep_loader_tint,
            hr_version = {
              filename = kr_entities_path .. "/loader/hr-kr-loader-mask.png",
              priority = "extra-high",
              shift = { 0.15625, 0.0703125 },
              width = 106,
              height = 85,
              scale = 0.5,
              tint = kr_se_deep_loader_tint,
            },
          },
        },
      },
    },
    order = "z-l[loader]-z[loader]",
  }

  -- Deep Space Loader Recipe
  local kr_se_deep_loader_recipe = {
    type = "recipe",
    name = "kr-se-deep-space-loader-black",
    category = data.raw.recipe["se-deep-space-splitter"].category,
    energy_required = data.raw.recipe["se-deep-space-splitter"].energy_required,
    ingredients = {
      { "se-naquium-cube", 10 },
      { "imersium-gear-wheel", 10 },
      { "kr-se-loader", 1 },
      { type = "fluid", name = "lubricant", amount = 1000 },
      { "se-deep-space-transport-belt-black", 1 },
      { "se-nanomaterial", 50 },
      { "se-heavy-assembly", 50 },
      { "se-quantum-processor", 10}
    },
    result = "kr-se-deep-space-loader-black",
    subgroup = "belt",
  }

  data:extend({kr_se_loader_item, kr_se_loader, kr_se_loader_recipe, kr_se_deep_loader_item, kr_se_deep_loader, kr_se_deep_loader_recipe})

  data_util.tech_lock_recipes("se-space-belt", {"kr-se-loader"})
  data_util.tech_lock_recipes("se-deep-space-transport-belt", {"kr-se-deep-space-loader-black"})
end