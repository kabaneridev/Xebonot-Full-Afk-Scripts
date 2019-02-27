

--BP SETUP--
local MainBp  = "Backpack of holding" ----- Main Backpack
local LootBp  = "Blue Backpack" ---------- Backpack to put loot in
local StackBp  = "Brocade Backpack" -------- Backpack to put stack in
local GoldBp  = "Jewelled Backpack" ----------- Backpack to put gold in
local ManaBp = "Zaoan chess box" --------- Backpack to put manas in
 --------- Backpack to put ammo in
--(info: all the bps should be different (individual) colours)

--[[
Depot SETUP (Have 4 backpacks in your depot, filled with backpacks)
BP1 = Rashid
BP2 = Blue Djinn
BP3 = Green Djinn
BP4 = Creature Products & DL Trophies
--]]


--[[Variables]]--
local MinCap = 120 -- Mininum cap
local ManaPotID = 23373 -- ID of mana potion
local ManaPotCost = 120 -- Cost of each mana potion
local MinManaPot = 200 -- Mininum mana potions
local MaxManaPot = 800 -- Maximum mana potions to buy
local AmmoID = 23373 -- ID of Ammo (prismatic bolt = 16141 / crystalline arrow = 15793)
local MinAmmo = 1 -- Minimum amount of ammo
local MaxAmmo = 2 -- Maximum amount of ammo to buy
local AmmoCost = 100 -- Cost of 1 arrow/bolt
local SpiritPotID = 3155 -- ID of great spirit potion
local SpiritPotCost = 110 -- Cost of each spirit potion
local MinSpiritPot = 50 -- Minimum spirit potions
local MaxSpiritPot = 100 -- Maximum spirit potions to buy
local UsingSoftboots = false -- Using Softboots? (set to true or false)
local KillPit = false -- Do you want to kill the 4 dragon lords in the pit in the middle? Better be 150+! (set to true or false)
local TrainType ="XXX"	 -- What skill do you want to train? (set to "sword", "axe", "club", "distance" or "magic".)

--[[########################################################]]--
--[[##########NOTHING BELOW HERE SHOULD BE CHANGED##########]]--
--[[########################################################]]--

--[[LABEL MANAGER]]--
displayInformationMessage("MS GRIMY HELIAR BY Gucci")
registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")

function onWalkerSelectLabel(labelName)
	
	if (labelName == "StartAnywhere") then
        print("Starting Script - Dara DL's for RP's")
        Targeting.Start()
		Looter.Start()
		Walker.Start()
		
elseif (labelName == "CheckCarlin") then	
	 print("Checking Carlin...")
		if ((Self.DistanceFromPosition(32327, 31789, 7) < 200)) then
			Walker.Goto("Carlin")
		else
			wait(100)
		end	
	elseif (labelName == "CheckVenore") then
	print("Checking Venore...")	
		if ((Self.DistanceFromPosition(32954, 32039, 6) < 200)) then
			Walker.Goto("Venore")
		else
			wait(100)
		end	
	elseif (labelName == "CheckEdron") then	
	print("Checking Edron...")	
		if ((Self.DistanceFromPosition(33191, 31790, 7) < 200)) then
			Walker.Goto("Edron")
		else
			wait(100)
		end	
	elseif (labelName == "CheckAnkrahmun") then	
	print("Checking Ankrahmun...")	
		if ((Self.DistanceFromPosition(33088, 32851, 7) < 200)) then
			Walker.Goto("Ankrahmun")
		else
			wait(100)
		end	
	elseif (labelName == "CheckDarashia") then
	print("Checking Darashia...")		
		if ((Self.DistanceFromPosition(33258, 32474, 7) < 200)) then
			Walker.Goto("StartAboveDepot")
		else
			wait(100)
		end	
	elseif (labelName == "CheckLibertyBay") then
	print("Checking Liberty Bay...")		
		if ((Self.DistanceFromPosition(32311, 32854, 7) < 200)) then
			Walker.Goto("LibertyBay")
		else
			wait(100)
		end	
	elseif (labelName == "CheckThais") then	
	print("Checking Thais...")	
		if ((Self.DistanceFromPosition(32337, 32216, 7) < 200)) then
			Walker.Goto("Thais")
		else
			wait(100)
		end	
	elseif (labelName == "CheckSvargrond") then	
	print("Checking Svargrond...")	
		if ((Self.DistanceFromPosition(32308, 31127, 7) < 200)) then
			Walker.Goto("Svargrond")
		else
			wait(100)
		end	
	elseif (labelName == "CheckAbdendriel") then
		print("Checking Ab'dendriel...")	
		if ((Self.DistanceFromPosition(32701, 31663, 7) < 200)) then
			Walker.Goto("Abdendriel")
		else
			wait(100)
		end	
	
	
	elseif (labelName == "CheckPortHope") then
		print("Checking Port Hope...")	
		if ((Self.DistanceFromPosition(32615, 32788, 6) < 100)) then
		Walker.Goto("PortHope")
		else
			wait(100)		
		end
		
	elseif (labelName == "CheckYalahar") then
		print("Checking Yalahar...")	
		if ((Self.DistanceFromPosition(32786, 31247, 7) < 100)) then
			Walker.Goto("Yalahar")
		else
			Walker.Goto("StartAnywhere")
		end		
		
	elseif (labelName == "Done") then	
	 print("Restarting Loop")
			Walker.Goto("StartAboveDepot")
			
	
	elseif (labelName == "Thais") then
	print("Found location : Thais!")		
			
	
	elseif (labelName == "Venore") then
	print("Found location : Venore!")
			
	
	elseif (labelName == "Darashia") then
	print("Found location : Darashia!")		
			
	
	elseif (labelName == "Svargrond") then
	print("Found location : Svargrond!")	
	
	elseif (labelName == "Carlin") then
	print("Found location : Carlin!")	
	
	elseif (labelName == "Abdendriel") then
	print("Found location : Ab'dendriel!")	
			
	
	elseif (labelName == "Ankrahmun") then
	print("Found location : Ankrahmun!")
			
	
	elseif (labelName == "LibertyBay") then
	print("Found location : Liberty Bay!")		
	
	elseif (labelName == "PortHope") then
	print("Found location : Port Hope!")		
    
	elseif (labelName == "Edron") then
	print("Found location : Edron!")	

	elseif (labelName == "Yalahar") then
	print("Found location : Yalahar!")	
	
	elseif (labelName == "Arrived") then
	print("Arrived in Darashia!")		
	Walker.Goto("ArrivedDara")	

			
	--[DepositGold]]--
	elseif (labelName == "DepositCash") then
        print("Depositing Gold")	
		setWalkerEnabled(false)			
		Walker.Stop()
		Walker.Start()
		setWalkerEnabled(true)
	
	--[Open Backpacks]]--	
	elseif (labelName == "OpenBP") then
        print("Opening Backpacks")	
            setWalkerEnabled(false)
            Self.CloseContainers()
            Self.OpenMainBackpack(true):OpenChildren({LootBp, true}, {StackBp, true}, {GoldBp, false}, {ManaBp, true})
		setWalkerEnabled(true) 
	
	elseif (labelName == "CheckBP") then
        print("Checking Backpacks")	
		if #Container.GetAll() == 4 then
		Walker.Goto("BPsOK")
		else
		Walker.Goto("OpenBP")	
		end
		setWalkerEnabled(true) 			
	
	elseif  (labelName == "Potchecker") then
		if ((Self.ItemCount(ManaPotID) < MaxManaPot) and (Self.ItemCount(SpiritPotID) < MaxSpiritPot)) then
			gotoLabel("BuyPotions")
	end
	
		elseif (labelName == "Minimize") then
            setWalkerEnabled(false)
			Client.HideEquipment()
			wait(500, 1400)
			for x = 0, #Container.GetIndexes() - 1 do
				local bp = Container.GetFromIndex(x) 
				bp:Minimize()
				wait(200, 400)
			end
			setWalkerEnabled(true) 
	
	--[DepositItems]]--
	elseif (labelName == "Depost") then
        print("Depositing Items")	
		Walker.Stop()
		Self.ReachDepo()
		Self.DepositItems({3386, 0}, {7402, 0}, {7430, 0}, {818, 0}, {3051, 0})	-- Rashid
		Self.DepositItems({3392, 1}, {3416, 1}, {3280, 1}, {3071, 1}, {3301, 1}) 	-- Blue Djinn
		Self.DepositItems({3428, 2}, {3322, 2}, {3297, 2}) 				-- Green Djinn			
		Self.DepositItems({7399, 3}, {5882, 3}, {3028, 3}, {3029, 3}, {5948, 3}, {5877, 3}, {11457, 3}, {236, 3}, {5920, 3}, {3061, 3}, {266, 3}, {7378, 3}, {3450, 3}, {3583, 3}, {3732, 3}, {3449, 3}, {2903, 3}) -- Creature Products & Trophies
		Walker.Start()
					 					 	
	--[[RefillPotions]]--
	elseif (labelName == "WithdrawCash") then
    print("Withdrawing Cash")	
	Walker.Stop()
		Self.SayToNpc({"hi", "deposit all", "yes", "balance"}, 60, 5)
		local totalManaCost = math.abs((ManaPotCost*(MaxManaPot-Self.ItemCount(ManaPotID))))
		local totalAmmoCost = math.abs((AmmoCost*(MaxAmmo-Self.ItemCount(AmmoID))))
		local totalSpiritCost = math.abs((SpiritPotCost*(MaxSpiritPot-Self.ItemCount(SpiritPotID))))		
		
		local boatMoney = 1000
		local totalmoneyneeded = (totalManaCost + totalSpiritCost + totalAmmoCost + boatMoney)
			wait(100,300)
			local MATHCEIL = (math.ceil((totalmoneyneeded/1000)))*1000
			if (MATHCEIL > 0) then			
			wait(700,1400)
			Self.WithdrawMoney(MATHCEIL)
			wait(500,900)
			end
			Walker.Start()
	
	--[[WithdrawSofts]]--
	elseif (labelName == "WithdrawSofts") then
    print("Withdrawing Soft Boots Money")		
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
	Walker.Start()

	--[[BuyPotions&Ammo]]--
	elseif (labelName == "BuyPotions") then
    print("Buying Potions")		
    Walker.Stop()
		Self.SayToNpc({"hi", "vial", "yes", "yes", "trade", "magic"}, 65)
		wait(900, 1200)
		Self.ShopBuyItemsUpTo(ManaPotID, MaxManaPot)
		wait(500,900)	
		Self.ShopBuyItemsUpTo(ManaPotID, MaxManaPot)
		wait(500,900)
		Self.ShopBuyItemsUpTo(ManaPotID, MaxManaPot)
		wait(500,900)		
		Self.ShopBuyItemsUpTo(ManaPotID, MaxManaPot)
		wait(500,900)	
		Self.ShopBuyItemsUpTo(ManaPotID, MaxManaPot)
		wait(500,900)	
		Self.ShopBuyItemsUpTo(SpiritPotID, MaxSpiritPot)
		wait(500,900)	
		Self.ShopBuyItemsUpTo(SpiritPotID, MaxSpiritPot)		
		wait(500,900)			
	Walker.Start()
	
		elseif (labelName == "BuyAmmo") then
    print("Buying Ammo")		
    Walker.Stop()
		Self.SayToNpc({"hi", "vial", "yes", "yes", "trade", "magic"}, 65)
		wait(900, 1200)
		Self.ShopBuyItemsUpTo(AmmoID, MaxAmmo)
		wait(500,900)	
		Self.ShopBuyItemsUpTo(AmmoID, MaxAmmo)
		wait(500,900)
		Self.ShopBuyItemsUpTo(AmmoID, MaxAmmo)
		wait(500,900)
		Self.ShopBuyItemsUpTo(AmmoID, MaxAmmo)
		wait(500,900)
		Self.ShopBuyItemsUpTo(AmmoID, MaxAmmo)
		wait(500,900)
		Self.ShopBuyItemsUpTo(AmmoID, MaxAmmo)
		wait(500,900)		
	Walker.Start()
	

	--[[TalkSofts]]--
	elseif (labelName == "RefillSofts") then
    Walker.Stop()
		Self.SayToNpc({"hi", "softboots", "yes"}, 65)
	Walker.Start()

	
	--[[Checkers]]--
	elseif (labelName == "CheckSofts") then
	print("Checking Softs")				
	delayWalker(3000)
		if (UsingSoftboots == true) and (Self.ItemCount(6530) >= 1) then
			gotoLabel("GoRefillSofts")
			else
			gotoLabel("SoftsOK")
		end
		
	elseif (labelName == "CheckPit") then
	print("Checking Pit")				
	delayWalker(3000)
		if (KillPit == true) then
			gotoLabel("GoPit")
			else
			gotoLabel("NoPit")
		end
				
	
	elseif (labelName == "CheckGo") then
	if (Self.ItemCount(3549) == 1) then
		print("Current Mana Potions: " .. Self.ItemCount(ManaPotID) .. " / " ..  MaxManaPot .. "\nCurrent Spirit Pots: " .. Self.ItemCount(SpiritPotID) .. " / " ..  MaxSpiritPot .. "\nCurrent Ammo: " .. Self.ItemCount(AmmoID) .. " / " ..  MaxAmmo ..  "\nSoft Boots" .. " = " ..  "Active" )			
	else
		print("Current Mana Potions: " .. Self.ItemCount(ManaPotID) .. " / " ..  MaxManaPot .. "\nCurrent Spirit Pots: " .. Self.ItemCount(SpiritPotID) .. " / " ..  MaxSpiritPot .. "\nCurrent Ammo: " .. Self.ItemCount(AmmoID) .. " / " ..  MaxAmmo ..  "\nSoft Boots" .. " = " ..  "Not found" )
	end
	delayWalker(3000)
		if ((Self.ItemCount(ManaPotID) < MaxManaPot) or (Self.Cap() < MinCap) or (Self.ItemCount(AmmoID) < MaxAmmo) or (Self.ItemCount(SpiritPotID) < MaxSpiritPot)) then
			gotoLabel("GoRefill")
	end	
	
	elseif (labelName == "CheckRefill") then
	if (Self.ItemCount(3549) == 1) then
		print("Current Mana Potions: " .. Self.ItemCount(ManaPotID) .. " / " ..  MaxManaPot .. "\nCurrent Spirit Pots: " .. Self.ItemCount(SpiritPotID) .. " / " ..  MaxSpiritPot .. "\nCurrent Ammo: " .. Self.ItemCount(AmmoID) .. " / " ..  MaxAmmo ..  "\nSoft Boots" .. " = " ..  "Active" )			
	else
		print("Current Mana Potions: " .. Self.ItemCount(ManaPotID) .. " / " ..  MaxManaPot .. "\nCurrent Spirit Pots: " .. Self.ItemCount(SpiritPotID) .. " / " ..  MaxSpiritPot .. "\nCurrent Ammo: " .. Self.ItemCount(AmmoID) .. " / " ..  MaxAmmo ..  "\nSoft Boots" .. " = " ..  "Not found" )
	end
	delayWalker(3000)
		if ((Self.ItemCount(ManaPotID) < MaxManaPot) or (Self.Cap() <= MinCap) or (Self.ItemCount(AmmoID) < MaxAmmo) or (Self.ItemCount(SpiritPotID) < MaxSpiritPot)) then
			gotoLabel("StartAboveDepo")
	end		


	elseif (labelName == "Check") then
		if ((Self.ItemCount(ManaPotID) < MinManaPot) or (Self.ItemCount(SpiritPotID) < MinSpiritPot)) then
			gotoLabel("Leave")
			else
			gotoLabel("KeepHunting")
	end
	
	--[Walking, Picking, Doors]]--	
	elseif (labelName == "StepEast") then
	setWalkerEnabled(false)
		delayWalker(500)
		Self.Step(EAST)
		wait(500)
		setWalkerEnabled(true)	

	elseif (labelName == "StepWest") then
	setWalkerEnabled(false)
		delayWalker(500)
		Self.Step(WEST)
		wait(500)
		setWalkerEnabled(true)	

	elseif (labelName == "StepNorth") then
	setWalkerEnabled(false)
		delayWalker(500)
		Self.Step(NORTH)
		wait(500)
		setWalkerEnabled(true)	

	elseif (labelName == "StepSouth") then
	setWalkerEnabled(false)
		delayWalker(500)
		Self.Step(SOUTH)
		wait(500)
		setWalkerEnabled(true)			
	
	elseif (labelName == "DoorSouth") then
		setWalkerEnabled(false)
		wait(500)
		Self.OpenDoor(Self.Position().x, Self.Position().y + 1, Self.Position().z)
		setWalkerEnabled(true) 	
		
	elseif (labelName == "DoorNorth") then
		setWalkerEnabled(false)
		wait(500)
		Self.OpenDoor(Self.Position().x, Self.Position().y - 1, Self.Position().z)
		setWalkerEnabled(true) 		
		
	elseif (labelName == "DoorEast") then
		setWalkerEnabled(false)
		wait(500)
		Self.OpenDoor(Self.Position().x + 1, Self.Position().y, Self.Position().z)
		setWalkerEnabled(true) 		
			elseif (labelName == "DoorWest") then
		setWalkerEnabled(false)
		wait(500)
		Self.OpenDoor(Self.Position().x - 1, Self.Position().y, Self.Position().z)
		setWalkerEnabled(true) 
	
	elseif (labelName == "Haste") then 
        Self.Say("Utani Hur")
		wait(100)
					
				
	
	--[[Stamina]]--	
		elseif (labelName == "StaminaChecker") then
		if (Self.Stamina() < 960) then
			Walker.Goto("BadStamina")
		else
			Walker.Goto("GoodStamina")
		end
		
		elseif (labelName == "CheckSkill") then
		Walker.Stop()
		Targeting.Stop()
		if (TrainType == "axe") then
		print("Axe!")			
			Walker.Goto("Axe")
		elseif (TrainType == "sword") then
		print("Sword!")	
			Walker.Goto("Sword")
		elseif (TrainType == "club") then
		print("Club!")		
			Walker.Goto("Club")
		elseif (TrainType == "distance") then
		print("Distance!")		
			Walker.Goto("Distance")
		elseif (TrainType == "magic") then
		print("Magic!")		
			Walker.Goto("Magic")
		end
		Walker.Start()		
		
	elseif (labelName == "UseClub") then
		Self.UseItemFromGround(33239, 32411, 7)
	
	elseif (labelName == "UseDistance") then
		Self.UseItemFromGround(33241, 32411, 7)

	elseif (labelName == "UseMagic") then
		Self.UseItemFromGround(33237, 32411, 7)

	elseif (labelName == "UseSword") then
		Self.UseItemFromGround(33238, 32407, 7)

	elseif (labelName == "UseAxe") then	
		Self.UseItemFromGround(33241, 32407, 7)		
	
	--[[TalkBoat]]--
	elseif (labelName == "DaraToVenore") then
    Walker.Stop()
		Creature.Follow("Petros")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	
	elseif (labelName == "ToHeliar") then
    Walker.Stop()
		Creature.Follow("Captain Gabriel")	
		Self.SayToNpc({"hi", "Heliar", "yes"}, 65)
	Walker.Start()

	
	elseif (labelName == "ToEngran") then
    Walker.Stop()
		Creature.Follow("Captain Marco")	
		Self.SayToNpc({"hi", "Engran", "yes"}, 65)
	Walker.Start()
		
	
	elseif (labelName == "ToCarlin") then
    Walker.Stop()
		Creature.Follow("Captain Fearless")	
		Self.SayToNpc({"hi", "carlin", "yes"}, 65)
	Walker.Start()
	
	
	elseif (labelName == "EdronToAnk") then
    Walker.Stop()
		Creature.Follow("Captain Seahorse")	
		Self.SayToNpc({"hi", "ankrahmun", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "AnkToVenore") then
    Walker.Stop()
		Creature.Follow("Captain Sinbeard")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "DaraToVenore") then
    Walker.Stop()
		Creature.Follow("Petros")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "LbToDara") then
    Walker.Stop()
		Creature.Follow("Jack Fate")	
		Self.SayToNpc({"hi", "darashia", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "ThaisToVenore") then
    Walker.Stop()
		Creature.Follow("Captain Bluebear")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "SvarToVenore") then
    Walker.Stop()
		Creature.Follow("Captain Breezelda")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "AbToVenore") then
    Walker.Stop()
		Creature.Follow("Captain Seagull")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "PhToDara") then
    Walker.Stop()
		Creature.Follow("Charles")	
		Self.SayToNpc({"hi", "darashia", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "CarlinToVenore") then
    Walker.Stop()
		Creature.Follow("Captain Greyhound")	
		Self.SayToNpc({"hi", "venore", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "YalaToDara") then
    Walker.Stop()
		Creature.Follow("Karith")	
		Self.SayToNpc({"hi", "darashia", "yes"}, 65)
	Walker.Start()
	
	elseif (labelName == "DoorSouth") then
		setWalkerEnabled(false)
		wait(500)
		Self.OpenDoor(Self.Position().x, Self.Position().y + 1, Self.Position().z)
		setWalkerEnabled(true) 	
		
		
		
	end
	end
			
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--[[FUNCTIONS]]--			
	--[[DepotChooser]]--
	Self.ReachDepo = function (attempt)
	local attempt = attempt or 4
	Walker.Stop()
	local DepotIDs = {3497, 3498, 3499, 3500}
	local DepotPos = {}
	for i = 1, #DepotIDs do
		local dps = Map.GetUseItems(DepotIDs[i])
		for d = 1, #dps do
			table.insert(DepotPos, dps[d])
		end
	end
	local function gotoDepot()
		local pos = Self.Position()
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
				print("There is something blocking the path.")
			end
		end
		return false
	end
	repeat
		reachedDP = gotoDepot()
		if reachedDP then
			return true
		end
		attempt = attempt - 1
		sleep(100)
		print("Attempt to reach depot was unsuccessfull. " .. attempt .. " attempts left.")
	until attempt <= 0
	return false
end

function dropBlood(id)
local cont = Container.New(1)
while (cont:isOpen()) do
    for spot = 0, cont:ItemCount() do
            local item = cont:GetItemData(spot)
    if (item.id == id) then
            cont:MoveItemToGround(spot, Self.Position().x, Self.Position().y, Self.Position().z)
        return true
    end
end 
cont = cont:GetNext()
end 
return false
end

function dropOil(id)
local cont = Container.New(2)
while (cont:isOpen()) do
    for spot = 0, cont:ItemCount() do
            local item = cont:GetItemData(spot)
    if (item.id == id) then
            cont:MoveItemToGround(spot, Self.Position().x, Self.Position().y, Self.Position().z)
        return true
    end
end 
cont = cont:GetNext()
end 
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