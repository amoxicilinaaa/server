function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Aplica dano tipo PSY em área db1 com efeito visual 133
    doMoveInArea2(cid, 133, db1, psyDmg, min, max, spell)

    return true
end