RingID = 3048

while (true) do
if (Self.Health() < 400) and (Self.Ring().id ~= RingID) then
Self.Equip(RingID, "ring")
end
wait(500)
end
