local disableMsg = "wypierdalaj do depo"
local allowedSenders = 
{
   "Vinter",
   "Willy Pogromca Debili"
}

PrivateMessageProxy.OnReceive("Private Message Proxy", function(proxy, speaker, level, text)
    if text == disableMsg and (not allowedSenders or table.find(allowedSenders, speaker)) then
        Walker.Goto("Leave")
    end
end)