function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    local name = getSubName(cid, target)

    if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, name) then
        -- Formas especiais com efeito visual 651
        doMoveInAreaMulti(cid, 27, 651, multi, multiDano, FIGHTINGDAMAGE, min, max)

    elseif name == "Hitmonlee" then
        -- Forma padrão com efeito visual 652
        doMoveInAreaMulti(cid, 27, 652, multi, multiDano, FIGHTINGDAMAGE, min, max)

    else
        -- Outras espécies com efeito visual genérico 113
        doMoveInAreaMulti(cid, 39, 113, multi, multiDano, FIGHTINGDAMAGE, min, max)
    end

    return true
end