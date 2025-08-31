function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Execução de múltiplos impactos tipo GRASS com efeitos visuais
    doMoveInAreaMulti(cid, 129, 245, bullet, bulletDano, GRASSDAMAGE, min, max)

    return true
end