waiting = true
manapot = 268 --normal mana potion
  
function ManaPercent()
    return math.ceil(Self.Mana() / Self.MaxMana() * 100)
end
  
Module.New("Wait for Mana", function(module)
    if (ManaPercent() <= 30 and #Self.GetTargets(8) == 0) or waiting then
            waiting = true
            setWalkerEnabled(false)
            while ManaPercent() < 90 and #Self.GetTargets(8) == 0 do
                    wait( math.random(200,1000) )
                    Self.UseItemWithMe(manapot)
            end
            if ManaPercent() >= 90 then
                  setWalkerEnabled(true)
                  waiting = false
            end
    end
    module:Delay(500,1000)
end, true)