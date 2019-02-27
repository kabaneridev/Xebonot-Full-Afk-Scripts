local ItemsIds = {3043, 3035}
local ItemBP = 'Brocade Backpack'

Module.New('Picking', function()
for x = -1, 1 do
for y = -1, 1 do
if table.find(ItemsIds, Map.GetTopTargetObject(Self.Position().x + x, Self.Position().y + y, Self.Position().z).id) then
Map.PickupItem(Self.Position().x + x, Self.Position().y + y, Self.Position().z, Container.New(ItemBP):Index(), math.random(0, 19))
wait(100, 200)
end
end
end
end)