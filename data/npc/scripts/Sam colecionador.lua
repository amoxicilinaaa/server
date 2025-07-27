local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local plevel = 1
local STORAGE_VIP = 1000 -- Storage para verificar status VIP
local LEVEL_BONUS_FREE = 0.015 -- Bonus de 1,5% por nível para contas Free
local LEVEL_BONUS_VIP = 0.02 -- Bonus de 2% por nível para contas VIP
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"} -- Pokémon comuns que não podem ser vendidos

function sellPokemon(cid, name, level, expectedPrice)
    -- Verifica se há Pokémon ativo
    if #getCreatureSummons(cid) >= 1 then
        selfSay("Chame seu Pokémon de volta para vendê-lo!")
        focus = 0
        return true
    end
    
    -- Verifica se está em fly, ride ou surf
    local storages = {17000, 63215, 17001, 13008}
    for _, storage in ipairs(storages) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            selfSay("Você não pode vender um Pokémon enquanto está em fly, ride ou surf!")
            focus = 0
            return true
        end
    end
    
    -- Obtém o preço base da tabela global 'prices'
    local basePrice = prices and prices[name]
    if not basePrice then
        selfSay("Desculpe, eu não compro "..name.."!")
        return false
    end
    if basePrice == 1 then
        selfSay("Desculpe, eu não compro Pokémon lendários como "..name.."!")
        return false
    end
    
    -- Função auxiliar para processar a venda de uma pokebola
    --  isLegSlot: true se a pokébola está no slot de pernas, false caso contrário
    local function processSale(ball, name, expectedLevel, expectedPrice, isLegSlot)
        local pokename = getItemAttribute(ball, "poke")
        if not pokename or string.lower(pokename) ~= string.lower(name) then
            return false
        end
        -- Verifica se o Pokémon é único
        if getItemAttribute(ball, "unico") then
            selfSay("Desculpe, eu não compro Pokémon únicos como "..name.."!")
            return false
        end
        -- Verifica se o Pokémon está bloqueado
        local lock = getItemAttribute(ball, "lock")
        if lock and lock > os.time() then
            selfSay("Desculpe, este "..name.." está bloqueado até "..os.date("%d/%m/%y %X", lock).."!")
            return false
        end
        -- Verifica o nível do Pokémon
        local pokeLevel = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl") or 1
        if pokeLevel < 10 then
            selfSay("Desculpe, eu só compro Pokémon a partir do nível 10!")
            return false
        end
        if pokeLevel ~= expectedLevel then
            selfSay("Erro: O nível do "..name.." não corresponde ao informado! Tente novamente.")
            print(string.format("[NPC Sam colecionador] Erro: Nível esperado=%d, nível encontrado=%d para %s", expectedLevel, pokeLevel, name))
            return false
        end
        -- Calcula o preço final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (pokeLevel - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        if finalPrice ~= expectedPrice then
            selfSay("Erro no cálculo do preço para "..name.."! Por favor, tente novamente.")
            print(string.format("[NPC Sam colecionador] Erro: Preço esperado=%d, preço calculado=%d para %s", expectedPrice, finalPrice, name))
            return false
        end
        -- Debug: Imprime atributos da pokebola e informações sobre o cálculo
        local attributes = getItemAttributes(ball) or {}
        print(string.format("[NPC Sam colecionador] Pokéball attributes for %s: %s", name, table.concat(attributes, ", ")))
        print(string.format("[NPC Sam colecionador] Sale of %s: basePrice=%d, level=%d, isVip=%s, bonus=%.3f, levelBonus=%.3f, finalPrice=%d",
            name, basePrice, pokeLevel, tostring(isVip), bonus, levelBonus, finalPrice))
        selfSay("Uau! Obrigado por este maravilhoso "..name.."! Pegue seus "..finalPrice.." dollars. Você gostaria de vender outro Pokémon?")
        if isLegSlot then
            -- Transforma a pokébola vazia em 2395 conforme especificação
            doTransformItem(ball, 2395)
        else
            doRemoveItem(ball, 1)
        end
        doPlayerAddMoney(cid, finalPrice)
        doPlayerSave(cid)
        return true
    end
    
    -- Verifica o Pokémon no slot de pernas
    local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
    if pokeball.uid ~= 0 then
        if processSale(pokeball.uid, name, level, expectedPrice, true) then
            return true
        end
    end
    
    -- Verifica o Pokémon na mochila
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    for _, ballType in pairs(pokeballs) do
        local balls = getItemsInContainerById(bp.uid, ballType.on)
        for _, ball in pairs(balls) do
            if processSale(ball, name, level, expectedPrice, false) then
                return true
            end
        end
    end
    
    selfSay("Você não tem um "..name.." nível "..level.." na mochila ou no slot de pernas, ou ele está desmaiado!")
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
        selfSay('Bem-vindo à minha loja! Eu compro Pokémon de todas as espécies a partir do nível 10, exceto Pokémon únicos, bloqueados ou lendários. Diga o nome do Pokémon que deseja vender.')
        focus = cid
        conv = 1
        talk_start = os.clock()
        cost = 0
        pname = ""
        plevel = 1
        return true
    end
    
    if msgcontains(msg, 'bye') and focus == cid then
        selfSay('Vejo você por aí!')
        focus = 0
        return true
    end
    
    if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
        selfSay('Diga o nome do Pokémon que deseja vender.')
        conv = 1
        return true
    end
    
    if msgcontains(msg, 'no') and conv == 4 and focus == cid then
        selfSay('Ok, vejo você por aí!')
        focus = 0
        return true
    end
    
    if conv == 1 and focus == cid then
        for _, commonPoke in ipairs(commonPokemons) do
            if msgcontains(msg, commonPoke) then
                selfSay('Eu não compro um Pokémon tão comum!')
                return true
            end
        end
    end
    
    if msgcontains(msg, 'no') and conv == 3 and focus == cid then
        selfSay('Diga o nome de outro Pokémon que deseja vender.')
        conv = 1
        return true
    end
    
    if (conv == 1 or conv == 4) and focus == cid then
        local name = doCorrectPokemonName(msg)
        if not prices or not next(prices) then
            selfSay("Desculpe, meu sistema de preços não está funcionando no momento. Tente novamente mais tarde!")
            return true
        end
        local basePrice = prices[name]
        if not basePrice then
            selfSay("Desculpe, não sei de que Pokémon você está falando! Tem certeza de que escreveu corretamente?")
            return true
        end
        if basePrice == 1 then
            selfSay("Desculpe, eu não compro Pokémon lendários como "..name.."!")
            return true
        end
        
        -- Busca a pokebola no slot de pernas ou mochila para obter o nível
        local level = 1
        local attributeLevel = nil
        local found = false
        local pokeballUid = nil
        local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
        if pokeball.uid ~= 0 and getItemAttribute(pokeball.uid, "poke") and string.lower(getItemAttribute(pokeball.uid, "poke")) == string.lower(name) then
            attributeLevel = getItemAttribute(pokeball.uid, "level") or getItemAttribute(pokeball.uid, "lvl")
            level = attributeLevel or 1
            pokeballUid = pokeball.uid
            found = true
        else
            local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
            for _, ballType in pairs(pokeballs) do
                local balls = getItemsInContainerById(bp.uid, ballType.on)
                for _, ball in pairs(balls) do
                    if getItemAttribute(ball, "poke") and string.lower(getItemAttribute(ball, "poke")) == string.lower(name) then
                        attributeLevel = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl")
                        level = attributeLevel or 1
                        pokeballUid = ball
                        found = true
                        break
                    end
                end
                if found then break end
            end
        end
        
        if not found then
            selfSay("Você não tem um "..name.." na mochila ou no slot de pernas, ou ele está desmaiado!")
            return true
        end
        
        if level < 10 then
            selfSay("Desculpe, eu só compro Pokémon a partir do nível 10!")
            return true
        end
        
        -- Verifica se o Pokémon é único ou bloqueado
        if pokeballUid then
            if getItemAttribute(pokeballUid, "unico") then
                selfSay("Desculpe, eu não compro Pokémon únicos como "..name.."!")
                return true
            end
            local lock = getItemAttribute(pokeballUid, "lock")
            if lock and lock > os.time() then
                selfSay("Desculpe, este "..name.." está bloqueado até "..os.date("%d/%m/%y %X", lock).."!")
                return true
            end
        end
        
        -- Calcula o preço final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (level - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        
        -- Debug: Imprime atributos da pokebola e informações antes da confirmação
        local attributes = getItemAttributes(pokeballUid) or {}
        print(string.format("[NPC Sam colecionador] Pokéball attributes for %s: %s", name, table.concat(attributes, ", ")))
        print(string.format("[NPC Sam colecionador] Confirmation of %s: basePrice=%d, level=%d, isVip=%s, bonus=%.3f, levelBonus=%.3f, finalPrice=%d",
            name, basePrice, level, tostring(isVip), bonus, levelBonus, finalPrice))
        
        cost = finalPrice
        pname = name
        plevel = level
        selfSay("Você realmente quer vender o "..name.." nível "..level.." por "..cost.." dollars?")
        conv = 3
        return true
    end
    
    if isConfirmMsg(msg) and focus == cid and conv == 3 then
        if sellPokemon(cid, pname, plevel, cost) then
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
        
        if (os.clock() - talk_start) > 70 then
            focus = 0
            selfSay("Tenho outros clientes também, fale comigo quando tiver vontade de vender um Pokémon.")
        end
        
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