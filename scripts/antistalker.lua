local runeID = 3161 --Avalanche
 
BattleMessageProxy.OnReceive('Anti Stalker', function(proxy, message)
    if message:find("You lose (.+) hitpoints due to an attack by a stalker.") and Self.TargetID() == 0 then
        Walker.Stop()
        Self.UseItemWithMe(runeID)
        Walker.Start()
    end
end)