function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Aplica dano tipo ROCK em área reta com efeito visual 58
    doMoveInArea2(cid, 58, retoB, ROCKDAMAGE, min, max, spell)

    return true
end