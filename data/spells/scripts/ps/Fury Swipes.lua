function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Envia projétil visual do caster até o alvo (ID 23)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)

    -- Aplica dano com delay e efeito visual (ID 152)
    doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 152)

    --[[ 💡 Sugestão opcional: bônus contra tipo Ghost ou Rock
    if isCreature(target) and (isPokeType(target, "Ghost") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.2)
        local bonusMax = math.floor(max * 0.2)
        addEvent(doDanoInTargetWithDelay, 400, cid, target, NORMALDAMAGE, bonusMin, bonusMax, 152)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end