local config = {
additem = 2159, addquantidade = 100, 
removeitem = 2160, removequantidade = 100,
}

--- By Luizmachado1 ---

function onSay(cid, words, param, channel)
if doPlayerRemoveItem(cid, config.removeitem, config.removequantidade) == TRUE then
   doPlayerAddItem(cid, config.additem, config.addquantidade)
   doPlayerSendTextMessage(cid, 27, "Congratulations! Vc Comprou 100 Scarab Coins.")
return true
end

doPlayerSendCancel(cid, "Voce Precisar 100 gold") 
return true
end