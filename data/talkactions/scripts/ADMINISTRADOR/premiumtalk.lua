function onSay(cid, words, param)
    -- Verificacao de permissao de administrador.
    -- O script nao ira funcionar se a sua conta nao tiver as permissoes necessarias
    -- para executar comandos de GM/Admin.

    -- Início da lógica para o comando /checkdays
    if words == "/checkdays" then
        -- Verifica se o parâmetro (nome do jogador) foi fornecido.
        if param == '' then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Faltou um nome de jogador. Uso correto: /checkdays <nome do jogador>")
            return true
        end

        local player = getPlayerByName(param)

        -- Verifica se o jogador foi encontrado.
        if not isPlayer(player) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador nao encontrado.")
            return true
        end

        -- Obtém os dias premium do jogador
        local premiumDays = getPlayerPremiumDays(player)

        -- Verifica se o jogador tem 0 dias premium.
        if premiumDays == 0 then
            doPlayerPopupFYI(cid, "O jogador " .. getCreatureName(player) .. " tem 0 dias de Premium Account.")
        else
            -- Calcula a data de expiração.
            local currentTime = os.time()
            local expireTime = currentTime + (premiumDays * 24 * 60 * 60)
            local expireDate = os.date("!%d/%m/%Y", expireTime) -- Apenas dia/mes/ano, em UTC

            -- Retorna o número de dias premium e a data de expiração.
            doPlayerPopupFYI(cid, "O jogador " .. getCreatureName(player) .. " tem " .. premiumDays .. " dias de Premium Account.\n\n" .. "A conta premium expira em: " .. expireDate .. " (UTC)")
        end
        return true
    end

    -- Início da lógica para o comando /addpremium
    if words == "/addpremium" then
        -- Separa os parâmetros (nome e quantidade de dias).
        local t = string.explode(param, ",")

        -- Validação: verifica se há dois parâmetros e se o segundo é um número.
        if #t < 2 or not tonumber(t[2]) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parametros invalidos. Uso correto: /addpremium <nome do jogador>,<dias>")
            return true
        end

        local player = getPlayerByNameWildcard(t[1])
        local days = tonumber(t[2])

        -- Verifica se o jogador foi encontrado.
        if not player then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador nao encontrado.")
            return true
        end

        -- Adiciona os dias premium.
        doPlayerAddPremiumDays(player, days)
        
        -- Adiciona um efeito de magia verde ao jogador
        doSendMagicEffect(getCreaturePosition(player), 830)
        
        -- Obtém o novo total de dias premium
        local newPremiumDays = getPlayerPremiumDays(player)
        
        -- Calcula a nova data de expiração
        local currentTime = os.time()
        local newExpireTime = currentTime + (newPremiumDays * 24 * 60 * 60)
        local newExpireDate = os.date("!%d/%m/%Y", newExpireTime) -- Apenas dia/mes/ano, em UTC
        
        -- Envia a mensagem com o novo total e a data de expiração
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce adicionou " .. days .. " dias de Premium Account ao jogador " .. getCreatureName(player) .. ". Sua conta agora tem " .. newPremiumDays .. " dias premium. Expira em: " .. newExpireDate .. " (UTC)")

        -- Mensagem "monster talk" para o jogador
        doCreatureSay(player, "Agora voce tem " .. newPremiumDays .. " dias de Premium!", TALKTYPE_MONSTER)
        
        return true
    end

    -- Início da lógica para o comando /removedays
    if words == "/removedays" then
        -- Separa os parâmetros (nome e quantidade de dias).
        local t = string.explode(param, ",")

        -- Validação: verifica se há dois parâmetros e se o segundo é um número.
        if #t < 2 or not tonumber(t[2]) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parametros invalidos. Uso correto: /removedays <nome do jogador>,<dias>")
            return true
        end

        local player = getPlayerByNameWildcard(t[1])
        local days = tonumber(t[2])

        -- Verifica se o jogador foi encontrado.
        if not player then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador nao encontrado.")
            return true
        end

        -- Remove os dias premium adicionando um valor negativo.
        doPlayerAddPremiumDays(player, -days)
        
        -- Adiciona um efeito de fumaça ao jogador
        doSendMagicEffect(getCreaturePosition(player), 3)
        
        -- Obtém o novo total de dias premium após a remoção
        local newPremiumDays = getPlayerPremiumDays(player)

        -- Verifica se o novo total é 0 para ajustar a mensagem
        if newPremiumDays <= 0 then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce removeu " .. days .. " dias de Premium Account do jogador " .. getCreatureName(player) .. ". O jogador agora tem 0 dias de Premium Account.")
            doCreatureSay(player, "Agora Você tem " .. newPremiumDays .. " dias de Premium!", TALKTYPE_MONSTER)
        else
            -- Calcula a nova data de expiração
            local currentTime = os.time()
            local newExpireTime = currentTime + (newPremiumDays * 24 * 60 * 60)
            local newExpireDate = os.date("!%d/%m/%Y", newExpireTime)

            -- Envia a mensagem com o novo total e a data de expiração
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce removeu " .. days .. " dias de Premium Account do jogador " .. getCreatureName(player) .. ". Sua conta agora tem " .. newPremiumDays .. " dias premium. Expira em: " .. newExpireDate .. " (UTC)")
            doCreatureSay(player, "Agora Você tem " .. newPremiumDays .. " dias de Premium!", TALKTYPE_MONSTER)
        end

        return true
    end

    -- Caso o comando nao seja reconhecido.
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando nao reconhecido.")
    return true
end
