function getTargetCount(radius, ignoreParty, ...)
local t = {...}
local players = {}
if (radius == 0) then
radius = 3
end
for i = CREATURES_LOW, CREATURES_HIGH do
local creature = Creature.GetFromIndex(i)
if (creature:isValid()) and creature:ID() ~= Self.ID() then
if (creature:isOnScreen() and creature:isVisible() and creature:isAlive()) then
if creature:isPlayer() then
local name = creature:Name()
if (creature:DistanceFromSelf() <= radius) and (not creature:isPartyMember() or not ignoreParty) and not creature:isGuildmate() then
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
 
function isAreaSafe()
if (Self.DistanceFromPosition(32873, 32832, 7) <= 3 and Self.Position().z == 7) or
(Self.DistanceFromPosition(32873, 32833, 7) <=3 and Self.Position().z == 7) or
(Self.DistanceFromPosition(32872, 32832, 7.) <=3 and Self.Position().z == 7) or
(Self.DistanceFromPosition(32873, 32834, 7) <=3 and Self.Position().z == 7) or
(Self.DistanceFromPosition(32871, 32832, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32872, 32832, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32871, 32833, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32871, 32834, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32871, 32835, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32872, 32835, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32869, 32827, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32869, 32828, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32870, 32828, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32871, 32828, 6) <=3 and Self.Position().z == 6) or
(Self.DistanceFromPosition(32872, 32827, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32872, 32826, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32871, 32827, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32870, 32826, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32869, 32826, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32869, 32827, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32870, 32831, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32871, 32831, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32872, 32831, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32873, 32831, 5) <=3 and Self.Position().z == 5) or
(Self.DistanceFromPosition(32873, 33830, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32873, 33829, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32872, 33829, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32871, 33829, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32870, 33829, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32870, 33830, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32868, 33831, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32867, 33831, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32866, 33831, 4) <=3 and Self.Position().z == 4) or
(Self.DistanceFromPosition(32866, 32829, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32867, 32829, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32868, 32829, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32869, 32829, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32869, 32830, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32867, 32835, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32867, 32836, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32867, 32837, 3) <=3 and Self.Position().z == 3) or
(Self.DistanceFromPosition(32866, 32837, 2) <=3 and Self.Position().z == 2) or
(Self.DistanceFromPosition(32865, 32837, 2) <=3 and Self.Position().z == 2) or
(Self.DistanceFromPosition(32865, 32836, 2) <=3 and Self.Position().z == 2) or
(Self.DistanceFromPosition(32865, 32835, 2) <=3 and Self.Position().z == 2) or
(Self.DistanceFromPosition(32865, 32834, 2) <=3 and Self.Position().z == 2) or
(Self.DistanceFromPosition(32866, 32834, 2) <=3 and Self.Position().z == 2) or
Self.Position().x >= 32868 then
return false
else
return true
end
end
 
Module.New("Safe_Exori", function(module)
 
local c = Creature.GetByID(Self.TargetID())
    if Self.TargetID() ~= 0 and c:DistanceFromSelf() <= 1 and Self.CanCastSpell("exori gran") and #getTargetCount(1, true) == 0 and #Self.GetTargets(1) >= 1 and isAreaSafe() then
        Self.Cast("exori gran", 340)
    elseif Self.TargetID() ~= 0 and c:DistanceFromSelf() <= 1 and Self.CanCastSpell("exori") and #getTargetCount(1, true) == 0 and #Self.GetTargets(1) >= 1 and isAreaSafe() then
        Self.Cast("exori", 115)
        elseif Self.TargetID() ~= 0 and c:DistanceFromSelf() <= 1 and Self.CanCastSpell("exori ico") then
                Self.Cast("exori ico", 30)
                elseif Self.TargetID() ~= 0 and c:DistanceFromSelf() <= 3 and Self.CanCastSpell("exori hur") then
        Self.Cast("exori hur", 40)
    end
    module:Delay(100)
end)