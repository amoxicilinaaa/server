function onTimer(interval, lastExecution)
MENSAGEM = {






"Jessie [8]: Para proteger o mundo da devastação!\nJames [8]: Para unir as pessoas de nossa nação!",






}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],21)
return TRUE
end
