-- fixing "launching_to_destiantion" spelling error in prior launchpad.lua code causes a crash on a save prior to this one during which a rocket is launched, this aims to fix that
if global.rocket_launch_pads then
  for _, struct in pairs(global.rocket_launch_pads) do
    if struct.launching_to_destiantion then
	  struct.launching_to_destination = struct.launching_to_destiantion
	end
  end
end

if global.tick_tasks then
  for _, tick_task in pairs(global.tick_tasks) do
    if tick_task.launching_to_destiantion then
	  tick_task.launching_to_destination = tick_task.launching_to_destiantion
	end
  end
end
