

--[[

:::::::::::::::::::::::::

:::::: MARSHMELLO :::::

::::: Tibiadevs :::::

:::::::::::::::::::::::::

]]
local  storage = {23345}

local itens1 = {13008, 12618} --- id dos itens que pode ser ganhos no evento

local itens2 = {2001, 2004} --- id de algumas bags

local grana = {2152,2160}

local porcentagem = 1,25 -- quantidade de dinheiro que podee vir

local random = itens1[math.random(1, #itens1)]

local random2 = itens2[math.random(1, #itens2)]

local random3 = grana[math.random(1, #grana)]

function onSay(cid, world, param)

for i = 1, #storage do

if getGlobalStorageValue(storage[i]) > os.time() then

doPlayerAddItem(cid, random, 1)

doPlayerAddItem(cid, random2, 1)

doPlayerAddItem(cid, random3, math.random(porcentagem))

doPlayerSendTextMessage(cid, 22, "Você coletou 1 "..getItemNameById(random).." and 1 "..getItemNameById(random2).." e uma quantia em dinheiro") setPlayerStorageValue(cid, 23365, os.time() + 60)

elseif getPlayerStorageValue(cid, storage[i])  > os.time() then

doPlayerSendCancel(cid, "Você já coletou agarde ".. os.time() - getPlayerStorageValue(cid, 23365).." para nova coleta")

else doPlayerSendCancel(cid, "Evento está off")

end

end

return true

end
