--////////Custom Haste Script///////////
--///////By Hypn0tic Ki11er//////////////
--//////Enjoy!!!////////////////////////

MA = 0 --How many creatures around you to use the spell.
Spell = "utani gran hur" --Word of the spell you want to use.
SpellWait = 21 --The time it takes for the spell to cool down (in seconds).


function getMonstersAround(radius, ...)
local t = {...}
local monsters = {}
for i = CREATURES_LOW, CREATURES_HIGH do
local creature = Creature.GetFromIndex(i)
if (creature:isValid()) and creature:ID() ~= Self.ID() then
if (creature:isOnScreen() and creature:isVisible() and creature:isAlive()) then
if not creature:isPlayer() then
local name = creature:Name()
if (creature:DistanceFromSelf() <= radius) then
if (#t > 0 and table.contains(t, name)) or (#t == 0) then
table.insert(monsters, creature)
end
end
end
end
end
end
return monsters
end
function monstersAround(radius, ...)
if getMonstersAround(radius, ...) then
return #getMonstersAround(radius, ...)
else
return 0
end
end
while (true) do
if ((monstersAround(7) == 0)) then
Self.Say(Spell)
wait(SpellWait*(1000))
else
wait(500)
end
end