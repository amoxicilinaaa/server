function onSay(cid, words, param)

local pos = {x= 1056, y= 1052, z= 7}

addEvent(doRemoveCreature, 5*1000, cid, true)

doTeleportThing(cid,pos)

doPlayerSendTextMessage(cid,25,"Você será kickado em 5 segundos.")   
return true
end
