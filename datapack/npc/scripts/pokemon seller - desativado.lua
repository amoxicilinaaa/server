local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local baseprice = 0

local pokePrice = {
["Bulbasaur"] = 3000,                                                   
["Ivysaur"] = 4500,        --alterado v1.6
["Venusaur"] = 12000,
["Lumineon"] = 12000,
}

function sellPokemon(cid, name, price)

	local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)

    if #getCreatureSummons(cid) >= 1 then
       selfSay("Chame seu pokémon para pokebola, e assim poderemos negociar!")
       focus = 0                                --alterado v1.8
       return true
    end
    local storages = {17000, 63215, 17001, 13008, 5700}   --alterado v1.8
    for s = 1, #storages do
        if getPlayerStorageValue(cid, storages[s]) >= 1 then
           selfSay("Não podemos negociar caso você esteja voando, surfando ou montado em um pokémon.") 
           focus = 0 
           return true
        end
    end
    
    if getPlayerSlotItem(cid, 8).uid ~= 0 then 
       if string.lower(getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")) == string.lower(name) then
          if not getItemAttribute(getPlayerSlotItem(cid, 8).uid, "unique") then  --alterado v1.6
             selfSay("Uau! Obrigado por esse maravilhoso "..name.."! Pegue seus "..price.." dólares. Você gostaria de vender outro pokémon?")
             doRemoveItem(getPlayerSlotItem(cid, 8).uid, 1)              --alterado v1.6
             doPlayerAddMoney(cid, price * 100)
             doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
             return true
          end
       end
    end
       
	for a, b in pairs(pokeballs) do
		local balls = getItemsInContainerById(bp.uid, b.on)
		for _, ball in pairs (balls) do
			if string.lower(getItemAttribute(ball, "poke")) == string.lower(name) then
				if not getItemAttribute(ball, "unique") then --alterado v1.6
                   selfSay("Uau! Obrigado por esse maravilhoso "..getItemAttribute(ball, "poke").."! Pegue seus "..price.." dólares. Você gostaria de vender outro pokémon?")
				   doRemoveItem(ball, 1)
				   doPlayerAddMoney(cid, price * 100)
	               return true
                end
			end
		end
	end

	selfSay("Você não tem um "..name..", ou acho que não está em sua mochila, ou está morto ou então pode ser que esteja em uma pokebola única.")  --alterado v1.6
return false
end

function onCreatureSay(cid, type, msg)

	local msg = string.lower(msg)

	if string.find(msg, "!") or string.find(msg, ",") then
	return true
	end

	if focus == cid then
		talk_start = os.clock()
	end

	if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 3 then
		selfSay('Bem-vindo(a) á minha loja! eu compro pokémons, caso esteja interessado(a) em vender algum pokémon diga o nome dele que darei minha oferta.')
		focus = cid
		conv = 1
		talk_start = os.clock()
		cost = 0
		pname = ""
	return true
	end

	if msgcontains(msg, 'bye') and focus == cid then
		selfSay('Ok, até a próxima!')
		focus = 0
	return true
	end

	if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
		selfSay('Diga o nome do pokémon que você gostaria de vender.')
		conv = 1
	return true
	end

	if msgcontains(msg, 'no') and conv == 4 and focus == cid then
		selfSay('Ok, vejo você em breve!')
		focus = 0
	return true
	end

	local common = {"rattata", "caterpie", "weedle", "magikarp", "charmander", "elekid", "cyndaquil", "squirtle", "bulbasaur", "treecko", "totodile", "chikorita", "torchic"}

	if conv == 1 and focus == cid then
		for a = 1, #common do
			if msgcontains(msg, common[a]) then
				selfSay('Não tenho interesse nesse pokémon!')
			return true
			end
		end
	end

	if msgcontains(msg, 'no') and conv == 3 and focus == cid then
		selfSay('Bom, então qual pokémon você gostaria de vender?')
		conv = 1
	return true
	end

	if (conv == 1 or conv == 4) and focus == cid then
		local name = doCorrectPokemonName(msg)
		local pokemon = pokes[name]
		if not pokemon then
			selfSay("Desculpa, mas não sei qual o pokémon que você está falando! Tem certeza que digitou o nome dele corretamente?")
		return true
		end

        baseprice = pokePrice[name] or math.floor(pokemon.level * 150)  --alterado v1.6

        cost = baseprice
        pname = name
        selfSay("Está certo(a) de que deseja vender um "..name.." por "..cost.." dólares?")
        conv = 3       
	end

	if isConfirmMsg(msg) and focus == cid and conv == 3 then
		if sellPokemon(cid, pname, cost) then
			conv = 4
		else
			conv = 1
		end
	return true
	end

end

local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Quero comprar alguns pokémons bonitos para minha coleção! Venha aqui, vamos negociar!",
		  "Quer vender algum pokémon? Veio ao lugar certo!",
		  "Compro pokémons! Tenho excelentes ofertas!",
		  "Cansado de um pokémon? Tenho uma boa oferta para ele!",
		 }

function onThink()

	if focus == 0 then
		selfTurn(1)
			delay = delay - 0.5
			if delay <= 0 then
				selfSay(messages[number])
				number = number + 1
					if number > #messages then
						number = 1
					end
				delay = math.random(intervalmin, intervalmax)
			end
		return true
	else

	if not isCreature(focus) then
		focus = 0
	return true
	end

		local npcpos = getThingPos(getThis())
		local focpos = getThingPos(focus)

		if npcpos.z ~= focpos.z then
			focus = 0
		return true
		end

		if (os.clock() - talk_start) > 70 then
			focus = 0
			selfSay("Eu tenho outros clientes também, converse comigo quando estiver querendo vender algum pokémon")
		end

		if getDistanceToCreature(focus) > 3 then
			selfSay("Até logo então e obrigado!")
			focus = 0
		return true
		end

		local dir = doDirectPos(npcpos, focpos)	
		selfTurn(dir)
	end


return true
end