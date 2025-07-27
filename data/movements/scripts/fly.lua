local del = {'460', '1022', '1023', '1024'}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    position.stackpos = 0

    if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then
        return false -- TV
    end

    if not isPremium(cid) then
        doPlayerSendCancel(cid, "Você precisa ser VIP para subir no fly.")
        doSendMagicEffect(getPlayerPosition(cid), 2)
        return false
    end

    if getPlayerStorageValue(cid, 17000) <= 0 then
        doTeleportThing(cid, fromPosition, false)
        doRemoveItem(getTileThingByPos(position).uid, 1)
        doPlayerSendCancel(cid, "You can't fly.")
        return true
    end

    doAreaCombatHealth(cid, FLYSYSTEMDAMAGE, getThingPos(cid), splash, 0, 0, 255)

    local pos = getThingPos(cid)
    if pos.z == 7 then
        return true
    end
    pos.z = pos.z + 1

    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, 3) or hasProperty(tile.uid, 7) or tile.itemid == 919 then
                doTransformItem(item.uid, 11677)
            end
        end
    end

    return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then
        return false -- TV
    end

    local effect = 2

    if toPosition.z == fromPosition.z and getCreatureOutfit(cid).lookType ~= 316 and getCreatureOutfit(cid).lookType ~= 648 then
        doSendMagicEffect(fromPosition, effect)
    end

    local oldtpos = fromPosition
    oldtpos.stackpos = STACKPOS_GROUND

    local tile = getTileThingByPos(oldtpos)
    if tile.itemid >= 1 then
        doRemoveItem(tile.uid, 1)
    end

    return true
end