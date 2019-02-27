function dropItem(id, count)
local cont = Container.GetFirst()
while (cont:isOpen()) do for spot = 0, cont:ItemCount() do local item = cont:GetItemData(spot)
if (item.id == id) then cont:MoveItemToGround(spot, Self.Position().x, Self.Position().y, Self.Position().z, count)
return true
end
end
cont = cont:GetNext()
end
return false
end
local last = 1
local trash = {3031, 3492}
while (true) do local thisone
while (thisone == last) do thisone = math.random(1, #trash)
end
if (dropItem(trash[thisone], math.random(1, 2))) then wait(100, 100)
else wait(20)
end
last = thisone
end