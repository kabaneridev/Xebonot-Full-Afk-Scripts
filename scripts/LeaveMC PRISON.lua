local disableMsg = "wypierdalaj do depo"
local allowedSenders = 
{
	"Weronisia Mathia",
	"Mathia Hardstyle",
	"Prezes Jaroslaw Kaczynski",
	"Mathia Univerze"
}

PrivateMessageProxy.OnReceive("Private Message Proxy", function(proxy, speaker, level, text)
    if text == disableMsg and (not allowedSenders or table.find(allowedSenders, speaker)) then
        Walker.Goto("Refill")
    end
end)