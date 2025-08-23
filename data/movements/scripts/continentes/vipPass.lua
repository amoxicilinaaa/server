function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end

    if getPlayerItemCount(cid, 25217) < 1 then
        doSendMagicEffect(position, CONST_ME_POFF)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa de um ticket de viagem para prosseguir. Compre em um na loja!")
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa de um ticket de viagem para prosseguir. Compre em um na loja!")
        return true
    end

    if not isPremium(cid) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Acesso negado! Apenas jogadores com conta Premium podem passar.")
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Acesso negado! Apenas jogadores com conta Premium podem passar.")
        return true
    end

    doTeleportThing(cid, {x = 2202, y = 2139, z = 7}, false)
    doSendMagicEffect(position, CONST_ME_TELEPORT)
    return true
end