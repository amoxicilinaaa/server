dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 19) -- efeito de míssil (recolor possível)
    doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 105)

    return true
end