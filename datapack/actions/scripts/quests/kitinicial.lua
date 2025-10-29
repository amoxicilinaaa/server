function onUse (cid,item,frompos,item2,topos)
pos = {x=1033, y=1037, z=7}
pos2 = getPlayerPosition(cid)

if getPlayerLevel(cid) >= 1 then
if item.uid == 9000 then
queststatus = getPlayerStorageValue(cid,5951)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Parabens,Você pegou seu Kit Inicial.")
doPlayerAddItem(cid,2152,40)
doPlayerAddItem(cid,12345,20)
doPlayerAddItem(cid,2392,50)
setPlayerStorageValue(cid,5951,1)
doSendMagicEffect(getThingPos(cid), 29)
else
doPlayerSendTextMessage(cid,22,"Você ja pegou isto!.")
end
end
else
doPlayerSendCancel(cid,'Somente Levels 5+ conseguem abrir este bau.')
end
return 1
end
