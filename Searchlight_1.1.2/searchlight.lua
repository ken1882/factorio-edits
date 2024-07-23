--searchlight.lua
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

--animations
function search_light_extension(inputs)
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-raising.png",
    priority = "medium",
    width = 250,
    height = 200,
    frame_count = inputs.frame_count or 8,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 8,
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-raising.png",
      priority = "medium",
      width = 250,
      height = 200,
      frame_count = inputs.frame_count or 8,
      line_length = inputs.line_length or 0,
      run_mode = inputs.run_mode or "forward",
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(0, -16),
      scale = 0.5
    }
  }
end

function search_light_extension_shadow(inputs)
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-raising-shadow.png",
    width = 250,
    height = 200,
    frame_count = inputs.frame_count or 8,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    axially_symmetrical = false,
    direction_count = 8,
    draw_as_shadow = true,
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-raising-shadow.png",
      width = 250,
      height = 200,
      frame_count = inputs.frame_count or 8,
      line_length = inputs.line_length or 0,
      run_mode = inputs.run_mode or "forward",
      axially_symmetrical = false,
      direction_count = 8,
      draw_as_shadow = true,
      shift = util.by_pixel(0, -16),
      scale = 0.5
    }
  }
end

function search_light_extension_mask(inputs)
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-raising-mask.png",
    flags = { "mask" },
    width = 250,
    height = 200,
    frame_count = inputs.frame_count or 8,
    line_length = inputs.line_length or 0,
    run_mode = inputs.run_mode or "forward",
    axially_symmetrical = false,
    apply_runtime_tint = true,
    direction_count = 8,
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-raising-mask.png",
      flags = { "mask" },
      width = 250,
      height = 200,
      frame_count = inputs.frame_count or 8,
      line_length = inputs.line_length or 0,
      run_mode = inputs.run_mode or "forward",
      axially_symmetrical = false,
      apply_runtime_tint = true,
      direction_count = 8,
      shift = util.by_pixel(0, -16),
      scale = 0.5
    }
  }
end

function search_light_shooting()
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-shooting.png",
    line_length = 8,
    width = 250,
    height = 200,
    frame_count = 1,
    direction_count = 64,
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-shooting.png",
      line_length = 8,
      width = 250,
      height = 200,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(0, -16),
      scale = 0.5
    }
  }
end

function search_light_shooting_glow()
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-shooting-light.png",
    line_length = 8,
    width = 250,
    height = 200,
    frame_count = 1,
    direction_count = 64,
    blend_mode = "additive",
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-shooting-light.png",
      line_length = 8,
      width = 250,
      height = 200,
      frame_count = 1,
      direction_count = 64,
      shift = util.by_pixel(0, -16),
      blend_mode = "additive",
      scale = 0.5
    }
  }
end

function search_light_shooting_mask()
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-shooting-mask.png",
    flags = { "mask" },
    line_length = 8,
    width = 250,
    height = 200,
    frame_count = 1,
    apply_runtime_tint = true,
    direction_count = 64,
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-shooting-mask.png",
      flags = { "mask" },
      line_length = 8,
      width = 250,
      height = 200,
      frame_count = 1,
      apply_runtime_tint = true,
      direction_count = 64,
      shift = util.by_pixel(0, -16),
      scale = 0.5
    }
  }
end

function search_light_shooting_shadow()
  return
  {
    filename = "__Searchlight__/graphics/hnt-search-shooting-shadow.png",
    line_length = 8,
    width = 250,
    height = 200,
    frame_count = 1,
    direction_count = 64,
    draw_as_shadow = true,
    shift = util.by_pixel(0, -16),
    scale = 0.5,
    hr_version =
    {
      filename = "__Searchlight__/graphics/hnt-search-shooting-shadow.png",
      line_length = 8,
      width = 250,
      height = 200,
      frame_count = 1,
      direction_count = 64,
      draw_as_shadow = true,
      shift = util.by_pixel(0, -16),
      scale = 0.5
    }
  }
end

--sound
local lampsound = {}
lampsound.mutebeam = {
	{
		filename = "__Searchlight__/sound/hnt-lamp-working.ogg", 
		volume = 0
	}
}




--PROTOTYPE bulb, fake-fire, lit-sticker
data:extend({{type = "ammo-category", name = "hnt-bulb"},
	{
		type = "fire",
		name = "hnt-fake-fire",
		damage_per_tick = {type = "fire", amount = 0},
		spread_delay = 0,
		spread_delay_deviation = 0,
		maximum_spread_count = 0,
		initial_lifetime = 60,
		maximum_lifetime = 60,
		burn_patch_lifetime = 10,
		burn_patch_alpha_default = 0,
		maximum_damage_multiplier = 0,
		--light = {intensity = 0.9, size = 80, color = {r=1.0, g=1.0, b=1.0}}
	},
	{
		type = "sticker",
		name = "hnt-lit-sticker",
		flags = {"not-on-map"},
		duration_in_ticks = 60,
		spread_fire_entity = "hnt-fake-fire",
		icon = "__Searchlight__/graphics/hnt-search-icon.png",
    	icon_size = 64, icon_mipmaps = 4,
	},
{--PROTOTYPE search-light
    type = "electric-turret",
    name = "hnt-search-light",
    icon = "__Searchlight__/graphics/hnt-search-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = { "placeable-player", "placeable-enemy", "player-creation", "building-direction-8-way"},
    minable = { mining_time = 0.4, result = "hnt-search-light" },
    max_health = 250,
    collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{ -1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    rotation_speed = 0.01,
    preparing_speed = 0.05,
    preparing_sound = sounds.laser_turret_activate,
    folding_sound = sounds.laser_turret_deactivate,
    corpse = "laser-turret-remnants",
    dying_explosion = "laser-turret-explosion",
    folding_speed = 0.05,
    alert_when_attacking = false,
    --these two are needed for building-direction-8-way
    shoot_in_prepare_state = true,
    turret_base_has_direction = true,

    energy_source =
    {
      type = "electric",
      buffer_capacity = "15kJ",
      input_flow_limit = "15kW",
      drain = "0kW",
      usage_priority = "secondary-input"
    },
    folded_animation =
    {
      layers =
      {
        search_light_extension{frame_count=1, line_length = 1},
        search_light_extension_shadow{frame_count=1, line_length=1},
        search_light_extension_mask{frame_count=1, line_length=1}
      }
    },
    preparing_animation =
    {
      layers =
      {
        search_light_extension{},
        search_light_extension_shadow{},
        search_light_extension_mask{}
      }
    },
    prepared_animation =
    {
      layers =
      {
        search_light_shooting(),
        search_light_shooting_shadow(),
        search_light_shooting_mask()
      }
    },
    energy_glow_animation = search_light_shooting_glow(),
    glow_light_intensity = 1,
    folding_animation =
    {
      layers =
      {
        search_light_extension{run_mode = "backward"},
        search_light_extension_shadow{run_mode = "backward"},
        search_light_extension_mask{run_mode = "backward"}
      }
    },
    base_picture =
    {
      layers =
      {
        {
          filename = "__Searchlight__/graphics/hnt-search-base.png",
          priority = "high",
          width = 250,
          height = 200,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -16),
          scale = 0.5,
          hr_version =
          {
            filename = "__Searchlight__/graphics/hnt-search-base.png",
            priority = "high",
            width = 250,
            height = 200,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -16),
            scale = 0.5
          }
        },
        {
          filename = "__Searchlight__/graphics/hnt-search-base-shadow.png",
          line_length = 1,
          width = 250,
          height = 200,
          draw_as_shadow = true,
          direction_count = 1,
          frame_count = 1,
          shift = util.by_pixel(0, -16),
          scale = 0.5,
          hr_version =
          {
            filename = "__Searchlight__/graphics/hnt-search-base-shadow.png",
            line_length = 1,
            width = 250,
            height = 200,
            draw_as_shadow = true,
            direction_count = 1,
            frame_count = 1,
            shift = util.by_pixel(0, -16),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound = sounds.generic_impact,

    attack_parameters =
    {
      type = "beam",
      cooldown = 60,
      range = 180,
      turn_range = 0.5,
      source_direction_count = 64,
      source_offset = {0, -0.8},
      damage_modifier = 0,
      fire_penalty = 500,
      rotate_penalty = 500,
      cyclic_sound = 
      {
      	middle_sound = 
      	{
      		{
      			filename = "__Searchlight__/sound/hnt-lamp-working.ogg", 
				    volume = 0.7
      		}
      	}
      },
      ammo_type =
      {
        category = "hnt-bulb",
        energy_consumption = "15kJ",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "beam",
            beam = "hnt-search-beam",
            max_length = 200,
            duration = 60,
            source_offset = {0, -1.31439 },
            target_effects = 
            {
            	type = "create-sticker",
            	sticker = "hnt-lit-sticker",
            	show_in_tooltip = false
            }
          }
        }
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  }})

--PROTOTYPE search-beam
local searchbeam = table.deepcopy(data.raw["beam"]["laser-beam"])

searchbeam.name = "hnt-search-beam"
searchbeam.action.action_delivery.target_effects = {type = "create-sticker", sticker = "hnt-lit-sticker", show_in_tooltip = false}
searchbeam.working_sound = lampsound.mutebeam
searchbeam.head =
{
  layers = 
  {
    searchbeam.head,
    searchbeam.head
  }
}
searchbeam.head.layers[1].filename = "__Searchlight__/graphics/hnt-search-head-color.png"
searchbeam.head.layers[1].tint = {r=1,g=1,b=1}
searchbeam.head.layers[1].height = 150
searchbeam.head.layers[1].line_length = 64
searchbeam.head.layers[2].filename = "__Searchlight__/graphics/hnt-search-head-light.png"
searchbeam.head.layers[2].height = 150
searchbeam.head.layers[2].line_length = 64

searchbeam.head.layers[1].flags = {beam_non_light_flags, "no-crop"}
searchbeam.head.layers[2].flags = {beam_non_light_flags, "no-crop"}

searchbeam.tail =
{
  layers = 
  {
    searchbeam.tail,
    searchbeam.tail     
  }
}
searchbeam.tail.layers[1].filename = "__Searchlight__/graphics/hnt-search-end-color.png"
searchbeam.tail.layers[1].tint = {r=1,g=1,b=1}
searchbeam.tail.layers[1].height = 150
searchbeam.tail.layers[1].line_length = 110
searchbeam.tail.layers[2].filename = "__Searchlight__/graphics/hnt-search-end-light.png"
searchbeam.tail.layers[2].height = 150
searchbeam.tail.layers[2].line_length = 110

searchbeam.tail.layers[1].flags = {beam_non_light_flags, "no-crop"}
searchbeam.tail.layers[2].flags = {beam_non_light_flags, "no-crop"}

searchbeam.body =
{
  layers = 
  {
    searchbeam.body[1],
    searchbeam.body[1]      
  }
}
searchbeam.body.layers[1].filename = "__Searchlight__/graphics/hnt-search-body-color.png"
searchbeam.body.layers[1].tint = {r=1,g=1,b=1}
searchbeam.body.layers[1].height = 150
searchbeam.body.layers[1].line_length = 64
searchbeam.body.layers[2].filename = "__Searchlight__/graphics/hnt-search-body-light.png"
searchbeam.body.layers[2].height = 150
searchbeam.body.layers[2].line_length = 64

searchbeam.body.layers[1].flags = {beam_non_light_flags, "no-crop"}
searchbeam.body.layers[2].flags = {beam_non_light_flags, "no-crop"}

searchbeam.ground_light_animations.head.tint = {r=1,g=1,b=1,a=0.2}
searchbeam.ground_light_animations.tail.tint = {r=1,g=1,b=1,a=0.2}
searchbeam.ground_light_animations.body.tint = {r=1,g=1,b=1,a=0.2}

searchbeam.light_animations.head.filename = "__Searchlight__/graphics/hnt-search-head-light.png"
searchbeam.light_animations.body[1].filename = "__Searchlight__/graphics/hnt-search-body-light.png"
searchbeam.light_animations.tail.filename = "__Searchlight__/graphics/hnt-search-end-light.png"
searchbeam.light_animations.head.height = 150
searchbeam.light_animations.body[1].height = 150
searchbeam.light_animations.tail.height = 150

--recipe
local recipe = table.deepcopy(data.raw["recipe"]["small-lamp"])
recipe.enabled = false
recipe.name = "hnt-search-light"
recipe.ingredients = {{"iron-plate",7},{"copper-cable",3},{"small-lamp",1}}
recipe.result = "hnt-search-light"


data:extend{recipe, searchbeam,
	{ --inventory
    type = "item",
    name = "hnt-search-light",
    icon = "__Searchlight__/graphics/hnt-search-icon.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "circuit-network",
    order = "b[light]-b[hnt-search-light]",
    place_result = "hnt-search-light",
    stack_size = 50
  	}
}
