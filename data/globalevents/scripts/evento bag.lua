function onTimer()
	setGlobalStorageValue(655453,1)
	doBroadcastMessageOld("[EVENTO-RELAMPAGO]:\nO Evento bag Esta Ativo por 15 segundos, use o comando !eventorelampago para participar", 21)
	doSendCustomBroadcastMessage("[EVENTO-RELAMPAGO]:\nO Evento bag Esta Ativo por 15 segundos, use o comando !eventorelampago para participar", "#ffbb00", "images/broadcast/event", 2000, 0.8)

	addEvent(function()
		setGlobalStorageValue(655453,0)
		doBroadcastMessageOld("[EVENTO-RELAMPAGO]:\nO evento finalizou", 21)
		doSendCustomBroadcastMessage("[EVENTO-RELAMPAGO]:\nO evento finalizou", "#ffbb00", "images/broadcast/event", 2500, 0.8)
	end,15000)
	return true
end