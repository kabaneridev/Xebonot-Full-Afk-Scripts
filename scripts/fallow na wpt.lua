local config = {
    ["group"] = {"Zdupydomordy", "Syrop", "friend3"},
    ["amount"] = 3, -- amount of friends on screen to break function
    ["distance"] = 7, --default on screen
}

luaGetDistanceFromPlayers = function (players, distance)
    local c = Self.GetSpectators()
    local count = 0
    for i = 1, #c do
        if c[i]:isPlayer() and c[i]:isOnScreen() and c[i]:DistanceFromSelf() <= distance then
            if table.find(players, c[i]:Name()) then
                count = count + 1
            end
        end
    end
    print(count)
    return count
end

function onLabel(label)
    local label = label:lower()
    if label == "wait" then
        while luaGetDistanceFromPlayers(config.group, config.distance) < config.amount do
            wait(500)
        end
    end
end
registerEventListener(WALKER_SELECTLABEL, "onLabel")