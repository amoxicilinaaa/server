dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Disparo visual da spell
    doSendDistanceShoot(posC, posT, 139)

    -- Dano com efeito visual
    doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 735)

    return true
end