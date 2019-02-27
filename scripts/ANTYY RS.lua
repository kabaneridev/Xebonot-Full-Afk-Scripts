GenericTextMessageProxy.New("Unjusted"):OnReceive(function (proxy, message)
local frag = string.match(message, "Warning! The murder of (.+) was not justified.")
  if frag then
    os.exit()
  end
end)