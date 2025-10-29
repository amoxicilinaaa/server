function onUse(cid, item, frompos, item2, topos)
if item.uid == 7103 then
queststatus = getPlayerStorageValue(cid,1571)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Você completou passou pelo pokemons mais perigosos, parabéns!")
doPlayerAddItem(cid,11447,500)
doPlayerAddItem(cid,2160,100)
setPlayerStorageValue(cid,1572,1)
else
doPlayerSendTextMessage(cid,22,"Voce ja completou essa quest amigo, todos viram seu poder.")
end
end
end