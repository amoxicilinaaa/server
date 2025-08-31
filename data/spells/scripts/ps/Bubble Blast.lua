dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica múltiplos efeitos e dano em área
    doMoveInAreaMulti(cid, 139, 735, bullet, bulletDano, WATERDAMAGE, min, max)

    return true
end