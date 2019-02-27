local slots = {"head", "amulet", "backpack", "armor", "shield", "weapon", "legs", "feet", "ring", "ammo"}
local eq = {"Backpack"}

Module.New("drop eq", function()
local bp = Container.GetFirst()
local pos = Self.Position()
for i = 1, #slots do
Self.Dequip(slots[i], bp)
end
Self.DropItems(pos.x, pos.y, pos.z, eq)
end)