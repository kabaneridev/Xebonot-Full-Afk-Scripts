local function onTextMessageEvent(serverConnectionHandlerID, targetMode, toID, fromID, fromName, fromUniqueIdentifier, message, ffIgnored)
    local myClient = ts3.getClientID(serverConnectionHandlerID)
    local  response = "AFK gram w lola"
    if targetMode = ts3defs.TextMessageTargetMode.TextMessageTarget_CLIENT and fromID ~= myClient then
        ts3.requestSendPrivateTextMsg(serverConnectionHandlerID, response, fromID)
    end
end