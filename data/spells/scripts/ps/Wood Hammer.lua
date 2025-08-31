function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local posT = getThingPosWithDebug(target)
    local posC = getThingPosWithDebug(cid)

    -- Disparo visual do projétil
    doSendDistanceShoot(posC, posT, 39)

    -- Dano com delay
    addEvent(doDanoInTargetWithDelay, 100, cid, target, GRASSDAMAGE, min, max)

    -- Efeito mágico adicional
    addEvent(doSendMagicEffect, 75, posT, 418)

    return true
end
