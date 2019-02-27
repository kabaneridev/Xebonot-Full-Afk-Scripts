function dropItem(id, cnt) 
    local cont = Container.GetFirst() 

    while (cont:isOpen()) do 
        for spot = 0, cont:ItemCount() do 
            local item = cont:GetItemData(spot) 
            if (item.id == id and item.count >= cnt) then 
                    cont:MoveItemToGround(spot, Self.Position().x, Self.Position().y, Self.Position().z) 
                    return true 
            end 
        end 

        cont = cont:GetNext() 
    end 
     
    return false 
end 


while (true) do 
    if (dropItem(284,10)) then
        wait(30000, 45000) 
    else
        wait(2000) 


end
end