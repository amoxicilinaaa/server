local DOUBLE_EXP_STORAGE = 98551801

function onSay(cid, words, param)
    local isAdmin = getPlayerGroupId(cid) >= 6 -- Defina o nível de acesso necessário para ser considerado administrador
    
    if not isAdmin then
        return true
    end
    
    if param == "on" then
        setGlobalStorageValue(DOUBLE_EXP_STORAGE, 1)
        doBroadcastMessage("Experiência dupla ativada por " .. getPlayerName(cid))
    elseif param == "off" then
        setGlobalStorageValue(DOUBLE_EXP_STORAGE, 0)
        doBroadcastMessage("Experiência dupla desativada por " .. getPlayerName(cid))
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Use '!doubleexp on' para ativar ou '!doubleexp off' para desativar.")
    end
    
    return true
end