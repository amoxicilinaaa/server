function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Efeitos visuais alternativos para Shiny Magmar/Magmortar
    local eff2 = {498, 35, 498, 35}

    -- Efeitos visuais padrão ou mega
    local eff = (isMega(cid) and getMegaID(cid) == "X") and {302, 419, 302, 419} or {6, 35, 6, 35}

    -- Áreas de impacto sequencial
    local area = {flames1, flames2, flames3, flames4}

    -- Onda central com efeito fixo
    addEvent(doMoveInArea2, 2 * 450, cid, 2, flames0, FIREDAMAGE, min, max, spell)

    -- Executa 4 ondas com delay progressivo e variação por espécie
    for i = 0, 3 do
        local effectID = isInArray({"Shiny Magmar", "Shiny Magmortar"}, getSubName(cid, target)) and eff2[i + 1] or eff[i + 1]
        addEvent(doMoveInArea2, i * 450, cid, effectID, area[i + 1], FIREDAMAGE, min, max, spell)
    end

    return true
end