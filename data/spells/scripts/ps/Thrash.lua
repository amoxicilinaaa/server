function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell      = spellData.spell
    local min        = spellData.min
    local max        = spellData.max

    -- Executa múltiplos disparos em área com efeitos visuais
    doMoveInAreaMulti(cid, 157, 111, bullet, bulletDano, NORMALDAMAGE, min, max)

    return true
end
