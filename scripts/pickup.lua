PickupItems = {3031, 3492, 11686, 6530, 8864, 14000, 14769, 16112, 16106, 11687, 3392, 3043, 3388, 6529}  
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