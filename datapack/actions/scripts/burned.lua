local config = {
remove = 2159, quantidade = 200, --- id do item quer vai remove  quantidade quer vai remove
}

--- By Luizmachado1 ---

function onUse(cid, item, fromPosition)

local pos = {x= 1062, y= 1046, z= 7} -- coordenadas para onde o player vai

if doPlayerRemoveItem(cid, config.remove, config.quantidade) == TRUE then
doTeleportThing(cid,pos)
doPlayerSendCancel(cid,"Parabéns Vc Entrou Na Burned")
return true
end

doTeleportThing(cid, fromPosition, false)
doPlayerSendTextMessage(cid, 27, "Vc Precisar 200 scarab coins.")
return true
end

