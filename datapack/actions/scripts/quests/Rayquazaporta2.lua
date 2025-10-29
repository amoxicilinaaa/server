function onUse(cid, item, fromPosition, itemEx, toPosition)

local pos = {x = 2305, y = 1593, z = 5}

if getPlayerStorageValue(cid, 54893) >= 1 then
doTeleportThing(cid , pos)
else
doPlayerSendTextMessage(cid, 25, "Você não tem a marca da divindade em você.")
return true
end
end