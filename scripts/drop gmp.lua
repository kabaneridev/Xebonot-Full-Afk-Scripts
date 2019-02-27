ManaID = 238 -- 238 = GMP
DropManasAbove = 1
AmountToDrop = 1

Module.New('DropPots', function(module)
if Self.ItemCount(ManaID) > DropManasAbove then
Self.DropItem(Self.Position().x,Self.Position().y, Self.Position().z, ManaID, AmountToDrop)
end
module:Delay(1000,1500)
end)