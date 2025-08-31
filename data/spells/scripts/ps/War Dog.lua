function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros do buff
    local ret = {
        id    = cid,
        cd    = 15,
        eff   = 28,
        check = 0,
        buff  = spell,
        first = true
    }

    -- Aplica o buff
    doCondition2(ret)

    return true
end