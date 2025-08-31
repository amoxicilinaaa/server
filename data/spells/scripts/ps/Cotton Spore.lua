dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Define condição de Stun
    local ret = {
        id = 0,
        cd = 9,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Aplica efeito visual e condição na área
    doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, 0, 0, spell, ret)

    return true
end