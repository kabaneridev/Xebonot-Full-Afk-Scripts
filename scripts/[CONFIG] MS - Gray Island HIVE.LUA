-----SETTINGS--------------------------------------------------------------
--POTIONS--
local ManaID = 23373 --- UMP Which mana potions are you using?  
local MinMana = 50 --- How many mana potions until you leave the hunt.
local MaxMana = 200 --- How many mana potions you begin the hunt with.
local ManaPrice = 350 --- What is the price of your selected mana potions?
local HealthID = 3155 --- SD Which health potions are you using?
local MinHealth = 150 --- How many health potions until you leave the hunt.
local MaxHealth = 700 --- How many health potions you begin the hunt with.
local HealthPrice = 105 --- What is the price of your selected mana potions?

--CAP--
local MinCap = 40 --- Leaves spawn when character reaches this cap.

--AUTOSELLING--
local SoftBoots = true	--- Do you want to use softboots? 'true' or 'false'

--BP SETUP--
local MainBp  = "backack" ----- Main Backpack
local GoldBp  = "blue backpack" ---- Backpack to put gold in
local LootBp  = "brocade backpack" ---- Loot Bp
local PotionBp  = "zaoan chess box"---- Potion Bp


-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
MS Hive by Gucci]]
    print([[
MS Hive by Gucci]])
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{LootBp, true},{PotionBp, true})
		setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 900) then
     print("Malo Staminy Daje Loga")
	 os.exit()
     else
     Walker.Goto("PotionCheck")
     end
     Walker.Start()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(3212, 4694)
		setWalkerEnabled(true)	
-------------------------------------------------------------------------------------------------------
elseif (labelName == "DepositItems") then
		setWalkerEnabled(false)
            Self.ReachDepot()
            Self.DepositItems(
    	{3326, 0}, 	
		{9057, 0}, 	
		{3554, 0},
		{3033, 0},
		{3032, 0},
		{3554, 0},
		{9058, 0},
		{3027, 0}
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)

-------------------------------------------------------------------------------
	elseif (labelName == "CheckSoft") then  
		Walker.Stop()
		if ((SoftBoots == true) and (Self.ItemCount(6530) > 0)) then
			print([[Softy rozladowane, lecimy naladowac..]])
			Walker.Goto("RefillSoft")
		else
			print([[Skip softs.]])
			Walker.Goto("DoneSoft")
		end
		wait(500,500)
		Walker.Start()	
		
	elseif (labelName == "ToVenore") then  
		Walker.Stop()
		Creature.Follow("Scrutinon")
		wait(150,200)
		Self.SayToNpc("hi")
		wait(150,200)
		Self.SayToNpc("travel")
		wait(150,200)
		Self.SayToNpc("venore")
		wait(150,200)
		Walker.Start()
   
   elseif (labelName == "SoftBoots") then  
		Walker.Stop()
		wait(150,200)
		Self.SayToNpc("hi")
		wait(100,200)
		Self.SayToNpc("Soft Boots")
		wait(150,200)
		Self.SayToNpc("yes")
		wait(150,200)
		Walker.Start()			
   		
     elseif (labelName == "ToGrayIsland") then  
		Walker.Stop()
		Creature.Follow("Captain Fearless")
		wait(150,200)
		Self.SayToNpc("hi")
		wait(150,200)
		Self.SayToNpc("gray island")
		wait(150,200)
		Self.SayToNpc("yes")
		wait(100,200)
		Walker.Start()  					
----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 900) then
				print("Enough supplies & cap, keep hunting..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Low mana pots or cap, leaving cave.")
			setWalkerEnabled(true) 
				end
	------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------	
     elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 900) then
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("Low mana pots, leaving cave.")
			setWalkerEnabled(true) 
			setTargetingEnabled(false)	
				end
----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) then
						print("Retry refill again")
				setWalkerEnabled(true) 
			            gotoLabel("Bank")
			else
						print("Going To Hunt")
				setWalkerEnabled(true) 
						gotoLabel("GoToHunt")
			end
			
----------------------------------------------------------------------------------------------------
elseif (labelName == "Bank") then
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
 elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		Creature.Follow("Sigurd")
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
----------------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(812, 994)
		setWalkerEnabled(true)	

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

		   elseif (labelName == "SellLoot") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
        SellItems(14078)
        wait(100, 120)
		SellItems(14083)
		wait(100, 120)
		SellItems(823)
		wait(100, 120)
		SellItems(14077)
		wait(100, 120)
		SellItems(14081)
		wait(100, 120)
		SellItems(14080)
		wait(100, 120)
		SellItems(14087)
		wait(100, 120)
		SellItems(14089)
		wait(100, 120)
		SellItems(14088)
		wait(100, 120)
		SellItems(14086)
		wait(100, 120)
		SellItems(14079)
		wait(100, 120)
		SellItems(14225)
		wait(100, 120)
		SellItems(14080)
		wait(100, 120)
		Walker.Start()
----------------------------------------------------------------------------------------------------
end
end