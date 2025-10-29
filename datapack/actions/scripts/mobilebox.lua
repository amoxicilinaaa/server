local stone_id = {13501, 13523, 13503, 13505, 13507, 13521, 13495, 13775, 14147, 14148, 14149, 14150, } -- joga os id das stones que vc quer que saia aki
function onUse(cid, item, frompos, item2, topos)
local level = 150 -- level
if item.itemid == 14155 then -- id da box
if getPlayerLevel(cid) >= level then
local w = math.random (1,#stone_id)
doPlayerAddItem(cid, stone_id[w])
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Você abriu a caixa de mobília aleatório e recebeu um "..getItemNameById(stone_id[w])..".")
doRemoveItem(item.uid, 1)
else
doPlayerSendCancel(cid,"Você precisa ser nível "..level.." para abrir essa caixa.")
end return true end  end