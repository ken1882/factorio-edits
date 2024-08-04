local data_util = require("data_util")

local function integrity_error(add_message)
  local message = "\n\n---------------------------------------------------------------------------------------------------"
  message = message .. "\n\nA mod has broken critical parts of the Space Exploration tech tree."
  message = message .. "\n\nPlease report the mod causing the problem so it can be fixed or marked as incompatible. \n\n"
  message = message .. add_message
  message = message .. " \n\nActive mods: "
  local i = 0
  for mod, version in pairs(mods) do
    i = i + 1
    message = message .. mod.." "..version..",  "
    if i % 8 == 0 then
      message = message .. " \n"
    end
  end
  message = message .. " \n\n---------------------------------------------------------------------------------------------------"
  error(message)
end

local function techs_assert_ingredients(techs, ingredients)
  for _, tech_name in pairs(techs) do
    local tech = data.raw.technology[tech_name]
    if (not tech) or tech.hidden == true or tech.enabled == false then integrity_error("Error details: "..tech_name.." is missing") end
    for _, need_ingredient in pairs(ingredients) do
      local found = false
      for _, ingredient in pairs(tech.unit.ingredients) do
        if ingredient[1] == need_ingredient or ingredient.name == need_ingredient then
          found = true break
        end
      end
      if not found then integrity_error("Error details: "..tech_name.." needs "..need_ingredient) end
    end
  end
end

-- only make suer the critical stuff is still valid.
-- lot other mods move around non-ciritcal items (like medpack)

techs_assert_ingredients(
  {
    data_util.mod_prefix .. "rocket-cargo-safety-2",
    data_util.mod_prefix .. "rocket-reusability-2",
    data_util.mod_prefix .. "rocket-survivability-2",
    data_util.mod_prefix .. "space-biochemical-laboratory",
    data_util.mod_prefix .. "space-plasma-generator",
    data_util.mod_prefix .. "space-solar-panel",
  },
  { data_util.mod_prefix .. "rocket-science-pack"}
)

techs_assert_ingredients(
  {
    data_util.mod_prefix .. "rocket-cargo-safety-3",
    data_util.mod_prefix .. "rocket-reusability-3",
    data_util.mod_prefix .. "rocket-survivability-3",
    data_util.mod_prefix .. "space-hypercooling-2",
    data_util.mod_prefix .. "space-electromagnetics-laboratory",
    data_util.mod_prefix .. "space-laser-laboratory",
    data_util.mod_prefix .. "space-radiation-laboratory",
    data_util.mod_prefix .. "space-telescope",
    data_util.mod_prefix .. "space-astrometrics-laboratory",
  },
  { "utility-science-pack"}
)

techs_assert_ingredients(
  {
    data_util.mod_prefix .. "space-genetics-laboratory",
    data_util.mod_prefix .. "space-mechanical-laboratory",
  },
  { "production-science-pack"}
)

-- make sure the critical techs are intact
techs_assert_ingredients(
  {
    data_util.mod_prefix .. "rocket-cargo-safety-4",
    data_util.mod_prefix .. "rocket-reusability-4",
    data_util.mod_prefix .. "rocket-survivability-4",
    data_util.mod_prefix .. "aeroframe-pole",
    data_util.mod_prefix .. "zone-discovery-random",
    data_util.mod_prefix .. "space-simulation-ab",
    data_util.mod_prefix .. "space-simulation-am",
    data_util.mod_prefix .. "space-simulation-as",
  },
  { data_util.mod_prefix .. "astronomic-science-pack-1"}
)

techs_assert_ingredients(
  {
    data_util.mod_prefix .. "vitalic-acid",
    data_util.mod_prefix .. "space-simulation-ab",
    data_util.mod_prefix .. "space-simulation-bm",
    data_util.mod_prefix .. "space-simulation-sb",
  },
  { data_util.mod_prefix .. "biological-science-pack-1"}
)

techs_assert_ingredients(
  {
    data_util.mod_prefix .. "holmium-cable",
    data_util.mod_prefix .. "space-hypercooling-3",
    data_util.mod_prefix .. "space-rail",
    data_util.mod_prefix .. "space-simulation-as",
    data_util.mod_prefix .. "space-simulation-sb",
    data_util.mod_prefix .. "space-simulation-sm",
  },
  { data_util.mod_prefix .. "energy-science-pack-1"}
)

techs_assert_ingredients(
  {
    data_util.mod_prefix .. "heavy-girder",
    data_util.mod_prefix .. "space-platform-plating",
    data_util.mod_prefix .. "space-simulation-am",
    data_util.mod_prefix .. "space-simulation-bm",
    data_util.mod_prefix .. "space-simulation-sm",
  },
  { data_util.mod_prefix .. "material-science-pack-1"}
)
