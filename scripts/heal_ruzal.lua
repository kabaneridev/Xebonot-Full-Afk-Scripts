function pumpMana()
    local charToPump = Creature.New("Marcin Ruzal Rozalski")
    local charToPumpPos = charToPump:Position()
    local manaId = 7643  -- rune, pot ID etc...
    local healthPercent = 40  -- friends hp % below this value to heal
    local bpName = "Backpack" -- name of the container where the pots are
    local distance = 2  -- range to target, if u want to limit it, otherwise set to 8
    local backpack = Container.GetByName(bpName)
    if (Self.DistanceFromPosition(charToPumpPos.x, charToPumpPos.y, charToPumpPos.z) <= distance) and (Self.Position().z == charToPumpPos.z) and (charToPump:HealthPercent() < healthPercent) then
        for spots = 0, backpack:ItemCount() do
            local item = backpack:GetItemData(spots)
            if (item.id == manaId) then
                backpack:UseItemWithCreature(spots, charToPump:ID())
                break
            end
        end
    end
end 
while true do
pumpMana()
wait(900,1100)
end