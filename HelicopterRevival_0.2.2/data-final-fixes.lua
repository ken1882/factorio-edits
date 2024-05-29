require("prototypes.tiles.heli-pad-concrete")

if mods["Krastorio2"] then
	-- copy K2 eqipment categories into heli-equipment-grid
	data.raw["equipment-grid"]["heli-equipment-grid"].equipment_categories = data.raw["equipment-grid"]["kr-car-grid"].equipment_categories
end

if mods["VehicleGrid"] then
	if mods["bobvehicleequipment"] then
		-- copy Bob's equipment categories into heli-equipment-grid
		data.raw["equipment-grid"]["heli-equipment-grid"].equipment_categories = data.raw["equipment-grid"]["bob-car"].equipment_categories
	end
end

if mods["vtk-armor-plating"] then
  table.insert(data.raw["equipment-grid"]["heli-equipment-grid"].equipment_categories, "vtk-armor-plating")
end

if mods["AircraftRealism"] then
  local aircraftMaker = require("__AircraftRealism__.aircraftMaker")
  local utility = require("__AircraftRealism__.logic.utility")
  local grounded = data.raw["car"][craftName]
end