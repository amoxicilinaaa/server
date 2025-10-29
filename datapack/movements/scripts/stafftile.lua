function onStepIn(cid, item, position, fromPosition)

if getPlayerAccess(cid) >= 2 then
doPlayerSendTextMessage(cid, 27, "Bem-Vindo.")
else
doTeleportThing(cid, fromPosition, true)
end
end