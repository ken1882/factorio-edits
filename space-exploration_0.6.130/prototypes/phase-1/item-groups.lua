data.raw["item-group"]["intermediate-products"].icon = "__space-exploration-graphics__/graphics/item-group/manufacturing.png"
data.raw["item-group"]["intermediate-products"].order = "c-b"
data.raw["item-group"]["combat"].icon = "__space-exploration-graphics__/graphics/item-group/equipment.png"
data:extend({

  --[[{
    type = "item-group",
    name = "space",
    order = "b-b-s",
    icon = "__space-exploration-graphics__/graphics/item-group/spaceship.png",
    icon_size = 64,
  },]]--
  {
    type = "item-group",
    name = "resources",
    order = "c-a",
    icon = "__space-exploration-graphics__/graphics/item-group/resources.png",
    icon_size = 128,
  },
  {
    type = "item-group",
    name = "science",
    order = "c-d",
    icon = "__space-exploration-graphics__/graphics/item-group/science.png",
    icon_size = 128,
  },


  {
    type = "item-subgroup",
    name = "storage",
    group = "logistics",
    order = "a[storage]"
  },
  {
    type = "item-subgroup",
    name = "transport-belt",
    group = "logistics",
    order = "b[belt]-a"
  },
  {
    type = "item-subgroup",
    name = "underground-belt",
    group = "logistics",
    order = "b[belt]-b"
  },
  {
    type = "item-subgroup",
    name = "splitter",
    group = "logistics",
    order = "b[belt]-c"
  },
  {
    type = "item-subgroup",
    name = "loader",
    group = "logistics",
    order = "b[belt]-d"
  },
  {
    type = "item-subgroup",
    name = "pipe",
    group = "logistics",
    order = "c"
  },
  {
    group = "logistics",
    name = "rail",
    order = "e[transport]-b[rail]",
    type = "item-subgroup"
  },

  {
    type = "item-subgroup",
    name = "spaceship-structure",
    group = "logistics",
    order = "k"
  },

  {
    type = "item-subgroup",
    name = "rocket-logistics",
    group = "logistics",
    order = "j"
  },
  {
    type = "item-subgroup",
    name = "delivery-cannon-capsules",
    group = "logistics",
    order = "k"
  },


  {
    type = "item-subgroup",
    name = "ancient",
    group = "logistics",
    order = "z-z-a"
  },



  {
    type = "item-subgroup",
    name = "solar",
    group = "production",
    order = "b-a"
  },
  {
    type = "item-subgroup",
    name = "mechanical",
    group = "production",
    order = "e-a"
  },
  {
    type = "item-subgroup",
    name = "assembling",
    group = "production",
    order = "e-b"
  },
  {
    type = "item-subgroup",
    name = "chemistry",
    group = "production",
    order = "e-c"
  },
  {
    type = "item-subgroup",
    name = "radiation",
    group = "production",
    order = "e-d"
  },
  {
    type = "item-subgroup",
    name = "plasma",
    group = "production",
    order = "e-e"
  },
  {
    type = "item-subgroup",
    name = "cooling",
    group = "production",
    order = "e-f"
  },
  {
    type = "item-subgroup",
    name = "computation",
    group = "production",
    order = "e-g"
  },
  {
    type = "item-subgroup",
    name = "telescope",
    group = "production",
    order = "e-h"
  },
  {
    type = "item-subgroup",
    name = "beaming",
    group = "production",
    order = "h-i"
  },
  {
    type = "item-subgroup",
    name = "space-structures",
    group = "production",
    order = "h-j"
  },
  {
    type = "item-subgroup",
    name = "lab",
    group = "production",
    order = "h-k"
  },
  {
    type = "item-subgroup",
    name = "module-speed",
    group = "production",
    order = "z-m-b"
  },
  {
    type = "item-subgroup",
    name = "module-productivity",
    group = "production",
    order = "z-m-c"
  },
  {
    type = "item-subgroup",
    name = "module-effectivity",
    group = "production",
    order = "z-m-d"
  },



  {
    type = "item-subgroup",
    name = "water",
    group = "resources",
    order = "a-b"
  },
  {
    type = "item-subgroup",
    name = "chemical",
    group = "resources",
    order = "a-c"
  },
  {
    type = "item-subgroup",
    name = "oil",
    group = "resources",
    order = "a-d"
  },
  {
    type = "item-subgroup",
    name = "fuel",
    group = "resources",
    order = "a-e"
  },
  {
    type = "item-subgroup",
    name = "gel",
    group = "resources",
    order = "a-f-a"
  },
  {
    type = "item-subgroup",
    name = "sludge",
    group = "resources",
    order = "a-f-b"
  },
  {
    type = "item-subgroup",
    name = "stone",
    group = "resources",
    order = "a-g"
  },
  {
    type = "item-subgroup",
    name = "iron",
    group = "resources",
    order = "a-h-a"
  },
  {
    type = "item-subgroup",
    name = "copper",
    group = "resources",
    order = "a-h-b"
  },
  {
    type = "item-subgroup",
    name = "uranium",
    group = "resources",
    order = "a-i"
  },
  {
    type = "item-subgroup",
    name = "vulcanite",
    group = "resources",
    order = "a-j"
  },
  {
    type = "item-subgroup",
    name = "cryonite",
    group = "resources",
    order = "a-k"
  },
  {
    type = "item-subgroup",
    name = "beryllium",
    group = "resources",
    order = "a-l"
  },
  {
    type = "item-subgroup",
    name = "holmium",
    group = "resources",
    order = "a-m"
  },
  {
    type = "item-subgroup",
    name = "iridium",
    group = "resources",
    order = "a-n"
  },
  {
    type = "item-subgroup",
    name = "vitamelange",
    group = "resources",
    order = "a-o"
  },
  {
    type = "item-subgroup",
    name = "naquium",
    group = "resources",
    order = "a-p"
  },
  {
    type = "item-subgroup",
    name = "core-fragments",
    group = "resources",
    order = "a-r"
  },
  {
    type = "item-subgroup",
    name = "stream",
    group = "resources",
    order = "a-t"
  },
  {
    type = "item-subgroup",
    name = "materialisation",
    group = "resources",
    order = "a-u"
  },





  {
    type = "item-subgroup",
    name = "spaceship-process",
    group = "intermediate-products",
    order = "a-a"
  },
  {
    type = "item-subgroup",
    name = "basic-assembling",
    group = "intermediate-products",
    order = "a-b"
  },
  {
    type = "item-subgroup",
    name = "electronic",
    group = "intermediate-products",
    order = "a-c"
  },
  {
    type = "item-subgroup",
    name = "processor",
    group = "intermediate-products",
    order = "a-d"
  },
  {
    type = "item-subgroup",
    name = "advanced-assembling",
    group = "intermediate-products",
    order = "a-e"
  },
  {
    type = "item-subgroup",
    name = "specialist-assembling",
    group = "intermediate-products",
    order = "a-f"
  },
  {
    type = "item-subgroup",
    name = "rocket-part",
    group = "intermediate-products",
    order = "a-g"
  },
  {
    type = "item-subgroup",
    name = "intersurface-part",
    group = "intermediate-products",
    order = "a-h"
  },
  {
    type = "item-subgroup",
    name = "canister",
    group = "intermediate-products",
    order = "a-i"
  },
  {
    type = "item-subgroup",
    name = "canister-fill",
    group = "intermediate-products",
    order = "a-j"
  },
  {
    type = "item-subgroup",
    name = "observation-frame",
    group = "intermediate-products",
    order = "a-k"
  },
  {
    type = "item-subgroup",
    name = "thermofluid",
    group = "intermediate-products",
    order = "a-l"
  },
  {
    type = "item-subgroup",
    name = "specimen",
    group = "intermediate-products",
    order = "a-m"
  },
  {
    type = "item-subgroup",
    name = "arcosphere",
    group = "intermediate-products",
    order = "a-n"
  },
  {
    type = "item-subgroup",
    name = "arcosphere-folding",
    group = "intermediate-products",
    order = "a-o"
  },
  {
    type = "item-subgroup",
    name = "recycling",
    group = "intermediate-products",
    order = "a-v"
  },





  {
    type = "item-subgroup",
    name = "data-generic",
    group = "science",
    order = "m-a"
  },
  {
    type = "item-subgroup",
    name = "data-significant",
    group = "science",
    order = "m-m"
  },

  {
    type = "item-subgroup",
    name = "data-catalogue-astronomic",
    group = "science",
    order = "n-a"
  },
  {
    type = "item-subgroup",
    name = "data-astronomic",
    group = "science",
    order = "n-b"
  },
  {
    type = "item-subgroup",
    name = "astronomic-science-pack",
    group = "science",
    order = "n-c"
  },
  {
    type = "item-subgroup",
    name = "data-catalogue-biological",
    group = "science",
    order = "o-a"
  },
  {
    type = "item-subgroup",
    name = "data-biological",
    group = "science",
    order = "o-b"
  },
  {
    type = "item-subgroup",
    name = "biological-science-pack",
    group = "science",
    order = "o-c"
  },
  {
    type = "item-subgroup",
    name = "data-catalogue-energy",
    group = "science",
    order = "p-a"
  },
  {
    type = "item-subgroup",
    name = "data-energy",
    group = "science",
    order = "p-b"
  },
  {
    type = "item-subgroup",
    name = "energy-science-pack",
    group = "science",
    order = "p-c"
  },
  {
    type = "item-subgroup",
    name = "data-catalogue-material",
    group = "science",
    order = "q-a"
  },
  {
    type = "item-subgroup",
    name = "data-material",
    group = "science",
    order = "q-b"
  },
  {
    type = "item-subgroup",
    name = "material-science-pack",
    group = "science",
    order = "q-c"
  },

  {
    type = "item-subgroup",
    name = "data-catalogue-deep",
    group = "science",
    order = "r-a"
  },
  {
    type = "item-subgroup",
    name = "data-deep",
    group = "science",
    order = "r-b"
  },
  {
    type = "item-subgroup",
    name = "deep-science-pack",
    group = "science",
    order = "r-c"
  },


  {
    type = "item-subgroup",
    name = "surface-defense",
    group = "combat",
    order = "z-a"
  },

  {
    type = "item-subgroup",
    name = "virtual-signal-utility",
    group = "signals",
    order = "u-a"
  },

  {
    type = "item-subgroup",
    name = "ruins",
    group = "environment",
    order = "z-r"
  },

  {
    type = "item-subgroup",
    name = "space-fluids",
    group = "fluids",
    order = "z-f-a"
  },
})
