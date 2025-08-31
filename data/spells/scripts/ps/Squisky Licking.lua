function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = 0,
        cd    = 9,
        check = 0,
        eff   = 0,
        spell = spell,
        cond  = "Stun"
    }

    -- Áreas sequenciais de impacto
    local areas = {SL1, SL2, SL3, SL4}

    -- Executa dano em cada área com delay crescente
    for i = 0, 3 do
        addEvent(doMoveInArea2, i * 200, cid, 145, areas[i + 1], NORMALDAMAGE, min, max, spell, ret)
    end

    return true
end