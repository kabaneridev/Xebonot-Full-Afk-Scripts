local ManaToEquip = 90 -- Mana Percent to equip soft boots.
local NormalBoots = 4033 -- Item ID of your normal boots. 3079 = BOH/ 4033 = DRAKEN BOOTS
Self.ManaPercent = function ()
    return math.abs(Self.Mana() / (Self.MaxMana() * 0.01))
end
Module.New('equip softs', function(module)
    if (Self.ManaPercent() <= ManaToEquip) and (Self.Feet().id ~= 3549) and (Self.ItemCount(6529) > 0) then
        Self.Equip(6529, "feet")
        module:Delay(1000)
    elseif (Self.ManaPercent() >= ManaToEquip) or (Self.Feet().id == 6530) and (Self.Feet().id ~= NormalBoots) then
        Self.Equip(NormalBoots, "feet")
        module:Delay(1000)
    end
end)