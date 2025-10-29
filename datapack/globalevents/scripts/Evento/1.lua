function onTimer(interval, lastExecution)
MENSAGEM = {






"Jessie [8]: Prepare-se para a encrenca!\nJames [8]: Encrenca em dobro!",






}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],21)
return TRUE
end
