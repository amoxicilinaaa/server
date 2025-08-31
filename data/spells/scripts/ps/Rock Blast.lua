function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local min     = spellData.min
    local max     = spellData.max

    -- Executa múltiplos impactos em área com efeitos visuais
    doMoveInAreaMulti(cid, 11, 44, bullet, bulletDano, damage, min, max)

    return true
end