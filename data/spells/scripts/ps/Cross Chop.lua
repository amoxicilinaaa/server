dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Primeiro impacto
    doMoveInArea2(cid, 118, blaze, FIGHTINGDAMAGE, min, max, spell)

    -- Segundo impacto com delay
    addEvent(doMoveInArea2, 200, cid, 118, kick, FIGHTINGDAMAGE, min, max, spell)

    return true
end