--[[
	Script: Exemplo de Quest
	Autor: MySticaL
	Email: matadormatou275@gmail.com
]]

	function onUse(cid, item, frompos, item2, topos) -- Não mecha.


storage = 2436754423 -- Storage a cada quest que for criada aumente um numero da storage pra qnd vc pegar o baú de outra quest ñ aparecer que vc já fez.
item = 13240 -- Id do item ira ganhar.
item2 = 13105 -- Id do item ira ganhar.
item3 = 13107 -- Id do item ira ganhar.
quantidade = 30 -- Quantidade ira ganhar.
quantidade2 = 1 -- Quantidade ira ganhar.
quantidade3 = 1 -- Quantidade ira ganhar.
level = 1 -- Level que precisa pra fazer.

	if getPlayerLevel(cid) >= level and getPlayerStorageValue(cid,storage) == -1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você terminou a Halloween quest!") -- Mensagem que aparecera quando ganhar o item.
doPlayerAddItem(cid, item, quantidade) -- Não mecha.
doPlayerAddItem(cid, item2, quantidade2) -- Não mecha.
doPlayerAddItem(cid, item3, quantidade3) -- Não mecha.
setPlayerStorageValue(cid,storage,1) -- Não mecha.

elseif getPlayerLevel(cid) <= level then -- Não mecha
doPlayerSendTextMessage(cid,25,"Você precisa ser level "..level.." ou mais.") -- Mensagem que ira aparecer se o player tiver menos level que o necessario.

elseif getPlayerStorageValue(cid,storage) >= 1 then -- Não mecha.
doPlayerSendTextMessage(cid,25,"Você já terminou a quest Halloween!") -- Quando tentar pegar mais de uma vez o baú.
end
return true
end