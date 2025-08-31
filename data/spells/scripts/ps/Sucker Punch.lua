function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Disparo visual do projétil sombrio
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Dano direto com efeito visual sombrio
    doDanoInTargetWithDelay(cid, target, DARKDAMAGE, min, max, 237)

    return true
end
