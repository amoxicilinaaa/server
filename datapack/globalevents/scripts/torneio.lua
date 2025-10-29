function onTimer()
if #getPlayersInArea(torneio.area) > 1 then
return true
end
for _, pid in ipairs(getPlayersInArea(torneio.waitArea)) do
doTeleportThing(pid, torneio.tournamentFight)
doPlayerSendTextMessage(pid, 21, "O torneio de Kanto 150+ começou!")
end
return true
end