----------------------------------------------------------
-------------------------Mleczko Script-------------------
----------------------------------------------------------

--Backpack Settings
local MainBp = "red backpack"
local PotionBp = "buggy backpack"
local NoStackBp = "brocade backpack"
local StackBp = "blue backpack"
local AsskiBp = "beach backpack"
--Supples Settings
local IDMana = 23374
local MinMana = 350 
local MaxMana = 1500
local CenaMana = 300
 
local IDAssHp = 7368
local MinAssHp = 100
local MaxAssHp = 450
local CenaAssHp = 125
--Cap Setings
local MinCap = 0 --Minimalna ilosc capa
local SoftBoots = true
--Target Looter czy ma byc właczony
setTargetingEnabled(true)
setLooterEnabled(true)

----------------------------------------------------------------------------------------------------------------------------------------------
--Poniżej NiE Ruszać--Poniżej NiE Ruszać--Poniżej NiE Ruszać--Poniżej NiE Ruszać--Poniżej NiE Ruszać--Poniżej NiE Ruszać--Poniżej NiE Ruszać--
----------------------------------------------------------------------------------------------------------------------------------------------
registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")


local info = [[
~~~~Poi Darki By Gucci~~~~
]]
    print([[
~~~~Poi Darki By Gucci~~~~]])
    wait(3000)
------------------------------------------
function onWalkerSelectLabel(labelName) --


	if (labelName == "Backpacks") then
            setWalkerEnabled(false)
            Self.CloseContainers()
            Self.OpenMainBackpack(true):OpenChildren({PotionBp, true}, {NoStackBp, true}, {StackBp, true}, {AsskiBp, true})
			wait(200)
			setWalkerEnabled(true) 

		
---------------Checkery-----------------

elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(IDAssHp) > MinAssHp) and (Self.ItemCount(IDMana) > MinMana) then
				print("Hunt Again...")
							setWalkerEnabled(true) 
			gotoLabel("Hunt")
		else
			gotoLabel("Refill")	
				print("Go To Refill...")
			setWalkerEnabled(true) 
				end
				
----------------------------
	elseif (labelName == "CheckPotion") then
		if (Self.ItemCount(IDMana) < MaxMana) or (Self.ItemCount(IDAssHp) < MaxAssHp) then
		Walker.Goto("BeforePotions")
		wait(1000,1000)
		print("Za malo potionow, kupuje na nowo")
		else
		Walker.Goto("SkipPotions")
		wait(1000,1000)
		print("Kupilem wszystko, ide na hunt")
		end				
			
----------------------------	
elseif (labelName == "CheckSoft") then  
		Walker.Stop()
		if ((SoftBoots == true) and (Self.ItemCount(6530) > 0)) then
			print([[2 Pary Zepsute Lecimy Naprawic]])
			Walker.Goto("RefillSoft")
		else
			print([[Niepotrzebna Naprawa Lecimy Dalej]])
			Walker.Goto("DoneSoft")
		end
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

		
elseif (labelName == "StaminaCheck") then
     Walker.Stop()
     if (Self.Stamina() < 850) then
     print("Mało Staminy Lecimy Off Skilla")
	 Walker.Goto("CheckOffline")	
	 else
     print("Go To Hunt")
	 Walker.Goto("GoToHunt")
     end
     Walker.Start()
	 
------------------------------------------------------------
			
elseif (labelName == "CheckExp") then
       	setWalkerEnabled(false)	
        if (Self.Cap() > MinCap and Self.ItemCount(IDMana) > MinMana) and (Self.ItemCount(IDAssHp) > MinAssHp) then
				print("**! Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("**! Wracam Do Miasta !**")
			setWalkerEnabled(true) 
				end

-----koniec checkerów-----
elseif (labelName == "PotionBuy") then
		setWalkerEnabled(false)
		delayWalker(10000) 
		Self.SayToNpc("hi")
		sleep(math.random(800, 1700)) 
		Self.SayToNpc("trade")
		sleep(math.random(2000, 2400)) 
        	Self.ShopBuyItem(IDMana, (MaxMana-Self.ItemCount(IDMana)))
		sleep(math.random(2000, 2400)) 
        	Self.ShopBuyItem(IDAssHp, (MaxAssHp-Self.ItemCount(IDAssHp)))
		sleep(math.random(800, 1700))
		setWalkerEnabled(true)
		
	elseif (labelName == "checkpos1") then
	if not(Self.Position().x == 32785 and Self.Position().y == 32336 and Self.Position().z == 7) then
	Walker.Goto("pos1")
	end

	elseif (labelName == "checkpos2") then
	if not(Self.Position().x == 32778 and Self.Position().y == 32328 and Self.Position().z == 7) then
	Walker.Goto("pos2")
	end
	
	elseif (labelName == "checkpos3") then
	if not(Self.Position().x == 32787 and Self.Position().y == 32328 and Self.Position().z == 6) then
	Walker.Goto("pos3")
	end
	
	elseif (labelName == "checkpos4") then
	if not(Self.Position().x == 32838 and Self.Position().y == 32230 and Self.Position().z == 13) then
	Walker.Goto("pos4")
	end	

	elseif (labelName == "checkpos5") then
	if not(Self.Position().x == 32767 and Self.Position().y == 32227 and Self.Position().z == 15) then
	Walker.Goto("pos5")
	end		
-----------------------------------------------------------------------------------------------------------------	

	elseif (labelName == "checkpos6") then
	if not(Self.Position().x == 32821 and Self.Position().y == 32238 and Self.Position().z == 12) then
	Walker.Goto("pos6")
	end

	elseif (labelName == "checkpos7") then
	if not(Self.Position().x == 32806 and Self.Position().y == 32328 and Self.Position().z == 15) then
	Walker.Goto("pos7")
	end	

	elseif (labelName == "checkpos8") then
	if not(Self.Position().x == 32794 and Self.Position().y == 32327 and Self.Position().z == 10) then
	Walker.Goto("pos8")
	end
	
	
	
end
--FUNCTIONS--

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
		print("Ilosc znalezionych Depo: " .. tostring(#DepotPos))
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
				print("To depo jest zajete, szukam dalej.")
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
		print("Nie udalo sie dotrzec do depo... " .. tries .. " szukam dalej.")
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
end