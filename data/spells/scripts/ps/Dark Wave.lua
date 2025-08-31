dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Efeito visual inicial sem dano
    doMoveInArea2(cid, 719, db1, DARKDAMAGE, 0, 0, spell)

    -- Dano real com efeito visual
    doMoveInArea2(cid, 696, db1, DARKDAMAGE, min, max, spell)

    return true
end