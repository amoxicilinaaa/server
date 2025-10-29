function onStepIn(cid, item, frompos, item2, topos)

local lukasfodao = {
	poke = "Totodile",
	ball = "normal",
	storage = 453454,
	pos = {x = 1038, y = 1035, z = 7}

}

	if getPlayerStorageValue(cid, lukasfodao.storage) <= 0 then
		addPokeToPlayer(cid, lukasfodao.poke, 0, gender, lukasfodao.ball)
		doPlayerAddItem(cid, 2394, 20) 
		doPlayerAddItem(cid, 2148, 50) 
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Pronto, agora você já está pronto para começar sua jornada, para usar seu pokémon mova a pokeball para o Slot e clique em Use!")
		doPlayerSendTextMessage(cid, 22, lukasfodao.poke)
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		doSendMagicEffect(getThingPos(cid), 21)
		setPlayerStorageValue(cid, lukasfodao.storage, 1)
	else
		doPlayerSendCancel(cid, "Você já pegou seu pokémon inicial :)")
	end
		return true
end