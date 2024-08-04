for _, linked_container in pairs(data.raw["linked-container"]) do
  linked_container.gui_mode = "none" -- all, none, admins
  linked_container.localised_description = {"entity-description.se-linked-container"}
end
