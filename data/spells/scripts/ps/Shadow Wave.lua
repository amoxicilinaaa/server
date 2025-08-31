function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Execuções sequenciais com efeito 678 (pulso sombrio)
    doMoveInArea2(cid, 678, db1, DARKDAMAGE, 0, 0, spell)
    addEvent(doMoveInArea2, 60, cid, 678, db1, DARKDAMAGE, 0, 0, spell)
    addEvent(doMoveInArea2, 310, cid, 678, db1, DARKDAMAGE, 0, 0, spell)

    -- Impacto final com efeito 680 e dano escalonado
    doMoveInArea2(cid, 680, db1, DARKDAMAGE, min, max, spell)

    return true
end
