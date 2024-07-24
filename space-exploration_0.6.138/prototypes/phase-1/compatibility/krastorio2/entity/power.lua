-- This source is dedicated to balancing Power production and distribution in SE and K2
local data_util = require("data_util")

-- fix power progression
-- higher tech means more power density
-- more complicated setups mean higher energy efficiency (closer to 1).
-- simpler setups mean reduced energy efficiency.

-- fuild isothermic generator is 0.75 normally
-- both convert fuel to energy directly so shouldn't be over 80% efficiency.
-- fuild isothermic generator is less space efficient.

-- Make changes to the Gas Power Station
data.raw["generator"]["kr-gas-power-station"].energy_source.effectivity = 0.75
data.raw.generator["kr-gas-power-station"].collision_mask = data.raw.generator["kr-gas-power-station"].collision_mask or collision_mask_util_extended.get_mask(data.raw.generator["kr-gas-power-station"])
collision_mask_util_extended.add_layer(data.raw.generator["kr-gas-power-station"].collision_mask, space_collision_layer)
data_util.collision_description(data.raw.generator["kr-gas-power-station"])

-- Windmill not in space
data.raw["electric-energy-interface"]["kr-wind-turbine"].collision_mask = data.raw["electric-energy-interface"]["kr-wind-turbine"].collision_mask or collision_mask_util_extended.get_mask(data.raw["electric-energy-interface"]["kr-wind-turbine"])
collision_mask_util_extended.add_layer(data.raw["electric-energy-interface"]["kr-wind-turbine"].collision_mask, space_collision_layer)
data_util.collision_description(data.raw["electric-energy-interface"]["kr-wind-turbine"])

-- Isothermic geneerator?
data.raw["generator"]["se-fluid-burner-generator"].collsion_mask = --space
  {"water-tile","ground-tile","item-layer","object-layer","player-layer"}

-- Rebalancing the K2 Fusion Reactor
data.raw["generator"]["kr-advanced-steam-turbine"].maximum_temperature = 1625
data.raw["generator"]["kr-advanced-steam-turbine"].max_power_output = "100MW"
data.raw["generator"]["kr-advanced-steam-turbine"].effectivity = 1
-- 1045/300 to get the correct consumption of 209/s of steam to make 100MW at 975C in the Factorio Engine.
data.raw["generator"]["kr-advanced-steam-turbine"].fluid_usage_per_tick = 209/60

-- Improve Energy Storage entity to account for now being the final accumulator
if data.raw.accumulator["kr-energy-storage"] then
	local accu = data.raw.accumulator["kr-energy-storage"]
	-- Pretty sure this might be OP, but hey, we're at DSS3 here.
	accu.energy_source = {
		type = "electric",
		buffer_capacity = "5000MJ",
		usage_priority = "tertiary",
		input_flow_limit = "10MW",
		output_flow_limit = "50MW"
	}
end

-- Adjust prototypes so that Flat Solar Panel upgrades from K2 Solar Panel
local se_space_solar_panel = data.raw["solar-panel"]["se-space-solar-panel"]
data.raw["solar-panel"]["kr-advanced-solar-panel"].fast_replaceable_group = se_space_solar_panel.fast_replaceable_group
data.raw["solar-panel"]["kr-advanced-solar-panel"].collision_box = se_space_solar_panel.collision_box
data.raw["solar-panel"]["kr-advanced-solar-panel"].collision_mask = se_space_solar_panel.collision_mask
data.raw["solar-panel"]["kr-advanced-solar-panel"].next_upgrade = "se-space-solar-panel"

-- Ensure balanced efficiency for lack of logistical challenge for this energy producer
data.raw["burner-generator"]["kr-antimatter-reactor"].burner.effectivity = 0.8
data.raw["burner-generator"]["kr-antimatter-reactor"].max_power_output = "2GW"

---- Advanced Condenser Turbine based on the Advanced Turbine
--[[
  As with the SE condenser turbine, this will be made of three entities:
  - Furnace: which is the placed entity, takes steam outputs water out the front, outputs decompressing-steam to storage-tank
  - sorage-tank: passes decompressing steam and is a buffer
  - generator takes decompressing steam to produce power

  the furnace has a 1 frame idle animation
  the generator has the actual animation (so that it scales speed to power output)
]]--

local condenser_tint = {57/255, 163/255, 219/255, 0.8}

local mask_path = "__Krastorio2Assets__/entities/advanced-steam-turbine/"

local selectable = false
local mask_layer_h = {
  filename = mask_path .. "advanced-steam-turbine-mask-H.png",
  width = 235,
  height = 134,
  frame_count = 1,
  line_length = 1,
  shift = { 0, -0.2 },
  tint = condenser_tint,
  hr_version = {
    filename = mask_path .. "hr-advanced-steam-turbine-mask-H.png",
    width = 469,
    height = 270,
    frame_count = 1,
    line_length = 1,
    shift = { 0, -0.2 },
    tint = condenser_tint,
    scale = 0.5
  }
}
local anim_mask_layer_h = {
  filename = mask_path .."advanced-steam-turbine-mask-H.png",
  width = 235,
  height = 134,
  frame_count = 6,
  line_length = 2,
  shift = { 0, -0.2 },
  tint = condenser_tint,
  hr_version = {
    filename = mask_path .. "hr-advanced-steam-turbine-mask-H.png",
    width = 469,
    height = 270,
    frame_count = 6,
    line_length = 2,
    shift = { 0, -0.2 },
    tint = condenser_tint,
    scale = 0.5
  }
}
local mask_layer_v = {
  filename = mask_path .. "advanced-steam-turbine-mask-V.png",
  width = 165,
  height = 250,
  frame_count = 1,
  line_length = 1,
  shift = { 0.26, 0 },
  tint = condenser_tint,
  hr_version = {
    filename = mask_path .. "hr-advanced-steam-turbine-mask-V.png",
    width = 330,
    height = 500,
    frame_count = 1,
    line_length = 1,
    shift = { 0.26, 0 },
    tint = condenser_tint,
    scale = 0.5,
  },
}
local anim_mask_layer_v = {
  filename = mask_path .. "advanced-steam-turbine-mask-V.png",
  width = 165,
  height = 250,
  frame_count = 6,
  line_length = 6,
  shift = { 0.26, 0 },
  tint = condenser_tint,
  hr_version = {
    filename = mask_path .. "hr-advanced-steam-turbine-mask-V.png",
    width = 330,
    height = 500,
    frame_count = 6,
    line_length = 6,
    shift = { 0.26, 0 },
    tint = condenser_tint,
    scale = 0.5,
  },
}
local idle_horizontal = {
  layers = {
    {
      filename = mask_path .. "advanced-steam-turbine-H.png",
      width = 235,
      height = 134,
      frame_count = 1,
      shift = { 0, -0.2 },
      line_length = 1,
      hr_version = {
        filename = mask_path .. "hr-advanced-steam-turbine-H.png",
        width = 469,
        height = 270,
        frame_count = 1,
        shift = { 0, -0.2 },
        line_length = 1,
        scale = 0.5,
      },
    },
    mask_layer_h,
    {
      filename = mask_path .. "advanced-steam-turbine-sh-H.png",
      width = 258,
      height = 113,
      frame_count = 1,
      shift = { 0.575, 0.25 },
      line_length = 1,
      repeat_count = 1,
      draw_as_shadow = true,
      hr_version = {
        filename = mask_path .. "hr-advanced-steam-turbine-sh-H.png",
        width = 514,
        height = 225,
        frame_count = 1,
        shift = { 0.575, 0.25 },
        line_length = 1,
        repeat_count = 1,
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
}
local idle_vertical = {
  layers = {
    {
      filename = mask_path .. "advanced-steam-turbine-V.png",
      width = 165,
      height = 250,
      frame_count = 1,
      line_length = 1,
      shift = { 0.26, 0 },
      hr_version = {
        filename = mask_path .. "hr-advanced-steam-turbine-V.png",
        width = 330,
        height = 500,
        frame_count = 1,
        line_length = 1,
        shift = { 0.26, 0 },
        scale = 0.5,
      },
    },
    mask_layer_v,
    {
      filename = mask_path .. "advanced-steam-turbine-sh-V.png",
      width = 175,
      height = 213,
      frame_count = 1,
      line_length = 1,
      repeat_count = 1,
      shift = { 0.48, 0.36 },
      draw_as_shadow = true,
      hr_version = {
        filename = mask_path .. "hr-advanced-steam-turbine-sh-V.png",
        width = 350,
        height = 425,
        frame_count = 1,
        line_length = 1,
        repeat_count = 1,
        shift = { 0.48, 0.36 },
        scale = 0.5,
        draw_as_shadow = true,
      },
    },
  },
}
local h_animation = data.raw.generator["kr-advanced-steam-turbine"].horizontal_animation
local v_animation = data.raw.generator["kr-advanced-steam-turbine"].vertical_animation
local blank_image = {
  filename = "__space-exploration-graphics__/graphics/blank.png",
  width = 1,
  height = 1,
  frame_count = 1,
  line_length = 1,
  shift = {0, 0},
}

data:extend({
  {
    type = "storage-tank",
    name = "se-kr-advanced-condenser-turbine-tank",
    icon = data.raw.item["kr-advanced-steam-turbine"].icon,
    icon_size = data.raw.item["kr-advanced-steam-turbine"].icon_size,
    flags = {"placeable-player", "player-creation", "not-deconstructable", "not-blueprintable", "hide-alt-info"},
    max_health = 500,
    order = "zz",
    collision_box = {{-1.5, -0.25},{1.5, 0.25}},
    selection_box = {{-1.5, -0.25},{1.5, 0.25}},
    se_allow_in_space = true,
    collision_make = {"not-colliding-with-itself"},
    selectable_in_game = selectable,
    fluid_box = {
      filter = "se-decompressing-steam",
      base_area = 0.25,
      base_level = 0,
      hide_connection_info = true,
      pipe_connections = {
        {position = {0, -1}}, -- generator
        {position = {1, -1}}, -- furnace
        {position = {-1, -1}}, -- furnace
      }
    },
    window_bounding_box = {{-0.0, 0.0}, {0.0, 1.0}},
    pictures = {
      picture = blank_image,
      window_background = blank_image,
      fluid_background = blank_image,
      flow_sprite = blank_image,
      gas_flow = blank_image,
    },
    flow_length_in_ticks = 360,
    circuit_wire_max_distance = 0,
  },
  {
    type = "generator",
    name = "se-kr-advanced-condenser-turbine-generator",
    icon = data.raw.item["kr-advanced-steam-turbine"].icon,
    icon_size = data.raw.item["kr-advanced-steam-turbine"].icon_size,
    alert_icon_shift = data.raw.item["kr-advanced-steam-turbine"].alert_icon_shift,
    burns_fluid = false,
    scale_fluid_usage = true,
    selectable_in_game = selectable,
    collision_box = {{-2.2, -2.69}, {2.2, 2.69}},
    selection_box = {{-2.2, -2.69}, {2.2, 2.69}},
    collision_mask = {"not-colliding-with-itself"},
    se_allow_in_space = true,
    order = "zzz",
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    energy_source = {type = "electric", usage_priority = "secondary-output"},
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "hide-alt-info"},
    fluid_box = {
      base_area = 0.25,
      base_level = -1,
      filter = "se-decompressing-steam",
      height = 2,
      minimum_temperature = 950,
      hide_connection_info = true,
      pipe_connections = {
        {
          position = {0, 3},
          type = "input-output",
        },
        {
          position = {0, -3},
          type = "input-output",
        },
      },
      production_type = "input-output",
    },
    horizontal_animation = {
      layers = {
        h_animation.layers[1],
        anim_mask_layer_h,
        h_animation.layers[2],
      }
    },
    vertical_animation = {
      layers = {
        v_animation.layers[1],
        anim_mask_layer_v,
        v_animation.layers[2],
      }
    },
    smoke = data.raw.generator["kr-advanced-steam-turbine"].smoke,
    working_sound = data.raw.generator["kr-advanced-steam-turbine"].working_sound,
    max_health = data.raw.generator["kr-advanced-steam-turbine"].max_health,
    maximum_temperature = data.raw.generator["kr-advanced-steam-turbine"].maximum_temperature,
    min_perceived_performance = data.raw.generator["kr-advanced-steam-turbine"].min_perceived_performance,
    performance_to_sound_speedup = data.raw.generator["kr-advanced-steam-turbine"].performance_to_sound_speedup,
    resistances = data.raw.generator["kr-advanced-steam-turbine"].resistances,
    max_power_output = data.raw.generator["kr-advanced-steam-turbine"].max_power_output,
    fluid_usage_per_tick = data.raw.generator["kr-advanced-steam-turbine"].fluid_usage_per_tick
  },
  {
    type = "furnace",
    name = "se-kr-advanced-condenser-turbine",
    icon = data.raw.generator["kr-advanced-steam-turbine"].icon,
    icon_size = data.raw.generator["kr-advanced-steam-turbine"].icon_size,
    collision_box = {{-2.25, -3.24}, {2.25, 3.24}},
    selection_box = {{-2.25, -3.24}, {2.25, 3.24}},
    se_allow_in_space = true,
    fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 1.5,
        base_level = -1,
        filter = "steam",
        minimum_temperature = 950.0,
        pipe_connections = {
          {type = "input", position = {0, -4}},
        },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 1.5,
        base_level = 1,
        filter = "water",
        pipe_connections = {
          {type = "output", position = {0, 4}},
        },
        secondary_draw_orders = { north = -1}
      },
      {
        filter = "se-decompressing-steam",
        production_type = "output",
        base_area = 1.5,
        base_level = 1,
        hide_connection_info = true,
        pipe_connections = {
          {type = "output", position = {1, 3.25}},
          {type = "output", position = {-1, 3.25}},
        },
        secondary_draw_orders = { north = -1}
      },
    },
    minable = {
      mining_time = 0.3,
      result = "se-kr-advanced-condenser-turbine",
    },
    flags = {"placeable-neutral","placeable-player","player-creation"},
    show_recipe_icon = false,
    show_recipe_icon_on_map = false,
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = data.raw.generator["kr-advanced-steam-turbine"].alert_icon_shift,
    --drawing_box = {{-1.5, 3}, {1.5, 4}},
    resistances = data.raw.generator["kr-advanced-steam-turbine"].resistances,
    open_sound = data_util.machine_open_sound,
    close_sound = data_util.machine_close_sound,
    vehicle_impact_sound = data.raw.generator["kr-advanced-steam-turbine"].vehicle_impact_sound,
    always_draw_idle_animation = true,
    source_inventory_size = 0,
    result_inventory_size = 0,
    animation = nil,
    idle_animation = {
      east = idle_horizontal,
      west = idle_horizontal,
      north = idle_vertical,
      south = idle_vertical,
    },
    crafting_categories = {"advanced-condenser-turbine"},
    crafting_speed = 1,
    energy_source = {
      type = "void",
    },
    energy_usage = "0.1W",
    module_specification = {
      module_slots = 0
    },
    allowed_effects = {},
    working_visualisations = nil,
    bottleneck_ignore = true
  }
})