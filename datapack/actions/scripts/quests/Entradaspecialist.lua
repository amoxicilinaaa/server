function onUse(cid,item,frompos,item2,topos)

if getPlayerStorageValue(cid,181647) >= 1 then
doTeleportThing(cid,{x=1442,y=3787,z=7})
doSendMagicEffect(getPlayerPosition(cid), 21)
return true
else
doPlayerSendTextMessage(cid, 26, "Voce precisa da outifit de esquiador para passasr")
end
return true
end