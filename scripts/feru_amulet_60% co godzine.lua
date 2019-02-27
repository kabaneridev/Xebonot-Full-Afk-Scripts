-- Config
local ssaID = 22768 -- ID amuletu
local health = 60 -- x% to use

-- Don't touch this if you don't know what are you doing
Self.HealthPercent = function()
return math.abs(Self.Health()/(Self.MaxHealth()*0.01))
end 

Module.New('eat', function(mod)
if Self.HealthPercent() <= health then Self.UseItem(ssaID, "amulet") 
Wait (600000)
end

end)

