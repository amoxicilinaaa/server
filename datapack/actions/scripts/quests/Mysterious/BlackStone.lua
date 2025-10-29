--[[
	Script: Exemplo de Quest
	Autor: MySticaL
	Email: matadormatou275@gmail.com
]]

	function onUse(cid, item, frompos, item2, topos) -- Não mecha.


storage = 9531622 -- Storage a cada quest que for criada aumente um numero da storage pra qnd vc pegar o baú de outra quest ñ aparecer que vc já fez.
item = 4852 -- Id do item ira ganhar.
nomeitem = "Black Stone" -- Nome do item
quantidade = 1 -- Quantidade ira ganhar.
level = 200 -- Level que precisa pra fazer.

	if getPlayerLevel(cid) >= level and getPlayerStorageValue(cid,storage) == -1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você encontrou a PRIMEIRA pedra lendária que um dia pertenceu aos sábios. Você desvendou o MISTÉRIO! 2/2") -- Mensagem que aparecera quando ganhar o item.
doPlayerAddItem(cid, item, quantidade) -- Não mecha.
setPlayerStorageValue(cid,storage,1) -- Não mecha.

elseif getPlayerLevel(cid) <= level then -- Não mecha
doPlayerSendTextMessage(cid,25,"Você precisa ser nível "..level.."+ ou então já encontrou o item escondido.") -- Mensagem que ira aparecer se o player tiver menos level que o necessario.

elseif getPlayerStorageValue(cid,storage) >= 1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você já encontrou o item escondido.") -- Quando tentar pegar mais de uma vez o baú.
end
return true
end