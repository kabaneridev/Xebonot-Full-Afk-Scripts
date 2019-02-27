GenericTextMessageProxy.New("Unjusted"):OnReceive(function (proxy, message)
local frag = string.match(message, "Warning! The murder of (.+) was not justified.")
  if frag then
    Targeting.Stop()
	Looter.Stop()
	Walker.Goto("Refill") -- nazwa labela z wptkami po ktorych ma latac jesli by kogos zabil
  end
end)