local ring = 'energy ring' -- Name of the ring
local hpperc = {equip = 60, dequip = 90} -- % HP to equip and % HP to dequip the ring.
local ringbp = "backpack of holding" -- Backpack it puts the ring into, when it's above dequip % HP.

Module.New('ring', function()
local health = Self.Health() / Self.MaxHealth() * 100
local finger = Self.Ring().id
local item = {normal = Item.GetID(ring), active = Item.GetRingActiveID(Item.GetID(ring))}
if health <= hpperc.equip then
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
if health >= hpperc.dequip then
Self.Dequip('ring', ringbp)
end
end)