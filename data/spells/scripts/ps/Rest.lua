function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros do buff
    local ret = {
        id = cid,
        cd = 6,
        eff = 0,
        check = 0,
        buff = spell,
        first = true
    }

    -- Aplica buff com efeito visual
    doCondition2(ret)

    return true
end