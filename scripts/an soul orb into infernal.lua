----------- BP SETUP ------------
MainBp  	= "deepling backpack" 			
--------- Refill Settings --------
local container = 'deepling backpack'
local InboxFull = true
local BpsCount = 30 -- amount of your stacked bps, these have to be stacked properly and without any items inside
local CurItems = 0 
local BpFull = false
local Logout = false 
local MinMana 		= 200 			
local MaxMana 		= 800 					
local MinCap 		= 10 			
---------- Extra Settings --------
local HideEquipment = true 		
local LogoutStamina = true 			
local ManaPot 		= 23373 					
local manaCost		= 180 			
local PickID = 3456
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

Targeting.Start()
Walker.Start()

registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")

local info = [[
Soul Orbs into Infernal Bolts changer]]
print(info) 
wait(500)


function onWalkerSelectLabel(labelName)
	if (labelName == "Check") then
		print("Checking Supplies")
		Walker.ConditionalGoto((Self.ItemCount(ManaPot) <= MinMana) or (Self.Cap() < MinCap) or ((LogoutStamina) and (Self.Stamina() < 840)), "hunt|end", "hunt|start")


	elseif (labelName == "ResetBP") then
		Walker.Stop()
		Self.CloseContainers()
		repeat
		wait(500)
		until (Self.UseItemFromEquipment("backpack") > 0)
		wait(500)
		Container.GetByName(MainBp):Minimize()
		wait(300)
		Walker.Start()

------------------------------------------------------------------------------------------------------------------

elseif (labelName == "DepositInf") then
		setWalkerEnabled(false)
            Self.ReachDepot()
            Self.DepositItems({6528, 2})
			sleep(math.random(600, 1100))
				setWalkerEnabled(true)
	
	elseif (labelName == "Cyclop") then
			Self.SayToNpc("Hi")
			wait(200,300)
			Self.SayToNpc("soul orb")
			wait(200,300)
			Self.SayToNpc("yes")
			wait(200,300)
			
			
	elseif (labelName == "GetOrbs") then
			CurItems = 0
			BpFull = false
			Self.OpenLocker()
			withdraw()		
			
	elseif (labelName == "Venore") then
			Self.SayToNpc("Hi")
			wait(200,300)
			Self.SayToNpc("venore")
			wait(200,300)
			Self.SayToNpc("yes")
			wait(200,300)
			
	elseif (labelName == "Ab'dendriel") then
			Self.SayToNpc("Hi")
			wait(200,300)
			Self.SayToNpc("ab'dendriel")
			wait(200,300)
			Self.SayToNpc("yes")
			wait(200,300)
									
	end
end



----------------------- Functions ----------------------
	function withdraw()
	local cfrom = Container.New('Your Inbox')
	local cto = Container.New(container)
	while not cfrom:isOpen() do
	cfrom = Container.New('Your Inbox')
	local dp = Container.New('Locker')
	for mailspot, touse in dp:iItems() do
	if touse.id == 12902 then
	dp:UseItem(mailspot, true)
	wait(300, 400)
	end
		end
			end
			
	if cfrom:isOpen() and cto:isOpen() then
		while (cfrom:ItemCount() >= 0) do
		local slot = 0
	
	if(cfrom:ItemCount() == 0) then
		InboxFull = false
		break
		else
		InboxFull = true
		end
		local items = cfrom:GetItemData(slot)

	if Self.Cap() - Item.GetWeight(items.id) < 1 then
		error('You need '..math.floor((Item.GetWeight(items.id)+1)-Self.Cap())..' cap to pick this item.') 
		break
		end
		while Self.Cap() - Item.GetWeight(items.id) >= 1 do
		
	if not cto:isFull() then
	if (CurItems < (BpsCount * 19)) then
		cfrom:MoveItemToContainer(slot, cto:Index(), 19, 100)
		wait(300, 400)
		CurItems = CurItems + 1
		break
		else
		BpFull = true
		break
		end
		else
		for spot, item in cto:iItems() do
	if Item.isContainer(item.id) then
		cto:UseItem(spot, true)
		wait(300, 400)
			end
				end
					end
						end
						
	if (BpFull == true) then
		error('Your bp is full.')
		break
			end
				end
					end
						end	