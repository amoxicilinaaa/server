function onUse(cid, item, frompos, item2, topos)
    if not isCreature(item2.uid) then return true end

    -- Restrições de uso
    if getPlayerStorageValue(cid, 52481) >= 1 then
        return doPlayerSendCancel(cid, "Você não pode fazer isso durante um duelo.")
    end

    if getPlayerStorageValue(cid, 990) >= 1 then
        return doPlayerSendCancel(cid, "Você não pode usar remédios durante batalhas de ginásio.")
    end

    -- Cura de status
    doCureStatus(item2.uid, "all", false)

    if getCreatureCondition(item2.uid, CONDITION_PARALYZE) then
        doRemoveCondition(item2.uid, CONDITION_PARALYZE)
    end

    -- Efeito visual e feedback
    local pos = getThingPos(item2.uid)
    doSendMagicEffect(pos, 14)
    doSendAnimatedText(pos, "MEDICADO!", 149)
    doRemoveItem(item.uid, 1)

    -- Atualiza barra de vida se houver summon ativo
    local summons = getCreatureSummons(cid)
    if #summons >= 1 then
        local ball = getPlayerSlotItem(cid, 8)
        local order = getItemAttribute(ball.uid, "ballorder") or 0
        doPlayerSendCancel(cid, "KGT," .. order .. "|0")
        doPlayerSendCancel(cid, "")
    end

    return true
end