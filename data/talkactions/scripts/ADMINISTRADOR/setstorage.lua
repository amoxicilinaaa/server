function onSay(cid, words, param, channel)
    if(not isGod(cid)) then
        return false
    end

    local p = string.explode(param, ",")
    if(not p[3]) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando incorreto! Use: /setstorage Nome,IdDaStorage,Valor")
        return true
    end

    local target = getPlayerByName(p[1])
    local storageId = tonumber(p[2])
    local storageValue = tonumber(p[3])
    
    if(not target) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador não encontrado ou offline.")
        return true
    end

    if(not storageId or not storageValue) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O ID e o valor da storage precisam ser números.")
        return true
    end
    
    setPlayerStorageValue(target, storageId, storageValue)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A storage ID " .. storageId .. " do jogador " .. getCreatureName(target) .. " agora tem o valor: " .. storageValue)
    return true
end