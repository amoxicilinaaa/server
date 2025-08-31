function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Aplica dano tipo Dark com efeito visual 222 em área db1
    doMoveInArea2(cid, 222, db1, DARKDAMAGE, min, max, spell)

    return true
end
