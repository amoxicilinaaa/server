local entrada = {x=1396, y=3745, z=5}

function onUse(cid, item, fromPosition, item2, toPosition)

if getPlayerStorageValue(cid, 77551) >= 1 then
doPlayerSendTextMessage(cid,25, "Bem Vindo")
doTeleportThing(cid, entrada)
doSendMagicEffect(getPlayerPosition(cid),21)
return true
else
doPlayerSendTextMessage(cid, 26, "Você precisa ter entregado a jester staff para o willian")
return true
end
end