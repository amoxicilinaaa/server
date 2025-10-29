function onAdvance(cid, skill, oldLevel, newLevel)

local config = {
[25] = {item = 2391, count = 30},
[40] = {item = 2393, count = 27},
[60] = {item = 2392, count = 48},
[80] = {item = 2152, count = 40},
[100] = {item = 2392, count = 88},
[110] = {item = 10503, count = 1},
[120] = {item = 2160, count = 2},
[150] = {item = 2160, count = 5},
}

if skill == 8 then
for level, info in pairs(config) do
if newLevel >= level and (getPlayerStorageValue(cid, 30700) == -1 or not (string.find(getPlayerStorageValue(cid, 30700), "'" .. level .. "'"))) then
doPlayerAddItem(cid, info.item, info.count)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Parabéns, você atingiu o level "..newLevel.." e ganhou "..info.count.." "..getItemNameById(info.item)..".")
local sat = getPlayerStorageValue(cid, 30700) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 30700) .. ",'" .. level .. "'" 
setPlayerStorageValue(cid, 30700, sat)
end
end
end

return TRUE
end