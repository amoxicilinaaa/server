function onSay(cid, words, param)
    -- Verifica se os parâmetros foram fornecidos corretamente
    if param == "" or not param:find(",") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Uso correto: /exp NomeDoJogador, QuantidadeDeExp")
        return true
    end

    -- Separa os parâmetros
    local name, amount = param:match("^(.-),%s*(%d+)$")
    if not name or not amount then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Formato inválido. Exemplo: /exp Lucas, 5000")
        return true
    end

    -- Procura o jogador pelo nome
    local target = getPlayerByName(name)
    if not isPlayer(target) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador '"..name.."' não está online.")
        return true
    end

    -- Converte a quantidade para número
    local exp = tonumber(amount)
    if exp <= 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A quantidade de experiência deve ser maior que zero.")
        return true
    end

    -- Aplica a experiência com animação verde e texto "+EXP"
    doPlayerAddExp(target, exp)
    doSendAnimatedText(getCreaturePosition(target), "+EXP "..exp, TEXTCOLOR_GREEN)
    doPlayerSendTextMessage(target, MESSAGE_EVENT_ADVANCE, "Você recebeu "..exp.." pontos de experiência de "..getCreatureName(cid)..".")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você deu "..exp.." de experiência para "..getCreatureName(target)..".")
    return true
end
