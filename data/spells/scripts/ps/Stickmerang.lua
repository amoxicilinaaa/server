function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 34)

    -- Dano direto com efeito visual
    doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 212)

    return true
end