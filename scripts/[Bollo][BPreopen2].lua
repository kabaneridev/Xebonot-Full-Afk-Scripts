local bps = 4 -- main + sub-backpacks (backpacks must be sorted in the order you want them to get opened)
local minimize = true -- minimizes all backpacks
 
local lastTime = os.clock()
 
Module.New("reconnect", function()
    if (os.difftime(os.clock(), lastTime) > 1) then
        local ping = Self.Ping()
        Cavebot.Stop()
        while (#Container.GetAll() == 0) do
            Self.OpenMainBackpack(minimize)
            wait(ping + 500)
        end
        local main = Container.GetFirst()
        for spot = 0, main:ItemCapacity()-1 do
            if (#Container.GetAll() == bps) then
                break
            elseif Item.isContainer(main:GetItemData(spot).id) then
                main:UseItem(spot, false)
                wait(ping + 500)
                if (minimize) then
                    Container.GetLast():Minimize()
                    wait(ping + 500)
                end
            end
        end
        Cavebot.Start()
    end
    lastTime = os.clock()
end)