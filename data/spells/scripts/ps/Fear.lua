dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    local ret = {
        id = 0,
        cd = 5,
        check = 0,
        skill = spell,
        cond = "Fear"
    }

    doMoveInArea2(cid, 0, confusion, DARKDAMAGE, 0, 0, spell, ret)

    return true
end