dofile("Forgee.lua") 
---------------------
while (true) do 
    if (playersAround(7) == 0) or (Self.TargetID() ~= 0) or ((monstersAround(1) > 1) and (playersAround(1) == 0)) or ((monstersAround(1) > 0) and (playersAround(3) == 0)) then 
        setTargetingEnabled(true)
        wait(500)
    else
        setTargetingEnabled(false)
        wait(500)
    end 
end  
