local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local plevel = 1

-- Constants
local STORAGE_VIP = 1000 -- Storage para verificar status VIP
local LEVEL_BONUS_FREE = 0.015 -- Bônus de 1,5% por nível para contas Free
local LEVEL_BONUS_VIP = 0.02 -- Bônus de 2% por nível para contas VIP
local MIN_LEVEL = 10 -- Nível mínimo para venda

-- Pokémon comuns que não podem ser vendidos
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"}

-- Storages para verificar fly, ride, surf
local movementStorages = {17000, 63215, 17001, 13008}

function isCommonPokemon(name)
    for _, commonPoke in ipairs(commonPokemons) do
        if string.lower(name) == string.lower(commonPoke) then
            return true
        end
    end
    return false
end

function isInMovement(cid)
    for _, storage in ipairs(movementStorages) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            return true
        end
    end
    return false
end

function getPokemonLevel(ball)
    -- Tenta primeiro com "level", depois com "lvl"
    local level = getItemAttribute(ball, "level")
    if not level then
        level = getItemAttribute(ball, "lvl")
    end
    return level or 1
end

function calculatePrice(basePrice, level, isVip)
    if level < MIN_LEVEL then
        return 0
    end
    
    local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
    local levelBonus = (level - MIN_LEVEL) * bonus
    local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
    
    return finalPrice
end

function findPokemonBall(cid, pokemonName)
    -- Primeiro verifica o slot de pernas
    local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
    if pokeball.uid ~= 0 then
        local ballPokemon = getItemAttribute(pokeball.uid, "poke")
        if ballPokemon and string.lower(ballPokemon) == string.lower(pokemonName) then
            return pokeball.uid, "legs"
        end
    end
    
    -- Depois verifica a mochila
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    if bp.uid ~= 0 then
        for _, ballType in pairs(pokeballs) do
            local balls = getItemsInContainerById(bp.uid, ballType.on)
            for _, ball in pairs(balls) do
                local ballPokemon = getItemAttribute(ball, "poke")
                if ballPokemon and string.lower(ballPokemon) == string.lower(pokemonName) then
                    return ball, "backpack"
                end
            end
        end
    end
    
    return nil, nil
end

function processSale(cid, pokemonName, expectedLevel, expectedPrice)
    -- Verifica se há Pokémon ativo
    if #getCreatureSummons(cid) >= 1 then
        selfSay("Chame seu Pokémon de volta para vendê-lo!")
        return false
    end
    
    -- Verifica se está em fly, ride ou surf
    if isInMovement(cid) then
        selfSay("Você não pode vender um Pokémon enquanto está em fly, ride ou surf!")
        return false
    end
    
    -- Busca a pokebola
    local ball, location = findPokemonBall(cid, pokemonName)
    if not ball then
        selfSay("Você não tem um "..pokemonName.." nível "..expectedLevel.." na mochila ou no slot de pernas, ou ele está desmaiado!")
        return false
    end
    
    -- Verifica se o Pokémon é único
    if getItemAttribute(ball, "unico") then
        selfSay("Desculpe, eu não compro Pokémon únicos como "..pokemonName.."!")
        return false
    end
    
    -- Verifica se o Pokémon está bloqueado
    local lock = getItemAttribute(ball, "lock")
    if lock and lock > os.time() then
        selfSay("Desculpe, este "..pokemonName.." está bloqueado até "..os.date("%d/%m/%y %X", lock).."!")
        return false
    end
    
    -- Verifica o nível
    local pokeLevel = getPokemonLevel(ball)
    if pokeLevel < MIN_LEVEL then
        selfSay("Desculpe, eu só compro Pokémon a partir do nível 10!")
        return false
    end
    
    if pokeLevel ~= expectedLevel then
        selfSay("Erro: O nível do "..pokemonName.." não corresponde ao informado! Tente novamente.")
        print(string.format("[NPC Sam colecionador] Erro: Nível esperado=%d, nível encontrado=%d para %s", expectedLevel, pokeLevel, pokemonName))
        return false
    end
    
    -- Obtém o preço base
    local basePrice = prices and prices[pokemonName]
    if not basePrice then
        selfSay("Desculpe, eu não compro "..pokemonName.."!")
        return false
    end
    
    if basePrice == 1 then
        selfSay("Desculpe, eu não compro Pokémon lendários como "..pokemonName.."!")
        return false
    end
    
    -- Calcula o preço final
    local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
    local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
    local levelBonus = (pokeLevel - MIN_LEVEL) * bonus
    local finalPrice = calculatePrice(basePrice, pokeLevel, isVip)
    
    if finalPrice ~= expectedPrice then
        selfSay("Erro no cálculo do preço para "..pokemonName.."! Por favor, tente novamente.")
        print(string.format("[NPC Sam colecionador] Erro: Preço esperado=%d, preço calculado=%d para %s", expectedPrice, finalPrice, pokemonName))
        return false
    end
    
    -- Debug: Imprime atributos da pokebola
    local attributes = getItemAttributes(ball) or {}
    local attrString = ""
    for k, v in pairs(attributes) do
        attrString = attrString .. k .. "=" .. tostring(v) .. ", "
    end
    print("[NPC Sam colecionador] Atributos da pokebola de "..pokemonName..": "..attrString)
    
    -- Debug: Imprime informações do cálculo
    print(string.format("[NPC Sam colecionador] Venda de %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
        pokemonName, basePrice, pokeLevel, tostring(isVip), bonus, levelBonus, finalPrice))
    
    -- Processa a venda
    selfSay("Uau! Obrigado por este maravilhoso "..pokemonName.."! Pegue seus "..finalPrice.." dollars. Você gostaria de vender outro Pokémon?")
    doRemoveItem(ball, 1)
    doPlayerAddMoney(cid, finalPrice)
    
    -- Transforma o item no slot de pernas se foi de lá
    if location == "legs" then
        doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
    end
    
    doPlayerSave(cid)
    return true
end

function onCreatureSay(cid, type, msg)
    local msg = string.lower(msg)
    
    -- Ignora mensagens com ! ou ,
    if string.find(msg, "!") or string.find(msg, ",") then
        return true
    end
    
    if focus == cid then
        talk_start = os.clock()
    end
    
    -- Cumprimento inicial
    if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 3 then
        selfSay('Bem-vindo à minha loja! Eu compro Pokémon de todas as espécies a partir do nível 10, exceto únicos, bloqueados ou lendários. Diga o nome do Pokémon que deseja vender.')
        focus = cid
        conv = 1
        talk_start = os.clock()
        cost = 0
        pname = ""
        plevel = 1
        return true
    end
    
    -- Despedida
    if msgcontains(msg, 'bye') and focus == cid then
        selfSay('Vejo você por aí!')
        focus = 0
        return true
    end
    
    -- Após venda - quer vender outro?
    if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
        selfSay('Diga o nome do Pokémon que deseja vender.')
        conv = 1
        return true
    end
    
    -- Após venda - não quer vender outro
    if msgcontains(msg, 'no') and conv == 4 and focus == cid then
        selfSay('Ok, vejo você por aí!')
        focus = 0
        return true
    end
    
    -- Rejeição da confirmação
    if msgcontains(msg, 'no') and conv == 3 and focus == cid then
        selfSay('Diga o nome de outro Pokémon que deseja vender.')
        conv = 1
        return true
    end
    
    -- Processamento do nome do Pokémon
    if (conv == 1 or conv == 4) and focus == cid then
        local name = doCorrectPokemonName(msg)
        
        -- Verifica se a tabela de preços existe
        if not prices or not next(prices) then
            selfSay("Desculpe, meu sistema de preços não está funcionando no momento. Tente novamente mais tarde!")
            return true
        end
        
        -- Verifica se é Pokémon comum
        if isCommonPokemon(name) then
            selfSay('Eu não compro um Pokémon tão comum!')
            return true
        end
        
        -- Verifica se conhece o Pokémon
        local basePrice = prices[name]
        if not basePrice then
            selfSay("Desculpe, não sei de que Pokémon você está falando! Tem certeza de que escreveu corretamente?")
            return true
        end
        
        -- Verifica se é lendário
        if basePrice == 1 then
            selfSay("Desculpe, eu não compro Pokémon lendários como "..name.."!")
            return true
        end
        
        -- Busca a pokebola para obter informações
        local ball, location = findPokemonBall(cid, name)
        if not ball then
            selfSay("Você não tem um "..name.." na mochila ou no slot de pernas, ou ele está desmaiado!")
            return true
        end
        
        -- Verifica se é único
        if getItemAttribute(ball, "unico") then
            selfSay("Desculpe, eu não compro Pokémon únicos como "..name.."!")
            return true
        end
        
        -- Verifica se está bloqueado
        local lock = getItemAttribute(ball, "lock")
        if lock and lock > os.time() then
            selfSay("Desculpe, este "..name.." está bloqueado até "..os.date("%d/%m/%y %X", lock).."!")
            return true
        end
        
        -- Obtém o nível
        local level = getPokemonLevel(ball)
        if level < MIN_LEVEL then
            selfSay("Desculpe, eu só compro Pokémon a partir do nível 10!")
            return true
        end
        
        -- Calcula o preço
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (level - MIN_LEVEL) * bonus
        local finalPrice = calculatePrice(basePrice, level, isVip)
        
        -- Debug: Imprime atributos da pokebola
        local attributes = getItemAttributes(ball) or {}
        local attrString = ""
        for k, v in pairs(attributes) do
            attrString = attrString .. k .. "=" .. tostring(v) .. ", "
        end
        print("[NPC Sam colecionador] Atributos da pokebola de "..name..": "..attrString)
        
        -- Debug: Imprime informações da confirmação
        print(string.format("[NPC Sam colecionador] Confirmação de %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, level, tostring(isVip), bonus, levelBonus, finalPrice))
        
        cost = finalPrice
        pname = name
        plevel = level
        selfSay("Você realmente quer vender o "..name.." nível "..level.." por "..cost.." dollars?")
        conv = 3
        return true
    end
    
    -- Confirmação da venda
    if isConfirmMsg(msg) and focus == cid and conv == 3 then
        if processSale(cid, pname, plevel, cost) then
            conv = 4
        else
            conv = 1
        end
        return true
    end
    
    return true
end

-- Configurações para mensagens automáticas
local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {
    "Comprando alguns Pokémon! Venha aqui para vendê-los!",
    "Quer vender um Pokémon? Venha ao lugar certo!",
    "Compro Pokémon! Com excelentes ofertas!!",
    "Cansado de um Pokémon? Por que você não me vende então?"
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
        
        local npcpos = getThingPos(getNpcId())
        local focpos = getThingPos(focus)
        
        if npcpos.z ~= focpos.z then
            focus = 0
            return true
        end
        
        -- Timeout após 70 segundos
        if (os.clock() - talk_start) > 70 then
            focus = 0
            selfSay("Tenho outros clientes também, fale comigo quando tiver vontade de vender um Pokémon.")
        end
        
        -- Se o jogador se afastar mais de 3 tiles
        if getDistanceToCreature(focus) > 3 then
            selfSay("Até logo e obrigado!")
            focus = 0
            return true
        end
        
        local dir = doDirectPos(npcpos, focpos)
        selfTurn(dir)
    end
    return true
end