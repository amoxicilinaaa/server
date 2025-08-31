function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Aplica dano em área tipo elétrico
    doAreaCombatHealth(cid, ELECTRICDAMAGE, getThingPosWithDebug(cid), scyther5, -min, -max, 255)

    -- Efeito visual posicionado à frente
    local sps = getThingPosWithDebug(cid)
    sps.x = sps.x + 1
    sps.y = sps.y + 1
    doSendMagicEffect(sps, 179)

    return true
end