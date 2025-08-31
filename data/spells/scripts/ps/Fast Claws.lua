dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    sendEffWithProtect(cid, getThingPosWithDebug(cid), 211)

    local function doSkyUpper(cid, target, min, max)
        if not isCreature(cid) or not isCreature(target) then return false end
        doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 7)), false)
        doDanoInTargetWithDelay(cid, target, STEELDAMAGE, min, max, 431)
        return true
    end

    local function doSkyUpper2(cid, target, min, max)
        if not isCreature(cid) or not isCreature(target) then return false end
        doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 7)), false)
        doDanoInTargetWithDelay(cid, target, STEELDAMAGE, min, max, 0)
        return true
    end

    local function doSkyUpper3(cid, target)
        if not isCreature(cid) or not isCreature(target) then return false end
        doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 7)), false)
        doDanoInTargetWithDelay(cid, target, STEELDAMAGE, 0, 0, 0)
        return true
    end

    addEvent(doSkyUpper, 120, cid, target, min, max)
    addEvent(sendEffWithProtect, 180, cid, getThingPosWithDebug(cid), 211)
    addEvent(doSkyUpper2, 240, cid, target, min, max)
    addEvent(sendEffWithProtect, 300, cid, getThingPosWithDebug(cid), 211)
    addEvent(doSkyUpper2, 360, cid, target, min, max)
    addEvent(sendEffWithProtect, 420, cid, getThingPosWithDebug(cid), 211)
    addEvent(doSkyUpper3, 480, cid, target)
    addEvent(sendEffWithProtect, 540, cid, getThingPosWithDebug(cid), 211)
    addEvent(doSkyUpper3, 600, cid, target)
    addEvent(sendEffWithProtect, 675, cid, getThingPosWithDebug(cid), 211)
    addEvent(doSkyUpper3, 750, cid, target)

    return true
end