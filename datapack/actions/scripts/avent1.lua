function onUse(cid, item, frompos, item2, topos)
txt = "Cidade do mestre de fogo L[a voce encontrará um grande cavalo de fogo cujo a semelhança seja de um Pegassos de fogo E tera um bau com um premio e a terceira pista."
	if item.actionid == 89901 then
		doShowTextDialog(cid, 2395, txt)
	return true
	end
return true
end