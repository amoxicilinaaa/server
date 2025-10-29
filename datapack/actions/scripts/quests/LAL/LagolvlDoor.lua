function onUse(cid, item, frompos, item2, topos)
 
local level = 550 -- coloque o Level aqui
 
if getPlayerLevel(cid) >= level then
doTeleportThing(cid, topos)
doSendMagicEffect(topos, 29)
else
doPlayerSendTextMessage(cid, 22, "Você precisa ser nível 550+ para passar por essa porta.")
end
 
return TRUE
end