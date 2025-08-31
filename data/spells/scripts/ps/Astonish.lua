dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local pos = spellData.posC or getThingPosWithDebug(cid)

    -- Aplica dano tipo fantasma em área ao redor do caster
    doDanoWithProtect(cid, GHOSTDAMAGE, pos, selfArea2, min, max, 411)

    return true
end