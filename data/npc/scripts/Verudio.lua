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
        {id = 12173, qt = 130, name = "Bitten Apple"} -- Ma��s Mordidas
    }
    local rewards = {
        {id = 2152, qt = 55, name = "Hundred dollars"}, -- Moedas de Ouro
        {id = 11451, qt = 1, name = "Heart Stone"} -- Pedra de Cora��o
    }
    local stoFinish = 93831
    local expReward = 50000

    local questState = getPlayerStorageValue(cid, stoFinish)
    if questState == -1 then
        setPlayerStorageValue(cid, stoFinish, 0) -- Define como 0 se n�o estiver setado
        questState = 0
    end

    if (msgcontains(msg, 'ajuda') or msgcontains(msg, 'help') or msgcontains(msg, 'quest') or msgcontains(msg, 'tarefa')) then
        if questState == 0 then
            selfSay("Ol�, amigo! Tenho uma tarefa para voc�. Posso te pedir 50 Pair Of Leaves e 130 Bitten Apple? Em troca, te recompensarei! Diga 'sim' para aceitar ou 'n�o' para recusar.", cid)
            talkState[talkUser] = 1
        elseif questState == 1 then
            selfSay("Realmente me lembrei de voc�, " .. getCreatureName(cid) .. "! Dei a voc� a tarefa de trazer 50 Pair Of Leaves e 130 Bitten Apple. Voc� os trouxe? Diga 'sim' para confirmar.", cid)
            talkState[talkUser] = 2
        elseif questState == 2 then
            selfSay("Parab�ns, " .. getCreatureName(cid) .. "! Voc� j� concluiu esta miss�o. N�o h� mais tarefas por agora.", cid)
        end
        return true
    elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 1 and questState == 0 then
        selfSay("�timo! Aceitou a tarefa. Agora, por favor, traga 50 Pair Of Leaves e 130 Bitten Apple. Quando tiver os itens, diga 'ajuda' ou 'tarefa' novamente.", cid)
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
            selfSay("" .. getCreatureName(cid) .. " voc� n�o tem todos os itens.\n" .. (#completedItems > 0 and "Voc� completou: " .. table.concat(completedItems, ", ") .. ".\n" or "") .. "Ainda falta: " .. table.concat(missingItems, ", ") .. ". Retorne quanto tiver todos!", cid)
            return true
        end

        -- Remove os itens necess�rios
        for _, item in ipairs(need) do
            if not doPlayerRemoveItem(cid, item.id, item.qt) then
                selfSay("Ocorreu um erro ao remover os itens. Tente novamente mais tarde.", cid)
                return true
            end
        end

        -- D� as recompensas
        for _, reward in ipairs(rewards) do
            doPlayerAddItem(cid, reward.id, reward.qt)
        end
        doPlayerAddExperience(cid, expReward)
        selfSay("Muito obrigado! Aqui est� sua recompensa: 55 Hundred dollars, 1 Heart Stone e 50.000 de experi�ncia. Miss�o conclu�da!", cid)
        setPlayerStorageValue(cid, stoFinish, 2) -- Marca a quest como conclu�da
        return true
    elseif (msgcontains(msg, 'n�o') or msgcontains(msg, 'no')) and talkState[talkUser] == 1 and questState == 0 then
        selfSay("Tudo bem, volte quando estiver pronto para ajudar!", cid)
        talkState[talkUser] = 0
        return true
    elseif msgcontains(msg, 'status') then
        if questState == 0 then
            selfSay("Voc� ainda n�o come�ou esta miss�o. Diga 'ajuda' para aceitar!", cid)
        elseif questState == 1 then
            selfSay("Voc� aceitou a miss�o! Traga 50 Pair Of Leaves e 130 Bitten Apple, ent�o diga 'ajuda' novamente.", cid)
        elseif questState == 2 then
            selfSay("Parab�ns! Voc� concluiu esta miss�o.", cid)
        end
        return true
    else
        selfSay("Desculpe, n�o entendi. Diga 'ajuda' para iniciar ou verificar a miss�o, 'sim' para aceitar ou confirmar, 'n�o' para recusar, ou 'status' para ver o progresso.", cid)
        talkState[talkUser] = 0
        return true
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())