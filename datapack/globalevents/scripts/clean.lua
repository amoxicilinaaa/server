function executeClean()
	doCleanMap()
	doBroadcastMessage("O mapa do jogo foi limpo, próxima limpeza em 2 horas.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("A limpeza do mapa será executada em 30 segundos.")
	addEvent(executeClean, 30000)
	return true
end
