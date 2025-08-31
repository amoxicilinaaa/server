function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Disparo visual da água
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)

    -- Dano principal com efeito 68 e área waba
    doDanoWithProtectWithDelay(cid, target, WATERDAMAGE, min, max, 68, waba)

    -- Segundo impacto visual com efeito 53 após 50ms
    addEvent(doDanoWithProtectWithDelay, 50, cid, target, WATERDAMAGE, 0, 0, 53, 0)

    return true
end
