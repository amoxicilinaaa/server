function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Parâmetros da condição "Silence"
    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 34,
        cond = "Silence"
    }

    -- Dano em área com efeito visual 116
    doMoveInAreaMulti(cid, 6, 116, multi, multiDano, WATERDAMAGE, min, max)

    -- Aplica condição "Silence" com efeito invisível
    doMoveInArea2(cid, 0, multiDano, WATERDAMAGE, 0, 0, spell, ret)

    return true
end