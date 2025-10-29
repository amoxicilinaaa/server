function onUse(cid, item)
if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "Volte seu pokémon!")
else
if #getPlayersInArea(torneio.area) > 1 then
doPlayerSendTextMessage(cid, 20 ,"Só o ultimo que ficar na arena, poderá abrir está porta! ") return true end
doTeleportThing(cid, torneio.playerTemple)
doBroadcastMessage("Parabéns ao treinador "..getCreatureName(cid)..". Vencedor do torneio de hoje! verifique o RANK utilizando o comando !rank torneio.")
doPlayerAddSkill(cid, 7, 1)
doPlayerAddItem(cid, torneio.awardTournament, torneio.awardAmount)
return true
end
end