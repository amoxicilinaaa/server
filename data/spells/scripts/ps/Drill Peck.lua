dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local posTarget = getThingPosWithDebug(target)

    addEvent(doDanoWithProtect, 20, cid, FLYINGDAMAGE, posTarget, 0, -min, -max, 968)

    return true
end