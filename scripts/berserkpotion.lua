Cooldown = 600000 -- Defaut 600 000 (10 minutes)
Potion = 'Berserk Potion'
 
Module.New('Use.Potion', function()
    if Self.UseItem(Item.GetID(Potion)) then
        print('Using: '..Potion)
        wait(Cooldown)
    end
end
)