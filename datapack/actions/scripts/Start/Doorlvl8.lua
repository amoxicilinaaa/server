function onUse(cid, item, frompos, item2, topos)
 
local level = 8 -- coloque o Level aqui
 
if getPlayerLevel(cid) >= level then
doTeleportThing(cid, topos)
doSendMagicEffect(topos, 29)
else
doPlayerSendTextMessage(cid, 22, "Você ainda não concluiu o tutorial completamente, volte aqui quando completar.")
end
 
return TRUE
end