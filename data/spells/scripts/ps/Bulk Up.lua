dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    local ret = {
        id = cid,
        cd = 10,
        eff = spell == "Outrage" and 358 or 356,
        check = 0,
        buff = spell,
        first = true
    }

    -- Aplica buff condicional
    doCondition2(ret)

    return true
end