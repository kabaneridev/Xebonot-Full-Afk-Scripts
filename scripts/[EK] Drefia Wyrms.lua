---------------------DREFIA WYRM'S FULL AFK BY MATHIA-----------------------------------------
--POTIONS--
local ManaID = 268 --- Which mana potions are you using? 
local MinMana = 100 --- How many mana potions until you leave the hunt.
local MaxMana = 1450 --- How many mana potions you begin the hunt with.
local ManaPrice = 50 --- What is the price of your selected mana potions?
local HealthID = 7643 --- Which health potions are you using?
local MinHealth = 50 --- How many health potions until you leave the hunt.
local MaxHealth = 100 --- How many health potions you begin the hunt with.
local HealthPrice = 310 --- What is the price of your selected mana potions?
---------------OFFLINE TRAINING----------------------------------------------------------------
StaminaLogout = false ---- Do you want to logout if less then 16 hours stamina?
SkillAxe = false --- Does your character use Axe Fighting primarily? (ONLY PUT TRUE ON ONE!)
SkillSword = true --- Does your character use Sword Fighting primarily? (ONLY PUT TRUE ON ONE!)
SkillClub = false --- Does your character use Club Fighting primarily? (ONLY PUT TRUE ON ONE!)
--CAP--
local MinCap = 1 --- Leaves spawn when character reaches this cap.
--CAVEBOT OPPTIONS--
local SoftBoots = true -- Do you want to use softboots? 'true' or 'false'
local sellitems = false -- sell crossbows?
local UseStealthRing = true -- Using Stealth Ring to avoid stuck on mobs? (True Or False)
local StealthRing = 3049 -- Item ID of your stealth ring.
local AlternateRing = 3006 -- Item ID of your alternate ring. (Default: Ring of the sky)
local UseRings = false -- Sword Ring - ID 3091  | Club Ring - ID 3093 | Axe Ring - ID 3092 | Ring Backpack (Default Backpack in slot 2)
local RingID = 3091 -- Item ID of your rings.
local DefaultRing = 3006 -- . (Default: Ring of the sky)
local WithdrawRings = false -- Withdraw Rings ?- Sword Ring - ID 3091  | Club Ring - ID 3093 | Axe Ring - ID 3092 | 
local MaxRings = 4 -- How much withdraw rings?
--BP SETUP--
local MainBp  = "Crown Backpack" ----- Main Backpack
local GoldBp  = "brocade backpack" ---- Backpack to put gold in
local LootBp  = "zaoan chess box" ---- Loot Bp
local SupplesBp  = "jewelled backpack" ---- Potion Bp
-----END OF SETTINGS--------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------
registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
[EK] Drefia Wyrms By Mathia]]
    print([[
[EK] Drefia Wyrms By Mathia]])
    wait(30000)

function BuyItems(item, count) -- item = item id, count = how many you want to buy up to
	wait(900, 1200)
	if (Self.ItemCount(item) < count) then
		Self.ShopBuyItem(item, (count-Self.ItemCount(item)))
		wait(200, 500)
	end
end

Self.ReachDepot = function (tries)
	local tries = tries or 3
	Walker.Stop()
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
					Walker.Start()
					return true
				end
			else
				print("Something is blocking the path. Trying next depot.")
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
		print("Attempt to reach depot was unsuccessfull. " .. tries .. " tries left.")
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

setTargetingEnabled(true)
setLooterEnabled(true)
	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function onWalkerSelectLabel(labelName)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if (labelName == "Backpacks") then
            	setWalkerEnabled(false)
            Self.CloseContainers()
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{LootBp, true},{SupplesBp, true})
			Container.GetFirst():Minimize()
		setWalkerEnabled(true) 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "Check Skill1") then
		if (SkillAxe) then 
			gotoLabel("Axe")
		print("Go Axe Training")
				end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "Check Skill2") then
		if (SkillSword) then
			gotoLabel("Sword")
		print("Go Sword Training")
				end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "Check Skill3") then
		if (SkillClub) then
			gotoLabel("Club")
		print("Go Club Training")
				end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	   
	elseif (labelName == "WithdrawRings?") then 
	 Walker.Stop()   
    if (WithdrawRings == true) then
    print([[Withdraw Rings]])
	 Walker.Stop()
	 Self.ReachDepot()
     if (Self.ItemCount(RingID) < MaxRings) then
            Self.WithdrawItems(2, {RingID, MaxRings, (MaxRings-Self.ItemCount(RingID, 2))})
            wait(1500,1900)
    end
		else
	        Walker.Goto("NoRings")
			print([[Skip Withdraw Rings]])
	    end
 		Walker.Start()	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "CheckSoft") then  
		Walker.Stop()
		if ((SoftBoots == true) and (Self.ItemCount(6530) > 0)) then
			print([[Worn Soft boots =1 1, lets go refill..]])
			Walker.Goto("RefillSoft")
		else
			print([[Skip softs.]])
			Walker.Goto("DoneSoft")
		end
		wait(1500,2000)
		Walker.Start()	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
	elseif (labelName == "ToPortHope") then  
		Walker.Stop()
		Creature.Follow("Petros")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("port hope")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
	elseif (labelName == "ToVenore") then  
		Walker.Stop()
		Creature.Follow("Charles")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
   elseif (labelName == "SoftBoots") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Soft Boots")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()			
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 		
     elseif (labelName == "BackPortHope") then  
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
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
	elseif (labelName == "BackToDarashia") then  
		Walker.Stop()
		Creature.Follow("Charles")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("darashia")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
----------------------------------------------------------------------------------------------------
	elseif (labelName == "EquipRing") then 
		if (UseStealthRing == true) then
    	Self.Equip(StealthRing, "ring")
    	end

    elseif (labelName == "UnEquipRing") then 
    	Self.Equip(AlternateRing, "ring")
----------------------------------------------------------------------------------------------------
	elseif (labelName == "UseRings?") then 
		if (UseRings == true) then
        print("Use Rings TRUE..")
		Self.Equip(RingID, "ring")
    	else
		print("Use Rings FALSE..")
		Self.Equip(DefaultRing, "ring")
		end
----------------------------------------------------------------------------------------------------			
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 850) and (Self.ItemCount(HealthID) > MinHealth) then
				print("Enough supplies & softs, keep hunting..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Low mana pots, leaving cave.")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
 elseif (labelName == "CheckerHunt") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 850) then
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("Low mana pots,or stamina..")
			setWalkerEnabled(true) 
			setTargetingEnabled(false)	
				end
---------------------------------------------------------------						
    elseif (labelName == "Bank") then
			local withdrawManas = (MaxMana-Self.ItemCount(ManaID))*ManaPrice
			local withdrawHealths = (MaxHealth-Self.ItemCount(HealthID))*HealthPrice
			setWalkerEnabled(false)
			Self.SayToNpc({"hi", "deposit all", "yes"}, 65)
			if (withdrawHealths > 0) then
                Self.SayToNpc({"withdraw " .. withdrawHealths, "yes"}, 65)
            end
			if (withdrawManas > 0) then
                Self.SayToNpc({"withdraw " .. withdrawManas, "yes"}, 65)
            end
			Self.SayToNpc({"balance"}, 65)
            setWalkerEnabled(true)
		sleep(math.random(400, 900)) 

----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) then
						print("Retry refill again")
				setWalkerEnabled(true) 
			            gotoLabel("CheckOffline")
			else
				setWalkerEnabled(true) 
						gotoLabel("GoToHunt")
			end
----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		Creature.Follow("Asima")
		if (Self.ItemCount(ManaID) < MaxMana or Self.ItemCount(HealthID) < MaxHealth) then
			Self.SayToNpc({"hi", "flasks", "yes", "yes", "trade"}, 65)
		sleep(math.random(598, 1081))
			if (Self.ItemCount(ManaID) < MaxMana) then
				Self.ShopBuyItem(ManaID, (MaxMana - Self.ItemCount(ManaID)))
		sleep(math.random(598, 1081))
			end
			if (Self.ItemCount(HealthID) < MaxHealth) then
				Self.ShopBuyItem(HealthID, (MaxHealth - Self.ItemCount(HealthID)))
		sleep(math.random(598, 1081))
			end
		sleep(math.random(598, 1081))
		end
		setWalkerEnabled(true)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(412, 894)
		setWalkerEnabled(true)	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif (labelName == "DepositItems") then
		setWalkerEnabled(false)
            Self.ReachDepot()
            Self.DepositItems(
        {3416, 1},           
		{7430, 1},          
		{8027, 1},          
		{237, 0},          
		{3297, 1},           
		{3028, 0},          
		{5920, 0},          
		{9665, 0},           
		{5877, 1},         
		{8092, 1},         
		{7379, 1},
		{9302, 1}, 	
		{7430, 4}, 	
		{3313, 8}, 	
		{3701, 5}, 	
		{8043, 1}, 	
		{8896, 1}, 	
		{816, 1}, 	
		{8045, 1}, 	
		{9635, 1}, 	
		{5879, 1}, 	
		{5880, 1}, 	
		{3032, 1},
		{3028, 0}, 	
		{9694, 1}, 	
		{10313, 1}, 
		{7386, 1}, 	
		{812, 1}, 	
		{811, 1}, 	
		{3381, 1}, 	
		{3436, 1},	
		{3073, 1}, 
		{9304, 1}, 	
		{9302, 1}, 
		{3081, 1}, 	
		{236, 0}, 	
		{7449, 1}, 
		{3415, 1}, 	
		{8093, 1}, 	
		{7499, 1}, 	
		{8074, 1}, 	
		{236, 0}, 	
		{236, 0}, 	
		{7456, 1},
		{6499, 0}, 	
		{7418, 1}, 	
		{7499, 1}, 
		{8061, 1}, 	
		{823, 1}, 	
		{9660, 0}, 
		{7456, 1},
		{9660, 0}, 
		{6299, 1},
		{238, 0},
		{7499, 1}
		)
		sleep(math.random(609, 1140))
		setWalkerEnabled(true)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    elseif (labelName == "CrossbowSell") then 
       	setWalkerEnabled(false)	
		if (sellingitems==true) then
	Self.SayToNpc({"Hi", "Trade"}, 65)
	wait(871, 1208)
	Self.ShopSellAllItems(3349, Self.ItemCount(3349)) 
    wait(861, 1204)  
    Self.ShopSellAllItems(3349, Self.ItemCount(3349))  
    wait(891, 124)  
	end
	setWalkerEnabled(true)	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("Targeting Off")
		wait(900, 1200)
    	setTargetingEnabled(false)	
        print("Targeting Off")
		wait(900, 1200)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("Targeting Off")
		wait(900, 1200)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
 elseif (labelName == "TargetingOn") then 
       	setTargetingEnabled(true)	
         print("Targeting On")
		 wait(900, 1200)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		 
 elseif (labelName == "LooterOff") then 
       	setLooterEnabled(false)	
         print("Looter Off")
		 wait(900, 1200)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 elseif (labelName == "LooterOn") then 
       	setLooterEnabled(true)	
         print("Looter On")
		 wait(900, 1200)	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	   
	    elseif (labelName == "CrossbowSeller?") then
		Walker.Stop()
	    if (sellitems == true) then
			Walker.Goto("GoSellCrossboWs")
			print([[Sell crossbow = true]])
	    else
	        Walker.Goto("NoSell")
			print([[Sell crossbow = false]])
	    end
 		Walker.Start()	
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    elseif (labelName == "CrossbowSeller") then 
       	setWalkerEnabled(false)	
		if (sellitems==true) then
	Self.SayToNpc({"Hi", "Trade"}, 65)
	wait(900, 1200)
	Self.ShopSellAllItems(3349, Self.ItemCount(3349)) 
    wait(900, 1200)  
    Self.ShopSellAllItems(3349, Self.ItemCount(3349))  
    wait(900, 1200)  
	    end
 		Walker.Start()	
	setWalkerEnabled(true) 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end
end	 