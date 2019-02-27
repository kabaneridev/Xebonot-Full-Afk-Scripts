-----SETTINGS--------------------------------------------------------------
--Supples--
local ManaID = 23373 --- Which mana potions are you using? 
local MinMana = 300 --- How many mana potions until you leave the hunt.
local MaxMana = 1300 --- How many mana potions you begin the hunt with.
local ManaPrice = 350 --- What is the price of your selected mana potions?

local HealthID = 3202 --- Which health potions are you using?
local MinHealth = 250 --- How many health potions until you leave the hunt.
local MaxHealth = 400 --- How many health potions you begin the hunt with.
local HealthPrice = 45


local avaID = 3161 --- Which health potions are you using?
local MinAva = 1 --- How many health potions until you leave the hunt.
local MaxAva = 100 --- How many health potions you begin the hunt with.
local AvaPrice = 45--- What is the price of your selected mana potions?

local gfbID = 3162

local SoftBoots = true		--- Do you want to use softboots? 'true' or 'false'

--CAP--
local MinCap = 1 --- Leaves spawn when character reaches this cap.

-- Seller --
local itemID = 8061
local item2ID = 823
local item3ID = 3019
local item4ID = 3567
local item5ID = 7418
local item6ID = 7383
local item7ID = 3428

--BP SETUP--
local MainBp  = "backpack of holding" ----- Main Backpack
local GoldBp  = "Dragon Backpack" ---- Backpack to put gold in
local LootBp  = "Zaoan Chess Box" ---- Potion Bp
local AmmoBp  = "Camouflage backpack" ---- Potion Bp
local StackBp  = "Jewelled Backpack" ---- Potion Bp
local NonStackBp  = "purple backpack" ---- Potion Bp

-----END OF SETTINGS-------------------------------------------------------
-----DO NOT EDIT BELOW HERE IF YOU DONT KNOW WHAT TO DO--------------------

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")
local info = [[
MS INQ Phantasm fixed by Gucci
]]
    print([[
MS INQ Phantasm fixed by Gucci]])
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
setLooterEnabled(false)

-----------------------------------------------------------------
function onWalkerSelectLabel(labelName)
----------------------------------------------------------------------------------------------------
     if (labelName == "Backpacks") then
            	setWalkerEnabled(false)
            Self.CloseContainers()
            Self.OpenMainBackpack(true):OpenChildren({GoldBp, true},{LootBp, true},{StackBp, true})
		setWalkerEnabled(true) 
----------------------------------------------------------------------------------------------------

elseif (labelName == "HuntHardcore") then
		print("Hunt Hardcore TRUE/FALSE")	Walker.ConditionalGoto((HuntHardcore) and (Self.ItemCount(268) > MinMana) and (Self.ItemCount(23375) > MinHealth), "HuntHardcore", "NoHardcore")
----------------------------------------------------------------------------------------------------
	elseif (labelName == "StaminaCheck1") then
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
		if ((SoftBoots == true) and (Self.ItemCount(6530) >= 1)) then
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
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("withdraw 30000")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()
		
		
	elseif (labelName == "Thais") then  
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
		
	elseif (labelName == "Venore") then  
		Walker.Stop()
		Creature.Follow("Captain Bluebear")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Venore")
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
		Self.SayToNpc("Soft Boots")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()			
   		
     elseif (labelName == "ylum") then  
		Walker.Stop()
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Asylum")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()  
		
	elseif (labelName == "Edron") then  
		Walker.Stop()
		Creature.Follow("Captain Seahorse")
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Edron")
		wait(1500,2000)
		Self.SayToNpc("yes")
		wait(1500,2000)
		Walker.Start()

	elseif (labelName == "Ankrahmun") then  
		Walker.Stop()
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Ankrahmun")
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

elseif (labelName == "Exana Pox") then  
		wait(1500,2000)
		Self.SayToNpc("exana pox")
		wait(1500,2000)
		Self.SayToNpc("utana vid")
		wait(1500,2000)
		Walker.Start()		

elseif (labelName == "Engran") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Engran")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
elseif (labelName == "Roshamuul") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Roshamuul")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()
		
elseif (labelName == "Oxidia") then  
		Walker.Stop()
		wait(1500,2000)
		Self.SayToNpc("hi")
		wait(1500,2000)
		Self.SayToNpc("Cursed Island")
		wait(1500,2000)
		Self.SayToNpc("Yes")
		wait(1500,2000)
		Walker.Start()

elseif (labelName == "Darashia") then
setWalkerEnabled(false)
delayWalker(2000) 
Self.Say("hi")
sleep(math.random(700, 1400)) 
Self.SayToNpc("darashia")
sleep(math.random(700, 1400)) 
Self.SayToNpc("yes")
setWalkerEnabled(true)

elseif (labelName == "Asylum") then
setWalkerEnabled(false)
delayWalker(2000) 
Self.Say("hi")
sleep(math.random(700, 1400))
Self.SayToNpc("asylum") -- Tutaj wpisz wyspe powrotna
sleep(math.random(300, 1000))
Self.SayToNpc("yes")
setWalkerEnabled(true)


elseif (labelName == "LeviUpW") then
		Walker.Stop()
		wait(500, 1000)
		Self.Turn(WEST)
		wait(500, 1000)
		Self.Say("Exani hur up")
		wait(2000, 2500)
		Walker.Start()
	
	elseif (labelName == "LeviDownS") then
		Walker.Stop()
		wait(500, 1000)
		Self.Turn(SOUTH)
		wait(500, 1000)
		Self.Say("Exani hur down")
		wait(2000, 2500)
		Walker.Start()
		
	elseif (labelName == "LeviDownE") then
		Walker.Stop()
		wait(500, 1000)
		Self.Turn(EAST)
		wait(500, 1000)
		Self.Say("Exani hur down")
		wait(2000, 2500)
		Walker.Start()
	
	elseif (labelName == "LeviUpN") then
		Walker.Stop()
		wait(500, 1000)
		Self.Turn(NORTH)
		wait(500, 1000)
		Self.Say("Exani hur up")
		wait(2000, 2500)
		Walker.Start()

	elseif (labelName == "DoorS") then
		setWalkerEnabled(false)
		wait(200)
		Self.OpenDoor(Self.Position().x, Self.Position().y + 1, Self.Position().z)
		wait(200)
		Self.OpenDoor(Self.Position().x, Self.Position().y + 1, Self.Position().z)		
		setWalkerEnabled(true) 	
		
	elseif (labelName == "DoorN") then
		setWalkerEnabled(false)
		wait(200)
		Self.OpenDoor(Self.Position().x, Self.Position().y - 1, Self.Position().z)
		wait(200)
		Self.OpenDoor(Self.Position().x, Self.Position().y - 1, Self.Position().z)		
		setWalkerEnabled(true) 		
		
	elseif (labelName == "DoorE") then
		setWalkerEnabled(false)
		wait(200)
		Self.OpenDoor(Self.Position().x + 1, Self.Position().y, Self.Position().z)
		wait(200)
		Self.OpenDoor(Self.Position().x + 1, Self.Position().y, Self.Position().z)		
		setWalkerEnabled(true) 	
		
	elseif (labelName == "DoorW") then
		setWalkerEnabled(false)
		wait(200)
		Self.OpenDoor(Self.Position().x - 1, Self.Position().y, Self.Position().z)
		wait(200)
		Self.OpenDoor(Self.Position().x - 1, Self.Position().y, Self.Position().z)		
		setWalkerEnabled(true)
	
	elseif (labelName == "OpenE") then
		Walker.Stop()
		Self.UseItemFromGround(Self.Position().x + 1, Self.Position().y, Self.Position().z) 
		Walker.Start()

	elseif (labelName == "OpenW") then
		Walker.Stop()
		Self.UseItemFromGround(Self.Position().x - 1, Self.Position().y, Self.Position().z) 
		Walker.Start()
		
	elseif (labelName == "OpenN") then
		Walker.Stop()
		Self.UseItemFromGround(Self.Position().x, Self.Position().y - 1, Self.Position().z) 
		Walker.Start()
		
	elseif (labelName == "OpenS") then
		Walker.Stop()
		Self.UseItemFromGround(Self.Position().x, Self.Position().y + 1, Self.Position().z) 
		Walker.Start()
		
---------------------------------------------------------------------------------------------------		
    elseif (labelName == "Bank") then
			setWalkerEnabled(false)
			Self.SayToNpc({"hi", "deposit all", "yes"}, 65)
			Self.SayToNpc({"balance"}, 65)
            setWalkerEnabled(true)
		sleep(math.random(600, 1100)) 

elseif (labelName == "Seller1") then
		setWalkerEnabled(false)
			delayWalker(10000)
			Self.SayToNpc("hi")
			sleep(math.random(800, 1700))
			Self.SayToNpc("trade")
			sleep(math.random(2000, 2400))
			Self.ShopSellItem(itemID, Self.ShopGetItemSaleCount(itemID))
			sleep(math.random(2000, 2400))
			Self.ShopSellItem(item2ID, Self.ShopGetItemSaleCount(item2ID))
			sleep(math.random(2000, 2400))
			Self.ShopSellItem(item3ID, Self.ShopGetItemSaleCount(item3ID))
			sleep(math.random(2000, 2400))
			Self.ShopSellItem(item4ID, Self.ShopGetItemSaleCount(item4ID))
			sleep(math.random(2000, 2400))
			Self.ShopSellItem(item5ID, Self.ShopGetItemSaleCount(item5ID))
			sleep(math.random(2000, 2400))
			Self.ShopSellItem(item6ID, Self.ShopGetItemSaleCount(item6ID))
			sleep(math.random(2000, 2400))
                  setWalkerEnabled(true)


function SellItems(item)
wait(300, 1700)
Self.ShopSellItem(item, Self.ShopGetItemSaleCount(item))
wait(900, 1200)
end 

----------------------------------------------------------------------------------------------------
    elseif (labelName == "First Checker") then
			       	setWalkerEnabled(false)	
		if (Self.ItemCount(ManaID) < MaxMana) or (Self.ItemCount(HealthID) < MaxHealth) then
						print("Failed buying pots - Trying again")
				setWalkerEnabled(true) 
			            gotoLabel("ToPots1")
			else
				        print("ToHunt")
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
			if (Self.ItemCount(avaID) < MaxAva) then
				Self.ShopBuyItem(avaID, (MaxAva - Self.ItemCount(avaID)))
		sleep(math.random(600, 1100))
			end
		sleep(math.random(600, 1100))
		end
		setWalkerEnabled(true)
----------------------------------------------------------------------------------------------------
elseif (labelName == "Deposit") then
setWalkerEnabled(false)
Self.ReachDepot()
Self.DepositItems({5944, 6}, {3073, 6}, {6499, 6}, {8082, 6}, {3371, 6}, {10386, 6}, {10451, 6}, {10387, 6}, {10384, 6}, {10390, 6}, {10438, 6}, {10323, 6}, {10385, 6}, {7368, 7}, {10316, 7}, {3370, 6})
setLooterEnabled(false)
wait(1500,1900)
----------------------------------------------------------------------------------------------------
     elseif (labelName == "Checker") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana and Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 890) then
				print("Hunt Again..:")
							setWalkerEnabled(true) 
			gotoLabel("Start Hunt")
		else
			gotoLabel("Leave")	
				print("Go to refill")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------				
  elseif (labelName == "TargetingOff") then 
       	setTargetingEnabled(false)	
        print("&Targeting Wylaczony !&")
		wait(900, 1200)
		
		elseif (labelName == "LooterOff") then 
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
       if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana and Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 890) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Leave")	
				print("**Wracam Do Miasta !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check2") then
       	setWalkerEnabled(false)	
		 if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana and Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 890) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Leave")	
				print("**Wracam Do Miasta !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------
	 elseif (labelName == "Check3") then
       	setWalkerEnabled(false)	
	  if (Self.Cap() > MinCap and Self.ItemCount(ManaID) > MinMana and Self.ItemCount(HealthID) > MinHealth) and (Self.Stamina() > 890) then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Leave")	
				print("**Wracam Do Miasta !**")
			setWalkerEnabled(true) 
				end
----------------------------------------------------------------------------------------------------	 
elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 2100) then
     Walker.Goto("Train")
     else
     Walker.Goto("ToPots")
     end
     Walker.Start()
----------------------------------------------------------------------------------------------------
  elseif (labelName == "Rashid") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
wait(100, 150)
    SellItems(8061)
wait(100, 120)
	SellItems(823)
wait(100, 120)
	SellItems(7386)
wait(100, 120)
	SellItems(7418)
wait(100, 120)
	SellItems(3019)
wait(100, 120)
	SellItems(7383)
wait(100, 120)
	SellItems(3342)
wait(100, 120)
	SellItems(813)
wait(100, 120)
	SellItems(812)
wait(100, 120)
	SellItems(7430)
wait(100, 120)
	SellItems(7402)
wait(100, 120)
	SellItems(3360)
wait(100, 120)
	SellItems(8057)
wait(100, 120)
	Walker.Start()
	
  elseif (labelName == "Faah'Naan") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
wait(100, 150)
    SellItems(3392)
wait(100, 120)
	SellItems(3079)
wait(100, 120)
	Walker.Start()	

 elseif (labelName == "Rosie") then
Walker.Stop()
        Self.SayToNpc({"Hi", "Trade"}, 65)
wait(100, 150)
        SellItems(3027)
wait(100, 120)
	SellItems(9057)
wait(100, 120)
	SellItems(3030)
wait(100, 120)
	SellItems(3032)
wait(100, 120)
	SellItems(9058)
wait(100, 120)
	SellItems(3029)
wait(100, 120)
	Walker.Start()	
----------------------------------------------------------------------------------------------------
end
end

