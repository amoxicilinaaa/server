function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Efeito principal com dano
    doMoveInArea2(cid, 728, HealWish, PSYCHICDAMAGE, min, max, spell)

    -- Efeito complementar com dano nulo (visual)
    addEvent(doMoveInArea2, 1, cid, 13, HealWish, PSYCHICDAMAGE, 0, 0, spell)

    return true
end
