function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local function sendMessageAndEffect(cid, msg, effect)
        doPlayerSendTextMessage(cid, 22, msg)
        doSendMagicEffect(getCreaturePosition(cid), effect)
    end

    -- Liberação da quest principal
    if item.uid == 59999 and getPlayerStorageValue(cid, 65060) <= 0 then
        if item.itemid == 5915 then
            if getPlayerLevel(cid) < 150 then
                sendMessageAndEffect(cid, "Desculpe, você é muito fraco!", 21)
                return true
            end
            setPlayerStorageValue(cid, 65060, 1)
            sendMessageAndEffect(cid, "Parabéns! Thrones Quest liberada.", 28)
            return true
        end
        return true
    end

    -- Etapas da quest
    local steps = {
        [65000] = {prev = nil, itemid = 5916, success = "Parabéns! 1ª parte concluída.", fail = "Desculpe, você precisa passar primeiro pela 1ª poltrona."},
        [65001] = {prev = 65000, itemid = 5915, success = "Parabéns! 2ª parte concluída.", fail = "Desculpe, você precisa concluir a 1ª parte antes."},
        [65002] = {prev = 65001, itemid = 5915, success = "Parabéns! 3ª parte concluída.", fail = "Desculpe, você precisa concluir a 2ª parte antes."},
        [65003] = {prev = 65002, itemid = 5916, success = "Parabéns! 4ª parte concluída.", fail = "Desculpe, você precisa concluir a 3ª parte antes."},
        [65004] = {prev = 65003, itemid = 5916, success = "Parabéns! 5ª parte concluída.", fail = "Desculpe, você precisa concluir a 4ª parte antes."}
    }

    local step = steps[item.actionid]
    if step and getPlayerStorageValue(cid, item.actionid) <= 0 then
        if item.itemid == step.itemid then
            if step.prev and getPlayerStorageValue(cid, step.prev) <= 0 then
                sendMessageAndEffect(cid, step.fail, 21)
                doTeleportThing(cid, fromPosition, true)
                return true
            end
            setPlayerStorageValue(cid, item.actionid, 1)
            sendMessageAndEffect(cid, step.success, 28)
            return true
        end
        sendMessageAndEffect(cid, step.fail, 21)
        doTeleportThing(cid, fromPosition, true)
        return true
    end
end