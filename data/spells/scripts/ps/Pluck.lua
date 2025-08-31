function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Aplica dano tipo FLYING com efeito visual 111
    doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 111)

    return true
end