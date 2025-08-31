function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Parâmetros da condição "Silence"
    local ret = {
        id    = 0,
        cd    = 9,
        check = 0,
        eff   = 26,
        cond  = "Silence",
        spell = spell
    }

    -- Executa múltiplos impactos com efeito visual 23 e 26
    doMoveInAreaMulti(cid, 23, 26, multi, multiDano, BUGDAMAGE, min, max)

    -- Aplica condição "Silence" com dano nulo
    doMoveInArea2(cid, 0, multiDano, BUGDAMAGE, 0, 0, spell, ret)

    return true
end
