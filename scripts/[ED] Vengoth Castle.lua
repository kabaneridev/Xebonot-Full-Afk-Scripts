-----SETTINGS---------------------------------------------------------------
local ManaID = 238 --- Which mana potions are you using? 
local MinMana = 100 --- How many mana potions until you leave the hunt.
local MaxMana = 550 --- How many mana potions you begin the hunt with.
local ManaPrice = 180 --- What is the price of your selected mana potions?
local HealthID = 3161 --- Which health potions are you using?
local MinHealth = 150 --- How many health potions until you leave the hunt.
local MaxHealth = 900 --- How many health potions you begin the hunt with.
local HealthPrice = 45 --- What is the price of your selected mana potions?
local SoftBoots = true		--- Do you want to use softboots? 'true' or 'false'
--CAP--
local MinCap = 1 --- Leaves spawn when character reaches this cap.
--AUTOSELLING--
local sellingcrossbow = false --- Set this on true if you want to sell Double Axe and Steel Helmets.
--BP SETUP--
local MainBp  = "mushroom backpack" ----- Main Backpack
local GoldBp  = "demon backpack" ---- Backpack to put gold in
local LootBp  = "golden backpack" ---- Potion Bp
local AmmoBp  = "zaoan chess box" ---- Potion Bp

-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
~~~~Vengoth ~~~~By Mathia~~~~]]
    print([[
~~~~Vengoth ~~~~By Mathia~~~~]])
    wait(10000)
	
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
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{LootBp, true},{AmmoBp, true})
		setWalkerEnabled(true)
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
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	elseif (labelName == "Check Skill1") then
		if (SkillClub) then
			gotoLabel("Distance")
		print("Go Distance Training")
				end	 
 ----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 840) then
				print("Enough supplies & cap, keep hunting..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Wracam Do Miasta")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
elseif (labelName == "Medusa") then
		print("Hunt Medusa TRUE/FALSE")	Walker.ConditionalGoto((Medusa) and (Self.ItemCount(237) > MinMana) and (Self.ItemCount(7642) > MinHealth), "Medusa", "NoMedusa")
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
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("withdraw 11000")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
		
	elseif (labelName == "ToPortHope") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("port hope")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
	elseif (labelName == "ToVenore") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("venore")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
		elseif (labelName == "ToLB") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("liberty bay")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
		
			
	elseif (labelName == "ToYalahar") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("yalahar")
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
   		
     elseif (labelName == "BackPortHope") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("port hope")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()  
		
	elseif (labelName == "BackToDarashia") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("darashia")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()	
		
	elseif (labelName == "BackToFactory") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("factory")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()

	elseif (labelName == "BackToYala") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("magician")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()			
		
----------------------------------------------------------------------------------------------------
     elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 840) then
				print("Hunt Again ;)..")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Wracam Do Miasta")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check2") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 840) then
				print("Hunt Again ;)..")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("Wracam Do Miasta")
			setWalkerEnabled(true) 
			setTargetingEnabled(false)	
				end				
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check3") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.ItemCount(ArrowID) > MinArrow) and (Self.Stamina() > 840) then
				print("Hunt Again ;)..")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("Wracam Do Miasta")
			setWalkerEnabled(true) 
			setTargetingEnabled(false)	
				end		


    elseif (labelName == "Bank") then
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
		sleep(math.random(600, 1100))
				
----------------------------------------------------------------------------------------------------	
     elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana) and (Self.Stamina() > 960) then
				print("Hunt Again ;)..")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("Wracam Do Miasta")
			setWalkerEnabled(true) 
			setTargetingEnabled(false)	
				end
----------------------------------------------------------------------------------------------------						
    elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		Creature.Follow("Asima")
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
    elseif (labelName == "PotionCheck") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(ArrowID) < MaxArrow) then
						print("Za malo suppli - Wracam zrobic refill ponownie :(")
				setWalkerEnabled(true) 
			            gotoLabel("Start")
			else
				setWalkerEnabled(true) 
						gotoLabel("GoToHunt")
			    print("Ide Expic :)")
			end
			
elseif (labelName == "ToSunken") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("sunken")
		Walker.Start()
		
   elseif (labelName == "ToFactory") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("factory")
		Walker.Start()

   elseif (labelName == "ToTrade") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("trade")
		Walker.Start()	

   elseif (labelName == "BackToForeign") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("foreign")
		Walker.Start()

	elseif (labelName == "ToYalahar") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("yalahar")
		wait(1500,2000)
		Self.SayToNpc("yes")
		Walker.Start()
		
   elseif (labelName == "BackToFactory") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("factory")
		Walker.Start()

   elseif (labelName == "BackToSunken") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("sunken")
		Walker.Start()	

   elseif (labelName == "BackToMagician") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("pass")
		wait(1500,2000)
		Self.SayToNpc("magician")
		Walker.Start()
  
  elseif (labelName == "ToVengoth") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("vengoth")
		wait(1500,2000)
		Self.SayToNpc("yes")
		Walker.Start()	
	
	
	  elseif (labelName == "ToLB") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("liberty bay")
		wait(1500,2000)
		Self.SayToNpc("yes")
		Walker.Start()	
			

----------------------------------------------------------------------------------------------------
    elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
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
				{5914, 0}, 	-- iron ore
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
		   	{5906, 0}, 	-- spider silk
		{9660, 0}, 	-- spider silk
		{3030, 0}, 	-- spider silk
		{238, 4}, 	-- spider silk
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
				{6553, 1}, 	-- snake skin 
						{827, 1}, 	-- snake skin 
		{3033, 0}, 	-- winged tail
		{5954, 0}, 	-- winged tail
		{9058, 0}, 	-- winged tail
		{6499, 0}, 	-- winged tail		
		{9058, 0}, 	-- winged tail		               
 {21168, 1}, 	-- winged tail	
	        {3063, 1}, 	-- mercenary sword
		{7407, 1}, 	-- winged tail			
                {823, 1}, 	-- terra legs
		{3320, 1}, 	-- terra mantle
		{3381, 1}, 	-- crown armor
		{3436, 1},	-- medusa shield
		{21177, 1},	-- medusa shield
		{10282, 0}, 	-- hydra head
				{9058, 0}, 	-- hydra head
		{9667, 0}, 	-- hydra head
		{9058, 0}, 	-- hydra head
		{9632, 0}, 	-- a
		{3369, 1}, 	-- ancient stone
		{8063, 1}, 	-- ancient stone
		{3354, 1}, 	-- ancient stone
		{3428, 1}, 	-- ancient stone
		{7393, 1}, 	-- ancient stone
		{3048, 1}, 	-- ancient stone
		{8896, 2}, 	-- b
		{3360, 1}, 	-- ancient stone
		{7386, 1}, 	-- ancient stone
		{10438, 1}, 	-- ancient stone
		{7388, 1}, 	-- ancient stone
		{8057, 1}, 	-- ancient stone
		{7430, 1}, 	-- ancient stone
	{10438, 1}, 	-- ancient stone
		{7388, 1}, 	-- ancient stone
		{3554, 1}, 	-- ancient stone		
{8896, 2}, 	-- b     		
                {9302, 1}, 	-- sackred tree amulet
		{3033, 0}, 	-- stone skin amulet
		{3029, 0}, 	-- zaoan sword
		{10313, 0}, 	-- zaoan sword
		{3281, 1}, 	-- guardian halberd
		{3041, 1}, 	-- guardian halberd		
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
		{3342, 1}, 	-- zaoan sword
		{7402, 1}, 	-- guardian halberd
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
				{3065, 1}, 	-- guardian halberd
						{3371, 1}, 	-- guardian halberd
		{3364, 1}, 	-- royal helmet
				{7452, 1}, 	-- royal helmet
						{9058, 0}, 	-- royal helmet
		{3392, 1}, 	-- royal helmet
				{3369, 1}, 	-- royal helmet
				{8082, 1}, 	-- royal helmet
						{8061, 1}, 	-- royal helmet
		{10304, 0}, 	-- royal helmet
		{7456, 1}, 	-- royal helmet
		{8898, 1}, 	-- royal helmet
				{7419, 1}, 	-- royal helmet
						{7421, 1}, 	-- royal helmet
		{3028, 0}, 	-- royal helmet
				{3281, 1}, 	-- royal helmet
						{7427, 1}, 	-- royal helmet
		{3033, 1}, 	-- royal helmet
				{3071, 1}, 	-- royal helmet
		{3354, 1}, 	-- royal helmet
		{8074, 1}, 	-- spellbook of mind control
		{3414, 1}, 	-- dragon slayer
		{3420, 1}, 	-- boots of haste
		{7382, 1}, 	-- boots of haste
		{10316, 0}, 	-- boots of haste
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
		{8082, 1}, 	-- royal helmet
		{3364, 1}, 	-- royal helmet
		{7412, 1}, 	-- royal helmet
		{5801, 1}, 	-- royal helmet
		{3354, 1}, 	-- royal helmet
		{8074, 1}, 	-- spellbook of mind control
		{3414, 1}, 	-- dragon slayer
		{3420, 1}, 	-- boots of haste
		{7382, 1}, 	-- boots of haste
		{7368, 3}, 	-- boots of haste
		{7418, 1} 	-- noble axe
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)

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
-----------------------------------------------------------------------------------------------------
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("Targeting Off")
		wait(900, 1200)

	        elseif (labelName == "Wait") then
		setWalkerEnabled(false)
			wait(4102, 8940)
		setWalkerEnabled(true)		
		
		----------------------------------------------------------------------------------------------------
 elseif (labelName == "TargetingOn") then 
       	setTargetingEnabled(true)	
         print("Targeting On")
		 wait(900, 1200)						 
----------------------------------------------------------------------------------------------------
elseif (labelName == "ToCemetery") then
		setWalkerEnabled(false)
		print("Wchodze na Cmentarz")
		wait(200, 300)
		Self.SayToNpc({"Hi"})
		wait(1000,1500)
		Self.SayToNpc({"Pass"})
		wait(1000,1500)
		Self.SayToNpc({"Cemetery"})
		wait(1000,1500)
		setWalkerEnabled(true)
----------------------------------------------------------------------------------------------------		
elseif (labelName == "ToYala") then
		setWalkerEnabled(false)
		print("Wracam do Yalahar")
		wait(200, 300)
		Self.SayToNpc({"Hi"})
		wait(1000,1500)
		Self.SayToNpc({"Pass"})
		wait(1000,1500)
		Self.SayToNpc({"Magician"})
		wait(1000,1500)
		setWalkerEnabled(true)
		
		

end
end	
end	