dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local ret = {
        id = 0,
        cd = math.random(6, 9),
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Aplica a condiÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂ£o "Stun" em ÃÂÃÂÃÂÃÂ¡rea com efeito visual 85
    doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, min, max, spell, ret)

    return true
end








