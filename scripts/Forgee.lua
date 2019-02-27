--[[
Mini library by Forgee. Last updated 23/3/12.
To use these functions paste: dofile("Forgee.lua")
at the top of the script.
]]
-- getMonstersAround(4, "Frost Dragon", "Frost Dragon Hatchling")
function getMonstersAround(radius, ...)
    local t = {...}
    local monsters = {}
    for i = CREATURES_LOW, CREATURES_HIGH do
        local creature = Creature.GetFromIndex(i) -- Let's find us a creature //TODO: Find a way to read additional info correctly (hp, speed, outfit etc).
        if (creature:isValid()) and creature:ID() ~= Self.ID() then -- Make sure it's valid and don't count ourselves.
            if (creature:isOnScreen() and creature:isVisible() and creature:isAlive()) then -- We want to see the creature.
                if not creature:isPlayer() then -- And it must not be a player, aren't we picky?
                    local name = creature:Name()
                    if (creature:DistanceFromSelf() <= radius) then -- Is the creature close enough to be considered?
                        if (#t > 0 and table.contains(t, name)) or (#t == 0) then -- If we have a monster list, we look for our creature there.
                            table.insert(monsters, creature)
                        end
                    end
                end
            end
        end
    end
    return monsters
end
--[[
Example use for exori: (Note: Added exori() function to library.)

dofile("Forgee.lua")
local radius = 1 -- Radius to consider
local min = 2 -- Minimum number of monsters to hit.
local spell = "exori" -- Spell to cast.
local mana = 120 -- Minimum mana to cast spell.
local monsters = {"Frost Dragon", "Frost Dragon Hatchling"}
function exori()
    local m = getMonstersAround(radius, unpack(monsters))
    if #m >= min then
        Self.Cast(spell, mana)
        wait(1100, 1800)
    end
end

while (true) do
    exori()
end
]]

-- getPlayersAround(7, "DarkstaR", "Syntax")
function getPlayersAround(radius, ...)
    local t = {...}
    local players = {}
    if (radius == 0) then
        radius = 8
    end
    for i = CREATURES_LOW, CREATURES_HIGH do
        local creature = Creature.GetFromIndex(i)
        if (creature:isValid()) and creature:ID() ~= Self.ID() then
            if (creature:isOnScreen() and creature:isVisible() and creature:isAlive()) then
                if creature:isPlayer() then
                    local name = creature:Name()
                    if (creature:DistanceFromSelf() <= radius) then
                        if (not table.contains(t, name)) then -- If we have a white list, we look for the player there.
                            table.insert(players, creature)
                        end
                    end
                end
            end
        end
    end
    return players
end
--[[
Usage:
We can find all info the bot can get about a creature.
If you enter names after the radius it will work as a "whitelist".

players = getPlayersAround(8, "DarkstaR", "Syntax")
if #players > 0 then
    for i = #players do
        creature = players[i]
        if creature:HealthPercent() < 60 then
            ~do something
        end
    end
end
]]

-- Same as getPlayersAround, but gets players from other floors too.
-- xrayPlayersAround(6)
function xrayPlayersAround(radius, ...)
    local t = {...}
    local players = {}
    if (radius == 0) then
        radius = 8
    end
    for i = CREATURES_LOW, CREATURES_HIGH do
        local creature = Creature.GetFromIndex(i)
        if (creature:isValid()) and creature:ID() ~= Self.ID() then
            if creature:isVisible() and creature:isAlive() then
                if creature:isPlayer() then
                    local name = creature:Name()
                    local selfpos = Self.Position()
                    local creaturepos = creature:Position()
                    local distance = math.max(math.abs(selfpos.x - creaturepos.x), math.abs(selfpos.y - creaturepos.y))
                    if (distance <= radius) then
                        if not table.contains(t, name) then
                            table.insert(players, creature)
                        end
                    end
                end
            end
        end
    end
    return players
end


function monstersAround(radius, ...) -- Count monsters around. monstersAround(5, "Frost Dragon") will count only Frost Dragons within a 5 sqm radius.
    if getMonstersAround(radius, ...) then
        return #getMonstersAround(radius, ...)
    else
        return 0
    end
end

function playersAround(radius, ...) -- Count players around. Names are excluded from the count.
    if getPlayersAround(radius, ...) then
        return #getPlayersAround(radius, ...)
    else
        return 0
    end
end

--teleportWalker(32111, 33106, 7, labelName, "Teleport1" "PassedTeleport1")
-- Please do not omit labelName (exactly like it is) as it is needed for the function to know which label the walker is on.
function teleportWalker(x, y, z, labelName, label1, label2)
    if not label1 then
        label1 = "Teleport"
    end
    if not label2 then
        label2 = "PassedTeleport"
    end
    if labelName == label1 then
        wait(2000)
        gotoLabel(label2)
    elseif labelName == label2 then
        delayWalker(2000)
        if Self.Position().x ~= x or Self.Position().y ~= y or Self.Position().z ~= z then
            gotoLabel(label1)
        end
    end
end


-- Can be used for any circular aoe spell such as UE, Divine Caldera, etc.
-- exori(1, 3, "exori", 120, false, "Frost Dragon", "Frost Dragon Hatchling")
function exori(radius, num, spell, mana, hitPlayers, ...)
    local monsters = {...}
    if monstersAround(radius, unpack(monsters)) >= num then
        if not hitPlayers then
            if playersAround(radius + 1) == 0 then
                Self.Cast(spell, mana)
            end
        else
            Self.Cast(spell, mana)
        end
        wait(1100, 1800)
    end
    wait(200,500)
end
--[[Example Script ] --
dofile("Forgee.lua")
local radius = 1 -- Radius to consider
local num = 2 -- Minimum number of monsters to hit.
local spell = "exori" -- Spell to cast.
local mana = 120 -- Minimum mana to cast spell.
local monsters = {"Frost Dragon", "Frost Dragon Hatchling"}
local hitPlayers = false -- false will not cast the spell if there are players in the affected nearby (radius+1). true will execute regardless of other players, only recommended for Optional pvp.

while (true) do
    exori(radius, num, spell, mana, hitPlayers, monsters) -- All waiting is handled by the main function.
end
]]

--[[
Backpacks inside one another should be the same kind.
closeBackpacks() -- optional id of cascaded backapacks
]]
function closeBackpacks(...)
    local tmpBP = Container.GetFirst() 
    local cascaded = {...}
    while tmpBP:isOpen() do
        for spot = 0, tmpBP:ItemCount() do
            local item = tmpBP:GetItemData(spot)
            if item.id == tmpBP:ID() then
                table.insert(cascaded, tmpBP:ID())
                tmpBP = tmpBP:GetNext()
            end
        end
        tmpBP = Container.GetFirst()
        if not table.contains(cascaded, tmpBP:ID()) or tmpBP:ItemCount() == 0 then -- Backpack is main or last cascaded. Closing...
            Self.UseItem(tmpBP:ID())
            wait(500, 900)
        end
        if #cascaded > 0 then -- Any cascaded backpacks?
            for i = 1, #cascaded do
                if tmpBP:ID() == cascaded[i] then -- Found cascaded backpack.
                    if tmpBP:ItemCount() > 0 then -- Backpack contains atleast one item, check for anoter bp.
                        for spot = 0, tmpBP:ItemCount() do
                            local item = tmpBP:GetItemData(spot)
                            if item.id == tmpBP:ID() then -- Found anoter cascade bp, opening...
                                tmpBP:UseItem(spot)
                                break
                            end
                        end
                    end
                end
            end
        end
        wait(500, 900)
        tmpBP = Container.GetFirst() -- Get a new bp to check.
        if tmpBP:ID() == 0 then -- No more open backpacks.
            print("All backpacks were successfully closed.")
        end
    end
    return true
end

-- openbackpacks(id[, {"Parent Name", id})
-- openBackpacks() -- Will open the bp in your backpack slot.
-- openBackpacks({"Backpack", 9602}) -- Will open an orange bp (9602) inside a Backpack.
-- openBackpacks(9602, {"Orange Backpack", 8860}) -- Will first open an orage bp inside the first container/main bp. Then opens a Brocade Backpack inside the Orange Backpack.
function openBackpacks(...)
    local backpacks = {...}
    Self.UseItem(Self.Backpack().id) -- Open main backpack.
    wait(500, 900)
    main = Container.GetFirst()
    if #backpacks > 0 then
        for i = 1, #backpacks do
            if type(backpacks[i]) == 'table' then -- Is parent container specified?
                tmpBP = Container.GetByName(backpacks[i][1])
                for spot = 0, tmpBP:ItemCount() do
                    item = tmpBP:GetItemData(spot)
                    if item.id == backpacks[i][2] then
                        tmpBP:UseItem(spot)
                        print("Opening backpack from list. " .. backpacks[i][1] .. ", " .. backpacks[i][2])
                        wait(300, 700)
                    end
                end
            else -- If there is no parent specified we will use the main bp.
                for spot = 0, main:ItemCount() do
                    item = main:GetItemData(spot)
                    if item.id == backpacks[i] then
                        main:UseItem(spot)
                        print("Opening backpack from list. Default, " .. backpacks[i])
                        wait(300,700)
                    end
                end
            end
        end
        indexes = Container.GetIndexes()
        if #indexes == #backpacks then
            print("All backpacks were successfully opened.")
        end
    end
end
--[[
Returns a table containing the ids of opened backpacks in order.
open = getOpenBackpacks()
open[1] -> first backpack
open[2] -> second backpack, etc.
]]
function getOpenBackpacks()
    local indexes = Container.GetIndexes() -- Find index for all open backpacks
    local open = {} -- Create a place to store our open backpacks
    for i = 1, #indexes do -- Search all open backpacks
        tmpBP = Container.GetFromIndex(indexes[i])
        table.insert(open, tmpBP:ID()) -- Store this backpack
    end
    return open -- Return found backpacks
end

--[[
Id of cascaded bps can be multiple {2869, 8860}
Open: id or {"Parent Name", id}
closeBackpacks(2869, 8860)
openBackpacks(2869, {"Backpack", 8860})
or
resetBackpacks({2869, 8860}, 2869, {"Backpack", 8860})
Note the brackets {2869, 8860} in reset.
]]
function resetBackpacks()
    setBotEnabled(false)
    open = getOpenBackpacks()
    wait(700,1300)
    closeBackpacks()
    wait(900,1800)
    openBackpacks(unpack(open))
    setBotEnabled(true)
end

-- getSpotByID(id[, container]) Container name/index is optional.
function getSpotByID(id, container)
    if container then
        if type(container) == "string" then
            cont = Container.GetByName(container)
        elseif type(container) == "number" then
            cont = Container.GetFromIndex(container)
        end
    else
        cont = Container.GetFirst()
    end
    while cont:isOpen() do
        for spot = 0, cont:ItemCount() do
            item = cont:GetItemData(spot)
            if item.id == id then
                return spot
            end
        end
        if container then
            return false
        else
            cont = cont:GetNext()
        end
    end
    return false
end

function getItemFromSpot(spot, container)
    cont = Container.GetByName(container)
    item = cont:GetItemData(spot)
    return item.id
end

-- [ In collaboration with Spectrus ] --
-- openDoor(NORTH, 5250)
-- openDoor({1234, 1234, 7}, 5250)
function openDoor(dir, keyid)
    if not dir then --[[assume doorpos is 1sqm ahead in the direction the char is facing]]
        pos = Self.LookPos(1)
    elseif type(dir) == "table" then
        pos = {
        ["x"] = dir[1],
        ["y"] = dir[2],
        ["z"] = dir[3]
        }
    else
        pos = getPositionFromDirection(Self.Position(), dir, 1)
    end
    if keyid then
        door = Self.UseItemWithGround(keyid, pos.x, pos.y, pos.z)
        wait(600, 1200)
        while not table.contains(OPENED_DOORS, door) do -- until we know the door was open
            door = Self.UseItemWithGround(keyid, pos.x, pos.y, pos.z)
            wait(600, 1200)
        end
        Self.UseItemWithGround(keyid, pos.x, pos.y, pos.z) -- then open it again
    else 
        door = Self.UseItemFromGround(pos.x, pos.y, pos.z)
        if table.contains(OPENED_DOORS, door) then -- door was open
            door = Self.UseItemFromGround(pos.x, pos.y, pos.z)
            wait(600, 1200)
        end
    end
    return true
end

Self.BuyItemsUpTo = function(item, count)
    amount = Self.ItemCount(item)
    needed = math.abs(count - amount)
    if type(item) ~= "number" then
        print("BuyItemsUpTo: Item must be specified by id.")
        return 0
    end
    if amount < count then
        if needed > 100 then
            repeat
                Self.ShopBuyItem(item, 100)
                amount = Self.ItemCount(item)
                needed = math.abs(count - amount)
                wait(500,1500)
            until needed < 100
        end
        return Self.ShopBuyItem(item, needed)
    else
        return 1
    end
end

Self.SellItemsDownTo = function(item, count)
    amount = Self.ItemCount(item)
    sell = math.abs(amount - count)
    if type(item) ~= "number" then
        print("SellItemsDownTo: Item must be specified by id.")
        return 0
    end
    while amount > count do
        Self.ShopSellItem(item, sell)
        amount = Self.ItemCount(item)
        sell = math.abs(amount - count)
    end
    return 1
end

Self.ShopBuyItemsUpTo = Self.BuyItemsUpTo
Self.ShopSellItemsDownTo = Self.SellItemsDownTo

-------------------------------------------------------------
-----------------------[ War tools ]-------------------------
-------------------------------------------------------------
-- [NOT TESTED] --
function warEnemies(range)
    p = getPlayersAround(range)
    enemies = {}
    for i = 1, #p do
        if p[i]:isWarEnemy() then
            table.insert(enemies, p[i])
        end
    end
    return #enemies
end

function warAllies(range)
    p = getPlayersAround(range)
    allies = {}
    for i = 1, #p do
        if p[i]:isWarAlly() then
            table.insert(allies, p[i])
        end
    end
    return #allies
end

function getWarAllies(range)
    p = getPlayersAround(range)
    allies = {}
    for i = 1, #p do
        if p[i]:isWarAlly() then
            table.insert(allies, p[i])
        end
    end
    if #allies > 0 then
        return allies
    else
        return false
    end
end

function getWarEnemies(range)
    p = getPlayersAround(range)
    enemies = {}
    for i = 1, #p do
        local player = p[i]
        if player:isWarEnemy() then
            table.insert(enemies, player)
        end
    end
    if #enemies > 0 then
        return enemies
    else
        return false
    end
end  
