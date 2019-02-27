local side = {{-1, 0, 3}, {1, 0, 1}, {0, 1, 2}, {0, -1, 0}}
 
luaPlayerTookSpot = function (x, y)
    local c = Self.GetSpectators()
    for i = 1, #c do
        if c[i]:isPlayer() and c[i]:Position().x == x and c[i]:Position().y == y then
            return true
        end
    end
    return false
end
 
 
luaGetSafeDirection = function ()
    local dir = nil
    for v, k in ipairs(side) do
        local self = getSelfPosition()
        if not luaPlayerTookSpot(self.x+k[1], self.y+k[2]) then
            dir = k[3]
            return dir
        end
    end
end
 
luaGetPlayerDirection = function ()
    for v, k in ipairs(side) do
        local self = getSelfPosition()
        if luaPlayerTookSpot(self.x+k[1], self.y+k[2]) then
            if luaGetSafeDirection() ~= nil then
                while Self.LookDirection() == k[3] do
                    Self.Turn(luaGetSafeDirection())
                end
            else break end
        end
    end
end
 
Module.New('Turn to safe direction', function()
    luaGetPlayerDirection()
end)