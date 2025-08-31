function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local posT = getThingPosWithDebug(target)

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), posT, 106)

    -- Aplica dano com delay
    addEvent(doDanoWithProtect, 200, cid, GHOSTDAMAGE, posT, waba, min, max, 0)

    -- Efeito adicional ao lado do alvo
    local sideEffectPos = {x = posT.x + 2, y = posT.y + 2, z = posT.z}
    addEvent(doSendMagicEffect, 195, sideEffectPos, 401)

    return true
end
