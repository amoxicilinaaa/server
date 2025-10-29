function onUse(cid, item, pos)
doPlayerSendTextMessage(cid, 27, "COLOQUE AQUI SUA MENSAGEM")
doRemoveItem(item.uid, 0)
return true
end