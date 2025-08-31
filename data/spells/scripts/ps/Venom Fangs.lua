function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Áreas de vento tóxico em sequência
    local area = {gale1, gale2, gale3, gale4, gale3, gale2, gale1}

    -- Executa dano em cada área com delay progressivo
    for i = 0, 6 do
        addEvent(doMoveInArea2, i * 400, cid, 138, area[i + 1], POISONDAMAGE, min, max, spell)
    end

    return true
end
