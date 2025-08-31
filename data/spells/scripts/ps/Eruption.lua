dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local pos = getThingPosWithDebug(cid)
    local posC1 = getThingPosWithDebug(cid)

    local function doSendBubble(cid, pos)
        if not isCreature(cid) then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        addEvent(doSendDistanceShoot, 250, getThingPosWithDebug(cid), pos, 29)
        addEvent(doSendMagicEffect, 250, pos, 15)
    end

    local config = {
        Pull = function(cid)
            local pid = getSpectators(getThingPos(cid), 5, 5)
            if pid and #pid > 0 then
                for i = 1, #pid do
                    if pid[i] ~= cid and ehMonstro(pid[i]) and not isInArray({"Abporygon", "Aporygon"}, getCreatureName(pid[i])) then
                        doTeleportThing(pid[i], getClosestFreeTile(cid, getThingPos(cid)))
                    end
                end
            end
        end,
    }

    if isSummon(cid) then
        config.Pull(cid)
    end

    stopNow(cid, 1000)
    doSendMagicEffect(posC1, 241)
    doMoveInArea2(cid, 0, bombWee1, FIREDAMAGE, min, max, spell)

    for a = 2, 20 do
        local lugar = {x = pos.x + math.random(-5, 5), y = pos.y + math.random(-4, 4), z = pos.z}
        addEvent(doSendBubble, a * 30, cid, lugar)
    end

    addEvent(doDanoWithProtect, 150, cid, FIREDAMAGE, pos, waterarea, -min, -max, 0)

    return true
end