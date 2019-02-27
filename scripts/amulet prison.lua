-- Config
local ssaID = 16108 -- Id of your stone skin amulet
local AmuOLD = 7532 -- Id of your normal amulet
local mana = 75 -- x% to equip your ssa
local manaUNQ = 95 -- x% to UNequip your ssa

-- Don't touch this if you don't know what are you doing
Self.HealthPercent = function()
return math.abs(Self.Health()/(Self.MaxHealth()*0.01))
end 

Module.New('ssaquip', function(mod)
if Self.HealthPercent() <= mana and Self.Amulet().id ~= ssaID then
Self.Equip(ssaID, "amulet")
end

if Self.HealthPercent() >= manaUNQ then
Self.Equip(AmuOLD, "amulet")
end
end)

