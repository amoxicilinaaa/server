local items = {
[1]=2160, --ID do item 1
[2]=2157, --ID do item 2
[3]=2121} --ID do item 3

local stor = (11401+os.date("%Y")) --Nao mexa

function onUse(cid)
if getPlayerStorageValue(cid, stor) ~= 1 then
a = math.random(1, #items)
doPlayerAddItem(cid, items[a], 1)
setPlayerStorageValue(cid, stor, 1)
else
doPlayerSendCancel(cid, "Voce ja pegou seu presente.")
end
doPlayerRemoveItem(cid, 11401, 1)
return true
end