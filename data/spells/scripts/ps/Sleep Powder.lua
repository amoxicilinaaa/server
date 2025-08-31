dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local ret = {
        id = 0,
        cd = math.random(5, 9),
        check = 0,
        first = true,
        cond = "Sleep"
    }

    -- Aplica a condiÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂ£o "Sleep" em ÃÂÃÂÃÂÃÂ¡rea com efeito visual 27
    doMoveInArea2(cid, 27, confusion, NORMALDAMAGE, min, max, spell, ret)
    return true
end