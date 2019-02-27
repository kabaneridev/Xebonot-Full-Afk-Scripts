-----SETTINGS--------------------------------------------------------------
--POTIONS--
local ManaID = 23373 --- Which mana potions are you using? 
local MinMana = 100 --- How many mana potions until you leave the hunt.
local MaxMana = 1000 --- How many mana potions you begin the hunt with.
local ManaPrice = 350 --- What is the price of your selected mana potions?
local HealthID = 3155 --- Which health potions are you using?
local MinHealth = 100 --- How many health potions until you leave the hunt.
local MaxHealth = 2000 --- How many health potions you begin the hunt with.
local HealthPrice = 105 --- What is the price of your selected mana potions?

--CAP--
local MinCap = 10 --- Leaves spawn when character reaches this cap.

--AUTOSELLING--
local SoftBoots = true	--- Do you want to use softboots? 'true' or 'false'

--BP SETUP--
local MainBp  = "backack" ----- Main Backpack



-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
Melting horn]]
    print([[
Melting horn]])
    wait(30000)
	
--FUNCTIONS--

function SellItems(item) -- item = item ID
    wait(300, 1700)
    Self.ShopSellItem(item, Self.ShopGetItemSaleCount(item))
    wait(900, 1200)
        end

function NpcConv(...)
    for _, str in ipairs(arg) do
        wait((tostring(str):len() / 125) * 60000 * math.random(1.1, 1.8))
        Self.SayToNpc(str)
    end
end

function buyitems(item, count)
	count = tonumber(count) or 1
	repeat
		local amnt = math.min(count, 100)
		if(Self.ShopBuyItem(item, amnt) == 0)then
			return printf("ERROR: failed to buy item: %s", tostring(item))
		end
        wait(200,500)
		count = (count - amnt)
	until count <= 0
end

Self.ReachDepot = function (tries)
	local tries = tries or 3
	setWalkerEnabled(false)
	local DepotIDs = {3497, 3498, 3499, 3500}
	local DepotPos = {}
	for i = 1, #DepotIDs do
		local dps = Map.GetUseItems(DepotIDs[i])
		for j = 1, #dps do
			table.insert(DepotPos, dps[j])
		end
	end
	local function gotoDepot()
		local pos = Self.Position()
		print("Depots found: " .. tostring(#DepotPos))
		for i = 1, #DepotPos do
			location = DepotPos[i]
			Self.UseItemFromGround(location.x, location.y, location.z)
			wait(1000, 2000)
			if Self.DistanceFromPosition(pos.x, pos.y, pos.z) >= 1 then
				wait(5000, 6000)
				if Self.DistanceFromPosition(location.x, location.y, location.z) == 1 then
					setWalkerEnabled(true)
					return true
				end
			else
				print("Ktos blokuje dostep do depo. Probuje dojsc do innej skrzynki.")
			end
		end
		return false
	end
	
	repeat
		reachedDP = gotoDepot()
		if reachedDP then
			return true
		end
		tries = tries - 1
		sleep(100)
		print("Nie moge z depozytowac itemkow. " .. tries .. " probuje jeszcze raz.")
	until tries <= 0

	return false
end

Map.GetUseItems = function (id)
    if type(id) == "string" then
        id = Item.GetID(id)
    end
    local pos = Self.Position()
    local store = {}
    for x = -7, 7 do
        for y = -5, 5 do
            if Map.GetTopUseItem(pos.x + x, pos.y + y, pos.z).id == id then
                itemPos = {x = pos.x + x, y = pos.y + y, z = pos.z}
                table.insert(store, itemPos)
            end
        end
    end
    return store
end

Self.ReachNpc = function(name, tries)
        local npc = Creature.GetByName(name)
        if (npc:DistanceFromSelf() > 3) then
                tries =  tries or 15
                repeat
                        local nposi = npc:Position()
                        Self.UseItemFromGround(nposi.x, nposi.y, nposi.z)
                        wait(1500)
                        tries = tries - 1
                until (npc:DistanceFromSelf() <= 3) or (tries == 0)
        end
end  

function Self.ShopSellItemsDownTo(item, count)
	wait(300, 1700)
	Self.ShopSellItem(item, Self.ShopGetItemSaleCount(item))
	wait(900, 1200)
end

setTargetingEnabled(true)
setLooterEnabled(true)


-----------------------------------------------------------------
function onWalkerSelectLabel(labelName)
----------------------------------------------------------------------------------------------------
    if (labelName == "Backpacks") then
            	setWalkerEnabled(false)
            Self.CloseContainers()
            Self.OpenMainBackpack(true)
		setWalkerEnabled(true) 
---------------------------------------------------------------------------------------------------------------------------------
        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(3212, 4694)
		setWalkerEnabled(true)	
---------------------------------------------------------------------------------------------------------------------------------
elseif (labelName == "ToSvar") then  
		Walker.Stop()
		Creature.Follow("Captain Bluebear")
		wait(150,200)
		Self.SayToNpc("hi")
		wait(150,200)
		Self.SayToNpc("svargrond")
		wait(450,600)
		Self.SayToNpc("yes")
		wait(500,600)
		Walker.Start()
						
----------------------------------------------------------------------------------------------------
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("Targeting Off")
		wait(900, 1200)
----------------------------------------------------------------------------------------------------
 elseif (labelName == "TargetingOn") then 
       	setTargetingEnabled(true)	
         print("Targeting On")
		 wait(900, 1200)
		 
 elseif (labelName == "LooterOff") then 
       	setLooterEnabled(false)	
         print("Looter Off")
		 wait(900, 1200)

 elseif (labelName == "LooterOn") then 
       	setLooterEnabled(true)	
         print("Looter On")
		 wait(900, 1200)			 				 

		   elseif (labelName == "Rashid") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
        SellItems(7418)
        wait(100, 120)
	SellItems(7402)
	wait(100, 120)
	SellItems(823)
	wait(100, 120)
	SellItems(10438)
	wait(100, 120)
	SellItems(3360)
    wait(100, 120)
	SellItems(8057)
	wait(100, 120)
	SellItems(7383)
	wait(100, 120)
	SellItems(7430)
	wait(100, 120)
	SellItems(813)
	wait(100, 120)
	SellItems(812)
	wait(100, 120)
	SellItems(8061)
	wait(100, 120)
	SellItems(3342)
	wait(100, 120)
	Walker.Start()
		 ----------------------------------------------------------------------------------------------------
end
end