local Diagnostics = {}

local util = require("shared_util")

local se_dependencies = { -- copy in from info.json
  "base >= 1.1.107",
  "aai-containers >= 0.2.7",
  "aai-industry >= 0.5.19",
  "alien-biomes >= 0.6.5",
  "jetpack >= 0.2.6",
  "robot_attrition >= 0.5.9",
  "shield-projector >= 0.1.3",
  "space-exploration-graphics >= 0.6.18",
  "space-exploration-graphics-2 >= 0.6.1",
  "space-exploration-graphics-3 >= 0.6.2",
  "space-exploration-graphics-4 >= 0.6.1",
  "space-exploration-graphics-5 >= 0.6.1",
  "space-exploration-menu-simulations >= 0.6.9",
  "~ space-exploration-postprocess >= 0.6.26",
  "informatron >= 0.2.1",
  "aai-signal-transmission >= 0.4.1",

  "? bullet-trails >= 0.6.1",
  "? grappling-gun >= 0.3.1",
  "? combat-mechanics-overhaul >= 0.6.15",
  "? equipment-gantry >= 0.1.1",
  "(?) Krastorio2 >= 1.3.24",
  "(?) Krastorio2Assets >= 1.2.3",

  "! angelsindustries",
  "! angelspetrochem",
  "! angelsrefining",
  "! angelssmelting",

  "! bobelectronics",
  "! bobores",
  "! bobplates",
  "! bobpower",
  "! bobrevamp",
  "! bobtech",
  "! bobvehicleequipment",
  "! bobwarfare",

  "! Yuoki",

  "! pycoalprocessing",
  "! pyindustry",
  "! pyhightech",
  "! PyBlock",

  "! angelsinfiniteores",
  "! BiggerStacksPlus",
  "! BitersBegoneUpdated",
  "! bobmodules",
  "! Clockwork",
  "! dangOreus",
  "! Darkstar_utilities",
  "! DeepMine",
  "! Explosive Excavation",
  "! FactorioExtended-Core",
  "! FactorioExtended-Plus-Core",
  "! IndustrialRevolution",
  "! infinite-resources-depletion",
  "! LandfillPainting",
  "! Li-Quarry",
  "! modmash",
  "! MoreScience",
  "! omnimatter",
  "! quarry-edit",
  "! rso-mod",
  "! SeaBlock",
  "! SchallMachineScaling",
  "! SchallOreConversion",
  "! sonaxaton-infinite-resources",
  "! Space-Exploration-Modpack",
  "! SpaceMod",
  "! TeamCoop",
  "! traintunnels",
  "! Unlimited-Resources",
  "! UnlimitedProductivity",
  "! vtk-deep-core-mining"
}

local log_always = false -- always print diagnostics result to log, not only if there's an issue

local function get_printed_mod_name(mod_name, use_colors)
  if use_colors then
    return "[color=cyan]" .. mod_name .. "[/color]"
  else
    return mod_name
  end
end

function Diagnostics.get_rich_text_message(mods)
  local issues_list = Diagnostics.get_issues_list(mods, true)
  if issues_list and table_size(issues_list) > 1 then
    local rich_text_issues_list = {""}
    local sub_final_string
    for i, value in pairs(issues_list) do
      -- Localised string limit is 20 parameters, we add 3 parameters per item
      -- add a new sub_final_string every 6 items
      if (i - 1) % 6 == 0 then
        sub_final_string = {""}
        table.insert(rich_text_issues_list, sub_final_string)
      end
      if value ~= "" then
        table.insert(sub_final_string, "[font=default-large-bold]- [color=red]")
        table.insert(sub_final_string, value)
        table.insert(sub_final_string, "[/color][/font]\n")
      end
    end
    log(serpent.line(rich_text_issues_list))
    local message = {"",
      {"", "\n\n\n",
      "[font=default-large-bold]═══════════════════════[/font]\n",
      "[font=default-large-bold]═══════════════════════[/font]\n\n",
      "[img=utility/warning_icon][font=default-large-semibold][color=yellow]", {"diagnostics.se-not-installed"}, "[/color][/font]\n",
      "[font=default-large-semibold]", {"diagnostics.fix-issues"}, "[/font]\n",
      rich_text_issues_list,
      "\n",
      "[font=default-large-bold]═══════════════════════[/font]\n",
      "[font=default-large-bold]═══════════════════════[/font]\n",
      "\n\n\n"},
    }
    return message
  else
    return nil
  end
end

local function split_dependency(dependency)
  -- First, find the dependency type and split it apart from the rest
  local dependency_type
  local dependency_without_type
  local _, dependency_type_index_end = string.find(dependency, "[!~%?%(%)]+")
  if dependency_type_index_end == nil then
    dependency_without_type = dependency -- no type, e.g. required
  else
    dependency_type = string.sub(dependency, 1, dependency_type_index_end)
    dependency_without_type = string.sub(dependency, dependency_type_index_end + 2)
  end

  -- Second, find the version operator and use to to get the 3 remaining parts
  local mod_name
  local operator
  local version
  local operator_index_start, operator_index_end = string.find(dependency_without_type, "[<>=]+")
  if operator_index_start == nil then
    mod_name = dependency_without_type
    -- Leave operator and version nil
  else
    mod_name = string.sub(dependency_without_type, 1, operator_index_start - 2) -- mod name could have spaces
    operator = string.sub(dependency_without_type, operator_index_start, operator_index_end)
    version = string.sub(dependency_without_type, operator_index_end + 2)
  end
  return dependency_type, mod_name, operator, version
end

local function is_version_acceptable(operator, required_version, actual_version)
  if operator == nil then
    return true
  elseif operator == ">" then
    return util.dot_string_greater_than(actual_version, required_version, false)
  elseif operator == ">=" then
    return util.dot_string_greater_than(actual_version, required_version, true)
  end
  -- TODO: Other comparisons
end

function Diagnostics.get_issues_list(mods, use_rich_text)
  if mods["space-exploration"] and not log_always then return end

  local message = {""}

  for _, dependency in pairs(se_dependencies) do
    local dependency_type, mod_name, version_operator, required_version = split_dependency(dependency)
    local printed_mod_name = get_printed_mod_name(mod_name, use_rich_text)

    if dependency_type == "!" then
      -- conflict
      if mods[mod_name] then
        table.insert(message, {"diagnostics.conflicting-mod", printed_mod_name})
      end
    elseif dependency_type == "?" or dependency_type == "(?)" then
      -- optional
      if mods[mod_name] and not is_version_acceptable(version_operator, required_version, mods[mod_name]) then
        table.insert(message, {"diagnostics.optional-mod-wrong-version", printed_mod_name, mods[mod_name], version_operator, required_version})
      end
    else
      -- required (with or without ~)
      if not mods[mod_name] then
        table.insert(message, {"diagnostics.required-mod-missing", printed_mod_name})
      elseif not is_version_acceptable(version_operator, required_version, mods[mod_name]) then
        table.insert(message, {"diagnostics.required-mod-wrong-version", printed_mod_name, mods[mod_name], version_operator, required_version})
      end
    end
  end
  return message
end

return Diagnostics
