local RingID = 3097

 while true do
    if Self.Ring().id == 0 then
        Self.Equip(RingID, "ring")
    end
    wait(100,300)
end  