------ REFILL SETTINGS ------
local LeaveMana = 100 --- How many mana potions until you leave the hunt?
local BuyMana = 300 --- How many mana potions you begin the hunt with?

local LeaveHealth = 5 --- How many health potions until you leave the hunt?
local BuyHealth = 10 --- How many health potions you begin the hunt with?

local AmmoName = "Royal Spear"	--- What ammunition are you using?
local LeaveAmmo = 10 --- How much ammunition until you leave hunt?
local BuyAmmo = 45 --- How much ammunition do you begin the hunt with?
local AmmoCost = 15 --- What is the cost of your selected ammunition?

local LeaveCap = 100 --- Leaves spawn when character reaches this cap.
local HideEquipment = true --- Do you want to minimize your equipment?
local LogoutStamina = false --- Do you want to logout at 16 hours? (Inside the depot)

-- Item ID's, if you don't want to use SHP and SMP, change these:

local ManaName = "Strong Mana Potion" 
local ManaCost = 80
local HealthName = "Strong Health Potion" 
local HealthCost = 100

-- Backpack Configuration:

local LootBP = "Fur Backpack"
local GoldBP = "Jewelled Backpack"

-- Spawn Options

local HuntMiddle = false

-- Here I'm gonna get the item ids, leave this as it is.

local ManaID = Item.GetID(ManaName)
local HealthID = Item.GetID(HealthName)
local AmmoID = Item.GetID(AmmoName)

-- These are the flask IDs, not worth changing since it will sell all flasks regardless of type.
local FlaskID = 283
local FlaskIDA = 284
local FlaskIDB = 285

-- local GoldBP = 5801 --- Item ID of your gold backpack.

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")

function onWalkerSelectLabel(labelName)
	if (labelName == "Checker") then
		-- Check Supplies, Hunt or Leave
		Walker.ConditionalGoto((Self.ItemCount(ManaID) <= LeaveMana) or (Self.Cap() < LeaveCap) or (Self.ItemCount(HealthID) <= LeaveHealth) or (Self.ItemCount(AmmoID) <= LeaveAmmo), "Leave", "BeginHunt")

	elseif (labelName == "Start") then
		Walker.ConditionalGoto((Self.Position().z == 11), "BeginHunt", "ReachDepot")
	
	elseif (labelName == "DepositGold") then
		-- Deposit Gold, check balance.
		Walker.Stop()
		Self.SayToNpc({"hi", "deposit all", "yes"}, 100)

		local withdrawManas = math.max(BuyMana - Self.ItemCount(ManaID), 0)*ManaCost
		local withdrawHealths = math.max(BuyHealth - Self.ItemCount(HealthID), 0)*HealthCost
		local withdrawAmmo = math.max(BuyAmmo - Self.ItemCount(AmmoID), 0)*AmmoCost
		local total = math.abs(withdrawManas + withdrawHealths + withdrawAmmo)

		if total >= 1 then
			Self.SayToNpc({"withdraw " .. total, "yes", "balance"}, 100)
		end
		Walker.Start()

	elseif (labelName == "BuyManas") then
		-- Buy Mana Potions
		Walker.Stop()
		if (Self.ItemCount(ManaID) < BuyMana) or (Self.ItemCount(HealthID) < BuyHealth) then
			print("Buying manas or healths")
			Self.SayToNpc({"hi", "flasks"}, 100)
			while (Self.ItemCount(FlaskID) >= 1) or (Self.ItemCount(FlaskIDA) >= 1) or (Self.ItemCount(FlaskIDB) >= 1) do
				Self.SayToNpc("yes", 100)
			end
			wait(2000)
			Self.SayToNpc("trade", 100)
			wait(2000)
			while (Self.ItemCount(ManaID) < BuyMana) do
				Self.ShopBuyItemsUpTo(ManaID, BuyMana)
				wait(500,800)
			end
			if (Self.ItemCount(HealthID) < BuyHealth) then
				Self.ShopBuyItemsUpTo(HealthID, BuyHealth)
				wait(500)
			end
			wait(200, 500)
		end
		Walker.Start()