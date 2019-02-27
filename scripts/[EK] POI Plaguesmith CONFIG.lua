----------------------------------------------------------
-------------------------Mleczko Script-------------------
----------------------------------------------------------

--Backpack Settings
local MainBp = "Backpack"
local PotionBp = "Zaoan Chess Box"
local NoStackBp = "Golden Backpack"
local StackBp = "Red Backpack"

--Supples Settings
local IDMana = 23375
local MinMana = 100 
local MaxMana = 600
local CenaMana = 300
 
local IDHealth = 268
local MinHealth = 200
local MaxHealth = 2000
local CenaHealth = 125
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
~~~~Poi Plagi By Gucci~~~~
]]
    print([[
~~~~Poi Plagi By Gucci~~~~]])
    wait(3000)
------------------------------------------
function onWalkerSelectLabel(labelName) --


	if (labelName == "Backpacks") then
            setWalkerEnabled(false)
            Self.CloseContainers()
            Self.OpenMainBackpack(true):OpenChildren({NoStackBp, true}, {StackBp, true}, {PotionBp, true})
			wait(200)
			setWalkerEnabled(true) 

		
---------------Checkery-----------------

elseif (labelName == "Check") then
       	setWalkerEnabled(false)	
		if (Self.Cap() > MinCap and Self.ItemCount(IDHealth) > MinHealth) and (Self.ItemCount(IDMana) > MinMana) then
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
		if (Self.ItemCount(IDMana) < MaxMana) or (Self.ItemCount(IDHealth) < MaxHealth) then
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
		
elseif (labelName == "Check1") then
       	setWalkerEnabled(false)	
		if (Self.ItemCount(IDMana) > MinMana) and (Self.Stamina() > 720) and (Self.ItemCount(HealthID) > MinHealth)then
				print("**Expienie Wznowione !**")
							setWalkerEnabled(true) 
		else
			gotoLabel("Refill")	
				print("**malo manasow lub runek wracam do dp.:D*")
			setWalkerEnabled(true) 
				end

   
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
        if (Self.Cap() > MinCap and Self.ItemCount(IDMana) > MinMana) and (Self.ItemCount(IDHealth) > MinHealth) then
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
        	Self.ShopBuyItem(IDHealth, (MaxHealth-Self.ItemCount(IDHealth)))
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
	
	 elseif (labelName == "DepositItems") then
		setWalkerEnabled(false)
            Self.ReachDepot()
            Self.DepositItems(
   	{5906, 0}, 	-- spider silk
		{9660, 0}, 	-- spider silk
		{3030, 0}, 	-- spider silk
		{238, 4}, 	-- spider silk
		{7643, 0}, 	-- iron ore
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
		{9058, 0}, 	-- hydra head
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
		{7382, 1}, 	-- boots of haste
				{10316, 1}, 	-- boots of haste
				{10438, 1}, 	-- boots of haste
						{3041, 1}, 	-- boots of haste
		{7368, 2}, 	-- boots of haste
		{7418, 1} 	-- noble axe
		)
		sleep(math.random(600, 1100))
		setWalkerEnabled(true)
	
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