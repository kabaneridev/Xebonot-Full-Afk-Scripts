-----------------------------------------------
-------------------- CONFIG -------------------
-----------------------------------------------
  
LootGold            = true
LootAboveValue      = 10 -- Will loot any item with an NPC price greater or equal to this.
LootAboveValueRatio = 10    -- Will loot any stackable item with a NPC price to weight ratio greater or equal to this.
LootList =                 -- Will loot all items on this list even if they don't meet any of the above criteria.
{
    "demon dust",
    "giant sword",
    "crown armor",
    "crown shield",
	"cluster of solace",
    "demon shield",
	    "cluster of solace",
    "cyan crystal fragment",
	    "small topaz",
    "blue crystal splinter",
	    "hemp rope",
    "silenter resonating chamber",
	    "dead weight",
    "silencer claw",
	    "underworld rod",
    "shadow sceptre",
	    "diamond sceptre",
    "guardian shield",
	    "terra mantle",
    "green crystal shard",
	    "crown shield",
    "brown crystal splinter",
	    "spiked squelcher",
    "giant sword",
	    "golden legs",
	    "boots of haste",
			    "mercenary sword",
					    "terra mantle",
			    "spadow spectre",
    "onyx flail",
	    "steel boots",
    "terra legs",
	    "crown shield",
			    "butcher/s axe",
							    "crown shield",
    "terra legs",
	    "steel boots",
    "vile axe",
    "Meat"
}
  
-- You need to open your backpacks on your own. 0 is your main backpack.
BpStacks = 1
BpRares  = 2
BpGold   = 3 -- Not needed if not looting gold.
  
-- Increase these if the script misses loot. Decrease them to increase speed.
MinWait = 80
MaxWait = 100
  
OpenCorpses  = true
CloseCorpses = false -- The corpse opener works better if you also let it close corpses.
LootFirst    = false -- Only relevant if OpenCorpses is true.
  
-----------------------------------------------
----------------- DESCRIPTION -----------------
-----------------------------------------------
--[[
    This script will open and loot corpses within 1sqm of your character.
    It will also loot any corpse that you open manually.
    Known issues:
        - The script is only able to open very fresh corpses.
        - The script will not retry opening a corpse if you walk away
          while it is being looted.
        - The script cannot open corpses on top of ladders and rope spots.
]]
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
  
-- CONVERT CONFIG
local LootAboveValue = LootAboveValue
local LootAboveValueRatio = LootAboveValueRatio
OldLootList = LootList
local LootList = {}
for _, name in ipairs(OldLootList) do
    LootList[Item.GetItemIDFromDualInput(name)] = true
end
  
local BpStacks = BpStacks
local BpRares = BpRares
local BpGold = BpGold
  
-- POSITION HASHING
local function ToNumber(pos)
    return 10000000000*pos.x+100000*pos.y+pos.z
end
  
local function ToPos(num)
    local x = math.floor(num/10000000000)
    local y = math.floor(num/100000)%100000
    local z = num%100000
    return {x=x, y=y, z=z}
end
  
-- WAITING
local MinWait = MinWait
local MaxWait = MaxWait
local function Wait()
    wait(MinWait, MaxWait)
end
  
-- LOOTER
local Corpses = {}
local Monsters = {}
  
  
Module("Find Corpses", function(find)
    local UpdatedMonsters = {}
    for pos, monster in pairs(Monsters) do
        if monster:isAlive() and monster:DistanceFromSelf() < 20 then
            UpdatedMonsters[ToNumber(monster:Position())] = monster
        elseif Corpses[ToNumber(monster:Position())] then
            Corpses[ToNumber(monster:Position())] = Corpses[ToNumber(monster:Position())] + 1
        else
            Corpses[ToNumber(monster:Position())] = 1
        end
    end
      
    for _, monster in Creature.iMonsters(7) do
        UpdatedMonsters[ToNumber(monster:Position())] = monster
    end
      
    Monsters = UpdatedMonsters
end)
  
local function GetBp(id)
    return (id==3031 and BpGold) or (Item.isStackable(id) and BpStacks) or BpRares
end
  
local function GetSlot(id)
    local bp = Container(GetBp(id))
    if bp:isOpen() then
        if Item.isStackable(id) then
            for Spot = 0, bp:ItemCount() - 1 do
                local item = bp:GetItemData(Spot)
                if id == item.id and item.count ~= 100 then
                    return bp:Index(), Spot, (100-item.count)
                end
            end
        end
        if bp:isFull() then
            if Item.isContainer(bp:GetItemData(bp:ItemCount()-1).id) then
                local tries = 0
                while not bp:UseItem(bp:ItemCount()-1, true) and tries < 10 do
                    Wait() 
                    tries = tries + 1 
                end
                if tries < 10 then
                    return GetSlot(id)
                end
            else
                print("Error: "..bp:Name().." is full and has no container in its last slot.")
            end
        else
            return bp:Index(), bp:ItemCount(), (Item.isStackable(id) and 100) or 1
        end
    else
        print("Error: All backpacks aren't open.")
    end
end
  
local function MoveToSelf(Corpse, Spot)
    local item = Corpse:GetItemData(Spot)
    if Self.Cap() >= Item.GetWeight(item.id)*item.count then
        local index, slot, count = GetSlot(item.id)
        if index then
            local tries = 0
            local LCount = Corpse:ItemCount()
            while Corpse:isOpen() and Corpse:ItemCount() == LCount and tries < 10 do
                Corpse:MoveItemToContainer(Spot, index, slot, math.min(item.count, count))
                Wait()
                tries = tries + 1 
            end
            Wait()
            if Corpse:isOpen() and Corpse:ItemCount() ~= LCount and count == item.count then
                return true
            end
            if Corpse:isOpen() and count < item.count then
                return MoveToSelf(Corpse, Spot)
            end
        end
    else
        print("Error: Not enough capacity.")
    end
    return false
end
  
local function IsLoot(id)
    return ((Item.GetValue(id) >= LootAboveValue) or
            (Item.isStackable(id) and (Item.GetValue(id)/Item.GetWeight(id)) > LootAboveValueRatio) or
             LootList[id]) and (LootGold or id ~= 3031)
end
 
local CorpseNames = {"Demon Outcast", "Dark Torturer", "Plaguesmith", "nightmare", "lost soul", "blightwalker", "20212"}
local function IsCorpseByName(name)
    for _, CPartName in ipairs(CorpseNames) do
        if name:find(CPartName) then
            return true
        end
    end
    return false
end
 
local function GrabItems(Corpse)
    local success = true
    if (Item.isCorpse(Corpse:ID()) or IsCorpseByName(Corpse:Name())) then
        for Spot = Corpse:ItemCount() - 1, 0, -1 do
            if IsLoot(Corpse:GetItemData(Spot).id) then
                success = success and MoveToSelf(Corpse, Spot)
                Wait()
            end
        end
    end
    return success
end
 
local function OpenCorpse(pos, count)
    if Item.isCorpse(Map.GetTopUseItem(pos.x, pos.y, pos.z).id) and count == 1 then
        local tries = 0
        -- We need slightly longer waits when opening corpses, or the script falls apart. However, I'd still like the user to be able to slow down the looter. Thus we use both a static wait and a user configured wait.
        while tries < 10 and not (Self.UseItemFromGround(pos.x, pos.y, pos.z) and (wait(4000, 5000) or Wait() or true) and Item.isCorpse(Container.GetLast():ID())) do
            tries = tries + 1
        end
        Wait()
        return tries < 10
    else
        local Browse = Container.GetByName("Browse Field")
        local tries = 0
        while (not Browse:isOpen() and tries < 10) do
            Self.BrowseField(pos.x, pos.y, pos.z)
            Wait()
            Browse = Container.GetByName("Browse Field")
            tries = tries + 1
        end
        Wait()
        local success = true
        for Spot = Browse:ItemCount() - 1, 0, -1 do
            if Item.isCorpse(Browse:GetItemData(Spot).id) then                 
			   local tries = 0
                while tries < 10 and not (Browse:UseItem(Spot) and (wait(40, 50) or Wait() or true) and Item.isCorpse(Container.GetLast():ID())) do
                    tries = tries + 1
                end
                Wait()  
				success = success and tries < 10
                count = count - 1
            end
            if count == 0 then break end
        end
        return success
    end
end
  
if OpenCorpses then
    Module("Open Corpses", function(open)
        local UpdatedCorpses = {}
        for numPos, count in pairs(Corpses) do
            local pos = ToPos(numPos)
			if Self.DistanceFromPosition(pos.x, pos.y, pos.z) <= 1 and (LootFirst or Self.TargetID() == 0) then
                if not OpenCorpse(pos, count) then
                    UpdatedCorpses[ToNumber(pos)] = count
                else
                    GrabItems(Container.GetLast())
                end
            else
                UpdatedCorpses[ToNumber(pos)] = count
            end
            Corpses = UpdatedCorpses
		end
    end)
end
 
Module("Loot Corpses", function(loot)
    for _, c in Container.iContainers() do       
	   if (Item.isCorpse(c:ID()) or IsCorpseByName(c:Name())) and c:isOpen() then
            if GrabItems(c) then
                Wait() 
                if CloseCorpses then c:Close() end       
		   end
        end
    end
end)
