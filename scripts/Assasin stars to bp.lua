--Stusse--
ManaBp = "backpack of holding"

ManaPotID = Item.GetID("prismatic bolt")
SDID = Item.GetID("ultimate spirit potion")
SHPID = Item.GetID("assassin star")
GHPID = Item.GetID("strong mana potion")

while true do

if (Self.ItemCount(ManaPotID) >= 1) or (Self.ItemCount(SDID) >=1) or (Self.ItemCount(SHPID) >=1) or (Self.ItemCount(GHPID) >=1) then
				local MainBp = Container.GetFirst()
				local DestinationBp = Container.GetByName(ManaBp)
				for spot = 0, MainBp:ItemCount() do
					local item = MainBp:GetItemData(spot) 				
						if (item.id == ManaPotID) or (item.id == SDID) or (item.id == SHPID) or (item.id == GHPID) then
						MainBp:MoveItemToContainer(spot, DestinationBp:Index(), 0)
						wait(50)					
						break
						end
		wait(50)
		end
end 
end

