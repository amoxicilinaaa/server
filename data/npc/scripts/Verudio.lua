local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = string.lower(msg)

    local need = {
        {id = 12155, qt = 300, name = "Pair Of Leaves"}, -- Caudas de Ratos
        {id = 12173, qt = 130, name = "Bitten Apple"} -- Maçãs Mordidas
    }
    local rewards = {
        {id = 2152, qt = 55, name = "Hundred dollars"}, -- Moedas de Ouro
        {id = 11451, qt = 1, name = "Heart Stone"} -- Pedra de Coração
    }
    local stoFinish = 93831
    local expReward = 50000

    local questState = getPlayerStorageValue(cid, stoFinish)
    if questState == -1 then
        setPlayerStorageValue(cid, stoFinish, 0) -- Define como 0 se não estiver setado
        questState = 0
    end

    if (msgcontains(msg, 'ajuda') or msgcontains(msg, 'help') or msgcontains(msg, 'quest') or msgcontains(msg, 'tarefa')) then
        if questState == 0 then
            selfSay("Olá, amigo! Tenho uma tarefa para você. Posso te pedir 50 Pair Of Leaves e 130 Bitten Apple? Em troca, te recompensarei! Diga 'sim' para aceitar ou 'não' para recusar.", cid)
            talkState[talkUser] = 1
        elseif questState == 1 then
            selfSay("Realmente me lembrei de você, " .. getCreatureName(cid) .. "! Dei a você a tarefa de trazer 50 Pair Of Leaves e 130 Bitten Apple. Você os trouxe? Diga 'sim' para confirmar.", cid)
            talkState[talkUser] = 2
        elseif questState == 2 then
            selfSay("Parabéns, " .. getCreatureName(cid) .. "! Você já concluiu esta missão. Não há mais tarefas por agora.", cid)
        end
        return true
    elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 1 and questState == 0 then
        selfSay("Ótimo! Aceitou a tarefa. Agora, por favor, traga 50 Pair Of Leaves e 130 Bitten Apple. Quando tiver os itens, diga 'ajuda' ou 'tarefa' novamente.", cid)
        setPlayerStorageValue(cid, stoFinish, 1) -- Marca a quest como iniciada
        talkState[talkUser] = 0
        return true
    elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 2 and questState == 1 then
        local missingItems = {}
        local completedItems = {}
        for _, item in ipairs(need) do
            local count = getPlayerItemCount(cid, item.id)
            if count < item.qt then
                table.insert(missingItems, (item.qt - count) .. " " .. item.name)
            else
                table.insert(completedItems, item.name)
            end
        end
        if #missingItems > 0 then
            selfSay("" .. getCreatureName(cid) .. " você não tem todos os itens.\n" .. (#completedItems > 0 and "Você completou: " .. table.concat(completedItems, ", ") .. ".\n" or "") .. "Ainda falta: " .. table.concat(missingItems, ", ") .. ". Retorne quanto tiver todos!", cid)
            return true
        end

        -- Remove os itens necessários
        for _, item in ipairs(need) do
            if not doPlayerRemoveItem(cid, item.id, item.qt) then
                selfSay("Ocorreu um erro ao remover os itens. Tente novamente mais tarde.", cid)
                return true
            end
        end

        -- Dá as recompensas
        for _, reward in ipairs(rewards) do
            doPlayerAddItem(cid, reward.id, reward.qt)
        end
        doPlayerAddExperience(cid, expReward)
        selfSay("Muito obrigado! Aqui está sua recompensa: 55 Hundred dollars, 1 Heart Stone e 50.000 de experiência. Missão concluída!", cid)
        setPlayerStorageValue(cid, stoFinish, 2) -- Marca a quest como concluída
        return true
    elseif (msgcontains(msg, 'não') or msgcontains(msg, 'no')) and talkState[talkUser] == 1 and questState == 0 then
        selfSay("Tudo bem, volte quando estiver pronto para ajudar!", cid)
        talkState[talkUser] = 0
        return true
    elseif msgcontains(msg, 'status') then
        if questState == 0 then
            selfSay("Você ainda não começou esta missão. Diga 'ajuda' para aceitar!", cid)
        elseif questState == 1 then
            selfSay("Você aceitou a missão! Traga 50 Pair Of Leaves e 130 Bitten Apple, então diga 'ajuda' novamente.", cid)
        elseif questState == 2 then
            selfSay("Parabéns! Você concluiu esta missão.", cid)
        end
        return true
    else
        selfSay("Desculpe, não entendi. Diga 'ajuda' para iniciar ou verificar a missão, 'sim' para aceitar ou confirmar, 'não' para recusar, ou 'status' para ver o progresso.", cid)
        talkState[talkUser] = 0
        return true
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())