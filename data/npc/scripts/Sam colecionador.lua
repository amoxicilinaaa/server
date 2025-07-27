local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local plevel = 1
local STORAGE_VIP = 1000 -- Storage para verificar status VIP
local LEVEL_BONUS_FREE = 0.015 -- Bônus de 1,5% por nível para contas Free
local LEVEL_BONUS_VIP = 0.02 -- Bônus de 2% por nível para contas VIP
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"} -- Pokémon comuns que não podem ser vendidos

function sellPokemon(cid, name, level, expectedPrice)
    -- Verifica se há Pokémon ativo
    if #getCreatureSummons(cid) >= 1 then
        selfSay("Call your Pokémon back to sell it!")
        focus = 0
        return true
    end
    
    -- Verifica se está em fly, ride ou surf
    local storages = {17000, 63215, 17001, 13008}
    for _, storage in ipairs(storages) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            selfSay("You can't sell a Pokémon while in fly, ride, or surf!")
            focus = 0
            return true
        end
    end
    
    -- Obtém o preço base da tabela global 'prices'
    local basePrice = prices and prices[name]
    if not basePrice then
        selfSay("Sorry, I don't buy "..name.."!")
        return false
    end
    if basePrice == 1 then
        selfSay("Sorry, I don't buy legendary Pokémon like "..name.."!")
        return false
    end
    
    -- Função auxiliar para processar a venda de uma pokebola
    local function processSale(ball, name, expectedLevel, expectedPrice)
        local pokename = getItemAttribute(ball, "poke")
        if not pokename or string.lower(pokename) ~= string.lower(name) then
            return false
        end
        
        -- Verifica se o Pokémon é único
        if getItemAttribute(ball, "unico") then
            selfSay("Sorry, I don't buy unique Pokémon like "..name.."!")
            return false
        end
        
        -- Verifica se o Pokémon está bloqueado
        local lock = getItemAttribute(ball, "lock")
        if lock and lock > os.time() then
            selfSay("Sorry, this "..name.." is locked until "..os.date("%d/%m/%y %X", lock).."!")
            return false
        end
        
        -- Verifica o nível do Pokémon
        local pokeLevel = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl") or 1
        if pokeLevel < 10 then
            selfSay("Sorry, I only buy Pokémon from level 10 onwards!")
            return false
        end
        if pokeLevel ~= expectedLevel then
            selfSay("Error: The "..name.." level doesn't match! Try again.")
            print(string.format("[NPC Sam colecionador] Error: Expected level=%d, found level=%d for %s", expectedLevel, pokeLevel, name))
            return false
        end
        
        -- Calcula o preço final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (pokeLevel - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        
        if finalPrice ~= expectedPrice then
            selfSay("Error in price calculation for "..name.."! Please try again.")
            print(string.format("[NPC Sam colecionador] Error: Expected price=%d, calculated price=%d for %s", expectedPrice, finalPrice, name))
            return false
        end
        
        -- Debug: Imprime atributos da pokebola e informações sobre o cálculo
        local attributes = {}
        for k, v in pairs(getItemAttributes(ball) or {}) do
            table.insert(attributes, k.."="..tostring(v))
        end
        print(string.format("[NPC Sam colecionador] Pokéball attributes for %s: %s", name, table.concat(attributes, ", ")))
        print(string.format("[NPC Sam colecionador] Sale of %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, pokeLevel, tostring(isVip), bonus, levelBonus, finalPrice))
        
        selfSay("Wow! Thanks for this wonderful "..name.."! Take your "..finalPrice.." dollars. Would you like to sell another Pokémon?")
        doRemoveItem(ball, 1)
        doPlayerAddMoney(cid, finalPrice)
        doPlayerSave(cid)
        return true
    end
    
    -- Verifica o Pokémon no slot de pernas
    local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
    if pokeball.uid ~= 0 then
        if processSale(pokeball.uid, name, level, expectedPrice) then
            doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
            return true
        end
    end
    
    -- Verifica o Pokémon na mochila
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    for _, ballType in pairs(pokeballs) do
        local balls = getItemsInContainerById(bp.uid, ballType.on)
        for _, ball in pairs(balls) do
            if processSale(ball, name, level, expectedPrice) then
                return true
            end
        end
    end
    
    selfSay("You don't have a "..name.." level "..level.." in your backpack or legs slot, or it's fainted!")
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
        selfSay('Welcome to my shop! I buy Pokémon of all species from level 10 onwards, except unique, locked, or legendary ones. Tell me the name of the Pokémon you want to sell.')
        focus = cid
        conv = 1
        talk_start = os.clock()
        cost = 0
        pname = ""
        plevel = 1
        return true
    end
    
    if msgcontains(msg, 'bye') and focus == cid then
        selfSay('See you around!')
        focus = 0
        return true
    end
    
    if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
        selfSay('Tell me the name of the Pokémon you want to sell.')
        conv = 1
        return true
    end
    
    if msgcontains(msg, 'no') and conv == 4 and focus == cid then
        selfSay('Okay, see you around!')
        focus = 0
        return true
    end
    
    if conv == 1 and focus == cid then
        for _, commonPoke in ipairs(commonPokemons) do
            if msgcontains(msg, commonPoke) then
                selfSay("I don't buy such a common Pokémon!")
                return true
            end
        end
    end
    
    if msgcontains(msg, 'no') and conv == 3 and focus == cid then
        selfSay('Tell me the name of another Pokémon you want to sell.')
        conv = 1
        return true
    end
    
    if (conv == 1 or conv == 4) and focus == cid then
        local name = doCorrectPokemonName(msg)
        
        -- Verifica se a tabela de preços existe
        if not prices or not next(prices) then
            selfSay("Sorry, my pricing system isn't working right now. Try again later!")
            return true
        end
        
        local basePrice = prices[name]
        if not basePrice then
            selfSay("Sorry, I don't know what Pokémon you're talking about! Are you sure you wrote it correctly?")
            return true
        end
        if basePrice == 1 then
            selfSay("Sorry, I don't buy legendary Pokémon like "..name.."!")
            return true
        end
        
        -- Busca a pokebola no slot de pernas ou mochila para obter o nível
        local level = 1
        local found = false
        local pokeballUid = nil
        local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
        if pokeball.uid ~= 0 and getItemAttribute(pokeball.uid, "poke") and string.lower(getItemAttribute(pokeball.uid, "poke")) == string.lower(name) then
            level = getItemAttribute(pokeball.uid, "level") or getItemAttribute(pokeball.uid, "lvl") or 1
            pokeballUid = pokeball.uid
            found = true
        else
            local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
            for _, ballType in pairs(pokeballs) do
                local balls = getItemsInContainerById(bp.uid, ballType.on)
                for _, ball in pairs(balls) do
                    if getItemAttribute(ball, "poke") and string.lower(getItemAttribute(ball, "poke")) == string.lower(name) then
                        level = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl") or 1
                        pokeballUid = ball
                        found = true
                        break
                    end
                end
                if found then break end
            end
        end
        
        if not found then
            selfSay("You don't have a "..name.." in your backpack or legs slot, or it's fainted!")
            return true
        end
        
        if level < 10 then
            selfSay("Sorry, I only buy Pokémon from level 10 onwards!")
            return true
        end
        
        -- Verifica se o Pokémon é único ou bloqueado
        if pokeballUid then
            if getItemAttribute(pokeballUid, "unico") then
                selfSay("Sorry, I don't buy unique Pokémon like "..name.."!")
                return true
            end
            local lock = getItemAttribute(pokeballUid, "lock")
            if lock and lock > os.time() then
                selfSay("Sorry, this "..name.." is locked until "..os.date("%d/%m/%y %X", lock).."!")
                return true
            end
        end
        
        -- Calcula o preço final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (level - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        
        -- Debug: Imprime atributos da pokebola e informações antes da confirmação
        local attributes = {}
        for k, v in pairs(getItemAttributes(pokeballUid) or {}) do
            table.insert(attributes, k.."="..tostring(v))
        end
        print(string.format("[NPC Sam colecionador] Pokéball attributes for %s: %s", name, table.concat(attributes, ", ")))
        print(string.format("[NPC Sam colecionador] Confirmation of %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, level, tostring(isVip), bonus, levelBonus, finalPrice))
        
        cost = finalPrice
        pname = name
        plevel = level
        selfSay("Do you really want to sell the "..name.." level "..level.." for "..cost.." dollars?")
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
    "Buying some Pokémon! Come here to sell them!",
    "Want to sell a Pokémon? Come to the right place!",
    "I buy Pokémon! With excellent offers!!",
    "Tired of a Pokémon? Why don't you sell it to me then?"
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
            selfSay("I have other customers too, talk to me when you want to sell a Pokémon.")
        end
        
        if getDistanceToCreature(focus) > 3 then
            selfSay("See you later and thank you!")
            focus = 0
            return true
        end
        
        local dir = doDirectPos(npcpos, focpos)
        selfTurn(dir)
    end
    return true
end