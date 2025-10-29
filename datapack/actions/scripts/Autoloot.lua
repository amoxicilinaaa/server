local toloot = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449,11450, 11451, 11452, 11453, 11454, 12618, 12232, 12244} -- PREFERENCIAL - SE QUISER APENAS COM ALGUNS ITENS


local useSpecific = false --True para lotear somente os itens que estiverem na tabela toloot, false para todos os itens do corpse
function onUse(cid, item, frompos, item2, topos)
if getItemAttribute(item.uid, "corpseowner") ~= cid then
doPlayerSendCancel(cid, "Você não é o proprietário.")
return true
end
local items = {}
for x = (getContainerSize(item.uid) - 1), 0, -1 do
local k = getContainerItem(item.uid, x)
table.insert(items, {i=k.itemid, q=k.type})
doRemoveItem(k.uid)
end
if #items == nil then
return false
end
for y=1, #items do
doPlayerAddItemStacking(cid, items[y].i, items[y].q)
doPlayerSendTextMessage(cid, 20, "Looted "..items[y].q.."x "..getItemNameById(items[y].i)..".")
end
return true
end
--[[
AUTO LOOT BY GABRIEL SALES
SE QUISER ATIVAR O AUTOLOOT APENAS PARA ALGUNS ITENS, ADICIONE OS IDS NA TABELA toloot E TIRE OS COMENTÁRIOS(--).
--]]