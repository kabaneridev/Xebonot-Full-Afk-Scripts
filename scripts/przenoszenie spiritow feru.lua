ManaPotion = "ultimate spirit potion"
 
SuppliesContainer = "zaoan chess box"
 
--[[ DO NOT EDIT ANYTHING BELOW THIS LINE ]]--
 
ManaID = Item.GetID(ManaPotion)
 
 
Module('SortManaPotion', function(mod)
    if (#Container.GetAll() >= 1) then
        if (Container(0):CountItemsOfID(ManaID) >=1) then
            for spot = Container(0):ItemCount()-1, 0, -1 do
                local item = Container(0):GetItemData(spot)          
                if (item.id == ManaID) then
                    Container(0):MoveItemToContainer(spot, Container.GetByName(SuppliesContainer):Index(), 0)
            break
                end
            end
        end
    end
end)