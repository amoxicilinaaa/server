function onUse(cid, item, frompos, item2, topos)
if item.uid == 7104 then
queststatus = getPlayerStorageValue(cid,1573)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você completou a Water Valley Quest, parabéns!")
doPlayerAddItem(cid,11442,500)
doPlayerAddItem(cid,2160,100)
setPlayerStorageValue(cid,1574,1)
else
doPlayerSendTextMessage(cid,22,"Você já pegou sua recompensa.")
end
end
end