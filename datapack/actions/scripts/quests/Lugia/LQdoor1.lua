function onUse(cid, item, fromPosition, item2, toPosition)

                     local teleport = {x=727, y=2405, z=8}-- Coordenadas para onde o player irá ser teleportado.
	local item1 = 2159 -- ID do item1 que o player precisa para ser teleportado.
	local item2 = 2174 -- ID do item2 que o player precisa para ser teleportado.
	local item3 = 2318 -- ID do item3 que o player precisa para ser teleportado.
	
	if getPlayerItemCount(cid,item1) >= 1 then
		if getPlayerItemCount(cid,item2) >= 1 then
			if getPlayerItemCount(cid,item3) >= 1 then
                                                                                        doPlayerRemoveItem(cid, item1, 1)
                                                                                        doPlayerRemoveItem(cid, item2, 1)
                                                                                        doPlayerRemoveItem(cid, item3, 1)
				doTeleportThing(cid, teleport)
			else
				doPlayerSendTextMessage(cid, 23, "Você precisa ter em mãos 1x Scarab Coin, 1x Strange Symbol e 1x Brooch.")
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
				return true
			end
		else
			doPlayerSendTextMessage(cid, 23, "Você precisa ter em mãos 1x Scarab Coin, 1x Strange Symbol e 1x Brooch.")
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			return true
		end
	else
		doPlayerSendTextMessage(cid, 23, "Você precisa ter em mãos 1x Scarab Coin, 1x Strange Symbol e 1x Brooch.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return true
	end	
end
