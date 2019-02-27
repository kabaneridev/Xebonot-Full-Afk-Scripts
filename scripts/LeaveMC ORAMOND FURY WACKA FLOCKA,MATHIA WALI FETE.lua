local disableMsg = "wypierdalaj do depo"
local allowedSenders = 
{
	"Wacka flocka Flame",
	"Mathia Wali Fete"
}

PrivateMessageProxy.OnReceive("Private Message Proxy", function(proxy, speaker, level, text)
    if text == disableMsg and (not allowedSenders or table.find(allowedSenders, speaker)) then
        Walker.Goto("Refill")
    end
end)