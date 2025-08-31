dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
    doDanoInTargetWithDelay(cid, target, DARKDAMAGE, min, max, 723)

    return true
end