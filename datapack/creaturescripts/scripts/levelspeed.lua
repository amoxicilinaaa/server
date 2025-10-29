function onAdvance(cid, skill, oldLevel, newLevel)


local speed = 220
local spood = getCreatureSpeed(cid)
local level = getPlayerLevel(cid)
if isPlayer(cid) then
doChangeSpeed(cid, -spood)
doChangeSpeed(cid, speed + (level * 3))
setPlayerStorageValue(cid, 1242343, (speed + (level * 3)))
end
return true
end