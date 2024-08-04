local data_util = require("data_util")

if not mods["space-exploration"] then return end -- Returning early could be a problem for multiplayer but only if you continue to play without SE.
-- general
require("prototypes/phase-4/general")
require("prototypes/phase-4/modules")

-- specific
require("prototypes/phase-4/bobs")
require("prototypes/phase-4/angels")
require("prototypes/phase-4/darkstar")
require("prototypes/phase-4/nputils")
require("prototypes/phase-4/qol_research")
require("prototypes/phase-4/krastorio2/krastorio2")
require("prototypes/phase-4/factory")
require("prototypes/phase-4/condenser-turbine")
require ("prototypes/phase-4/pylon-description")

require("prototypes/phase-4/resources")

require("prototypes/phase-4/tech-tree-prune.lua")

require("prototypes/phase-4/tile")

require("prototypes/phase-4/medpack")

require("prototypes/phase-4/sanity")

require("prototypes/phase-4/linked-container")

require("prototypes/phase-4/integrity_check")
