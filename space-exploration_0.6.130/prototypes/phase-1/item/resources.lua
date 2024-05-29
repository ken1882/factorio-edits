local data_util = require("data_util")

data:extend({
  {
    type = "item",
    name = data_util.mod_prefix .. "water-ice",
    icon = "__space-exploration-graphics__/graphics/icons/water-ice.png",
    icon_size = 64,
    subgroup = "water",
    order = "i-a",
    stack_size = 200,
  },


  {
    type = "item",
    name = data_util.mod_prefix .. "methane-ice",
    icon = "__space-exploration-graphics__/graphics/icons/methane-ice.png",
    icon_size = 64,
    order = "c",
    stack_size = 200,
    subgroup = "chemical",
  },

  {
    type = "item",
    name = data_util.mod_prefix .. "iron-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/iron-ingot.png",
    icon_size = 64,
    order = "a-a-b",
    stack_size = 50,
    subgroup = "iron",
  },

  {
    type = "item",
    name = data_util.mod_prefix .. "steel-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/steel-ingot.png",
    icon_size = 64,
    order = "b-b",
    stack_size = 50,
    subgroup = "iron",
  },

  {
    type = "item",
    name = data_util.mod_prefix .. "copper-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/copper-ingot.png",
    icon_size = 64,
    order = "a-a-b",
    stack_size = 50,
    subgroup = "copper",
  },

  {
    type = "item",
    name = data_util.mod_prefix .. "cryonite",
    icon = "__space-exploration-graphics__/graphics/icons/cryonite.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/cryonite.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/cryonite-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/cryonite-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/cryonite-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 20,
    subgroup = "cryonite",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "cryonite-powder",
    icon = "__space-exploration-graphics__/graphics/icons/cryonite-powder.png",
    icon_size = 64,
    order = "b",
    stack_size = 50,
    subgroup = "cryonite",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "cryonite-crystal",
    icon = "__space-exploration-graphics__/graphics/icons/cryonite-crystal.png",
    icon_size = 64,
    order = "c",
    stack_size = 50,
    subgroup = "cryonite",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "cryonite-rod",
    icon = "__space-exploration-graphics__/graphics/icons/cryonite-rod.png",
    icon_size = 64,
    order = "d",
    stack_size = 200,
    subgroup = "cryonite",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "cryonite-ion-exchange-beads",
    icon = "__space-exploration-graphics__/graphics/icons/cryonite-ion-exchange-beads.png",
    icon_size = 64,
    order = "e",
    stack_size = 200,
    subgroup = "cryonite",
  },





  {
    type = "item",
    name = data_util.mod_prefix .. "beryllium-ore",
    icon = "__space-exploration-graphics__/graphics/icons/beryllium-ore.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/beryllium-ore.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/beryllium-ore-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/beryllium-ore-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/beryllium-ore-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 50,
    subgroup = "beryllium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "beryllium-sulfate",
    icon = "__space-exploration-graphics__/graphics/icons/beryllium-sulfate.png",
    icon_size = 64,
    order = "b",
    stack_size = 100,
    subgroup = "beryllium",
  },
  {
    type = "fluid",
    name = data_util.mod_prefix .. "beryllium-hydroxide",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    max_temperature = 100,
    base_color = {r=73, g=112, b=79},
    flow_color = {r=156, g=178, b=159},
    icon = "__space-exploration-graphics__/graphics/icons/fluid/beryllium-hydroxide.png",
    icon_size = 64,
    order = "a-c",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "beryllium-powder",
    icon = "__space-exploration-graphics__/graphics/icons/beryllium-powder.png",
    icon_size = 64,
    order = "c",
    stack_size = 100,
    subgroup = "beryllium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "beryllium-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/beryllium-ingot.png",
    icon_size = 64,
    order = "d",
    stack_size = 100,
    subgroup = "beryllium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "beryllium-plate",
    icon = "__space-exploration-graphics__/graphics/icons/beryllium-plate.png",
    icon_size = 64,
    order = "e",
    stack_size = 200,
    subgroup = "beryllium",
  },

  {
    type = "item",
    name = data_util.mod_prefix .. "holmium-ore",
    icon = "__space-exploration-graphics__/graphics/icons/holmium-ore.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/holmium-ore.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/holmium-ore-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/holmium-ore-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/holmium-ore-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 20,
    subgroup = "holmium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "holmium-ore-crushed",
    icon = "__space-exploration-graphics__/graphics/icons/holmium-ore-washed.png",
    icon_size = 64,
    order = "b",
    stack_size = 50,
    subgroup = "holmium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "holmium-chloride",
    icon = "__space-exploration-graphics__/graphics/icons/holmium-chloride.png",
    icon_size = 64,
    order = "c",
    stack_size = 50,
    subgroup = "holmium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "holmium-powder",
    icon = "__space-exploration-graphics__/graphics/icons/holmium-powder.png",
    icon_size = 64,
    order = "d",
    stack_size = 50,
    subgroup = "holmium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "holmium-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/holmium-ingot.png",
    icon_size = 64,
    order = "e",
    stack_size = 50,
    subgroup = "holmium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "holmium-plate",
    icon = "__space-exploration-graphics__/graphics/icons/holmium-plate.png",
    icon_size = 64,
    order = "f",
    stack_size = 100,
    subgroup = "holmium",
  },



  {
    type = "item",
    name = data_util.mod_prefix .. "iridium-ore",
    icon = "__space-exploration-graphics__/graphics/icons/iridium-ore.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/iridium-ore.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/iridium-ore-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/iridium-ore-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/iridium-ore-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 10,
    subgroup = "iridium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "iridium-ore-crushed",
    icon = "__space-exploration-graphics__/graphics/icons/iridium-ore-crushed.png",
    icon_size = 64,
    order = "b",
    stack_size = 40,
    subgroup = "iridium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "iridium-powder",
    icon = "__space-exploration-graphics__/graphics/icons/iridium-powder.png",
    icon_size = 64,
    order = "c",
    stack_size = 30,
    subgroup = "iridium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "iridium-blastcake",
    icon = "__space-exploration-graphics__/graphics/icons/iridium-blastcake.png",
    icon_size = 64,
    order = "d",
    stack_size = 20,
    subgroup = "iridium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "iridium-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/iridium-ingot.png",
    icon_size = 64,
    order = "e",
    stack_size = 20,
    subgroup = "iridium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "iridium-plate",
    icon = "__space-exploration-graphics__/graphics/icons/iridium-plate.png",
    icon_size = 64,
    order = "f",
    stack_size = 40,
    subgroup = "iridium",
  },



  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-ore",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-ore.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/naquium-ore.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/naquium-ore-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/naquium-ore-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/naquium-ore-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 10,
    subgroup = "naquium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-ore-crushed",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-ore-crushed.png",
    icon_size = 64,
    order = "b",
    stack_size = 20,
    subgroup = "naquium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-refined",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-refined.png",
    icon_size = 64,
    order = "c",
    stack_size = 20,
    subgroup = "naquium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-crystal",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-crystal.png",
    icon_size = 64,
    order = "d",
    stack_size = 20,
    subgroup = "naquium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-powder",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-powder.png",
    icon_size = 64,
    order = "e",
    stack_size = 20,
    subgroup = "naquium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-ingot",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-ingot.png",
    icon_size = 64,
    order = "f",
    stack_size = 10,
    subgroup = "naquium",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "naquium-plate",
    icon = "__space-exploration-graphics__/graphics/icons/naquium-plate.png",
    icon_size = 64,
    order = "g",
    stack_size = 20,
    subgroup = "naquium",
  },


  {
    type = "item",
    name = data_util.mod_prefix .. "vitamelange",
    icon = "__space-exploration-graphics__/graphics/icons/vitamelange.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/vitamelange.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/vitamelange-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/vitamelange-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/vitamelange-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 20,
    subgroup = "vitamelange",
    fuel_category = "chemical",
    fuel_value = "2MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vitamelange-nugget",
    icon = "__space-exploration-graphics__/graphics/icons/vitamelange-nugget.png",
    icon_size = 64,
    order = "b",
    stack_size = 50,
    subgroup = "vitamelange",
    fuel_category = "chemical",
    fuel_value = "1MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vitamelange-bloom",
    icon = "__space-exploration-graphics__/graphics/icons/vitamelange-bloom.png",
    icon_size = 64,
    order = "c",
    stack_size = 50,
    subgroup = "vitamelange",
    fuel_category = "chemical",
    fuel_value = "2.2MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vitamelange-spice",
    icon = "__space-exploration-graphics__/graphics/icons/vitamelange-spice.png",
    icon_size = 64,
    order = "d",
    stack_size = 50,
    subgroup = "vitamelange",
    fuel_category = "chemical",
    fuel_value = "4.5MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vitamelange-extract",
    icon = "__space-exploration-graphics__/graphics/icons/vitamelange-extract.png",
    icon_size = 64,
    order = "e",
    stack_size = 200,
    subgroup = "vitamelange",
    fuel_category = "chemical",
    fuel_value = "10MJ",
  },


  {
    type = "item",
    name = data_util.mod_prefix .. "vulcanite",
    icon = "__space-exploration-graphics__/graphics/icons/vulcanite.png",
    icon_size = 64,
    order = "a-a-b",
    pictures = {
      {
        filename = "__space-exploration-graphics__/graphics/icons/vulcanite.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/vulcanite-01.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/vulcanite-02.png",
        scale = 0.25,
        size = 64
      },
      {
        filename = "__space-exploration-graphics__/graphics/icons/vulcanite-03.png",
        scale = 0.25,
        size = 64
      }
    },
    stack_size = 20,
    subgroup = "vulcanite",
    fuel_category = "chemical",
    fuel_value = "2MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vulcanite-crushed",
    icon = "__space-exploration-graphics__/graphics/icons/vulcanite-washed.png",
    icon_size = 64,
    order = "b",
    stack_size = 50,
    subgroup = "vulcanite",
    fuel_category = "chemical",
    fuel_value = "4MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vulcanite-enriched",
    icon = "__space-exploration-graphics__/graphics/icons/vulcanite-enriched.png",
    icon_size = 64,
    order = "c",
    stack_size = 50,
    subgroup = "vulcanite",
    fuel_category = "chemical",
    fuel_value = "10MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vulcanite-block",
    icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png",
    icon_size = 64,
    order = "d",
    stack_size = 200,
    subgroup = "vulcanite",
    fuel_category = "chemical",
    fuel_value = "30MJ",
  },
  {
    type = "item",
    name = data_util.mod_prefix .. "vulcanite-ion-exchange-beads",
    icon = "__space-exploration-graphics__/graphics/icons/vulcanite-ion-exchange-beads.png",
    icon_size = 64,
    order = "e",
    stack_size = 200,
    subgroup = "vulcanite",
  },

})
