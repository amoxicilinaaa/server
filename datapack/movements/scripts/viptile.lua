function onStepIn(cid, item, position, fromPosition)
if not isPlayer(cid) then return true end
if not isPremium(cid) then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, 27, "Apenas membros Premium Account podem passar.")
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return true
end
doSendMagicEffect(fromPosition, 12)
return true
end