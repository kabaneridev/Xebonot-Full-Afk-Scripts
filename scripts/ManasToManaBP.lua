--Stusse--
ManaBp = "Backpack of holding"

ManaPotID = Item.GetID("mana potion")
SDID = Item.GetID("avalanche rune")
SHPID = Item.GetID("sudden death rune")
GHPID = Item.GetID("great health potion")

while true do

if (Self.ItemCount(ManaPotID) >= 1) or (Self.ItemCount(SDID) >=1) or (Self.ItemCount(SHPID) >=1) or (Self.ItemCount(GHPID) >=1) then
				local MainBp = Container.GetFirst()
				local DestinationBp = Container.GetByName(ManaBp)
				for spot = 0, MainBp:ItemCount() do
					local item = MainBp:GetItemData(spot) 				
						if (item.id == ManaPotID) or (item.id == SDID) or (item.id == SHPID) or (item.id == GHPID) then
						MainBp:MoveItemToContainer(spot, DestinationBp:Index(), 0)
						wait(500)					
						break
						end
		wait(200)
		end
end 
end

