-- Reopen backpacks after reconnect 
  
AmountRecntBps = 5 -- MainBP + RecconectBps 
  
ReconnectBps = {{'Golden Backpack',true}, {'Demon Backpack',true}, {'Zaoan Chess Box',true}, {'Jewelled Backpack',true}} -- starting with 2nd bp, without main bp.  
  
-- DO NOT TOUCH BELOW! 
  
Module.New('reconnect', function() 
    if #Container.GetAll() < AmountRecntBps and not Self.isInPz() then 
        Cavebot.Stop() 
    Self.CloseContainers() 
        Self.OpenMainBackpack(true):OpenChildren(unpack(ReconnectBps)) 
        Cavebot.Start() 
    end 
end)