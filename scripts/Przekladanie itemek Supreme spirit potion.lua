ammunitionID = 23373 -- Change to the ID of the ammo you use.
ammoBP = "brocade backpack" -- Change to the name of the ammoBP you use.

function Move()
if Self.ItemCount(ammunitionID) >= 1 then
local mainBP = Container.GetFirst()
local DestinationBp = Container.GetByName(ammoBP)
for spot = 0, mainBP:ItemCount() do
local item = mainBP:GetItemData(spot)
if (item.id == ammunitionID) then
mainBP:MoveItemToContainer(spot, DestinationBp:Index(), 0)
wait(100)
break
end
end
end
wait(50)
end

while true do
Move()
wait(100,150)
end