-----SETTINGS--------------------------------------------------------------
--Supples--
local ManaID = 23374 --- Which mana potions are you using? 
local MinMana = 10 --- How many mana potions until you leave the hunt.
local MaxMana = 600 --- How many mana potions you begin the hunt with.
local ManaPrice = 190 --- What is the price of your selected mana potions?

local HealthID = 23374 --- Which health potions are you using?
local MinHealth = 5 --- How many health potions until you leave the hunt.
local MaxHealth = 600 --- How many health potions you begin the hunt with.
local HealthPrice = 80 --- What is the price of your selected mana potions?

local ArrowID = 15793 ---- Normal Spear ID is 3277 . Royal Spear ID is 7378
local ArrowPrice = 20 ---- Normal Spear is 9gp, Royal Spear is 15gp (Note: If you use Royal Spears, change the spear ID in support > equipment manager and change spears in looter to floor, or not to loot at all).
local MaxArrow = 600 ---- Spear amount to refill too. 
local MinArrow = 150 ---- Minimum Spears to exit the cave

local SoftBoots = true		--- Do you want to use softboots? 'true' or 'false'

--CAP--
local MinCap = 20 --- Leaves spawn when character reaches this cap.

--BP SETUP--
local GoldBp  = "jewelled backpack" ---- Backpack to put gold in
local MainBp  = "brocade backpack" ----- Main Backpack
local LootBp  = "red backpack" ---- Potion Bp
local AmmoBp  = "zaoan chess box" ---- Potion Bp

-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
Minotaurs Oramond Ultimate Hard
]]
    print([[
Minotaurs Oramond Ultimate Hard]])
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true}, {MainBp, true},{LootBp, true},{AmmoBp, true})
		setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
elseif (labelName == "HuntHardcore") then
		print("Hunt Hardcore TRUE/FALSE")	Walker.ConditionalGoto((HuntHardcore) and (Self.ItemCount(237) > MinMana) and (Self.ItemCount(7642) > MinHealth), "HuntHardcore", "NoHardcore")
----------------------------------------------------------------------------------------------------
elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 960) then
     print("Malo Staminy Daje Loga")
	 os.exit()
     else
     Walker.Goto("PotionCheck")
     end
     Walker.Start()
----------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------		
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
			            gotoLabel("~~MINOS~~")
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
      {3381, 1},          ---  
		{9057, 0},          ---  
		{3028, 0},          --- 
		{11472, 0},          --- 
		{3030, 0},          ---  
		{5912, 0},          --- 
		{7425, 1},          --- 
		{7413, 1},          --- 
		{7412, 1},          --- 
		{9058, 0},          --- 
		{3039, 1},          --- 
		{7427, 1},          --- 
		{7452, 1},          --- 
		{7443, 0},          --- 
		{3081, 1},          --- 
		{31169, 1},          --- 
		{11487, 0},          --- 
		{3026, 0},          --- 
		{7379, 0},
		{3030, 0},          --- 
		{21993, 0},          --- 
		{3037, 1},          --- 
		{3038, 1},          ---
		{3024, 1},          ---
		{21196, 0},          ---
		{7412, 1},          ---
		{21755, 0},          ---
		{21816, 0},          ---
		{7452, 1},          ---
		{811, 1},          ---
		{238, 0},          ---
		{281, 0},          ---
		{239, 0},          ---
		{7386, 1},          ---
		{812, 1},          ---
		{8082, 1},          ---
		{8084, 1},          ---
		{21170, 1},          ---
		{21171, 1},          ---
		{8899, 1},          ---
		{8096, 1},          ---
		{8096, 1},          ---
		{21183, 1},
		{3342, 1},
		{21814, 0},
		{7379, 0},
		{21178, 1}, 	-- 
		{21180, 1}, 	-- 
		{21182, 0}, 	-- 
		{21203, 0}, 	-- 
		{3324, 1}, 	-- 
		{21167, 1}, 	-- 
		{7430, 1}, 	-- 
		{3313, 1}, 	-- 
		{3701, 1}, 	-- 
		{8043, 1}, 	-- 
		{816, 1}, 	-- 
		{8045, 1}, 	-- 
		{3065, 1}, 	-- 
		{21193, 0}, 	-- 
		{9635, 0}, 	-- 
		{21169, 1}, 	-- 
		{3036, 1}, 	-- 
		{5879, 0}, 	-- spider silk
		{5880, 0}, 	-- iron ore
		{3032, 0}, 	-- small emerald
		{3028, 0}, 	-- strand of medusa hair
		{9694, 0}, 	-- snake skin 
		{8083, 1}, 	-- iron ore
		{3032, 0}, 	-- small emerald
		{11487, 0}, 	-- strand of medusa hair
		{9694, 0}, 	-- snake skin 
		{3027, 0}, 	-- snake skin 
	    {11488, 0}, 	-- snake skin 
		{10313, 0}, 	-- winged tail
		{7386, 1}, 	-- mercenary sword
		{812, 1}, 	-- terra legs
		{811, 1}, 	-- terra mantle
		{3381, 1}, 	-- crown armor
		{3436, 1},	-- medusa shield
		{3073, 1}, 	-- hydra head
		{3370, 1}, 	-- ancient stone
		{11491, 1}, 	-- sackred tree amulet
		{21195, 0}, 	-- stone skin amulet
		{236, 0}, 	-- zaoan sword
		{21146, 0}, 	-- guardian halberd
		{21194, 0}, 	-- guardian halberd
		{21182, 0}, 	-- guardian halberd
		{21179, 1}, 	-- royal helmet
		{5895, 1}, 	-- spellbook of mind control
		{236, 0}, 	-- dragon slayer
		{236, 0}, 	-- boots of haste
		{813, 1}, 	-- boots of haste
		{3032, 0},
		{21173, 0},
		{8879, 0},
		{21197, 0},
		{8896, 1},
		{21103, 0},
		{8775, 0},
		{21143, 0},
		{5880, 0},
		{21165, 1},
		{21197, 0},
		{5880, 0},
		{21200, 0},
		{21201, 0},
		{21197, 0},
		{21200, 0},
		{21173, 0},
	    {3416, 1},          ---  
	    {7430, 1},          ---  
	    {813, 1},          ---  
		{830, 1},          ---  
		{8027, 1},          --- 
		{3028, 0},          --- 
		{9057, 0},          ---  
		{8084, 1},          --- 
		{21183, 1},          --- 
		{11488, 0},          --- 
		{3029, 0},          --- 
		{3028, 0},          --- 
		{3034, 0},          --- 
		{8899, 1},          --- 
		{8894, 1},          --- 
		{3033, 0},          --- 
		{21164, 1},          --- 
		{31169, 1},          --- 
		{11487, 0},          --- 
		{3026, 0},          --- 
		{7379, 0},
		{3030, 0},          --- 
		{21993, 0},          --- 
		{3037, 1},          --- 
		{3038, 1},          ---
		{3024, 1},          ---
		{21196, 0},          ---
		{21755, 0},          ---
		{21816, 0},          ---
		{7452, 1},          ---
		{7412, 1},          ---
		{7419, 1},          ---
		{811, 1},          ---
		{238, 0},          ---
		{281, 0},          ---
		{239, 0},          ---
		{7386, 1},          ---
		{812, 1},          ---
		{8082, 1},          ---
		{8084, 1},          ---
		{21170, 1},          ---
		{21171, 1},          ---
		{8899, 1},          ---
		{8096, 1},          ---
		{8096, 1},          ---
		{21183, 1},
		{3342, 1},
		{21814, 0},
		{7379, 0},
		{21178, 1}, 	-- 
		{21180, 1}, 	-- 
		{21182, 0}, 	-- 
		{21203, 0}, 	-- 
		{3324, 1}, 	-- 
		{21167, 1}, 	-- 
		{7430, 1}, 	-- 
		{3313, 1}, 	-- 
		{3701, 1}, 	-- 
		{7368, 3}, 	-- 	
	{8043, 1}, 	-- 
		{816, 1}, 	-- 
		{8045, 1}, 	-- 
		{3065, 1}, 	-- 
		{21193, 0}, 	-- 
		{9635, 0}, 	-- 
		{21169, 1}, 	-- 
		{3036, 1}, 	-- 
		{5879, 0}, 	-- spider silk
		{5880, 0}, 	-- iron ore
		{3032, 0}, 	-- small emerald
		{3028, 0}, 	-- strand of medusa hair
		{9694, 0}, 	-- snake skin 
		{8083, 1}, 	-- iron ore
		{3032, 0}, 	-- small emerald
		{11487, 0}, 	-- strand of medusa hair
		{9694, 0}, 	-- snake skin 
		{3027, 0}, 	-- snake skin 
	    {11488, 0}, 	-- snake skin 
		{10313, 0}, 	-- winged tail
		{7386, 1}, 	-- mercenary sword
		{812, 1}, 	-- terra legs
		{811, 1}, 	-- terra mantle
		{3381, 1}, 	-- crown armor
		{3436, 1},	-- medusa shield
		{3073, 1}, 	-- hydra head
		{3370, 1}, 	-- ancient stone
		{11491, 1}, 	-- sackred tree amulet
		{21195, 0}, 	-- stone skin amulet
		{236, 0}, 	-- zaoan sword
		{21146, 0}, 	-- guardian halberd
		{21194, 0}, 	-- guardian halberd
		{21182, 0}, 	-- guardian halberd
		{21179, 1}, 	-- royal helmet
		{5895, 1}, 	-- spellbook of mind control
		{236, 0}, 	-- dragon slayer
		{236, 0}, 	-- boots of haste
		{813, 1}, 	-- boots of haste
		{3032, 0},
		{21173, 0},
		{8879, 0},
		{21197, 0},
		{8896, 1},
		{21103, 0},
		{8775, 0},
		{21143, 0},
		{5880, 0},
		{21165, 1},
		{21168, 1},
		{21197, 0},
		{5880, 0},
		{21200, 0},
		{21201, 0},
		{21197, 0},
		{21200, 0},
		{21173, 0},
		{21158, 1}, 	-- 
		{21158, 1}, 	-- 
		{8896, 1} 	-- 
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
 ----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 960) then
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

		 
  elseif (labelName == "SellGems") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
        SellItems(3033)
        wait(100, 120)
	    SellItems(3030)
         wait(100, 120)
	    SellItems(9057)
		wait(100, 120)
	    SellItems(3032)
        wait(100, 120)
	   SellItems(3029)
        wait(100, 120)
			   SellItems(3028)
        wait(100, 120)
Walker.Start()			 
 ----------------------------------------------------------------------------------------------------
elseif (labelName == "BoltBuy") then
			setWalkerEnabled(false)
			Self.SayToNpc({"Hi", "Trade"}, 65)
			wait(900, 1200)
			Self.ShopBuyItem(ArrowID, (MaxArrow - Self.ItemCount(ArrowID)))
			wait(900, 1200)
			setWalkerEnabled(true)
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) then
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

  elseif (labelName == "SellGlooth") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(800, 1500)
        SellItems(21174)
        wait(900, 1200)
	SellItems(21175)
	wait(900, 1200)
	SellItems(21179)
	wait(900, 1200)
	SellItems(21178)
	wait(900, 1200)
	SellItems(21170)
	wait(900, 1200)
	SellItems(21165)
	wait(900, 1200)
	SellItems(21164)
	wait(900, 1200)
	SellItems(21173)
    wait(900, 1200)
	SellItems(21176)
	wait(900, 1200)
    SellItems(21168)
	wait(900, 1200)
	SellItems(21174)
	wait(900, 1200)
Walker.Start()

  elseif (labelName == "SellRares") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(800, 1500)
        SellItems(21220)
        wait(900, 1200)
	    SellItems(21199)
		wait(800, 1500)
        SellItems(21196)
        wait(900, 1200)
        SellItems(21193)
        wait(900, 1200)	   
	   SellItems(21103)
        wait(900, 1200)
	    SellItems(21182)
        wait(900, 1200)
        wait(800, 1500)
        SellItems(21194)
        wait(900, 1200)
	    SellItems(21195)
		wait(800, 1500)
        SellItems(21196)
        wait(900, 1200)
	    SellItems(21103)
        wait(900, 1200)
	    SellItems(21182)
        wait(900, 1200)
		Walker.Start()

----------------------------------------------------------------------------------------------------
end
end