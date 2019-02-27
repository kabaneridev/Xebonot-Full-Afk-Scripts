Self.OpenLocker()
withdraw()
local container = 'backpack' --write your main bp's name
local InboxFull = true -- don't touch
local BpsCount = 6 -- amount of your stacked bps, these have to be stacked properly and without any items inside
local CurItems = 0  -- don't touch
local BpFull = false -- don't touch
function withdraw()
    local cfrom = Container.New('Your Inbox')
    local cto = Container.New(container)
    while not cfrom:isOpen() do
        cfrom = Container.New('Your Inbox')
        local dp = Container.New('Locker')
        for mailspot, touse in dp:iItems() do
            if touse.id == 12902 then
                dp:UseItem(mailspot, true)
                wait(500, 1700)
            end
        end
    end
    if cfrom:isOpen() and cto:isOpen() then
        while (cfrom:ItemCount() >= 0) do
            local slot = 0
            if(cfrom:ItemCount() == 0) then
                InboxFull = false
                break
            else
                InboxFull = true
            end
            local items = cfrom:GetItemData(slot)
            if Self.Cap() - Item.GetWeight(items.id) < 1 then
                error('You need '..math.floor((Item.GetWeight(items.id)+1)-Self.Cap())..' cap to pick this item.')
                break
            end
            while Self.Cap() - Item.GetWeight(items.id) >= 1 do
                if not cto:isFull() then
                    if (CurItems < (BpsCount * 19)) then
                        cfrom:MoveItemToContainer(slot, cto:Index(), 19, 100)
                        wait(300, 1200)
                        CurItems = CurItems + 1
                        break
                    else
                        BpFull = true
                        break
                    end
                else
                    for spot, item in cto:iItems() do
                        if Item.isContainer(item.id) then
                            cto:UseItem(spot, true)
                            wait(500, 1600)
                        end
                    end
                end
            end
            if (BpFull == true) then
                error('Your bp is full.')
                break
            end
        end
    end
end