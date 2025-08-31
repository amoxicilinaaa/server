dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Primeira onda de Boomburst
    doMoveInArea2(cid, 985, Boomburst, NORMALDAMAGE, -min, -max, spell)

    -- Segunda onda após 1.5s
    addEvent(function()
        if isCreature(cid) then
            doMoveInArea2(cid, 985, Boomburst1, NORMALDAMAGE, -min, -max, spell)
        end
    end, 1500)

    -- Terceira onda após 2.5s
    addEvent(function()
        if isCreature(cid) then
            doMoveInArea2(cid, 985, Boomburst2, NORMALDAMAGE, -min, -max, spell)
        end
    end, 2500)

    return true
end