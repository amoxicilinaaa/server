function onUse(cid, item, fromposition, toPos)
local pos = {x=1225, y=2410, z=8}
if getPlayerStorageValue(cid, 454545) <= 1 then
doTeleportThing(cid, pos)
doPlayerSendTextMessage(cid, 25, "Bem Vindo")
doSendMagicEffect(getPlayerPosition(cid), 21)
return true
else
doPlayerSendTextMessage(cid, 26, "A porta esta trancada")
return true
end
end