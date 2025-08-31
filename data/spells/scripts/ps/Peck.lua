function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posT1 = spellData.posT1
    local posT = spellData.posT

    -- Projétil visual com proteção
    sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Dano tipo FLYING com efeito visual 3
    doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 3)

    -- Efeitos visuais sincronizados
    doSendMagicEffect(posT1, 969)
    addEvent(doSendMagicEffect, 200, posT, 3)

    return true
end