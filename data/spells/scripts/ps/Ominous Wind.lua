function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max
    local PosCid1 = spellData.posC1

    -- Efeito visual antecipado
    addEvent(doSendMagicEffect, 1, PosCid1, 988)

    -- Dano tipo GHOST em área definida
    doMoveInArea2(cid, 0, stomp2, GHOSTDAMAGE, min, max, spell)

    return true
end