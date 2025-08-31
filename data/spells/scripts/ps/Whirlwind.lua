function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Define áreas conforme forma Mega
    local area = isMega(cid) and {SLL1, SLL2, SLL3, SLL4} or {SL1, SL2, SL3, SL4}

    -- Executa 4 impactos em sequência com delay progressivo
    for i = 0, 3 do
        addEvent(doMoveInArea2, i * 300, cid, 42, area[i + 1], FLYINGDAMAGE, min, max, spell)
    end

    return true
end