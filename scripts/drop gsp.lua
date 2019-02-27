local MinCap = 100 -- Mininum cap
local itemID = 7642 -- Gold itemID is 3031, but this scrip can drop any item


Module.New("Drop items", function(module)
if (Self.Cap() < MinCap) then
Self.DropItem(Self.Position().x, Self.Position().y, Self.Position().z, itemID)
module:Delay(1000)
end
end)