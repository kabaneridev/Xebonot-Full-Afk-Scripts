-- Config
local ssaID = 9086 -- ID Potrawki
local health = 20 -- x% to equip your ssa

-- Don't touch this if you don't know what are you doing
Self.HealthPercent = function()
return math.abs(Self.Health()/(Self.MaxHealth()*0.01))
end 

Module.New('eat', function(mod)
if Self.HealthPercent() <= health then Self.UseItem(ssaID, "amulet")
end

end)

