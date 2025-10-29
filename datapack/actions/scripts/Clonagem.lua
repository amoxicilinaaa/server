function onUse(cid, item, frompos, item2, topos)
local book = doPlayerAddItem(cid,1950,1)
doSetItemText(book,"texto") 
    return TRUE
end