-- Ring #1
local UseRing = true
local Ring = 3098 -- Item ID of the ring, with the most priority, that you want to equip. (Default: Ring of Healing)
local ActiveRing = 3089 -- Item ID of the ring while wearing it.
-- Ring #2
local UseRing2 = true
local Ring2 = 3098 -- Item ID of the ring, with least priority, that you want to equip. (Default: Life Ring)
local ActiveRing2 = 3089 -- Item ID of the ring while wearing it.
-- Alternate Ring
local AlternateRing = 9394 -- Item ID of your alternate ring. (Default: Wedding Ring)
-- Do not edit anything below
Module.New('equip ring', function(module)
    if (UseRing) and (Self.Ring().id ~= ActiveRing) and (Self.ItemCount(Ring) > 0) then
        Self.Equip(Ring, "ring")
        module:Delay(1000)
    elseif (UseRing2) and (Self.ItemCount(Ring) == 0) and (Self.Ring().id ~= ActiveRing2) and (Self.ItemCount(Ring2) > 0) then
        Self.Equip(Ring2, "ring")
        module:Delay(1000)
    elseif (Self.Ring().id ~= ActiveRing) and (Self.Ring().id ~= ActiveRing2) and (Self.Ring().id ~= AlternateRing) then
        Self.Equip(AlternateRing, "ring")
        module:Delay(1000)
    end
end)