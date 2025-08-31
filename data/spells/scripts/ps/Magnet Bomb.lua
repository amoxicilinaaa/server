function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Parâmetros da condição "Miss"
    local ret = {
        id = 0,
        cd = 9,
        eff = 48,
        check = 0,
        spell = spell,
        cond = "Miss"
    }

    -- Executa múltiplos disparos com dano tipo ELECTRIC
    doMoveInAreaMulti(cid, 22, 171, bullet, bulletDano, ELECTRICDAMAGE, min, max, ret)

    return true
end