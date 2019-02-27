-----SETTINGS---------------------------------------------------------------
local ManaID = 238 --- Which mana potions are you using? 
local MinMana = 100 --- How many mana potions until you leave the hunt.
local MaxMana = 500 --- How many mana potions you begin the hunt with.
local ManaPrice = 180 --- What is the price of your selected mana potions?
local HealthID = 3155 --- Which health potions are you using?
local MinHealth = 100 --- How many health potions until you leave the hunt.
local MaxHealth = 1000 --- How many health potions you begin the hunt with.
local HealthPrice = 108 --- What is the price of your selected mana potions?

--CAP--
local MinCap = 100 --- Leaves spawn when character reaches this cap.

---------------OFFLINE TRAINING----------------------------------------------------------------
StaminaLogout = false ---- Do you want to logout if less then 16 hours stamina?
MagicLevel = true --- Does your character use Axe Fighting primarily? (ONLY PUT TRUE ON ONE!)

--AUTOSELLING--
local sellitems = true --- Set this on true if you want to sell Double Axe and Steel Helmets.

--BP SETUP--
local MainBp  = "backpack of holding" ----- Main Backpack
local GoldBp  = "backpack of holding" ---- Backpack to put gold in
local PotionBp  = "zaoan chess box" ---- Potion Bp
local SdBp  = "jewelled backpack" ---- Potion Bp


-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
ASYLUM SERPENTS BY MATHIA]]
    print([[
ASYLUM SERPENTS BY MATHIA]])
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{PotionBp, true},{SdBp, true})
		setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 		
	elseif (labelName == "BankThais") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("withdraw 1000")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "ToCursed") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("cursed")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "CursedToAsylum") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("asylum")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()		

	elseif (labelName == "SoftBank") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("withdraw 22000")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
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
----------------------------------------------------------------------------------------------------
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
            print("## Deposit Items ##.")
			Self.ReachDepot()
            Self.DepositItems(
 		{5879, 0}, 	-- spider silk
		{5880, 0}, 	-- iron ore
		{3032, 0}, 	-- small emerald
		{10309, 0}, 	-- strand of medusa hair
		{6499, 0}, 	-- snake skin 
		{10304, 0}, 	-- winged tail
		{9057, 0}, 	-- snake skin 
		{5944, 0}, 	-- winged tail
		{9694, 0}, 	-- snake skin 
		{5944, 0}, 	-- winged tail
		{3033, 0}, 	-- snake skin 
		{3033, 0}, 	-- winged tail
		{3029, 0}, 	-- winged tail
		{5884, 1}, 	-- winged tail	
	    {7386, 1}, 	-- mercenary sword
		{8052, 1}, 	-- winged tail	
		{812, 1}, 	-- terra legs
		{811, 1}, 	-- terra mantle
		{3381, 1}, 	-- crown armor
		{3436, 1},	-- medusa shield
		{10282, 0}, 	-- hydra head
		{9632, 0}, 	-- ancient stone
		{3369, 1}, 	-- ancient stone
		{3354, 1}, 	-- ancient stone
		{3428, 1}, 	-- ancient stone
		{9302, 1}, 	-- sackred tree amulet
		{3033, 0}, 	-- stone skin amulet
		{3029, 0}, 	-- zaoan sword
		{3554, 1}, 	-- zaoan sword
		{3061, 0}, 	-- guardian halberd
		{3069, 0}, 	-- stone skin amulet
		{5884, 0}, 	-- stone skin amulet
		{10282, 0}, 	-- stone skin amulet
		{3428, 1}, 	-- zaoan sword
		{3061, 0}, 	-- guardian halberd
		{7414, 1}, 	-- royal helmet
		{3370, 1}, 	-- royal helmet
		{3081, 1}, 	-- stone skin amulet
		{10390, 1}, 	-- zaoan sword
		{3315, 1}, 	-- guardian halberd
		{7413, 1}, 	-- royal helmet
		{3392, 1}, 	-- royal helmet
		{8074, 1}, 	-- spellbook of mind control
		{7402, 1}, 	-- dragon slayer
		{3079, 1}, 	-- boots of haste
		{3079, 1}, 	-- boots of haste
		{7456, 1} 	-- noble axe
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
----------------------------------------------------------------------------------------------------
 elseif (labelName == "TargetingOn") then 
       	setTargetingEnabled(true)	
         print("&Targeting Wlaczony !&")
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
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 900) then
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

	elseif (labelName == "SoftBank") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("withdraw 11000")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
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
		
	elseif (labelName == "BackToAsylum") then  
		Walker.Stop()
		Creature.Follow("Captain Bluebear")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("asylum")
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
				
				---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 840) then
     print("Low Stamina Go Offline Training")
	 Walker.Goto("CheckOffline")	
	 else
     print("Go To Hunt")
	 Walker.Goto("PotionCheck")
     end
     Walker.Start()
----------------------------------------------------------------------------------------------------
    elseif (labelName == "LootSeller") then 
       	setWalkerEnabled(false)	
		if (sellitems==true) then
	Self.SayToNpc({"Hi", "Trade"}, 65)
	wait(900, 1200)
	Self.ShopSellItem(3269, Self.ItemCount(3269)) 
    wait(900, 1200)  
    Self.ShopSellItem(3269, Self.ItemCount(3269))  
    wait(900, 1200)  
    Self.ShopSellItem(3269, Self.ItemCount(3269))  
    wait(900, 1200)  
    Self.ShopSellItem(3269, Self.ItemCount(3269))  
    wait(900, 1200)  
    Self.ShopSellItem(3269, Self.ItemCount(3269))  
    wait(900, 1200)  
    Self.ShopSellItem(14080, Self.ItemCount(14080)) 
    wait(900, 1200)   
    Self.ShopSellItem(14089, Self.ItemCount(14089)) 
    wait(900, 1200)
    Self.ShopSellItem(14082, Self.ItemCount(14082)) 
    wait(900, 1200)
    Self.ShopSellItem(14088, Self.ItemCount(14088)) 
    wait(900, 1200)
    Self.ShopSellItem(14087, Self.ItemCount(14087)) 
    wait(900, 1200)
    Self.ShopSellItem(14086, Self.ItemCount(14086)) 
    wait(900, 1200)
end
	setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
end
end