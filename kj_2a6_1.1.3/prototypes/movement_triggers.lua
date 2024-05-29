local vanilla_movement_triggers = require("__base__/prototypes/entity/movement-triggers.lua")

local movement_triggers = {}
movement_triggers.maustank  = vanilla_movement_triggers.tank



local maustank_tires_big = {  
      {1.1, 3.9},
      {-1.1,3.9},
      {1.1, 1.05},
      {-1.1,1.05},
      {1.1, -1.8},
      {-1.1,-1.8},
}
local maustank_tires = { 
      {1.1, 3.9},
      {-1.1,3.9},
      {1.1, -1.8},
      {-1.1,-1.8},
}
local maustank_tires_small = { 
      {1.05, 3.9},
      {-1.05,3.9},
}

movement_triggers.maustank[1].offsets = maustank_tires
movement_triggers.maustank[2].offsets = maustank_tires
movement_triggers.maustank[3].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[3].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[3].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[3].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[4].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[4].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[4].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[4].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[5].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[5].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[5].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[5].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[6].actions[1].offsets = maustank_tires_big
movement_triggers.maustank[6].actions[2].offsets = maustank_tires_big
movement_triggers.maustank[6].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[6].actions[4].offsets = maustank_tires

movement_triggers.maustank[7].actions[1].offsets = maustank_tires_big
movement_triggers.maustank[7].actions[2].offsets = maustank_tires_big
movement_triggers.maustank[7].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[7].actions[4].offsets = maustank_tires

movement_triggers.maustank[8].actions[1].offsets = maustank_tires_big
movement_triggers.maustank[8].actions[2].offsets = maustank_tires_big
movement_triggers.maustank[8].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[8].actions[4].offsets = maustank_tires

movement_triggers.maustank[9].actions[1].offsets = maustank_tires_big
movement_triggers.maustank[9].actions[2].offsets = maustank_tires_big
movement_triggers.maustank[9].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[9].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[10].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[10].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[10].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[10].actions[4].offsets = maustank_tires_big
movement_triggers.maustank[10].actions[5].offsets = maustank_tires_big

movement_triggers.maustank[11].actions[1].offsets = maustank_tires
movement_triggers.maustank[11].actions[2].offsets = maustank_tires
movement_triggers.maustank[11].actions[3].offsets = maustank_tires
movement_triggers.maustank[11].actions[4].offsets = maustank_tires

movement_triggers.maustank[12].actions[1].offsets = maustank_tires
movement_triggers.maustank[12].actions[2].offsets = maustank_tires
movement_triggers.maustank[12].actions[3].offsets = maustank_tires
movement_triggers.maustank[12].actions[4].offsets = maustank_tires

movement_triggers.maustank[13].actions[1].offsets = maustank_tires
movement_triggers.maustank[13].actions[2].offsets = maustank_tires
movement_triggers.maustank[13].actions[3].offsets = maustank_tires
movement_triggers.maustank[13].actions[4].offsets = maustank_tires

movement_triggers.maustank[14].actions[1].offsets = maustank_tires
movement_triggers.maustank[14].actions[2].offsets = maustank_tires
movement_triggers.maustank[14].actions[3].offsets = maustank_tires
movement_triggers.maustank[14].actions[4].offsets = maustank_tires

movement_triggers.maustank[15].actions[1].offsets = maustank_tires
movement_triggers.maustank[15].actions[2].offsets = maustank_tires
movement_triggers.maustank[15].actions[3].offsets = maustank_tires
movement_triggers.maustank[15].actions[4].offsets = maustank_tires

movement_triggers.maustank[16].actions[1].offsets = maustank_tires
movement_triggers.maustank[16].actions[2].offsets = maustank_tires
movement_triggers.maustank[16].actions[3].offsets = maustank_tires
movement_triggers.maustank[16].actions[4].offsets = maustank_tires

movement_triggers.maustank[17].actions[1].offsets = maustank_tires
movement_triggers.maustank[17].actions[2].offsets = maustank_tires
movement_triggers.maustank[17].actions[3].offsets = maustank_tires
movement_triggers.maustank[17].actions[4].offsets = maustank_tires

movement_triggers.maustank[18].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[18].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[18].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[18].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[19].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[19].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[19].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[19].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[20].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[20].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[20].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[20].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[21].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[21].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[21].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[21].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[22].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[22].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[22].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[22].actions[4].offsets = maustank_tires_big

movement_triggers.maustank[23].actions[1].offsets = maustank_tires_small
movement_triggers.maustank[23].actions[2].offsets = maustank_tires_small
movement_triggers.maustank[23].actions[3].offsets = maustank_tires_big
movement_triggers.maustank[23].actions[4].offsets = maustank_tires_big



return movement_triggers