dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local master = getCreatureMaster(cid) or cid

    local ret = {
        id = 0,
        cd = 9,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Miss"
    }

    for rocks = 1, 42 do
        addEvent(fall, rocks * 35, cid, master, psyDmg, -1, 238)
    end

    addEvent(doMoveInArea2, 500, cid, 0, BigArea2, psyDmg, min, max, spell, ret)

    return true
end