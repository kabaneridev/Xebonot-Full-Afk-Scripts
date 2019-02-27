local ring = 'energy ring'                     -- Name of the ring
local hpperc = {equip = 30, dequip = 90}
local manarc = {equip = 20, dequip = 10}       -- % HP to equip and % HP to dequip the ring.
  
Module.New('ring', function()
    local health = Self.Health() / Self.MaxHealth() * 100
    local mana = Self.Mana() / Self.MaxMana() * 100
    local finger = Self.Ring().id
    local item = {normal = Item.GetID(ring), active = Item.GetRingActiveID(Item.GetID(ring))}
    if health <= hpperc.equip and mana > manarc.equip then
        if finger ~= item.active then
            process = true
        end
    end
    if process then
        if finger ~= item.active then
            Self.Equip(item.normal, 'ring')
        else
            process = nil
        end
    end
    if health >= hpperc.dequip or mana < manarc.dequip then
            Self.Dequip('ring')
    end
end)