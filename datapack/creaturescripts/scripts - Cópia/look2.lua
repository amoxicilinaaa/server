function onLook(cid, thing, position, lookDistance)
if items[thing.itemid] then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You see a "..items[thing.itemid].." "..getItemAttribute(thing.uid, "poke"):sub(9, findLetter(getItemAttribute(thing.uid, "poke"), "'")-1))
return false       
end
return true
end