function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Parâmetros da condição "Miss"
    local ret = {
        id = 0,
        cd = 9,
        eff = 34,
        check = 0,
        spell = spell,
        cond = "Miss"
    }

    -- Executa múltiplos impactos em área com efeitos visuais
    doMoveInAreaMulti(cid, 22, 158, bullet, bulletDano, GROUNDDAMAGE, min, max, ret)

    return true
end
