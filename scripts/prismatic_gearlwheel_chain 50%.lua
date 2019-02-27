-- Config

local ssaID = 16113 -- Id of your stone skin amulet

local AmuOLD = 21170 -- Id of your normal amulet

local health = 50 -- x% to equip your ssa

local healthUNQ = 95 -- x% to UNequip your ssa



-- Don't touch this if you don't know what are you doing

Self.HealthPercent = function()

return math.abs(Self.Health()/(Self.MaxHealth()*0.01))

end 



Module.New('ssaquip', function(mod)

	if Self.HealthPercent() <= health and Self.Amulet().id == AmuOLD then

		Self.Equip(ssaID, "amulet")

	end

	

	if Self.HealthPercent() >= healthUNQ then

		Self.Equip(AmuOLD, "amulet")

	end

end)
