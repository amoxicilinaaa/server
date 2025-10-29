function onUse(cid, item, frompos, item2, topos)

	message = "Computar: Ponto. Agora você está desbugado(a)."
	doCreatureSay(cid, message, 19)
	doRegainSpeed(cid)
	setPlayerStorageValue(cid, 243656, 0)

return true
end