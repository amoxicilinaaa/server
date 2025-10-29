function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) and isMarried(thing.uid) then
doPlayerSetSpecialDescription(thing.uid, "\n"..(getPlayerSex(thing.uid) == 0 ).." in Marriage: "..getPlayerGUID(cid).." ")
end
return true
end