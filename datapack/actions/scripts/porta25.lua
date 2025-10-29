function onUse(cid, item, frompos, item2, topos)
    if getPlayerLevel(cid) >= 25 then
        return doTeleportThing(cid, topos)
    else
        return doPlayerSendCancel(cid, "É NECESSARIO LEVEL 25+ PARA PASSAR POR AKI!")
    end
    return true
end