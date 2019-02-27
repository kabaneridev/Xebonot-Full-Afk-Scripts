GenericTextMessageProxy.New("Unjusted"):OnReceive(function (proxy, message)
local text = string.match(message, "The seals on Ferumbras")
  if text then
alert()
  end
end)