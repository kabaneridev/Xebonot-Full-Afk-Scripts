PickupItems = {5903} 
Module.New('Item Picker+bp opener', function(module)
for y = -1, 1 do
for x = -1, 1 do
if table.contains(PickupItems, Map.GetTopMoveItem(Self.Position().x + x, Self.Position().y + y, Self.Position().z).id) then
Map.PickupItem(Self.Position().x + x, Self.Position().y + y, Self.Position().z, Container.GetFirst(), 0)
end
end
end
end
)