local btype = "normal"
local pokemon = "Milotic" 
 local storage = 314143
 
 
function onUse(cid, item, frompos, item2, topos)


if pokemon == "" then return true end
if getPlayerStorageValue(cid, storage) <= 0 then
addPokeToPlayer(cid, pokemon, 0, nil, btype)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "PARABENS! voce fez a Quest Milotic!")
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendCancel(cid, "Você já fez está quest")
end
return true
end