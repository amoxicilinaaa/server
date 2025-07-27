local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local plevel = 1
local STORAGE_VIP = 1000 -- Storage para verificar status VIP
local LEVEL_BONUS_FREE = 0.015 -- B�nus de 1,5% por n�vel para contas Free
local LEVEL_BONUS_VIP = 0.02 -- B�nus de 2% por n�vel para contas VIP
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"} -- Pok�mon comuns que n�o podem ser vendidos

function sellPokemon(cid, name, level, expectedPrice)
    -- Verifica se h� Pok�mon ativo
    if #getCreatureSummons(cid) >= 1 then
        selfSay("Chame seu Pok�mon de volta para vend�-lo!")
        focus = 0
        return true
    end
    
    -- Verifica se est� em fly, ride ou surf
    local storages = {17000, 63215, 17001, 13008}
    for _, storage in ipairs(storages) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            selfSay("Voc� n�o pode vender um Pok�mon enquanto est� em fly, ride ou surf!")
            focus = 0
            return true
        end
    end
    
    -- Obt�m o pre�o base da tabela global 'prices'
    local basePrice = prices and prices[name]
    if not basePrice then
        selfSay("Desculpe, eu n�o compro "..name.."!")
        return false
    end
    if basePrice == 1 then
        selfSay("Desculpe, eu n�o compro Pok�mon lend�rios como "..name.."!")
        return false
    end
    
    -- Fun��o auxiliar para processar a venda de uma pokebola
    local function processSale(ball, name, expectedLevel, expectedPrice)
        local pokename = getItemAttribute(ball, "poke")
        if not pokename or string.lower(pokename) ~= string.lower(name) then
            return false
        end
        -- Verifica se o Pok�mon � �nico
        if getItemAttribute(ball, "unico") then
            selfSay("Desculpe, eu n�o compro Pok�mon �nicos como "..name.."!")
            return false
        end
        -- Verifica se o Pok�mon est� bloqueado
        local lock = getItemAttribute(ball, "lock")
        if lock and lock > os.time() then
            selfSay("Desculpe, este "..name.." est� bloqueado at� "..os.date("%d/%m/%y %X", lock).."!")
            return false
        end
        -- Verifica o n�vel do Pok�mon
        local pokeLevel = getItemAttribute(ball, "level") or 1
        if pokeLevel < 10 then
            selfSay("Desculpe, eu s� compro Pok�mon a partir do n�vel 10!")
            return false
        end
        if pokeLevel ~= expectedLevel then
            selfSay("Erro: O n�vel do "..name.." n�o corresponde ao informado! Tente novamente.")
            print(string.format("[NPC Sam colecionador] Erro: N�vel esperado=%d, n�vel encontrado=%d para %s", expectedLevel, pokeLevel, name))
            return false
        end
        -- Calcula o pre�o final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (pokeLevel - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        if finalPrice ~= expectedPrice then
            selfSay("Erro no c�lculo do pre�o para "..name.."! Por favor, tente novamente.")
            print(string.format("[NPC Sam colecionador] Erro: Pre�o esperado=%d, pre�o calculado=%d para %s", expectedPrice, finalPrice, name))
            return false
        end
        -- Debug: Imprime atributos da pokebola e informa��es sobre o c�lculo
        local attributes = getItemAttributes(ball) or {}
        print(string.format("[NPC Sam colecionador] Atributos da pokebola de %s: %s", name, table.concat(attributes, ", ")))
        print(string.format("[NPC Sam colecionador] Venda de %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, pokeLevel, tostring(isVip), bonus, levelBonus, finalPrice))
        selfSay("Uau! Obrigado por este maravilhoso "..name.."! Pegue seus "..finalPrice.." dollars. Voc� gostaria de vender outro Pok�mon?")
        doRemoveItem(ball, 1)
        doPlayerAddMoney(cid, finalPrice)
        doPlayerSave(cid)
        return true
    end
    
    -- Verifica o Pok�mon no slot de pernas
    local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
    if pokeball.uid ~= 0 then
        if processSale(pokeball.uid, name, level, expectedPrice) then
            doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
            return true
        end
    end
    
    -- Verifica o Pok�mon na mochila
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    for _, ballType in pairs(pokeballs) do
        local balls = getItemsInContainerById(bp.uid, ballType.on)
        for _, ball in pairs(balls) do
            if processSale(ball, name, level, expectedPrice) then
                return true
            end
        end
    end
    
    selfSay("Voc� n�o tem um "..name.." n�vel "..level.." na mochila ou no slot de pernas, ou ele est� desmaiado!")
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
        selfSay('Bem-vindo � minha loja! Eu compro Pok�mon de todas as esp�cies a partir do n�vel 10, exceto Pok�mon �nicos, bloqueados ou lend�rios. Diga o nome do Pok�mon que deseja vender.')
        focus = cid
        conv = 1
        talk_start = os.clock()
        cost = 0
        pname = ""
        plevel = 1
        return true
    end
    
    if msgcontains(msg, 'bye') and focus == cid then
        selfSay('Vejo voc� por a�!')
        focus = 0
        return true
    end
    
    if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
        selfSay('Diga o nome do Pok�mon que deseja vender.')
        conv = 1
        return true
    end
    
    if msgcontains(msg, 'no') and conv == 4 and focus == cid then
        selfSay('Ok, vejo voc� por a�!')
        focus = 0
        return true
    end
    
    if conv == 1 and focus == cid then
        for _, commonPoke in ipairs(commonPokemons) do
            if msgcontains(msg, commonPoke) then
                selfSay('Eu n�o compro um Pok�mon t�o comum!')
                return true
            end
        end
    end
    
    if msgcontains(msg, 'no') and conv == 3 and focus == cid then
        selfSay('Diga o nome de outro Pok�mon que deseja vender.')
        conv = 1
        return true
    end
    
    if (conv == 1 or conv == 4) and focus == cid then
        local name = doCorrectPokemonName(msg)
        if not prices or not next(prices) then
            selfSay("Desculpe, meu sistema de pre�os n�o est� funcionando no momento. Tente novamente mais tarde!")
            return true
        end
        local basePrice = prices[name]
        if not basePrice then
            selfSay("Desculpe, n�o sei de que Pok�mon voc� est� falando! Tem certeza de que escreveu corretamente?")
            return true
        end
        if basePrice == 1 then
            selfSay("Desculpe, eu n�o compro Pok�mon lend�rios como "..name.."!")
            return true
        end
        
        -- Busca a pokebola no slot de pernas ou mochila para obter o n�vel
        local level = 1
        local found = false
        local pokeballUid = nil
        local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
        if pokeball.uid ~= 0 and getItemAttribute(pokeball.uid, "poke") and string.lower(getItemAttribute(pokeball.uid, "poke")) == string.lower(name) then
            level = getItemAttribute(pokeball.uid, "level") or 1
            pokeballUid = pokeball.uid
            found = true
        else
            local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
            for _, ballType in pairs(pokeballs) do
                local balls = getItemsInContainerById(bp.uid, ballType.on)
                for _, ball in pairs(balls) do
                    if getItemAttribute(ball, "poke") and string.lower(getItemAttribute(ball, "poke")) == string.lower(name) then
                        level = getItemAttribute(ball, "level") or 1
                        pokeballUid = ball
                        found = true
                        break
                    end
                end
                if found then break end
            end
        end
        
        if not found then
            selfSay("Voc� n�o tem um "..name.." na mochila ou no slot de pernas, ou ele est� desmaiado!")
            return true
        end
        
        if level < 10 then
            selfSay("Desculpe, eu s� compro Pok�mon a partir do n�vel 10!")
            return true
        end
        
        -- Verifica se o Pok�mon � �nico ou bloqueado
        if pokeballUid then
            if getItemAttribute(pokeballUid, "unico") then
                selfSay("Desculpe, eu n�o compro Pok�mon �nicos como "..name.."!")
                return true
            end
            local lock = getItemAttribute(pokeballUid, "lock")
            if lock and lock > os.time() then
                selfSay("Desculpe, este "..name.." est� bloqueado at� "..os.date("%d/%m/%y %X", lock).."!")
                return true
            end
        end
        
        -- Calcula o pre�o final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (level - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        
        -- Debug: Imprime atributos da pokebola e informa��es antes da confirma��o
        local attributes = getItemAttributes(pokeballUid) or {}
        print(string.format("[NPC Sam colecionador] Atributos da pokebola de %s: %s", name, table.concat(attributes, ", ")))
        print(string.format("[NPC Sam colecionador] Confirma��o de %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, level, tostring(isVip), bonus, levelBonus, finalPrice))
        
        cost = finalPrice
        pname = name
        plevel = level
        selfSay("Voc� realmente quer vender o "..name.." n�vel "..level.." por "..cost.." dollars?")
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
    "Comprando alguns Pok�mon! Venha aqui para vend�-los!",
    "Quer vender um Pok�mon? Venha ao lugar certo!",
    "Compro Pok�mon! Com excelentes ofertas!!",
    "Cansado de um Pok�mon? Por que voc� n�o me vende ent�o?"
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
            selfSay("Tenho outros clientes tamb�m, fale comigo quando tiver vontade de vender um Pok�mon.")
        end
        
        if getDistanceToCreature(focus) > 3 then
            selfSay("At� logo e obrigado!")
            focus = 0
            return true
        end
        
        local dir = doDirectPos(npcpos, focpos)
        selfTurn(dir)
    end
    return true
end