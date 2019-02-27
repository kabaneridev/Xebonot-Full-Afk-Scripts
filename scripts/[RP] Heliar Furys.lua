-----SETTINGS--------------------------------------------------------------
--Supples--
local ManaID = 237 --- Which mana potions are you using? 
local MinMana = 10 --- How many mana potions until you leave the hunt.
local MaxMana = 20 --- How many mana potions you begin the hunt with.
local ManaPrice = 80 --- What is the price of your selected mana potions?

local HealthID = 7642 --- Which health potions are you using?
local MinHealth = 200 --- How many health potions until you leave the hunt.
local MaxHealth = 1050 --- How many health potions you begin the hunt with.
local HealthPrice = 190 --- What is the price of your selected mana potions?

local ArrowID = 7368 ---- Normal Spear ID is 3277 . Royal Spear ID is 7378
local ArrowPrice = 100 ---- Normal Spear is 9gp, Royal Spear is 15gp (Note: If you use Royal Spears, change the spear ID in support > equipment manager and change spears in looter to floor, or not to loot at all).
local MaxArrow = 200 ---- Spear amount to refill too. 
local MinArrow = 100 ---- Minimum Spears to exit the cave

local SoftBoots = true		--- Do you want to use softboots? 'true' or 'false'

--CAP--
local MinCap = 0 --- Leaves spawn when character reaches this cap.

--BP SETUP--
local MainBp  = "beach backpack" ----- Main Backpack
local GoldBp  = "fur backpack" ---- Backpack to put gold in
local LootBp  = "golden backpack" ---- Potion Bp
local AmmoBp  = "zaoan chess box" ---- Potion Bp

-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
--------------------
--------------------
---------RP---------
~~~~HELIAR FURY BY MATHIA~~~~
]]
    print([[
~~~~HELIAR FURY BY MATHIA~~~~
--------------------
---------RP---------
--------------------]])
    wait(30000)
	
--FUNCTIONS--
function SellItems(item) -- item = item ID
    wait(300, 1700)
    Self.ShopSellItem(item, Self.ShopGetItemSaleCount(item))
    wait(900, 1200)
        end
		
function SellItems(item) -- item = item ID
    wait(300, 1700)
    Self.ShopSellItem(item, Self.ShopGetItemSaleCount(item))
    wait(900, 1200)
        end


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

function Self.ShopSellItemsDownTo(item, count)
	wait(300, 1700)
	Self.ShopSellItem(item, Self.ShopGetItemSaleCount(item))
	wait(900, 1200)
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{LootBp, true},{AmmoBp, true})
		setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
elseif (labelName == "HuntHardcore") then
		print("Hunt Hardcore TRUE/FALSE")	Walker.ConditionalGoto((HuntHardcore) and (Self.ItemCount(237) > MinMana) and (Self.ItemCount(7642) > MinHealth), "HuntHardcore", "NoHardcore")
----------------------------------------------------------------------------------------------------
	elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 850) then
     print("Low Stamina Go Offline Training")
	 Walker.Goto("CheckOffline")	
	 else
     print("Go To Hunt")
	 Walker.Goto("PotionCheck")
     end
     Walker.Start()
----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "CheckSoft") then  
		Walker.Stop()
		if ((SoftBoots == true) and (Self.ItemCount(6530) > 0)) then
			print([[Worn Soft boots =2 1, lets go refill..]])
			Walker.Goto("RefillSoft")
		else
			print([[Skip softs.]])
			Walker.Goto("DoneSoft")
		end
		wait(1500,2000)
		Walker.Start()	

	elseif (labelName == "SoftBank") then  
		Walker.Stop()
		wait(150,200)
		Self.SayToNpc("hi")
		wait(150,200)
		Self.SayToNpc("transfer")
		wait(150,200)
		Self.SayToNpc("all")
		wait(150,200)
		Self.SayToNpc("My Little Pony")
		wait(150,200)
		Self.SayToNpc("yes")
		wait(150,200)
		Walker.Start()
		
	elseif (labelName == "ToThais") then  
		Walker.Stop()
		Creature.Follow("Captain Gulliver")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("thais")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "ToVenore") then  
		Walker.Stop()
		Creature.Follow("Captain Bluebear")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
   
   elseif (labelName == "SoftBoots") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Soft Boots")
		wait(1500,2000)
		Self.SayToNpc("yes")
		Self.SayToNpc("Soft Boots")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()			
   		
     elseif (labelName == "BackToThais") then  
		Walker.Stop()
		Creature.Follow("Captain Fearless")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("thais")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()  
		
	elseif (labelName == "BackToOramond") then  
		Walker.Stop()
		Creature.Follow("Captain Bluebear")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("oramond")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()

	elseif (labelName == "Quest") then  
		Walker.Stop()
		Creature.Follow("Terrence")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Taking the Rot Out")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	

elseif (labelName == "TalkQuest") then  
		Walker.Stop()
		Creature.Follow("Terrence")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Taking the Rot Out")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()

elseif (labelName == "RootQuest") then  
		Walker.Stop()
		Creature.Follow("Chavis")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("food")
		wait(1500,2000)
		Self.SayToNpc("root")
		wait(1500,2000)
		Walker.Start()		

elseif (labelName == "Scores") then  
		Walker.Stop()
		Creature.Follow("Doubleday")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("scores")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()

elseif (labelName == "ToPortHope") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Port Hope")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
	
elseif (labelName == "PHtoVenore") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()

elseif (labelName == "GryzzlyAdams") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()

elseif (labelName == "HydraTask") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("bye")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("hydras")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()		

elseif (labelName == "ToWest") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("west")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
elseif (labelName == "ToEWast") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("east")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
		
		elseif (labelName == "ToVenore") then  
		Walker.Stop()
		Creature.Follow("Captain Bluebear")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
   
   elseif (labelName == "SoftBoots") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Soft Boots")
		wait(1500,2000)
		Self.SayToNpc("yes")
		Self.SayToNpc("Soft Boots")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()			
   		
elseif (labelName == "ToPortHope") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Port Hope")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "ToThais") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("thais")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "BackToThais") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("thais")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()			
		
	elseif (labelName == "ToAsylum") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("asylum")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()	
		
   		
elseif (labelName == "BackToPortHope") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Port Hope")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()		
	
elseif (labelName == "PHtoVenore") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
elseif (labelName == "ToWest") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("west")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()		

elseif (labelName == "GryzzlyAdams") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("promotion")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		wait(1500,2000)
		Self.SayToNpc("bye")
		wait(1500,2000)
		Walker.Start()

elseif (labelName == "UndeadsTask") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("bye")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("undead dragons")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()		
		
		elseif (labelName == "MedusaTask") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("bye")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("medusae")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()		
		
		elseif (labelName == "SerpentSpawnTask") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("bye")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("serpent spawns")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()		

elseif (labelName == "ToWest") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("west")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
elseif (labelName == "ToEast") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("east")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
	
	elseif (labelName == "ToPortHope") then  
		Walker.Stop()
		Creature.Follow("Captain Fearless")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("port hope")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
		
			
	elseif (labelName == "ToHeliar") then  
		Walker.Stop()
		Creature.Follow("Captain Fearless")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("heliar")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
		
		
		
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
	SellItems(7404)
	wait(100, 120)
	SellItems(8061)
	wait(100, 120)
	SellItems(3342)
	wait(100, 120)
    wait(100, 150)
    SellItems(3392)
    wait(100, 120)
	SellItems(7402)
        wait(100, 150)
        SellItems(3032)
		wait(100, 150)
	    SellItems(3029)
		wait(100, 150)
	    SellItems(3033)
		wait(100, 150)
		SellItems(9057)
		wait(100, 150)
		SellItems(9030)
		wait(100, 150)
		SellItems(3027)
		wait(100, 150)
	Walker.Start()
		
		   elseif (labelName == "Rashid1") then
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
    wait(100, 150)
    SellItems(3392)
    wait(100, 120)
	SellItems(7402)
        wait(100, 150)
        SellItems(3032)
		wait(100, 150)
	    SellItems(3029)
		wait(100, 150)
	    SellItems(3033)
		wait(100, 150)
		SellItems(9057)
		wait(100, 150)
		SellItems(9030)
		wait(100, 150)
		SellItems(3027)
		wait(100, 150)
	Walker.Start()		
	
			   elseif (labelName == "Rashid2") then
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
    wait(100, 150)
    SellItems(3392)
    wait(100, 120)
	SellItems(7402)
        wait(100, 150)
        SellItems(3032)
		wait(100, 150)
	    SellItems(3029)
		wait(100, 150)
	    SellItems(3033)
		wait(100, 150)
		SellItems(9057)
		wait(100, 150)
		SellItems(9030)
		wait(100, 150)
		SellItems(3027)
		wait(100, 150)
	Walker.Start()			
				
		
---------------------------------------------------------------------------------------------------		
    elseif (labelName == "Bank") then
			local withdrawManas = (MaxMana-Self.ItemCount(ManaID))*ManaPrice
			local withdrawHealths = (MaxHealth-Self.ItemCount(HealthID))*HealthPrice
			local withdrawArrows = (MaxArrow-Self.ItemCount(ArrowID))*ArrowPrice
			setWalkerEnabled(false)
			Self.SayToNpc({"hi", "deposit all", "yes"}, 65)
			if (withdrawHealths > 0) then
                Self.SayToNpc({"withdraw " .. withdrawHealths, "yes"}, 65)
            end
			if (withdrawManas > 0) then
                Self.SayToNpc({"withdraw " .. withdrawManas, "yes"}, 65)
            end
            if (withdrawArrows > 0) then
                Self.SayToNpc({"withdraw " .. withdrawArrows, "yes",}, 65)
            end
			Self.SayToNpc({"hi", "withdraw 1000", "yes"}, 65)
			wait(1500,2000)
			Self.SayToNpc({"balance"}, 65)
            setWalkerEnabled(true)
		sleep(math.random(600, 1100)) 
----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) or (Self.ItemCount(ArrowID) < MaxArrow) then
						print("Failed buying pots - Trying again")
				setWalkerEnabled(true) 
			            gotoLabel("Bank")
			else
				        print("GoToHunt")
				setWalkerEnabled(true) 
						gotoLabel("GoToHunt")
			end

----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		print("## Kupuje Potiony ##.")
		if (Self.ItemCount(ManaID) < MaxMana or Self.ItemCount(HealthID) < MaxHealth) then
			Self.SayToNpc({"hi", "flasks", "yes", "yes", "trade"}, 65)
		sleep(math.random(600, 1100))
			if (Self.ItemCount(ManaID) < MaxMana) then
				Self.ShopBuyItem(ManaID, (MaxMana - Self.ItemCount(ManaID)))
		sleep(math.random(600, 1100))
			end
			if (Self.ItemCount(HealthID) < MaxHealth) then
				Self.ShopBuyItem(HealthID, (MaxHealth - Self.ItemCount(HealthID)))
		sleep(math.random(600, 1100))
			end
		sleep(math.random(600, 1100))
		end
		setWalkerEnabled(true)
----------------------------------------------------------------------------------------------------
    elseif (labelName == "DepositItems") then
		setWalkerEnabled(false)
            Self.ReachDepot()
            Self.DepositItems(
   	{5906, 0}, 	-- spider silk
		{9660, 0}, 	-- spider silk
		{3030, 0}, 	-- spider silk
		{238, 4}, 	-- spider silk
		{7643, 0}, 	-- iron ore
		{3034, 0}, 	-- spider silk
		{5880, 0}, 	-- iron ore
		{3032, 0}, 	-- small emerald
		{3033, 0}, 	-- strand of medusa hair
		{9057, 0}, 	-- snake skin 
		{10304, 0}, 	-- winged tail
		{9057, 0}, 	-- snake skin 
		{5944, 0}, 	-- winged tail
		{9694, 0}, 	-- snake skin 
		{5944, 0}, 	-- winged tail
		{3033, 0}, 	-- snake skin 
		{3033, 0}, 	-- winged tail
		{5954, 0}, 	-- winged tail
		{6499, 0}, 	-- winged tail
		{21168, 1}, 	-- winged tail	
	    {3063, 1}, 	-- mercenary sword
		{823, 1}, 	-- terra legs
		{3320, 1}, 	-- terra mantle
		{3381, 1}, 	-- crown armor
		{3436, 1},	-- medusa shield
		{21177, 1},	-- medusa shield
		{10282, 0}, 	-- hydra head
		{9667, 0}, 	-- hydra head
		{9058, 0}, 	-- hydra head
		{9632, 0}, 	-- ancient stone
		{3369, 1}, 	-- ancient stone
		{8063, 1}, 	-- ancient stone
		{3354, 1}, 	-- ancient stone
		{3428, 1}, 	-- ancient stone
		{7393, 1}, 	-- ancient stone
		{3048, 1}, 	-- ancient stone
		{8896, 2}, 	-- ancient stone
		{9302, 1}, 	-- sackred tree amulet
		{3033, 0}, 	-- stone skin amulet
		{3029, 0}, 	-- zaoan sword
		{10313, 0}, 	-- zaoan sword
		{3281, 1}, 	-- guardian halberd
		{7382, 1}, 	-- stone skin amulet
		{5884, 0}, 	-- stone skin amulet
		{10282, 0}, 	-- stone skin amulet
		{3428, 1}, 	-- zaoan sword
		{3061, 0}, 	-- guardian halberd
		{7414, 1}, 	-- royal helmet
		{238, 2}, 	-- royal helmet
		{239, 2}, 	-- royal helmet	
	    {3039, 1}, 	-- royal helmet
		{3370, 1}, 	-- royal helmet
		{3364, 1}, 	-- royal helmet
		{8061, 1}, 	-- royal helmet
		{3081, 1}, 	-- stone skin amulet
		{10390, 1}, 	-- zaoan sword
		{3315, 1}, 	-- guardian halberd
		{3366, 1}, 	-- guardian halberd
		{7413, 1}, 	-- royal helmet
		{3392, 1}, 	-- royal helmet
        {7301, 1}, 	-- guardian halberd
		{5741, 1}, 	-- guardian halberd
		{7416, 1}, 	-- royal helmet
		{3392, 1}, 	-- royal helmet
		{8082, 1}, 	-- royal helmet
		{3364, 1}, 	-- royal helmet
		{7412, 1}, 	-- royal helmet
		{5801, 1}, 	-- royal helmet
		{3354, 1}, 	-- royal helmet
		{8074, 1}, 	-- spellbook of mind control
		{3414, 1}, 	-- dragon slayer
		{3420, 1}, 	-- boots of haste
		{7382, 1}, 	-- boots of haste
				{10316, 1}, 	-- boots of haste
				{10438, 1}, 	-- boots of haste
						{3041, 1}, 	-- boots of haste
		{7368, 2}, 	-- boots of haste
		{7418, 1} 	-- noble axe
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
  ----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(HealthID) > MinHealth) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 840) then
				print("Hunt Again..:")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Go to refill")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------				
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("&Targeting Wylaczony !&")
		wait(900, 1200)
		
		elseif (labelName == "Looteroff") then 
       	setLooterEnabled(false)	
        print("&Looter OFF!&")
		wait(900, 1200)
		
		elseif (labelName == "LooterOn") then 
       	setLooterEnabled(true)	
        print("&Looter ON !&")
		wait(900, 1200)
-------------------------------------------------------------------------------------------------------------
		elseif (labelName == "CheckSoftHunt") then  
		Walker.Stop()
		if ((SoftBoots == true) and (Self.ItemCount(6530) > 0)) then
			print([[Exit cave for repair softs]])
			Walker.Goto("Refill")
		else
			print([[Softs good]])
			Walker.Goto("Check")
		end
		wait(1500,2000)
		Walker.Start()		
		----------------------------------------------------------------------------------------------------
 elseif (labelName == "TargetingOn") then 
       	setTargetingEnabled(true)	
         print("&Targeting Wlaczony !&")
		 wait(900, 1200)
		 
 elseif (labelName == "LooterOff") then 
       	setLooterEnabled(false)	
         print("Looter Off")
		 wait(900, 1200)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 elseif (labelName == "LooterOn") then 
       	setLooterEnabled(true)	
         print("Looter On")
		 wait(900, 1200)	
----------------------------------------------------------------------------------------------------
elseif (labelName == "BoltBuy") then
			setWalkerEnabled(false)
			wait(900, 1200)
			Self.SayToNpc({"Hi", "Trade"}, 65)
			wait(900, 1200)
			Self.ShopBuyItem(ArrowID, (MaxArrow - Self.ItemCount(ArrowID)))
			wait(900, 1200)
			Self.ShopBuyItem(ArrowID, (MaxArrow - Self.ItemCount(ArrowID)))
			wait(900, 1200)
			Self.ShopBuyItem(ArrowID, (MaxArrow - Self.ItemCount(ArrowID)))
			wait(900, 1200)
			Self.ShopBuyItem(ArrowID, (MaxArrow - Self.ItemCount(ArrowID)))
			wait(900, 1200)
			setWalkerEnabled(true)
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
        if (Self.Cap() > MinCap and Self.ItemCount(HealthID) > MinHealth) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 840) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("**Wracam Do Miasta !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check2") then
       	setWalkerEnabled(false)	
		  if (Self.Cap() > MinCap and Self.ItemCount(HealthID) > MinHealth) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 840) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("ToCheck1")	
				print("**Sprawdzam Supple !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check3") then
       	setWalkerEnabled(false)	
	  if (Self.Cap() > MinCap and Self.ItemCount(HealthID) > MinHealth) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 960) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("ToCheck3")	
				print("**Sprawdzam Supple !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------	 
elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 960) then
     os.exit()
     else
     Walker.Goto("CheckSoft")
     end
     Walker.Start()
----------------------------------------------------------------------------------------------------
end
end