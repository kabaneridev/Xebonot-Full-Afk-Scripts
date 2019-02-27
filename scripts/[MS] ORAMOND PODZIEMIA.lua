-----SETTINGS---------------------------------------------------------------
local ManaID = 23373 --- Which mana potions are you using? 
local MinMana = 50 --- How many mana potions until you leave the hunt.
local MaxMana = 700 --- How many mana potions you begin the hunt with.
local ManaPrice = 180 --- What is the price of your selected mana potions?
local HealthID = 3155 --- Which health potions are you using?
local MinHealth = 50 --- How many health potions until you leave the hunt.
local MaxHealth = 200 --- How many health potions you begin the hunt with.
local HealthPrice = 108 --- What is the price of your selected mana potions?

local AvalancheID = 3202 --- Which health potions are you using?
local MinAvalanche = 100 --- How many health potions until you leave the hunt.
local MaxAvalanche = 600 --- How many health potions you begin the hunt with.
local AvalanchePrice = 45 --- What is the price of your selected mana potions?

local SoftBoots = true
--CAP--
local MinCap = 10 --- Leaves spawn when character reaches this cap.

--BP SETUP--
local MainBp  = "backpack of holding" ----- Main Backpack
local GoldBp  = "brocade backpack" ---- Backpack to put gold in
local PotionBp  = "blue backpack" ---- Potion Bp
local SdBp  = "zaoan chess box" ---- Potion Bp


-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
MS ORAMOND]]
    print([[
MS ORAMOND]])
    wait(20000)
	
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{PotionBp, true},{SdBp, true})
		setWalkerEnabled(true) 

	elseif (labelName == "Check Skill11") then
		if (SkillDistance) then 
			gotoLabel("Distance")
		print("Go Dist Training")
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
		
		
		
    elseif (labelName == "BankAvalanche") then
			local withdrawAvalanches = (MaxAvalanche-Self.ItemCount(AvalancheID))*AvalanchePrice
			setWalkerEnabled(false)
			Self.SayToNpc({"hi", "deposit all", "yes"}, 65)
            if (withdrawAvalanches > 0) then
                Self.SayToNpc({"withdraw " .. withdrawAvalanches, "yes",}, 65)
            end
            Self.SayToNpc({"balance"}, 65)
            setWalkerEnabled(true)
		sleep(math.random(600, 1100))			
----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) or (Self.ItemCount(AvalancheID) < MaxAvalanche) then
						print("Failed buying pots - Trying again")
				setWalkerEnabled(true) 
			            gotoLabel("Start")
			else
				        print("GoToHunt")
				setWalkerEnabled(true) 
				print("GoToHunt")
						gotoLabel("GoToHunt")
			end

----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		print("## Kupuje Potiony ##.")
		if (Self.ItemCount(ManaID) < MaxMana or Self.ItemCount(HealthID) < MaxHealth or Self.ItemCount(AvalancheID) < MaxAvalanche) then
			Self.SayToNpc({"hi", "flasks", "yes", "yes", "trade"}, 65)
		sleep(math.random(600, 1100))
		end
		if (Self.ItemCount(AvalancheID) < MaxAvalanche) then
				Self.ShopBuyItem(AvalancheID, (MaxAvalanche - Self.ItemCount(AvalancheID)))
		sleep(math.random(600, 1100))
			end
		sleep(math.random(600, 1100))
			if (Self.ItemCount(ManaID) < MaxMana) then
				Self.ShopBuyItem(ManaID, (MaxMana - Self.ItemCount(ManaID)))
		sleep(math.random(600, 1100))
			end
			if (Self.ItemCount(HealthID) < MaxHealth) then
				Self.ShopBuyItem(HealthID, (MaxHealth - Self.ItemCount(HealthID)))
		sleep(math.random(600, 1100))
		end
		setWalkerEnabled(true)	
----------------------------------------------------------------------------------------------------
   elseif (labelName == "DepositItems") then
		setWalkerEnabled(false)
            print("## Deposit Items ##.")
			Self.ReachDepot()
            Self.DepositItems(
        {3416, 1},          ---  
		{7430, 1},          ---  
		{8027, 1},          --- 
		{3028, 0},          --- 
		{9057, 1},          ---  
		{8084, 1},          --- 
		{21183, 1},          --- 
		{11488, 0},          --- 
		{3029, 1},          --- 
		{3028, 1},          --- 
		{3034, 1},          --- 
		{237, 0},          --- 
		{3033, 1},          --- 
		{21164, 1},          --- 
		{31169, 1},          --- 
		{11487, 0},          --- 
		{3026, 0},          --- 
		{7379, 0},
		{3030, 0},          --- 
		{21993, 0},          --- 
		{3037, 1},          --- 
		{3038, 1},          ---
		{21196, 0},          ---
		{21755, 0},          ---
		{21168, 1},
		{7379, 0},
		{21178, 1}, 	-- 
		{21180, 1}, 	-- 
		{21182, 0}, 	-- 
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
		{3032, 1}, 	-- small emerald
		{3028, 0}, 	-- strand of medusa hair
		{9694, 0}, 	-- snake skin 
		{8083, 1}, 	-- iron ore
		{3032, 1}, 	-- small emerald
		{11487, 0}, 	-- strand of medusa hair
		{9694, 0}, 	-- snake skin 
		{3027, 1}, 	-- snake skin 
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
		{21179, 2}, 	-- royal helmet
		{5895, 2}, 	-- spellbook of mind control
		{236, 0}, 	-- dragon slayer
		{236, 0}, 	-- boots of haste
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
		{21158, 1} 	-- 
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
 
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
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 720) and (Self.ItemCount(HealthID) > MinHealth) and (Self.ItemCount(AvalancheID) > MinAvalanche)then
				print("Expie dalej ! :D..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("malo manasow lub runek wracam do dp.:D")
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
		if (Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 720) and (Self.ItemCount(HealthID) > MinHealth) and (Self.ItemCount(AvalancheID) > MinAvalanche)then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("**malo manasow lub runek wracam do dp.:D*")
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
---------------------------------------------------------------------------------------
        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(91200, 129400)
		setWalkerEnabled(true)	
				
			
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
----------------------------------------------------------------------------------------------------

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
    SellItems(9058)
    wait(100, 120)
    SellItems(3028)
        wait(100, 120)
Walker.Start()		
  
  
  elseif (labelName == "SellRares") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
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
	SellItems(21175)
    wait(900, 1200)
	SellItems(21176)
	wait(900, 1200)
    SellItems(21168)
	wait(900, 1200)
	SellItems(21174)
	wait(900, 1200)
    SellItems(21183)
	wait(900, 1200)
	SellItems(21180)
	wait(900, 1200)
		SellItems(21197)
	wait(900, 1200)
	        SellItems(21171)
        wait(900, 1200)
	SellItems(21167)
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
	SellItems(21180)
    wait(900, 1200)
	SellItems(21183)
	wait(900, 1200)
    SellItems(21168)
	wait(900, 1200)
	SellItems(21169)
	wait(900, 1200)
Walker.Start()		
----------------------------------------------------------------------------------------------------
end
end