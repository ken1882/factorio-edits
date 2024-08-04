local data_util = require("data_util")

for _, capsule in pairs(data.raw.capsule) do
  if string.find(capsule.name, "medpack", 1, true) or string.find(capsule.name, "medkit", 1, true) then
    if capsule.capsule_action and
       capsule.capsule_action.attack_parameters and
       capsule.capsule_action.attack_parameters.ammo_type and
       capsule.capsule_action.attack_parameters.ammo_type.action and
       capsule.capsule_action.attack_parameters.ammo_type.action.action_delivery and
       capsule.capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects then
      local healing = 0
      for _, effect in pairs(capsule.capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects) do
        if effect.type == "damage" and effect.damage and effect.damage.amount and effect.damage.amount < 0 then
          healing = -effect.damage.amount
        end
      end
      if healing > 0 then
        capsule.capsule_action.type = "throw"
        capsule.capsule_action.attack_parameters.type = "beam"
        capsule.capsule_action.attack_parameters.range = 8
        table.insert(capsule.capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects,
          {
            type = "create-entity",
            entity_name = data_util.mod_prefix .. "heal-trigger-"..healing,
            trigger_created_entity = true,
            show_in_tooltip = false,
          }
        )
        data:extend({
          {
            type = "explosion",
            name = data_util.mod_prefix .. "heal-trigger-"..healing,
            animations = {
              {
                direction_count = 1,
                filename = "__space-exploration-graphics__/graphics/blank.png",
                frame_count = 1,
                height = 1,
                line_length = 1,
                width = 1
              }
            },
            flags = {
              "not-on-map", "placeable-off-grid"
            },
          }
        })
      end
    end
  end
end
--[[
{
  icon = "__space-exploration-graphics__/graphics/icons/medpack-1.png",
  icon_size = 64,
  name = data_util.mod_prefix .. "medpack",
  order = "aa",
  stack_size = 20,
  subgroup = "tool",
  type = "capsule",
  capsule_action = {
    type = "throw",
    attack_parameters = {
      activation_type = "consume",
      cooldown = 60,
      range = 8,
      type = "beam",
      ammo_category = "capsule",
      ammo_type = {
        category = "capsule",
        target_type = "position",
        action = {
          action_delivery = {
            target_effects = {
              {
                type = "play-sound",
                sound = { filename = "__base__/sound/character-corpse-open.ogg", volume = 0.5 },
              },
              {
                damage = {
                  amount = -50,
                  type = "poison"
                },
                type = "damage"
              },
              {
                type = "create-entity",
                entity_name = data_util.mod_prefix .. "tesla-gun-trigger",
                trigger_created_entity = true,
                show_in_tooltip = false,
              },
            },
            type = "instant"
          },
          type = "direct"
        },
      },
    },
  },
},
]]
