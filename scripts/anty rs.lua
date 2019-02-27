GenericTextMessageProxy.OnReceive("", function(proxy, message)
    if (string.find(string.lower(message), "the murder of")) then
        os.exit()
    end
end)