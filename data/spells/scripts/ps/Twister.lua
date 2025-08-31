function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Executa múltiplos impactos em área com efeitos visuais
    doMoveInAreaMulti(cid, 166, 490, bulletTwister, bulletDano, DRAGONDAMAGE, min, max)

    return true
end
