local disableMsg = "wypierdalaj do depo"
local allowedSenders = 
{
   "Eletrix",
   "Lenolia",
   "Wika Mathia",
   "Garmie",
   "Chlopaszek",
   "Gucci Swagger Hexery",
   "Sadysta Parcel Gaming",
   "Kawin",
   "Mathia Love Wika"
   
}

PrivateMessageProxy.OnReceive("Private Message Proxy", function(proxy, speaker, level, text)
    if text == disableMsg and (not allowedSenders or table.find(allowedSenders, speaker)) then
        Walker.Goto("Refill")
    end
end)