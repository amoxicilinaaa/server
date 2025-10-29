torneio = {
awardTournament = 2148, ---moeda usada para entra no torneio--
awardAmount = 1000, -- quantidade de moeda que o player vai ganhar ao vencer o torneio--
playerTemple = {x = 1072, y = 1238, z = 7}, --pra onde vai o player quando morrer ?--

tournamentFight = {x = 894, y = 538, z = 15}, --centro da arena torneio combate-- 
area = {fromx = 1090, fromy = 1219, fromz = 15, tox = 1121, toy = 1236, toz= 15},--canto acima direito da arena combate-canto esquerdo abaixo da arena combate--

waitPlace = {x = 1074, y = 1227, z = 15}, --centro da sala de espera--  
waitArea = {fromx = 1061, fromy = 1219, fromz = 15, tox = 1088, toy = 1236, toz= 15}, --canto esquerdo acima da sala de espera--canto abaixo esquerdo da sala de espera--

startHour1 = "07:50:00", --horario do aviso?--
endHour1 = "08:00:00",--horario que começa?--

startHour2 = "11:50:00",--horario do aviso?--
endHour2 = "12:00:00",--horario do aviso?--

startHour3 = "17:50:00",--horario do aviso?--
endHour3 = "18:00:00",--horario do aviso?--

startHour4 = "22:50:00",--horario do aviso?--
endHour4 = "23:00:00",--horario do aviso?--

price = 500,--valor para entrar no torneio ? 500 dollar no caso--
revivePoke = 12344,--aqui é revive se tiver e se não tiver não precisa mexer--
}

function getPlayersInArea(area)

local players = {}

for x = area.fromx,area.tox do
for y = area.fromy,area.toy do
for z = area.fromz,area.toz do

local m = getTopCreature({x=x, y=y, z=z}).uid

if m ~= 1 and isPlayer(m) then
table.insert(players, m)
end
end
end
end
return players
end