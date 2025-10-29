local btype = "normal"
local pokemon = "Charmander"
 
local storage = 453454
 
 
function onUse(cid, item, frompos, item2, topos)
if pokemon == "" then return true end
if getPlayerStorageValue(cid, storage) <= 0 then
addPokeToPlayer(cid, pokemon, 0, nil, btype)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Parabéns! Seu primeiro pokémon é o "..pokemon.."!")
doSendMagicEffect(getThingPos(cid), 29)
doSendMagicEffect(getThingPos(cid), 27)
doSendMagicEffect(getThingPos(cid), 29)
doPlayerAddLevel(cid, 1)
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendCancel(cid, "Você já pegou seu pokémon inicial.")
end
return TRUE
end