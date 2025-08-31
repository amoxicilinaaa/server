dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 12)
    doDanoWithProtectWithDelay(cid, target, NORMALDAMAGE, min, max, 5, crusher)

    return true
end