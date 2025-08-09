
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
	npcHandler:onThink()
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	msg = string.lower(msg)

	-- Storages
	local cfsto = {
		stoPr = 91230,   -- storage pra ele ir falar com o npc e voltar
		stoCo = 91231,   -- storage que ele falou com a npc tudo certo
		stoM = 91232,    -- storage para próxima missão
		stoAdd = 91233,  -- storage que o npc de ceru deu pra ele que confirmou a msg
	}

	local storage = 91250   -- storage da quest completa

	-- Storages da missão 2
	local stoTwo = {
		sto1 = 91234, -- storage pra poder falar com ash
		sto2 = 91235, -- storage que diz que ele falou com ash
		sto3 = 91236, -- storage dada pra ele poder pegar o clan no pvp
	}

	-- Primeira missão
	if msgcontains(msg, 'info') or msgcontains(msg, 'information') then
		if getPlayerStorageValue(cid, storage) >= 1 then
			selfSay("I do not need your help anymore.", cid)
			return true
		end
		selfSay("Hello, I'm Bill, I like to know everything about pokemon, I'm needing some help to complete my research over pokemon, want to help me?", cid)
		talkState[talkUser] = 1
		return true

	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 then
		selfSay("Okay, I need you to send a message to a friend of mine, she is in Cerulean. She called me for a great event of waterborne pokemons but as I am very busy with my research, I cannot go. Can you go there and tell her that I will not go?", cid)
		talkState[talkUser] = 2

	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'ok')) and talkState[talkUser] == 2 then
		selfSay("Ok, I'll be waiting for you here.", cid)
		setPlayerStorageValue(cid, cfsto.stoPr, 1)
		talkState[talkUser] = 3

	elseif (msgcontains(msg, 'talk') or msgcontains(msg, 'complete')) and talkState[talkUser] == 3 then
		selfSay("You said what I asked?", cid)
		talkState[talkUser] = 4

	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 4 then
		if getPlayerStorageValue(cid, cfsto.stoAdd) >= 1 then
			selfSay("Sorry, you did not do what I asked you needed.", cid)
			return true
		end
		selfSay("Very good, I am very grateful for helping me. With this help I managed to finish my research and can find the formula of gvhd, your pokemon will be stronger. I adopted this as the name of the clan. Do you want to know more about this story?", cid)
		setPlayerStorageValue(cid, cfsto.stoM, 1)
		talkState[talkUser] = 5

	-- Segunda missão
	elseif (msgcontains(msg, 'missao') or msgcontains(msg, 'help')) and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid, cfsto.stoM) <= 1 then
			selfSay("Sorry, you haven't helped me in the first mission yet!", cid)
			return true
		end
		selfSay("I see a lot of interest on your part, I need you to do me another favor, are you interested?", cid)
		talkState[talkUser] = 2

	elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 2 then
		selfSay("Ok, I'm almost done with my research about clans, so I need you to talk to Ash. He will tell you the attribute needed to finalize the clan. Can you bring me this feedback from Ash?", cid)
		setPlayerStorageValue(cid, stoTwo.sto1, 1)
		talkState[talkUser] = 3

	-- Entregando a missão
	elseif (msgcontains(msg, 'help')) and talkState[talkUser] == 1 then
		if getPlayerStorageValue(cid, stoTwo.sto2) <= 1 then
			selfSay("Sorry, you haven't helped me in the message mission.", cid)
			return true
		end
		selfSay("Really good, I believe you are the best. When you are level 80 you can become a clan! Thank you.", cid)
		setPlayerStorageValue(cid, storage, 1)
	end
end

