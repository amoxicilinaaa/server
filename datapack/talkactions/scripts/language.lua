function onSay(cid, words, param, channel)
if isBr(cid) then
setPlayerStorageValue(cid, 105505, -1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You successfully changed the language of your game to english. This only affects some channel messages and NPC conversations.")
else
setPlayerStorageValue(cid, 105505, 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você acabou de mudar o idioma do jogo para português. Isso modifica apenas algumas mensagens que aparecem no canal \"default\" e a fala dos NPCS.")
end
return 0
end