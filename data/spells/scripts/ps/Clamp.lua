dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Disparo visual
    doSendDistanceShoot(posC, posT, 2)

    -- Dano com efeito visual
    doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 53)

    return true
end