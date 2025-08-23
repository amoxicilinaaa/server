function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end

    -- Tabela de sa�das espec�ficas por actionid
    local tileExits = {
        [9089] = {x = 1253, y = 1535, z = 7},
        [9090] = {x = 697, y = 775, z = 7},
        [9091] = {x = 561, y = 628, z = 1},
        [9092] = {x = 355, y = 798, z = 8},
        [9093] = {x = 683, y = 1437, z = 6}, -- exemplo adicional
        --[9094] = {x = 1100, y = 1100, z = 7},
        --[9095] = {x = 1100, y = 1100, z = 7},
        [9096] = {x = 1551, y = 846, z = 6},
        [9097] = {x = 580, y = 1687, z = 9},
        [9098] = {x = 754, y = 1631, z = 8},
        [9099] = {x = 1549, y = 1062, z = 7}
    }

    -- Verifica se o jogador � Premium
    if not isPremium(cid) then
        local exitPos = tileExits[item.actionid]
        if exitPos then
            -- Teleporta para a sa�da definida
            doTeleportThing(cid, exitPos, true)
            doSendMagicEffect(exitPos, CONST_ME_POFF)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� n�o possui conta Premium.")
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voc� n�o possui conta Premium.")
        end
    else
        -- Jogador Premium entra normalmente
        doSendMagicEffect(position, 103)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Acesso liberado: �rea Premium.")
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Acesso liberado: �rea Premium.")
    end

    return true
end
