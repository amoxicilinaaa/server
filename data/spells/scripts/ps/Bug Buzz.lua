dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Define condição de Stun
    local ret = {
        id = target,
        cd = 9,
        eff = 34,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Aplica dano com Stun
    doMoveInArea2(cid, 86, db1, BUGDAMAGE, min, max, spell, ret)

    -- Reforça efeito visual após 250ms
    addEvent(function()
        if isCreature(cid) then
            doMoveInArea2(cid, 86, db1, BUGDAMAGE, 0, 0, spell)
        end
    end, 250)

    return true
end