local CONFIG = {
    {BP = 'shopping bag', -- BP name or index
    LIST =
        {'steel boots', 'rift bow', 'rift lance', 'rift shield', 'mastermind shield', 'giant sword', 'dreaded cleaver', 'butcher/s axe',
        'blue gem', 'vile axe', 'skull helmet', 'rift crossbow', 'demonrage sword', 'small ruby', 'small saphire', 'small diamond', 'golden legs', 'small topaz', 'small emerald', 'small amethyst', 'small rubies', 'small saphires', 'small diamonds', 'small topazs', 'small emeralds', 'small amethysts', 'nightmare blade', 'wand of voodoo', 'underworld rod',
        'nighmare blade', 'glacier kilt', 'some grimeleech wings', 'magma legs', 'demon horn', 'fire mushroom', 'great mana potion', 'great spirit potion', 'assassin star', 'assassin stars',
        'spiked squelcher', 'onyx flail', 'chaos mace', 'skull helmet', 'skullcracker armor',
        'underworld rod', 'golden legs', 'ruthless axe', 'golden armor', 'haunted blade', 'magic plate armor', 'demon shield', 'terra legs', 'grimeleech wing', 'dreaded cleaver', 'skull staff', 'dreaded cleaver', 'Spellweaver/s robe', 'pair of hellflayer horns', 'fire axe','mercenary sword', 'platinum coin', 'demonic essence', 'gold ingot', 'vexclaw talon'}}
	}
  
for i = 1, #CONFIG do
    for j = 1, #CONFIG[i]['LIST'] do
        CONFIG[i]['LIST'][j] = Item.GetItemIDFromDualInput(CONFIG[i]['LIST'][j])
    end
end
  
local bodies = {'The', 'Demonic', 'Dead', 'Slain', 'Dissolved', 'Remains', 'Elemental'}
 
function Container:isFull(id)
    for spot = 0, self:ItemCount()-1 do
        local data = self:GetItemData(spot)
        if (isItemStackable(id) and data.id == id and data.count ~= 5) then
            return false
        elseif not isItemStackable(id) then
            return getContainerItemCount(self._index) == getContainerItemCapacity(self._index)
        end
    end
end
 
while (true) do
    for i = #Container.GetAll()-1, 0, -1 do
        local c = Container.New(i)
        if (c:isOpen() and table.contains(bodies, string.match(c:Name(), '%a+'))) then
            for j = 1, #CONFIG do
                for spot = c:ItemCount()-1, 0, -1 do
                    local spotData = c:GetItemData(spot)
                    if table.contains(CONFIG[j]['LIST'], spotData.id) then
                        local desti = Container.New(CONFIG[j]['BP'])
                        if (Self.Cap() > (Item.GetWeight(spotData.id)*spotData.count) and not desti:isFull(spotData.id)) then
                            if isItemStackable(spotData.id) then
                                c:MoveItemToContainer(spot, desti:Index(), 0)
                            else
                                c:MoveItemToContainer(spot, desti:Index(), desti:ItemCount())
                            end
                        elseif (desti:isFull(spotData.id) and Item.isContainer(desti:GetItemData(desti:ItemCount()-1).id)) then
                            desti:UseItem(desti:ItemCount()-1, true)
                        end
                    end
                end
            end
        end
    end
    wait(5)
end