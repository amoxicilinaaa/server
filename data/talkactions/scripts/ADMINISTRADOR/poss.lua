function isWalkable(pos)
    local tile = getThingFromPos(pos)
    if tile.itemid == 0 then
        return false
    end
    return not hasProperty(tile.uid, CONST_PROP_BLOCKSOLID) and not hasProperty(tile.uid, CONST_PROP_IMMOVABLEBLOCKSOLID)
end

function onSay(cid, words, param)
    if getPlayerGroupId(cid) < 3 then
        return doPlayerSendCancel(cid, "Somente admins podem usar este comando."), true
    end

    local args = string.explode(param, ",")
    if #args < 3 then
        return doPlayerSendCancel(cid, "Uso correto: /pos x,y,z ou /pos x,y,z, NomeDoPlayer"), true
    end

    local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
    if not x or not y or not z then
        return doPlayerSendCancel(cid, "Coordenadas inv�lidas."), true
    end

    local targetPos = {x = x, y = y, z = z}
    if not isWalkable(targetPos) then
        return doPlayerSendCancel(cid, "Esta posi��o n�o � walkable."), true
    end

    if #args == 3 then
        -- Teleporta o pr�prio jogador
        doTeleportThing(cid, targetPos)
        doSendMagicEffect(targetPos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� foi teleportado para ("..x..","..y..","..z..").")
        return true
    else
        -- Teleporta outro jogador
        local targetName = string.trim(args[4])
        local target = getPlayerByName(targetName)
        if not target then
            return doPlayerSendCancel(cid, "Jogador '"..targetName.."' n�o encontrado ou offline."), true
        end

        doTeleportThing(target, targetPos)
        doSendMagicEffect(targetPos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� teleportou "..getCreatureName(target).." para ("..x..","..y..","..z..").")
        doPlayerSendTextMessage(target, MESSAGE_EVENT_ADVANCE, "Voc� foi teleportado por "..getCreatureName(cid)..".")
        return true
    end
end
