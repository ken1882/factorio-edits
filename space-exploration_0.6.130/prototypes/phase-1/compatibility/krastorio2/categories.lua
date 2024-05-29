-- Remove the K2 Science pack categories
data.raw["recipe-category"]["t2-tech-cards"] = nil
data.raw["recipe-category"]["t3-tech-cards"] = nil

data:extend({
  -- Recipe category for vita bloom recipe
    {
      type = "recipe-category",
      name = "vita-growth"
    },
  -- Create new item group for basic matter recipes
    {
      type = "recipe-category",
      name = "advanced-particle-stream"
    },
    {
      type = "item-subgroup",
      name = "advanced-particle-stream",
      group = "intermediate-products",
      order = "z-h-b"
    },
    {
      type = "recipe-category",
      name = "basic-matter-conversion"
    },
    {
      type = "item-subgroup",
      name = "basic-matter-conversion",
      group = "intermediate-products",
      order = "m0"
    },
    {
      type = "recipe-category",
      name = "advanced-matter-conversion"
    },
    {
      type = "item-subgroup",
      name = "advanced-matter-conversion",
      group = "intermediate-products",
      order = "m2"
    },
    {
      type = "recipe-category",
      name = "basic-matter-deconversion"
    },
    {
      type = "item-subgroup",
      name = "basic-matter-deconversion",
      group = "intermediate-products",
      order = "m0"
    },
    {
      type = "recipe-category",
      name = "advanced-matter-deconversion"
    },
    {
      type = "item-subgroup",
      name = "advanced-matter-deconversion",
      group = "intermediate-products",
      order = "m2"
    },
    {
      type = "recipe-category",
      name = "atmosphere-condensation-water"
    },
  -- Create Recipe categories for science catalogue and science pack creation (used in K2 research servers)
    {
      type = "recipe-category",
      name = "catalogue-creation-1"
    },
    {
      type = "recipe-category",
      name = "catalogue-creation-2"
    },
    {
      type = "recipe-category",
      name = "science-pack-creation-1"
    },
    {
      type = "recipe-category",
      name = "science-pack-creation-2"
    },
  -- Create Item subgroups for K2 resource recipe reordering to be inline with SE resource recipe ordering
    {
      type = "item-subgroup",
      name = "rare-metals",
      group = "resources",
      order = "a-h-c"
    },
    {
      type = "item-subgroup",
      name = "imersite",
      group = "resources",
      order = "a-k-b"
    },
    {
      type = "item-subgroup",
      name = "lithium",
      group = "resources",
      order = "a-h-d"
    },
  -- Create Item subgroups for the new Matter Science Packs
    {
      type = "item-subgroup",
      name = "data-catalogue-matter",
      group = "science",
      order = "q-d"
    },
    {
      type = "item-subgroup",
      name = "data-matter",
      group = "science",
      order = "q-e"
    },
    {
      type = "item-subgroup",
      name = "matter-science-pack",
      group = "science",
      order = "q-f"
    },
    {
      type = "item-subgroup",
      name = "data-catalogue-advanced",
      group = "science",
      order  = "q-g"
    },
    {
      type = "item-subgroup",
      name = "data-advanced",
      group = "science",
      order = "q-h"
    },
    {
      type = "item-subgroup",
      name = "advanced-science-pack",
      group = "science",
      order = "q-i"
    },
  -- Equipment catagories
    {
      type = "equipment-category",
      name = "armor-shield"
    },
    {
      type = "equipment-category",
      name = "armor-weapons"
    },
    {
      type = "equipment-category",
      name = "belt-immunity"
    },
    {
      type = "equipment-category",
      name = "movement-improving"
    },
    {
      type = "equipment-category",
      name = "combat-tier-1"
    },
    {
      type = "equipment-category",
      name = "combat-tier-2"
    },
    {
      type = "equipment-category",
      name = "combat-tier-3"
    },
    {
      type = "equipment-category",
      name = "combat-tier-4"
    },
    {
      type = "equipment-category",
      name = "shield-tier-1"
    },
    {
      type = "equipment-category",
      name = "shield-tier-2"
    },
    {
      type = "equipment-category",
      name = "shield-tier-3"
    },
    {
      type = "equipment-category",
      name = "shield-tier-4"
    },
    {
      type = "equipment-category",
      name = "shield-tier-5"
    },
    {
      type = "equipment-category",
      name = "shield-tier-6"
    },
    {
      type = "equipment-category",
      name = "life-support-tier-1"
    },
    {
      type = "equipment-category",
      name = "life-support-tier-2"
    },
    {
      type = "equipment-category",
      name = "life-support-tier-3"
    },
    {
      type = "equipment-category",
      name = "life-support-tier-4"
    },
    {
      type = "equipment-category",
      name = "reactor-equipment"
    },
    {
      type = "equipment-category",
      name = "reactor-tier-1"
    },
    {
      type = "equipment-category",
      name = "reactor-tier-2"
    },
    {
      type = "equipment-category",
      name = "reactor-tier-3"
    }
  })