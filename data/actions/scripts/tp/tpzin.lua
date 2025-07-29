function onUse(cid, item, frompos, item2, topos)

local toPosi = {x = 1851, y = 1460, z = 13} --pos pra onde os players serao teleportados

doTeleportThing(cid, toPosi)
doSendMagicEffect(getThingPos(cid), 21)

end