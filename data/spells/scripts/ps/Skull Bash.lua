function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Parâmetros da condição "Paralyze"
    local ret = {
        id = 0,
        cd = 6,
        eff = 182,
        check = 0,
        first = true,
        cond = "Paralyze"
    }

    -- Efeito antecipado com dano nulo
    addEvent(doMoveInArea2, 350, cid, 118, reto5, NORMALDAMAGE, 0, 0, spell)

    -- Efeito principal com dano e paralisia
    doMoveInArea2(cid, 182, reto5, NORMALDAMAGE, min, max, spell, ret)

    return true
end
