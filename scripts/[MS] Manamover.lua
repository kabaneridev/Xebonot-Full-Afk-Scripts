ManaBp = "Zaoan Chess box"

ManaPotID = Item.GetID("ultimate mana potion")
GSP = Item.GetID("icicle rune")

Module.New("MoveManas", function(module)

if (Self.ItemCount(ManaPotID) >= 1) or (Self.ItemCount(GSP) >=1)then
				local MainBp = Container.GetFirst()
				local DestinationBp = Container.GetByName(ManaBp)
				for spot = 0, MainBp:ItemCount() do
					local item = MainBp:GetItemData(spot) 				
						if (item.id == ManaPotID) or (item.id == GSP) then
						MainBp:MoveItemToContainer(spot, DestinationBp:Index(), 0)
						module:Delay(500)					
						break
						end
		module:Delay(200)
		end
end 
end)