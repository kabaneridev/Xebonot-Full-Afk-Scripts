-----SETTINGS--------------------------------------------------------------
--POTIONS--
local ManaID = 268 --- Which mana potions are you using? 
local MinMana = 200 --- How many mana potions until you leave the hunt.
local MaxMana = 2000 --- How many mana potions you begin the hunt with.
local ManaPrice = 50 --- What is the price of your selected mana potions?
local HealthID = 23375 --- Which health potions are you using?
local MinHealth = 100 --- How many health potions until you leave the hunt.
local MaxHealth = 400 --- How many health potions you begin the hunt with.
local HealthPrice = 500 --- What is the price of your selected mana potions?
---------OFFLINE TRAINING-----------------------------------------------------
StaminaLogout = true ---- Do you want to logout if less then 16 hours stamina?
SkillAxe = true --- Does your character use Axe Fighting primarily? (ONLY PUT TRUE ON ONE!)
SkillSword = false --- Does your character use Sword Fighting primarily? (ONLY PUT TRUE ON ONE!)
SkillClub = false --- Does your character use Club Fighting primarily? (ONLY PUT TRUE ON ONE!)
--CAP--
local MinCap = 20 --- Leaves spawn when character reaches this cap.
--AUTOSELLING--
local SoftBoots = true	--- Do you want to use softboots? 'true' or 'false'
local UseRings = true -- Sword Ring - ID 3091  | Club Ring - ID 3093 | Axe Ring - ID 3092 | Ring Backpack (Default Backpack in slot 2)
local RingID = 3095 -- Item ID of your rings.
local DefaultRing = 3063 -- . (Default: Ring of the sky)
local WithdrawRings = false -- Withdraw Rings ?- Sword Ring - ID 3091  | Club Ring - ID 3093 | Axe Ring - ID 3092 | 
local MaxRings = 4 -- How much withdraw rings?
local RingID = 3092 -- Item ID of your rings.
--BP SETUP--
local MainBp  = "backpack" ----- Main Backpack
local GoldBp  = "golden backpack" ---- Backpack to put gold in
local LootBp  = "red backpack" ---- Loot Bp
local PotionBp  = "yellow backpack" ---- Potion Bp
-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
--------------------
--------------------
---------EK---------
~~~~Demons ORAMOND~~~~
]]
    print([[
~~~~Demons ORAMOND~~~~
--------------------
---------EK---------
--------------------]])
    wait(30000)
	
---FUNCTIONS--

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
elseif (labelName == "HuntHardcore") then
		print("Hunt Hardcore TRUE/FALSE")	Walker.ConditionalGoto((HuntHardcore) and (Self.ItemCount(237) > MinMana) and (Self.ItemCount(7642) > MinHealth), "HuntHardcore", "NoHardcore")

	elseif (labelName == "WithdrawRings?") then 
	 Walker.Stop()   
    if (WithdrawRings == true) then
    print([[Withdraw Rings]])
	 Walker.Stop()
	 Self.ReachDepot()
     if (Self.ItemCount(RingID) < MaxRings) then
            Self.WithdrawItems(3, {RingID, MaxRings, (MaxRings-Self.ItemCount(RingID, 3))})
            wait(1500,1900)
    end
		else
	        Walker.Goto("NoRings")
			print([[Skip Withdraw Rings]])
	    end
 		Walker.Start()	
		
----------------------------------------------------------------------------------------------------
	 
elseif (labelName == "Wait") then
    setWalkerEnabled(false)
	wait(400000, 400000)
    setWalkerEnabled(true)	 
	 
	elseif (labelName == "UseRings?") then 
		if (UseRings == true) then
        print("Use Rings TRUE..")
		Self.Equip(RingID, "ring")
    	else
		print("Use Rings FALSE..")
		Self.Equip(DefaultRing, "ring")
		end	

    elseif (labelName == "UnEquipRing") then 
    	Self.Equip(DefaultRing, "ring")
		
	
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
		Self.SayToNpc("withdraw")
		wait(150,200)
		Self.SayToNpc("20000")
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
		
			elseif (labelName == "ToAsylum") then  
		Walker.Stop()
		Creature.Follow("Captain Gulliver")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("asylum")
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

		

	elseif (labelName == "WithdrawRings?") then 
	 Walker.Stop()   
    if (WithdrawRings == true) then
    print([[Withdraw Rings]])
	 Walker.Stop()
	 Self.ReachDepot()
     if (Self.ItemCount(RingID) < MaxRings) then
    Self.WithdrawItems (RingID,{RingID,3,MaxRings})
            wait(1500,1900)
    end
		else
	        Walker.Goto("NoRings")
			print([[Skip Withdraw Rings]])
	    end
 		Walker.Start()	
	
---------------------------------------------------------------------------------------------------		
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
    	{5906, 0}, 	
		{9660, 0}, 	
		{3030, 0}, 
		{3034, 0}, 
		{5880, 0}, 
		{3032, 0}, 
		{3033, 0}, 	
		{9057, 0}, 	
		{10304, 0}, 	
		{9057, 0}, 	 
		{5944, 0}, 	
		{9694, 0}, 	
		{5944, 0}, 	
		{3033, 0}, 	
		{7368, 0}, 	
		{7642, 0}, 	 
		{3033, 0},
		{5954, 0}, 	
		{6499, 0}, 
			{7643, 0}, 	
		{6499, 0}, 
{21168, 1}, 		
	    {3063, 1}, 	
		{823, 1}, 	
		{3320, 1}, 
		{3381, 1}, 	
		{3436, 1},	
		{21177, 1},	
		{10282, 0}, 
		{9667, 0}, 
		{9632, 0}, 
		{3369, 1}, 	
		{3092, 3}, 		
	    {8063, 1}, 
		{3354, 1}, 	
		{3428, 1}, 	
		{7393, 1}, 	
		{3048, 1}, 	
		{8896, 2}, 	
		{9302, 1}, 
		{3033, 0}, 	
		{3029, 0}, 	
		{10313, 0}, 	
		{3281, 1}, 
		{7382, 1}, 
		{5884, 0}, 	
		{10282, 0}, 
		{3428, 1}, 	
		{3061, 0}, 	
		{7414, 1}, 
		{238, 1}, 	
		{239, 1}, 	
	    {3039, 1}, 
		{3370, 1}, 
		{3364, 1}, 
		{8061, 1},
		{3081, 1}, 	
		{10390, 1}, 	
		{3315, 1}, 	
		{3366, 1}, 	
		{7413, 1}, 	
		{3392, 1}, 	
		{8082, 1}, 	
		{8074, 1}, 	
		{3414, 1}, 	
		{3420, 1}, 
		{7382, 1}, 
		{7418, 1} 	
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
  ----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 840) then
				print("Exp Continue :D.:")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Refill :))")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------				
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("&Targeting  Off !&")
		wait(900, 1200)
		
		elseif (labelName == "LooterOff") then 
       	setLooterEnabled(false)	
        print("&Looter OFF!&")
		wait(900, 1200)
		
		elseif (labelName == "LooterOn") then 
       	setLooterEnabled(true)	
        print("&Looter On !&")
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
		 
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
	if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 840) then
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
	if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 840) then
				print("**Hunting Again :D**")
							setWalkerEnabled(true) 
		else
			gotoLabel("ToCheck1")	
				print("**Go To Refill**")
			setWalkerEnabled(true) 
			setTargetingEnabled(false) 			
			end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check3") then
       	setWalkerEnabled(false)	
	if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 840) then
				print("**Hunting Again :D**")
							setWalkerEnabled(true) 
		else
			gotoLabel("ToCheck2")	
				print("**Go To Refill**")
			setTargetingEnabled(false) 
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------	 
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
  elseif (labelName == "SellGlooth") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
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
	
	  elseif (labelName == "Rashid") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
        SellItems(7412)
        wait(100, 120)
	SellItems(7421)
	wait(100, 120)
	SellItems(3364)
	wait(100, 120)
	SellItems(3366)
	wait(100, 120)
	SellItems(3414)
    wait(100, 120)
	SellItems(3420)
	wait(100, 120)
	SellItems(3063)
	wait(100, 120)
	SellItems(823)
	wait(100, 120)
	SellItems(8061)
	wait(100, 120)
	SellItems(6299)
	wait(100, 120)
	SellItems(21180)
	wait(100, 120)
	SellItems(21183	)
	wait(100, 120)
	Walker.Start()
	
  elseif (labelName == "Djjin") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
        wait(100, 150)
        SellItems(3284)
        wait(100, 120)
	SellItems(3320)
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
Walker.Start()
----------------------------------------------------------------------------------------------------
end
end