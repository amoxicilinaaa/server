function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Executa dano em área com delay e efeito visual
    addEvent(doMoveInArea2, 100, cid, 111, reto5, NORMALDAMAGE, min, max, spell)

    return true
end
