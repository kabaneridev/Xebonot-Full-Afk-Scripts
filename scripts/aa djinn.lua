local lootCont = "Depot slot I"     -- Loot Container in Depot
local NPC = "Rashid"                     -- "Green"/"Blue"/"Rashid"

local MerchantsAndItems =
{
    BlueDjinn = {"Magic Light Wand", "Orb", "Wand of Cosmic Energy", "Stealth Ring", "Wand of Decay", "Wand of Draconia", "Wand of Dragonbreath", "Wand of Inferno", "Wand of Starstorm", "Wand of Voodoo", "Wand of Vortex", "Angelic Axe", "Blue Robe", "Bonelord Shield", "Boots of Haste", "Broadsword", "Butcher's Axe", "Crown Armor", "Crown Helmet", "Crown Legs", "Crown Shield", "Crusader Helmet", "Dragon Lance", "Dragon Shield", "Earth Spike Sword", "Earth War Hammer", "Energy Spike Sword", "Energy War Hammer", "Fiery Spike Sword", "Fiery War Hammer", "Fire Axe", "Fire Sword", "Glorious Axe", "Guardian Shield", "Ice Rapier", "Icy Spike Sword", "Icy War Hammer", "Noble Armor", "Obsidian Lance", "Queen's Sceptre", "Royal Helmet", "Shadow Sceptre", "Spike Sword", "Thaian Sword", "War Hammer"},
    GreenDjinn = {"Ancient Shield", "Black Shield", "Bonebreaker", "Dark Armor", "Dark Helmet", "Dragon Hammer", "Dreaded Cleaver", "Earth Knight Axe", "Energy Knight Axe", "Fiery Knight Axe", "Giant Sword", "Haunted Blade", "Icy Knight Axe", "Knight Armor", "Knight Axe", "Knight Legs", "Mystic Turban", "Onyx Flail", "Poison Dagger", "Scimitar", "Serpent Sword", "Skull Staff", "Strange Helmet", "Titan Axe", "Tower Shield", "Vampire Shield", "Warrior Helmet", "Hailstorm Rod", "Moonlight Rod", "Mysterious Fetish", "Necrotic Rod", "Northwind Rod", "Snakebite Rod", "Springsprout Rod", "Strange Talisman", "Terra Rod", "Underworld Rod"},
    Rashid = {"Abyss Hammer", "Amber Staff", "Ancient Amulet", "Assassin Dagger", "Bandana", "Beastslayer Axe", "Beetle Necklace", "Berserker", "Blacksteel Sword", "Blessed Sceptre", "Bone Shield", "Bonelord Helmet", "Buckle", "Brutetamer's Staff", "Castle Shield", "Chaos Mace", "Coconut Shoes", "Composite Hornbow", "Cranial Basher", "Crocodile Boots", "Crystal Mace", "Crystal Necklace", "Crystal Ring", "Crystal Sword", "Crystalline Armor", "Daramanian Mace", "Daramanian Waraxe", "Dark Shield", "Death Ring", "Demon Shield", "Demonbone Amulet", "Demonrage Sword", "Devil Helmet", "Diamond Sceptre", "Doll", "Dragon Scale Mail", "Dragon Slayer", "Dragonbone Staff", "Dreaded Cleaver", "Earth Cranial Basher", "Earth Dragon Slayer", "Earth Heroic Axe", "Earth Mystic Blade", "Earth Relic Sword", "Earth War Axe", "Elvish Bow", "Emerald Bangle", "Energy Cranial Basher", "Energy Dragon Slayer", "Energy Heroic Axe", "Energy Mystic Blade", "Energy Relic Sword", "Energy War Axe", "Epee", "Fiery Cranial Basher", "Fiery Dragon Slayer", "Fiery Heroic Axe", "Fiery Mystic Blade", "Fiery Relic Sword", "Fiery War Axe", "Flower Dress", "Flower Wreath", "Fur Boots", "Furry Club", "Glacier Amulet", "Glacier Kilt", "Glacier Mask", "Glacier Robe", "Glacier Shoes", "Gold Ring", "Golden Armor", "Golden Legs", "Guardian Halberd", "Hammer of Wrath", "Heavy Mace", "Heavy Machete", "Heavy Trident", "Heroic Axe", "Helmet of the Lost", "Hibiscus Dress", "Icy Cranial Basher", "Icy Dragon Slayer", "Icy Heroic Axe", "Icy Mystic Blade", "Icy Relic Sword", "Icy War Axe", "Jade Hammer", "Krimhorn Helmet", "Leaf Legs", "Leopard Armor", "Leviathan's Amulet", "Light Shovel", "Lightning Boots", "Lightning Headband", "Lightning Legs", "Lightning Pendant", "Lightning Robe", "Lunar Staff", "Magic Plate Armor", "Magma Amulet", "Magma Boots", "Magma Coat", "Magma Legs", "Magma Monocle", "Mammoth Fur Cape", "Mammoth Fur Shorts", "Mammoth Whopper", "Mastermind Shield", "Medusa Shield", "Mercenary Sword", "Mystic Blade", "Naginata", "Nightmare Blade", "Noble Axe", "Norse Shield", "Orcish Maul", "Paladin Armor", "Pair of Iron Fists", "Pirate Boots", "Pirate Hat", "Pirate Knee Breeches", "Pirate Shirt", "Pirate Voodoo Doll", "Platinum Amulet", "Ragnir Helmet", "Relic Sword", "Ring of the Sky", "Ruby Necklace", "Ruthless Axe", "Sacred Tree Amulet", "Sapphire Hammer", "Scarab Amulet", "Scarab Shield", "Shockwave Amulet", "Silver Brooch", "Silver Dagger", "Skull Helmet", "Skullcracker Armor", "Spiked Squelcher", "Steel Boots", "Swamplair Armor", "Taurus Mace", "Terra Amulet", "Terra Boots", "Terra Hood", "Terra Legs", "Terra Mantle", "The Justice Seeker", "Tortoise Shield", "Vile Axe", "Voodoo Doll", "War Axe", "War Horn", "Witch Hat", "Wyvern Fang"},
}
registerEventListener(WALKER_SELECTLABEL, 'onLabel')

local totalprofit        = 0
local profit            = HUD.New(10, 23, "Profit:", 255, 255, 255)
local profitcount         = HUD.New(52, 23, "" .. totalprofit, 255, 255, 0)

function onLabel(label)

    if (label == 'ReachDepot') then
        Walker.Stop()
        Self.ReachDepot()
        Walker.Start()

    elseif (label == 'Start') then
        if (NPC == 'Green') or (NPC == 'Blue') then
            Walker.Goto('StartDjinn')
            print("Going to the Djinns!")
        elseif (NPC == 'Rashid') then
            Walker.Goto('StartRashid')
            print("Going to Rashid!")
        end

    elseif (label == 'Depot') then
        Walker.Stop()
        if (type(lootCont) == 'string') then
            lootCont = Item.GetID(lootCont)
        end
        Self.OpenDepot()
        local depot = Container.New('Depot Chest')
        if (depot) then
            local spot, gotLoot = 0, false
            repeat
                for s = 0, depot:ItemCount() do
                    local item = depot:GetItemData(s)
                    if (item.id == lootCont) then
                        spot = s
                        break
                    end
                end
                local startCap = Self.Cap()
                depot:MoveItemToContainer(spot, 0, 19)
                wait(200, 500)
                if (startCap == Self.Cap()) then
                    depot:UseItem(spot, true)
                    depot = Container.New(depot:Index())
                else
                    gotLoot = true
                end
                wait(200, 500)
            until gotLoot
        end
        Walker.Start()

    elseif (label == 'CheckCity') then
        if (Self.Position().x > 32249) and (Self.Position().x < 32279) and (Self.Position().y > 31133) and (Self.Position().y < 31149) then
            Walker.Goto('RashidSvar')
            print("You are in Svargrond!")
        elseif (Self.Position().x > 32324) and (Self.Position().x < 32343) and (Self.Position().y > 32828) and (Self.Position().y < 32850) then
            Walker.Goto('RashidLib')
            print("You are in Liberty Bay!")
        elseif (Self.Position().x > 32616) and (Self.Position().x < 32638) and (Self.Position().y > 32734) and (Self.Position().y < 32752) then
            Walker.Goto('RashidPort')
            print("You are in Port Hope!")
        elseif (Self.Position().x > 33116) and (Self.Position().x < 33137) and (Self.Position().y > 32833) and (Self.Position().y < 32855) then
            Walker.Goto('RashidAnk')
            print("You are in Ankrahmun!")
        elseif (Self.Position().x > 33202) and (Self.Position().x < 33225) and (Self.Position().y > 32452) and (Self.Position().y < 32468) then
            Walker.Goto('RashidDar')
            print("You are in Darashia!")
        elseif (Self.Position().x > 33158) and (Self.Position().x < 33177) and (Self.Position().y > 31792) and (Self.Position().y < 31816) then
            Walker.Goto('RashidEdron')
            print("You are in Edron!")
        elseif (Self.Position().x > 32332) and (Self.Position().x < 32347) and (Self.Position().y > 31772) and (Self.Position().y < 31789) then
            Walker.Goto('RashidCarlin')
            print("You are in Carlin!")
        end

    elseif (label == 'PickDjinn') then
        if (NPC == 'Green') then
            Walker.Goto('GoToGreen')
            print("Going to the Green Djinns!")
        elseif (NPC == 'Green') then
            Walker.Goto('GoToBlue')
            print("Going to the Blue Djinns!")
            end

    elseif (label == 'Alesar') then
        Walker.Stop()
        Self.SayToNpc({'hi','trade'}, 65)
        wait(400)        
        for i = 1, #MerchantsAndItems.GreenDjinn do
            if (Self.ShopGetItemSaleCount(MerchantsAndItems.GreenDjinn:lower()) >= 1) then
                Self.ShopSellAllItems(MerchantsAndItems.GreenDjinn)
                wait(300, 500)
            end
        end
        Walker.Start()

    elseif (label == 'Yaman') then
        Walker.Stop()
        Self.SayToNpc({'hi','trade'}, 65)
        wait(400)        
        for i = 1, #MerchantsAndItems.GreenDjinn do
            if (Self.ShopGetItemSaleCount(MerchantsAndItems.GreenDjinn:lower()) >= 1) then
                Self.ShopSellAllItems(MerchantsAndItems.GreenDjinn)
                wait(300, 500)
            end
        end
        Walker.Start()

    elseif (label == 'Haroun') then
        Walker.Stop()
        Self.SayToNpc({'hi','trade'}, 65)
        wait(400)
        for i = 1, #MerchantsAndItems.BlueDjinn do
            if (Self.ShopGetItemSaleCount(MerchantsAndItems.BlueDjinn:lower()) >= 1) then
                Self.ShopSellAllItems(MerchantsAndItems.BlueDjinn)
                wait(300, 500)
            end
        end
        Walker.Start()

    elseif (label == 'Nah\'Bob') then
        Walker.Stop()
        Self.SayToNpc({'hi','trade'}, 65)
        wait(400)
        for i = 1, #MerchantsAndItems.BlueDjinn do
            if (Self.ShopGetItemSaleCount(MerchantsAndItems.BlueDjinn:lower()) >= 1) then
                Self.ShopSellAllItems(MerchantsAndItems.BlueDjinn)
                wait(300, 500)
            end
        end
        Walker.Start()

    elseif (label == 'Rashid') then
        Walker.Stop()
        Creature.Follow("Rashid")
        wait(500)
        Self.SayToNpc({'hi','trade'}, 65)
        wait(400)        
        for i = 1, #MerchantsAndItems.Rashid do
            if (Self.ShopGetItemSaleCount(MerchantsAndItems.Rashid:lower()) >= 1) then
                Self.ShopSellAllItems(MerchantsAndItems.Rashid)
                wait(300, 500)
            end
        end
        Walker.Start()

    elseif (label == 'Bank') then
        Walker.Stop()
        totalprofit = totalprofit + Self.Money()
        profitcount:SetText("" .. totalprofit)
        Self.SayToNpc({"Hi", "deposit all", "yes", "balance"}, 65)
        Walker.Start()

    end
end

----------------------- Functions ----------------------
Self.ReachDepot = function (tries)
    local tries = tries or 3
    Walker.Stop()
    local DepotIDs = {3497, 3498, 3499, 3500}
    local DepotPos = {}
    for i = 1, #DepotIDs do
        local dps = Map.GetUseItems(DepotIDs)
        for j = 1, #dps do
            table.insert(DepotPos, dps[j])
        end
    end
    local function gotoDepot()
        local pos = Self.Position()
        print("Depots found: " .. tostring(#DepotPos))
        for i = 1, #DepotPos do
            location = DepotPos
            Self.UseItemFromGround(location.x, location.y, location.z)
            wait(1000, 2000)
            if Self.DistanceFromPosition(pos.x, pos.y, pos.z) >= 1 then
                wait(5000, 6000)
                if Self.DistanceFromPosition(location.x, location.y, location.z) == 1 then
                    Walker.Start()
                    return true
                end
            else
                print("Something is blocking the path. Trying next depot.")
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
        print("Attempt to reach depot was unsuccessfull. " .. tries .. " tries left.")
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