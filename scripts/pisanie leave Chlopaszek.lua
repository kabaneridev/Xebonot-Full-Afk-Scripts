registerEventListener(WALKER_SELECTLABEL, "onWalkerSelectLabel")

function onWalkerSelectLabel(labelName)
    if (labelName == "Refill") then
     Self.PrivateMessage("Chlopaszek", "wypierdalaj do depo")
    end
end