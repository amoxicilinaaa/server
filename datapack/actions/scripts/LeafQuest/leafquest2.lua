function onUse(cid, item, frompos, item2, topos)
if item.uid == 7105 then
queststatus = getPlayerStorageValue(cid,1575)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você completou a Leaf Valley Quest, parabéns!")
doPlayerAddItem(cid,11441,500)
doPlayerAddItem(cid,2160,100)
setPlayerStorageValue(cid,1576,1)
else
doPlayerSendTextMessage(cid,22,"Você já pegou sua recompensa.")
end
end
end