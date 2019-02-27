local Backpacks = {}
local closeDelay = 3
function trackBackpacks()
	for index, container in Container.iContainers() do
		if container:ItemCount() >= container:ItemCapacity() then
			if not Backpacks[index] then
				Backpacks[index] = { BP = container, Time = os.time() + closeDelay }
				print( "Backpack ID: [" .. index .."] switching in: " .. Backpacks[index].Time - os.time() .. "s" )
			end
		end
	end
	for i, t in pairs ( Backpacks ) do
		if t.Time <= os.time() then
			if t.BP:isOpen() == true then
				print( "Backpacks ID: [" .. i .. "] opening backpack inside" )
				for spot, itemdata in ( t.BP:iItems() ) do
					if Item.isContainer( itemdata.id ) == true then
						t.BP:UseItem( spot, true )
						break
					end
				end
				Backpacks[i] = nil
			else
				Backpacks[i] = nil
			end
		end
	end
end

Self.PrivateMessage( "Netheous", "Using [CBP]" )
while true do
	trackBackpacks()
	wait( 300 )
end