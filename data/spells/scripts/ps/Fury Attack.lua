function onCastSpell(cid, var)
    -- Ativa storage temporária (pode ser usada para controle de estado ou visual)
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 600, cid, 3644587, -1) -- desativa após 600ms

    -- Aplica 3 instâncias de dano com delay progressivo
    for i = 0, 2 do
        addEvent(doDanoInTargetWithDelay, i * 300, cid, target, NORMALDAMAGE, min, max, 975) -- efeito visual 975
    end

    --[[ 💡 Sugestão opcional: bônus contra tipo Ghost ou Rock
    if isCreature(target) and (isPokeType(target, "Ghost") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.2)
        local bonusMax = math.floor(max * 0.2)
        addEvent(doDanoInTargetWithDelay, 1000, cid, target, NORMALDAMAGE, bonusMin, bonusMax, 975)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end