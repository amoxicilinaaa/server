local config = {
fromPos = {x = 2236, y = 860, z = 6}, -- posição superior esquerda do mapa, da area em que esta mapeado a area.
toPos = {x = 2276, y = 905, z = 6}, -- posição inferior direita do mapa, da area em que esta mapeado a area.
boss = "Dragonite Milenar" -- Aqui você bota o nome do monstro que você quer remover
}

function onTimer()
removeMonsterInArea(fromPos, toPos)
return true
end

function removeMonsterInArea() -- by Daaniel Gay
local positionsCheck = {}
for i = config.fromPos.x, config.toPos.x do
positionsCheck[#positionsCheck+1] = {x=i, y = config.fromPos.y, z = config.fromPos.z, stackpos = 0}
for j = config.fromPos.y+1, config.toPos.y do
positionsCheck[#positionsCheck+1] = {x=i, y = j, z = config.fromPos.z, stackpos = 0}
end
end
for j=1, #positionsCheck do
for i = 0, 255 do
positionsCheck[j].stackpos = i
local tile = getTileThingByPos(positionsCheck[j])
if isMonster(tile.uid) then
if getCreatureName(tile.uid) == config.boss then
doRemoveCreature(tile.uid)
end
end
end
end
end