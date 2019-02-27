local MinMana = 40                     -- Amount to buy new potions
local MaxMana = 300                 -- Amount to buy up to
local MinCash = 5000                -- Stops is below x gps
local ManaName = "great mana potion"         -- Name of your mana potion

function Self.ManaPercent()
    local x = math.ceil(math.abs(Self.Mana() / (Self.MaxMana() * 0.01)))
    return x
end

function BuyItems(item, count)
    wait(900, 1200)
    if (Self.ItemCount(item) < count) then
        Self.ShopBuyItem(item, (count-Self.ItemCount(item)))
        wait(200, 500)
    end
end

Module.New('ManaTrain', function(module)
    if (Self.ItemCount(Item.GetID(ManaName)) <= MinMana) and (Self.Money() >= MinCash) then
        Self.SayToNpc({"hi", "vials", "yes", "yes", "yes", "yes", "yes", "yes", "trade"}, 65)
        BuyItems(Item.GetID(ManaName), MaxMana)
            wait(500)
        Self.SayToNpc("bye")
    end
    module:Delay(1500)
end)