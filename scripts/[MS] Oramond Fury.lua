-----SETTINGS--------------------------------------------------------------
--POTIONS--
local ManaID = 23373 --- Which mana potions are you using? 
local MinMana = 100 --- How many mana potions until you leave the hunt.
local MaxMana = 400 --- How many mana potions you begin the hunt with.
local ManaPrice = 120 --- What is the price of your selected mana potions?
local HealthID = 3155 --- Which health potions are you using?
local MinHealth = 150 --- How many health potions until you leave the hunt.
local MaxHealth = 800 --- How many health potions you begin the hunt with.
local HealthPrice = 108 --- What is the price of your selected mana potions?
local minAva = 1
local maxAva = 1
local AvaID = 3161
local AvaPrice = 100
--CAP--
local MinCap = 10 --- Leaves spawn when character reaches this cap.

--AUTOSELLING--
local SoftBoots = true	--- Do you want to use softboots? 'true' or 'false'

--BP SETUP--
local MainBp  = "backpack of holding" ----- Main Backpack
local GoldBp  = "brocade backpack" ---- Backpack to put gold in
local PotionBp  = "blue backpack" ---- Potion Bp
local SdBp  = "zaoan chess box" ---- Potion Bp

---------------OFFLINE TRAINING----------------------------------------------------------------
StaminaLogout = false ---- Do you want to logout if less then 16 hours stamina?
SkillAxe = true --- Does your character use Axe Fighting primarily? (ONLY PUT TRUE ON ONE!)
SkillSword = false --- Does your character use Sword Fighting primarily? (ONLY PUT TRUE ON ONE!)
SkillClub = false --- Does your character use Club Fighting primarily? (ONLY PUT TRUE ON ONE!)


-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
~~~~Oramond Fury~~~~]]
    print([[
~~~~Oramond Fury~~~~]])
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{LootBp, true},{PotionBp, true}, {SdBp, true})
		setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------
	elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 1000) then
     print("Low Stamina Go Offline Training")
	 Walker.Goto("GoOfflineTrain")	
	 setWalkerEnabled(true)
	 else
     print("Go To Hunt")
	 Walker.Goto("PotionCheck")
     setWalkerEnabled(true)
	 end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(3212, 4694)
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
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 850) and (Self.ItemCount(HealthID) > MinHealth) then
				print("Enough supplies & cap, keep hunting..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Low mana pots, leaving cave.")
			setWalkerEnabled(true) 
				end
	------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 850) and (Self.ItemCount(HealthID) > MinHealth) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("**Wracam Do Miasta !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------						
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
			Self.SayToNpc({"hi", "withdraw 1000", "yes"}, 65)
			wait(1500,2000)
			Self.SayToNpc({"balance"}, 65)
            setWalkerEnabled(true)
		sleep(math.random(600, 1100)) 
		----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) then
						print("Retry refill again")
				setWalkerEnabled(true) 
			            gotoLabel("ToBank")
			else
						print("Going To Hunt")
				setWalkerEnabled(true) 
						gotoLabel("GoToHunt")
			end
			
----------------------------------------------------------------------------------------------------
 elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		print("## Kupuje Potiony ##.")
		if (Self.ItemCount(ManaID) < MaxMana or Self.ItemCount(HealthID) < MaxHealth ) then
			Self.SayToNpc({"hi", "flasks", "yes", "yes", "trade"}, 65)
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
            Self.ReachDepot()
            Self.DepositItems(
        {3416, 1},          ---  
	    {7430, 1},          ---  
	    {813, 1},          ---  
		{830, 1},          ---  
		{8027, 1},          --- 
		{3028, 0},          --- 
		{9057, 1},          ---  
		{8084, 1},          --- 
		{21183, 1},          --- 
		{11488, 0},          --- 
		{3029, 1},          --- 
		{3028, 1},          --- 
		{3034, 1},          --- 
		{8899, 1},          --- 
		{8894, 1},          --- 
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
		{21178, 1},
{3364, 0},
{3554, 0},
{7383, 0},
{10312, 1},
{10306, 1},		-- 
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
		{5944, 0},
		{3033, 0},
		{6499, 0},
		{8898, 1},
		{7456, 0},
		{3019, 1},
		{3065, 1},
		{7404, 1}, 	-- 
		{3079, 1} 	-- 
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
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

  elseif (labelName == "SellGlooth") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 120)
        SellItems(21171)
        wait(100, 120)
	SellItems(21167)
	wait(100, 120)
	SellItems(21179)
	wait(100, 120)
	SellItems(21178)
	wait(100, 120)
	SellItems(21170)
    wait(100, 120)
	SellItems(21168)
	wait(100, 120)
	SellItems(21168)
	wait(100, 120)
	SellItems(21169)
	wait(100, 120)
	SellItems(21165)
	wait(100, 120)
	SellItems(21164)
	wait(100, 120)
	SellItems(21180)
	wait(100, 120)
	SellItems(21183	)
	wait(100, 120)
	Walker.Start()

  elseif (labelName == "SellRares") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
        SellItems(21196)
        wait(100, 120)
	    SellItems(21103)
         wait(100, 120)
	    SellItems(21193)
		wait(100, 120)
	    SellItems(21182)
        wait(100, 120)
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
----------------------------------------------------------------------------------------------------
end
end