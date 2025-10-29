--[[
	Script: Quest Example
	Autor: GOD Vitor
	Email: pokemonparaisov3@hotmail.com
]]

	function onUse(cid, item, frompos, item2, topos) -- Não mecha.


storage = 5237249 -- Storage a cada quest que for criada aumente um numero da storage pra qnd vc pegar o baú de outra quest ñ aparecer que vc já fez.
item = 14145 -- Id do item ira ganhar.
quantidade = 1 -- Quantidade ira ganhar.
level = 250 -- Level que precisa pra fazer.

	if getPlayerLevel(cid) >= level and getPlayerStorageValue(cid,storage) == -1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Parabéns! Você encontrou 1x Lugia doll.") -- Mensagem que aparecera quando ganhar o item.
doPlayerAddItem(cid, item, quantidade) -- Não mecha.
setPlayerStorageValue(cid,storage,1) -- Não mecha.

elseif getPlayerLevel(cid) <= level then -- Não mecha
doPlayerSendTextMessage(cid,25,"Você precisa ser nível "..level.." ou mais para pegar o o item escondido.") -- Mensagem que ira aparecer se o player tiver menos level que o necessario.

elseif getPlayerStorageValue(cid,storage) >= 1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você já encontrou o item escondido.") -- Quando tentar pegar mais de uma vez o baú.
end
return true
end	