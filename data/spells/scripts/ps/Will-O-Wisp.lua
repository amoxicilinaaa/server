function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Parâmetros da condição "Slow"
    local ret = {
        id       = 0,
        cd       = 6,
        check    = 0,
        eff      = 749,
        cond     = "Slow",
        im       = target,
        attacker = cid
    }

    -- Aplica dano visual com condição
    addEvent(doMoveDano2, 100, cid, target, FIREDAMAGE, 0, 0, ret, spell)

    -- Aplica queimadura no alvo
    doBurnPoke(cid, target)

    -- Disparo visual duplo
    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)
    doSendDistanceShoot(posC, posT, 142)
    addEvent(doSendDistanceShoot, 42, posC, posT, 142)

    -- Dano real com efeito visual
    doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 749)

    return true
end
