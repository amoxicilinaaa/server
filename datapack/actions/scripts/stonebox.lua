local stone_id = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449, 11450, 11451, 11452, 11453, } -- joga os id das stones que vc quer que saia aki
function onUse(cid, item, frompos, item2, topos)
local level = 50 -- level
if item.itemid == 12331 then -- id da box
if getPlayerLevel(cid) >= level then
local w = math.random (1,#stone_id)
doPlayerAddItem(cid, stone_id[w])
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Você abriu a caixa de stones e recebeu uma ["..getItemNameById(stone_id[w]).."].")
doRemoveItem(item.uid, 1)
else
doPlayerSendCancel(cid,"Você precisa ser nível "..level.."")
end return true end  end