local btype = "normal"
local pokemon = "Bulbasaur"

local storage = 55557 -- storage
local pos = {x= 1053, y= 1048, z= 7} -- coordenadas para onde o player vai


function onUse(cid, item, frompos, item2, topos)
if pokemon == "" then return true end
if getPlayerStorageValue(cid, storage) <= 0 then
addPokeToPlayer(cid, pokemon, 0, nil, btype)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce pegou seu "..pokemon.."!!")
doSendMagicEffect(getThingPos(cid), 29)
doSendMagicEffect(getThingPos(cid), 27)
doSendMagicEffect(getThingPos(cid), 29)
doTeleportThing(cid,pos)
doPlayerAddItem(cid, 11441, 2)
doPlayerAddItem(cid, 2160, 2)
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendCancel(cid, "Você já pegou seu Pokémon")
end
return TRUE
end