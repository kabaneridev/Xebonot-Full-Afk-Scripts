local MinCap = 50  
Module.New('drop gold', function(module) 
    if (Self.ItemCount(3031) > 0) and (Self.Cap() < MinCap) then 
        Self.DropItem(Self.Position().x, Self.Position().y, Self.Position().z, 3031) 
        module:Delay(1000) 
    end 
end)  