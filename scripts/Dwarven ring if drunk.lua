local checkDrunkStatus = 2 -- recheck if drunk every x seconds
local unequipToContainer = 1 -- unequip to x container ex. 1 SHOULD be mainbp
 
-- [[ DO NOT EDIT BELOW THIS LINE ]] --
 
lastTimeDwarvenRingEquipped = os.time()
dwarvenRingId = Item.GetID("dwarven ring")
 
Module.New("dwarven-ring", function()
    if (Self.isDrunk() and Self.Ring().id ~= Item.GetRingActiveID(dwarvenRingId)) then
        lastTimeDwarvenRingEquipped = os.time()
        Self.Equip(dwarvenRingId, "ring")
    elseif (os.time() - lastTimeDwarvenRingEquipped > checkDrunkStatus) then
        if (Self.Ring().id == Item.GetRingActiveID(dwarvenRingId) and Self.TargetID() == 0) then
            Walker.Delay(1000)
            Self.Dequip("ring", unequipTo)
        end
    end
end)