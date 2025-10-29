function onTimer(interval, lastExecution)
MENSAGEM = {






"Jessie [8]: Jessie!\nJames [8]: James!",






}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],21)
return TRUE
end
