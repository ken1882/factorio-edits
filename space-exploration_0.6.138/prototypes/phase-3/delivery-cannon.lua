local data_util = require("data_util")

for _, resource in pairs(se_delivery_cannon_recipes) do
  local type = resource.type or "item"
  if data.raw[type][resource.name] then
    local base = data.raw[type][resource.name]
    local amount = resource.amount
    if not amount then
      if type == "fluid" then
        amount = 1000
      else
        amount = math.min(200, base.stack_size or 1)
      end
    end
    local order = ""
    local o_subgroup = base.subgroup and data.raw["item-subgroup"][base.subgroup] or nil
    local o_group = o_subgroup and data.raw["item-group"][o_subgroup.group] or nil
    if o_group then
      order = (o_group.order or o_group.name) .. "-|-" .. (o_subgroup.order or o_subgroup.name) .. "-|-"
    end
    order = order .. (base.order or base.name)
    data:extend({
      {
          type = "item",
          name = data_util.mod_prefix .. "delivery-cannon-package-"..resource.name,
          icons = data_util.add_icon_to_stack({{
            icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png",
            icon_size = 64,
          }}, base, {scale = 0.5}),
          order = order,
          flags = {"hidden"},
          subgroup = base.subgroup or "delivery-cannon-capsules",
          stack_size = 1,
          localised_name = {"item-name.se-delivery-cannon-capsule-packed", base.localised_name or {type.."-name."..resource.name}}
      },
      {
          type = "recipe",
          name = data_util.mod_prefix .. "delivery-cannon-pack-" .. resource.name,
          icon = base.icon,
          icon_size = base.icon_size,
          icon_mipmaps = base.icon_mipmaps,
          icons = base.icons,
          enabled = true,
          energy_required = 5,
          ingredients = {
            { data_util.mod_prefix .. "delivery-cannon-capsule", 1 },
            {
              type = (type == 'fluid') and 'fluid' or 'item',
              name = resource.name,
              amount = amount,
              catalyst_amount = amount, -- Completely hide from production statistics, without hiding the consumpttion of the capsule itself
            },
          },
          results = {{
            type = "item",
            name = data_util.mod_prefix .. "delivery-cannon-package-"..resource.name,
            amount = 1,
          }},
          requester_paste_multiplier = 1,
          always_show_made_in = false,
          category = "delivery-cannon",
          hide_from_player_crafting = true,
          localised_name = {"item-name.se-delivery-cannon-capsule-packed", base.localised_name or {type.."-name."..resource.name}},
          allow_decomposition = false
      },
    })
    if is_debug_mode then
      --log(serpent.block(data.raw.item[data_util.mod_prefix .. "delivery-cannon-package-"..resource.name]))
    end
  end
end

-- ammo and capsules can't be ingredients.
-- the delivery cannon will need to assemble the item based on the original recipe
for _, dcar in pairs(se_delivery_cannon_ammo_recipes) do
  local type = dcar.type or "ammo" -- could be "capsule"
  if data.raw[type][dcar.name] then
    local proto = data.raw[type][dcar.name]
    local recipe_name = dcar.recipe_name or proto.name
    if data.raw.recipe[recipe_name] then
      local recipe = data.raw.recipe[recipe_name]
      local ingredients = table.deepcopy(recipe.ingredients or recipe.expensive.ingredients or recipe.normal.ingredients)
      local energy_required = recipe.energy_required or recipe.expensive.energy_required or recipe.normal.energy_required
      -- ensure the recipe has the capsule as an ingredient
      table.insert(ingredients, { data_util.mod_prefix .. "delivery-cannon-weapon-capsule", 1 })
      local order = ""
      local o_subgroup = data.raw["item-subgroup"][proto.subgroup]
      local o_group = data.raw["item-group"][o_subgroup.group]
      order = (o_group.order or o_group.name) .. "-|-" .. (o_subgroup.order or o_subgroup.name) .. "-|-" .. (proto.order or proto.name)
      local unlock_tech
      for _, technology in pairs(data.raw.technology) do
        if technology.effects then
          for _, effect in pairs(technology.effects) do
            -- the technology that unlocks the original payload should also unlock the weapon delivery cannon recipe for the payload and the weapon delivery cannon artillery targeter for that payload
            -- caveat - this means that any payloads that can be used in a weapon delivery cannon that are unlocked in the tech tree prior to the weapon delivery cannon itself will unlock these recipes
            -- before they can actually be used - an example of this is the atomic-bomb
            if effect.recipe == recipe_name then
              table.insert(technology.effects, { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-weapon-pack-" .. dcar.name })
              table.insert(technology.effects, { type = "unlock-recipe", recipe = data_util.mod_prefix .. "delivery-cannon-artillery-targeter-"..dcar.name })
              unlock_tech = technology
              break
            end
          end
          if unlock_tech then break end
        end
      end
      local artillery_icons = {
        {
          icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-artillery-targeter.png",
          icon_size = 64
        },
      }
      if proto.icon then
        table.insert(artillery_icons, {
          icon = proto.icon,
          icon_size = proto.icon_size,
          icon_mipmaps = proto.icon_mipmaps,
          scale = 0.4,
          shift = {0, -2}
        })
      elseif proto.icons then
        -- scaling and shifting already stacked icons doesn't work well
        -- with a naive approach so just don't for now
        for _, icon in pairs(proto.icons) do
          table.insert(artillery_icons, table.deepcopy(icon))
        end
      end
      data:extend({
        {
            type = "item",
            name = data_util.mod_prefix .. "delivery-cannon-weapon-package-"..proto.name,
            icons = data_util.add_icon_to_stack({{
              icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon-capsule.png",
              icon_size = 64,
            }}, proto, {scale = 0.5}),
            order = order,
            flags = {"hidden"},
            subgroup = proto.subgroup or "delivery-cannon-capsules",
            stack_size = 1,
            localised_name = {"item-name.se-delivery-cannon-weapon-capsule-packed", proto.localised_name or {"item-name."..dcar.name}}
        },
        {
            type = "recipe",
            name = data_util.mod_prefix .. "delivery-cannon-weapon-pack-" .. dcar.name,
            icon = proto.icon,
            icon_size = proto.icon_size,
            icon_mipmaps = proto.icon_mipmaps,
            icons = table.deepcopy(proto.icons),
            result = data_util.mod_prefix .. "delivery-cannon-weapon-package-"..dcar.name,
            enabled = unlock_tech == nil,
            energy_required = energy_required,
            ingredients = dcar.ingredients or ingredients,
            requester_paste_multiplier = 1,
            always_show_made_in = false,
            category = "delivery-cannon-weapon",
            hide_from_player_crafting = true,
            localised_name = {"item-name.se-delivery-cannon-weapon-capsule-packed", proto.localised_name or {"item-name."..dcar.name}},
            allow_decomposition = false
        },
        {
          -- capsule w/ capsule_action="equipment-remote" gives us the activate hotkey tooltip w/o it actually having to do anything outside of our script
          type = "capsule",
          name = data_util.mod_prefix .. "delivery-cannon-artillery-targeter-"..dcar.name,
          icons = artillery_icons,
          capsule_action =
          {
            type = "equipment-remote",
            equipment = "dummy-defense-equipment"
          },
          -- order and subgroup match the vanilla artillery targeting remote such that all the artillery targeting remotes stay organized together
          order = "b[turret]-d[artillery-turret]-b[remote]-"..order,
          subgroup = "defensive-structure",
          stack_size = 1,
          localised_name = {"item-name.se-delivery-cannon-artillery-targeter", proto.localised_name or {"item-name."..dcar.name}},
          localised_description = {"item-description.se-delivery-cannon-artillery-targeter", proto.localised_name or {"item-name."..dcar.name}},
          flags = {}
      },
      {
        -- this dummy artillery flare will not take any shots from the artillery because its shots_per_flare is 0
        -- its life_time has been set to 0 and has the early_death_ticks replaced with the lifetime since because of
        -- the 0 shots_per_flare the flare is immediately considered in need of being dead upon spawning
        -- if the dummy artillery flare needs to be removed before its early_death_ticks worth of lifetime expires, it
        -- must be manually destroyed by script
        type = "artillery-flare",
        name = data_util.mod_prefix.."dummy-artillery-flare-"..dcar.name,
        icon = "__base__/graphics/icons/artillery-targeting-remote.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-off-grid", "not-on-map"},
        map_color = dcar.map_color or {r=1, g=0.5, b=0},
        life_time = 0 * 60,
        initial_height = 0,
        initial_vertical_speed = 0,
        initial_frame_speed = 1,
        shots_per_flare = 0,
         -- + 60 seconds to the value in the settings so the flare always lasts long enough to either be fired upon or be expired by script
        early_death_ticks = 60 * (settings.startup[data_util.mod_prefix.."delivery-cannon-artillery-timeout"].value + 60),
        pictures =
        {
          {
            filename = "__core__/graphics/shoot-cursor-red.png",
            priority = "low",
            width = 258,
            height = 183,
            frame_count = 1,
            scale = 1,
            flags = {"icon"}
          }
        }
      },
      {
        type = "recipe",
        name = data_util.mod_prefix .. "delivery-cannon-artillery-targeter-"..dcar.name,
        result = data_util.mod_prefix .. "delivery-cannon-artillery-targeter-"..dcar.name,
        enabled = false,
        energy_required = 0.5,
        ingredients = {
          { "processing-unit", 1 },
          { "radar", 1 },
        },
        requester_paste_multiplier = 1,
        always_show_made_in = false,
      },
      })

      if is_debug_mode then
        --log(serpent.block(data.raw.item[data_util.mod_prefix .. "delivery-cannon-weapon-package-"..proto.name]))
      end
    end
  end
end

-- ensure that the atomic-bomb has a chart explosion - without a chart explosion it odd when fired with the weapon delivery cannon
if data.raw["projectile"]["atomic-rocket"] then
  local has_chart = false
  for _, effect in pairs(data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects) do
    if effect.type == "show-explosion-on-chart" then
      has_chart = true
    end
  end
  if not has_chart then
    table.insert(data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects, {
      type = "show-explosion-on-chart",
      scale = 3,
    })
  end
end