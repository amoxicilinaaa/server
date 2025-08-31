function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros da condição Fear
    local ret = {
        id = 0,
        cd = 5,
        check = 0,
        skill = spell,
        cond = "Fear"
    }

    -- Aplica dano tipo DARK em área com condição
    doMoveInArea2(cid, 0, confusion, DARKDAMAGE, 0, 0, spell, ret)

    return true
end