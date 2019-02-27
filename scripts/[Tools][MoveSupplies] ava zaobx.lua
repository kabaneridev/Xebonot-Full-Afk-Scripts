local bp = 'zaoan chess box' --  container where u want put all potions
local DROP_ITEMS = {"ultimate mana potion", "avalanche rune", "sudden death rune"}
--------------------
--     Engine     --
--------------------
Module.New('Shove-pots', function(mod)
    for i = 0, #Container.GetAll() do   -- let's find bps
        search = Container.New(i)
        cont = Container.New(bp)
        for spot = 0, cont:ItemCount() do
            local item = search:GetItemData(spot)
            if cont:isOpen() and search:Name() ~= cont:Name() then
                if table.find(DROP_ITEMS, Item.GetName(item.id)) and not cont:isFull() then
                    search:MoveItemToContainer(spot, cont:Index(), 0, 100)  -- just shove to selected bp
                end
            end
        end
    end
end)