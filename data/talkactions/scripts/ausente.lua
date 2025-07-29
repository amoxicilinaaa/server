local FRASES = {"AUSENTE!", "VOLTO JÁ!", "JÁ VOLTO!", "AFK!", "FUI COMER!"} -- Auto-Mensagens.
local TEMPO = 10 -- Intervalo de Tempo em segundos.
local CORES = math.random(1, 255)
local say = {}

local function doSendAutoMessage(cid, pos, player)
	if (isCreature(cid) == TRUE) then
		npos = getThingPos(cid)
		if (pos.x == npos.x) and (pos.y == npos.y) and (pos.z == npos.z) and say[player] ~= nil then
			doSendAnimatedText(pos, FRASES[math.random(#FRASES)], CORES)
			doSendMagicEffect(pos, 166)
			say[player] = addEvent(doSendAutoMessage, TEMPO*1000, cid, npos, player)
		else
			say[player] = nil
			doPlayerSendCancel(cid, "Ausente desativado.")
		end
	else
		say[player] = nil
	end
end

function onSay(cid, words, param)
	local player = getPlayerGUID(cid)
	if say[player] == nil then
		pos = getThingPos(cid)
		doSendAnimatedText(pos, FRASES[math.random(#FRASES)], CORES)
		doSendMagicEffect(pos, 2)
		doPlayerSendCancel(cid, "Ausente ativado.")
		say[player] = addEvent(doSendAutoMessage, TEMPO*1000, cid, pos, player)
		return TRUE
	else
		doPlayerSendCancel(cid, "Você já está com o Ausente ativado, saia do piso onde ativou e aguarde desativar.")
	end
end