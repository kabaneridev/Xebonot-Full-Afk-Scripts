local disableMsg = "wypierdalaj do depo"
local allowedSenders = 
{
   "Vinter",
   "Gucci Swagger Hexery"
}

PrivateMessageProxy.OnReceive("Private Message Proxy", function(proxy, speaker, level, text)
    if text == disableMsg and (not allowedSenders or table.find(allowedSenders, speaker)) then
        Walker.Goto("Refill")
		setTargetingEnabled(false) 
		setLooterEnabled(false)
    end
end)