-----SETTINGS---------------------------------------------------------------
local ManaID = 268 --- Which mana potions are you using? 
local MinMana = 600 --- How many mana potions until you leave the hunt.
local MaxMana = 2600 --- How many mana potions you begin the hunt with.
local ManaPrice = 50 --- What is the price of your selected mana potions?
local HealthID = 23375 --- Which health potions are you using?
local MinHealth = 300 --- How many health potions until you leave the hunt.
local MaxHealth = 600 --- How many health potions you begin the hunt with.
local HealthPrice = 500 
-----------------------------------------------------------------------------
local SoftBoots = true -- Do you want to use softboots? 'true' or 'false'
--CAP--
local MinCap = 100 --- Leaves spawn when character reaches this cap.
local sellitems = false
---------------OFFLINE TRAINING----------------------------------------------------------------
StaminaLogout = false ---- Do you want to logout if less then 16 hours stamina?
SkillAxe = true --- Does your character use Axe Fighting primarily? (ONLY PUT TRUE ON ONE!)

--AUTOSELLING--
local sellitems = true --- Set this on true if you want to sell Double Axe and Steel Helmets.

--BP SETUP--
local MainBp  = "backpack of holding" ----- Main Backpack
local GoldBp  = "camouflage backpack" ---- Backpack to put gold in
local RareBp  = "pirate backpack" ---- Potion Bp
local SuppliesBp  = "zaoan chess box" ---- Potion Bp


-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
Draken Walls EK]]
    print([[
Draken Walls EK]])
    wait(20000)
	
--FUNCTIONS--
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
				print("Cos Blokuje Dostep Do Depo , Szukam Wolnej Skrzynki.")
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{RareBp, true},{SuppliesBp, true})
		setWalkerEnabled(true) 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 		
     elseif (labelName == "GrizzlyAdams") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("yes")
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
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("hydras")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Self.SayToNpc("tasks")
		wait(1500,2000)
		Self.SayToNpc("serpent spawns")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Self.SayToNpc("Bye")
		wait(1500,2000)
		Walker.Start()  
----------------------------------------------------------------------------------------------------
    elseif (labelName == "Bank") then
			local withdrawManas = (MaxMana-Self.ItemCount(ManaID))*ManaPrice
			local withdrawHealths = (MaxHealth-Self.ItemCount(HealthID))*HealthPrice
			setWalkerEnabled(false)
			Self.SayToNpc({"hi", "deposit all", "yes"}, 65)
			if (withdrawManas > 0) then
                Self.SayToNpc({"withdraw " .. withdrawManas, "yes"}, 65)
            end
            if (withdrawHealths > 0) then
                Self.SayToNpc({"withdraw " .. withdrawHealths, "yes",}, 65)
            end
            Self.SayToNpc({"balance"}, 65)
            setWalkerEnabled(true)
		sleep(math.random(600, 1100))
---------------------------------------------------------------------------------------------------------
	elseif (labelName == "CheckSoft") then  
		Walker.Stop()
		if ((SoftBoots == true) and (Self.ItemCount(6530) > 0)) then
			print([[Worn Soft boots =1 1, lets go refill..]])
			Walker.Goto("RefillSoft")
		else
			print([[Skipping softs OR already have repaired softs.]])
			Walker.Goto("DoneSoft")
		end
		wait(1500,2000)
		Walker.Start()	

	elseif (labelName == "SoftBank") then  
		Walker.Stop()
		wait(150,200)
		Self.SayToNpc("hi")
		wait(150,200)
		Walker.Start()
		
		
	elseif (labelName == "ToEdron") then  
		Walker.Stop()
		Creature.Follow("Pemaret")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("edron")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "ToCormaya") then  
		Walker.Stop()
		Creature.Follow("Thorgrin")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("cormaya")
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
		wait(1500,2000)
		Walker.Start()			
   		
     elseif (labelName == "ToEdron") then  
		Walker.Stop()
		Creature.Follow("Pemaret")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("edron")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()  
		
	elseif (labelName == "ToVenore") then  
		Walker.Stop()
		Creature.Follow("Captain Seahorse")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
			
	elseif (labelName == "ToCormaya") then  
		Walker.Stop()
		Creature.Follow("Captain Seahorse")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("cormaya")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
		
	elseif (labelName == "ToFarmine") then  
		Walker.Stop()
		Creature.Follow("Gurbasch")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("farmine")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) then
						print("Failed buying pots - Trying again")
				setWalkerEnabled(true) 
			            gotoLabel("ToBank")
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
		sleep(math.random(2000, 3100))
			if (Self.ItemCount(ManaID) < MaxMana) then
				Self.ShopBuyItem(ManaID, (MaxMana - Self.ItemCount(ManaID)))
		sleep(math.random(2000, 3100))
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
            print("## Deposit Items ##.")
			Self.ReachDepot()
            Self.DepositItems(
      {10408, 0},      -- Spiked Iron Ball 
		{3032, 0},      --  small emerald
		{10415, 0},      -- high guard flag
		{10416, 0},      --  High Guard Shoulderplates
		{10417, 0},      -- legionnaire flags
		{5881, 0}, 
		{3032, 0},      --  small emerald
		{10415, 0},      -- high guard flag
		{10404, 0},      --  High Guard Shoulderplates
		{10379, 0},      -- legionnaire flags
		{10405, 0},      -- lizard scale		-- lizard scale
		{5876, 0},      -- lizard leather
		{3028, 0},     -- small diamond
		{10388, 1},      -- Drakinata
		{10444, 0},      --  Dragon Priest's Wandtip
		{10386, 1},     -- zaoan shoes
		{10384, 1}, 	-- zaoan armor
		{10439, 1}, 	-- zaoan robe
		{10387, 1}, 	-- zaoan legs
		{3428, 1}, 	-- Tower shield
		{3065, 1}, 	-- terra rod
		{5922, 0}, 	-- 
		{3071, 1}, 	-- wand of inferno
		{8043, 1}, 	-- focus cape
		{281, 0}, 	--  Giant Shimmering Pearl
		{282, 0}, 	--  Giant Shimmering Pearl
		{3032, 0}, 	-- small emerald
		{10418, 0}, 	-- broken halberd
		{9694, 0}, 	-- snake skin 
		{10313, 0}, 	-- winged tail
		{7386, 1}, 	-- mercenary sword
		{812, 1}, 	-- terra legs
		{811, 1}, 	-- terra mantle
		{3381, 1}, 	-- crown armor
		{3436, 1},	-- medusa shield
		{10410, 0}, 	-- hydra head
		{9632, 0}, 	-- ancient stone
		{9302, 1}, 	-- sackred tree amulet
		{3081, 1}, 	-- stone skin amulet
		{10390, 1}, 	-- zaoan sword
		{3315, 1}, 	-- guardian halberd
		{813, 1}, 	-- royal helmet
		{10409, 1}, 	-- spellbook of mind control
		{11673, 0}, 	-- dragon slayer
		{10385, 1}, 	-- boots of haste
		{239, 0},   -- gmp
		{238, 0}, 	-- ghp
		{236, 0}, 	-- shp
		{10323, 1}, 	-- zaoan sword
		{10390, 1}, 	-- guardian halberd
		{10451, 1}, 	-- royal helmet
		{10450, 0}, 	-- spellbook of mind control
		{11658, 0}, 	-- spellbook of mind control
		{3032, 0}, 	-- dragon slayer
		{5944, 0}, 	-- boots of haste
		{6499, 0}, 	-- boots of haste
		{10438, 1},   -- gmp
		{8896, 1}, 	-- ghp
		{10397, 0}, 	-- ghp
		{10397, 0}, 	-- ghp
		{3006, 1}, 	-- ghp
		{10449, 0},	-- ghp
		{3071, 0},	-- ghp
		{11454, 1},	-- ghp
		{3428, 0},	-- ghp
		{3030, 1}	-- ghp
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
 ----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 720) and (Self.ItemCount(HealthID) > MinHealth) then
				print("Enough supplies & cap, keep hunting..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Low mana pots, leaving cave.")
			setWalkerEnabled(true) 
				end------------------------------------------------------------------------
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("&Targeting Wylaczony !&")
		wait(900, 1200)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "Check Skill1") then
		if (SkillAxe) then 
			gotoLabel("Axe")
		print("Go Axe Training")
				end
----------------------------------------------------------------------------------------------------
 elseif (labelName == "TargetingOn") then 
       	setTargetingEnabled(true)	
         print("&Targeting Wlaczony !&")
		 wait(900, 1200)
		 
 elseif (labelName == "LooterOn") then 
       	setLooterEnabled(true)	
         print("&Looter Wlaczony !&")
		 wait(900, 1200)

 elseif (labelName == "LooterOff") then 
       	setLooterEnabled(true)	
         print("&Looter Wylaczony !&")
		 wait(900, 1200)		 
----------------------------------------------------------------------------------------------------
    elseif (labelName == "Pompan") then 
       	setWalkerEnabled(false)	
		if (sellitems==true) then
	Self.SayToNpc({"Hi", "Trade"}, 65)
	wait(900, 1200)
	Self.ShopSellItemsDownTo(10409, 0)
	wait(900, 1200)
	end
	setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
			if (Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 720) and (Self.ItemCount(HealthID) > MinHealth) then
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
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("GoToCheck1")	
				print("**Sprawdzam Supple !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check3") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("GoToCheck2")	
				print("**Sprawdzam Supple !**")
			setWalkerEnabled(true) 
				end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 840) then
     print("Malo Staminy Daje Loga")
	 os.exit()
     else
     Walker.Goto("PotionCheck")
     end
     Walker.Start()		
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    elseif (labelName == "SellItems") then 
       	setWalkerEnabled(false)	
		if (sellitems==true) then
	Self.SayToNpc({"Hi", "Trade"}, 65)
	wait(900, 1200)
	Self.ShopSellAllItems(10387, Self.ItemCount(10388), Self.ItemCount(10384), Self.ItemCount(10386)) 
    wait(900, 1200)  	
	    end
 		Walker.Start()	
	setWalkerEnabled(true) 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end
end	 