function onTimer(interval, lastExecution)
MENSAGEM = {






"Jessie [8]: Equipe Rocket decolando na velocidade da luz!\nJames [8]: Renda-se agora ou prepare-se para lutar!\nMeowth [0]: Meowth! É isso aí!",






}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],21)
return TRUE
end
