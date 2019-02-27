ManaType = "Mana Potion"
SuppliesContainer = "Zaoan Chess Box"
--[[ DO NOT EDIT ANYTHING BELOW THIS LINE ]]--
ManaTypeID = Item.GetID(ManaType)
Module('StackMana', function(mod)
    if (#Container.GetAll() >= 1) then
        if (Container(0):CountItemsOfID(ManaTypeID) >=1) then
            for spot = Container(0):ItemCount()-1, 0, -1 do
                local item = Container(0):GetItemData(spot)
                if (item.id == ManaTypeID) then
                    Container(0):MoveItemToContainer(spot, Container.GetByName(SuppliesContainer):Index(), 0)
                    break
                end
            end
        end
    end
    mod:Delay(300)
end)
