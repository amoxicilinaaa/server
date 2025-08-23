function onSay(cid, words, param)
    -- Verifica se os par�metros foram fornecidos corretamente
    if param == "" or not param:find(",") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Uso correto: /exp NomeDoJogador, QuantidadeDeExp")
        return true
    end

    -- Separa os par�metros
    local name, amount = param:match("^(.-),%s*(%d+)$")
    if not name or not amount then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Formato inv�lido. Exemplo: /exp Lucas, 5000")
        return true
    end

    -- Procura o jogador pelo nome
    local target = getPlayerByName(name)
    if not isPlayer(target) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador '"..name.."' n�o est� online.")
        return true
    end

    -- Converte a quantidade para n�mero
    local exp = tonumber(amount)
    if exp <= 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A quantidade de experi�ncia deve ser maior que zero.")
        return true
    end

    -- Aplica a experi�ncia com anima��o verde e texto "+EXP"
    doPlayerAddExp(target, exp)
    doSendAnimatedText(getCreaturePosition(target), "+EXP "..exp, TEXTCOLOR_GREEN)
    doPlayerSendTextMessage(target, MESSAGE_EVENT_ADVANCE, "Voc� recebeu "..exp.." pontos de experi�ncia de "..getCreatureName(cid)..".")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voc� deu "..exp.." de experi�ncia para "..getCreatureName(target)..".")
    return true
end
