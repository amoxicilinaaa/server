function onSay(cid, words, param, channel)
    if(not isGod(cid)) then
        return false
    end

    local p = string.explode(param, ",")
    if(not p[2]) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando incorreto! Use: /getstorage Nome,IdDaStorage")
        return true
    end

    local target = getPlayerByName(p[1])
    local storageId = tonumber(p[2])
    
    if(not target) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador não encontrado ou offline.")
        return true
    end

    if(not storageId) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O ID da storage precisa ser um número.")
        return true
    end

    local storageValue = getPlayerStorageValue(target, storageId)

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Storage ID " .. storageId .. " do jogador " .. getCreatureName(target) .. " tem o valor: " .. storageValue)
    return true
end