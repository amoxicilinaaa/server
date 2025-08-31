function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 138)

    -- Aplica dano tipo GROUND com efeito visual 34
    doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 34)

    return true
end