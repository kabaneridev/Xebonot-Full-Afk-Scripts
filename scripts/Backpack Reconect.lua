local LootBp1       = 'Zaoan Chess Box'

local LootBp2       = 'Jewelled Backpack'

local StackBp       = 'Dragon Backpack'

local StackBp2       = 'Camouflage Backpack'

local numberOfBackpacks = 5



Module('Alarm Containers', function(mod)

	if #Container.GetAll() < numberOfBackpacks and Self.isInPz() == false then

	    print('BP')

            Self.CloseContainers()

	    Self.OpenMainBackpack(true):OpenChildren({StackBp, true},{LootBp1, true},{LootBp2, true},{StackBp2, true})

	    wait(200, 500)


            end

	mod:Delay(2000)

end)
