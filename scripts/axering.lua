local RingID = 3092

while true do
if Self.Ring().id == 0 then
Self.Equip(RingID, "ring")
end
wait(100,600)
end