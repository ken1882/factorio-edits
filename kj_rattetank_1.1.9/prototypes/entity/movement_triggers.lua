local vanilla_movement_triggers = require("__base__/prototypes/entity/movement-triggers.lua")

local movement_triggers = {}
movement_triggers.rattetank = vanilla_movement_triggers.tank

local rattetank_tires_big = { 
      {5.8, 8.6},
      {-5.8,8.6},
      {8.6, -5.65},
      {-8.6,-5.65},
      {8.6, -19.9},
      {-8.6,-19.9},
}
local rattetank_tires = { 
      {5.8, 8.6},
      {-5.8,8.6},
      {8.6, -19.9},
      {-8.6,-19.9},
}
local rattetank_tires_small = { 
      {5.75, 8.6},
      {-5.75,8.6},
}

movement_triggers.rattetank[1].offsets = rattetank_tires
movement_triggers.rattetank[2].offsets = rattetank_tires
movement_triggers.rattetank[3].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[3].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[3].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[3].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[4].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[4].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[4].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[4].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[5].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[5].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[5].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[5].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[6].actions[1].offsets = rattetank_tires_big
movement_triggers.rattetank[6].actions[2].offsets = rattetank_tires_big
movement_triggers.rattetank[6].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[6].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[7].actions[1].offsets = rattetank_tires_big
movement_triggers.rattetank[7].actions[2].offsets = rattetank_tires_big
movement_triggers.rattetank[7].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[7].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[8].actions[1].offsets = rattetank_tires_big
movement_triggers.rattetank[8].actions[2].offsets = rattetank_tires_big
movement_triggers.rattetank[8].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[8].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[9].actions[1].offsets = rattetank_tires_big
movement_triggers.rattetank[9].actions[2].offsets = rattetank_tires_big
movement_triggers.rattetank[9].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[9].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[10].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[10].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[10].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[10].actions[4].offsets = rattetank_tires_big
movement_triggers.rattetank[10].actions[5].offsets = rattetank_tires_big

movement_triggers.rattetank[11].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[11].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[11].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[11].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[12].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[12].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[12].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[12].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[13].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[13].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[13].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[13].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[14].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[14].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[14].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[14].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[15].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[15].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[15].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[15].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[16].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[16].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[16].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[16].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[17].actions[1].offsets = rattetank_tires
movement_triggers.rattetank[17].actions[2].offsets = rattetank_tires
movement_triggers.rattetank[17].actions[3].offsets = rattetank_tires
movement_triggers.rattetank[17].actions[4].offsets = rattetank_tires

movement_triggers.rattetank[18].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[18].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[18].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[18].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[19].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[19].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[19].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[19].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[20].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[20].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[20].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[20].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[21].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[21].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[21].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[21].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[22].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[22].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[22].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[22].actions[4].offsets = rattetank_tires_big

movement_triggers.rattetank[23].actions[1].offsets = rattetank_tires_small
movement_triggers.rattetank[23].actions[2].offsets = rattetank_tires_small
movement_triggers.rattetank[23].actions[3].offsets = rattetank_tires_big
movement_triggers.rattetank[23].actions[4].offsets = rattetank_tires_big


return movement_triggers