registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")

function onWalkerSelectLabel(labelName)
    if (labelName == "Refill") then
     Self.PrivateMessage("Garmie", "wypierdalaj do depo")
    end
end