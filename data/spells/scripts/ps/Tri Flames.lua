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
        eff   = 39,
        cond  = "Silence",
        spell = spell
    }

    -- Primeiro impacto visual com dano base
    doMoveInArea2(cid, 6, triflames, FIREDAMAGE, 0, 0, spell, ret)

    -- Segundo impacto com dano real
    doMoveInArea2(cid, 356, triflames, FIREDAMAGE, min, max, spell, ret)

    return true
end
