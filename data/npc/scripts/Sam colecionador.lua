local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local plevel = 1
<<<<<<< HEAD
local STORAGE_VIP = 1000
local LEVEL_BONUS_FREE = 0.015
local LEVEL_BONUS_VIP = 0.02
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"}

function sellPokemon(cid, name)
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    
=======
local STORAGE_VIP = 1000 -- Storage para verificar status VIP
local LEVEL_BONUS_FREE = 0.015 -- B√¥nus de 1,5% por n√≠vel para contas Free
local LEVEL_BONUS_VIP = 0.02 -- B√¥nus de 2% por n√≠vel para contas VIP
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"} -- Pok√©mon comuns que n√£o podem ser vendidos

function sellPokemon(cid, name, level, expectedPrice)
    -- Verifica se h√° Pok√©mon ativo
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
    if #getCreatureSummons(cid) >= 1 then
        selfSay("Call your Pok√©mon back to sell it!")
        focus = 0
        return true
    end
    
<<<<<<< HEAD
=======
    -- Verifica se est√° em fly, ride ou surf
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
    local storages = {17000, 63215, 17001, 13008}
    for _, storage in ipairs(storages) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            selfSay("You can't sell a Pok√©mon while in fly, ride, or surf!")
            focus = 0
            return true
        end
    end
    
<<<<<<< HEAD
=======
    -- Obt√©m o pre√ßo base da tabela global 'prices'
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
    local basePrice = prices and prices[name]
    if not basePrice then
        selfSay("Sorry, I don't buy "..name.."!")
        return false
    end
    if basePrice == 1 then
        selfSay("Sorry, I don't buy legendary Pok√©mon like "..name.."!")
        return false
    end
    
<<<<<<< HEAD
    local function processSale(ball, name)
=======
    -- Fun√ß√£o auxiliar para processar a venda de uma pokebola
    local function processSale(ball, name, expectedLevel, expectedPrice)
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        local pokename = getItemAttribute(ball, "poke")
        if not pokename or string.lower(pokename) ~= string.lower(name) then
            return false
        end
<<<<<<< HEAD
=======
        
        -- Verifica se o Pok√©mon √© √∫nico
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        if getItemAttribute(ball, "unico") then
            selfSay("Sorry, I don't buy unique Pok√©mon like "..name.."!")
            return false
        end
<<<<<<< HEAD
=======
        
        -- Verifica se o Pok√©mon est√° bloqueado
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        local lock = getItemAttribute(ball, "lock")
        if lock and lock > os.time() then
            selfSay("Sorry, this "..name.." is locked until "..os.date("%d/%m/%y %X", lock).."!")
            return false
        end
<<<<<<< HEAD
        local level = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl") or 1
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local finalPrice = math.floor(basePrice * (1 + (level - 1) * (isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE)))
        selfSay("Uau! Obrigado por este maravilhoso "..name.." nÌvel "..level.."! Pegue seus "..finalPrice.." dÛlares. VocÍ gostaria de vender outro PokÈmon, diga-me o nome!")
=======
        
        -- Verifica o n√≠vel do Pok√©mon
        local pokeLevel = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl") or 1
        if pokeLevel < 10 then
            selfSay("Sorry, I only buy Pok√©mon from level 10 onwards!")
            return false
        end
        if pokeLevel ~= expectedLevel then
            selfSay("Error: The "..name.." level doesn't match! Try again.")
            print(string.format("[NPC Sam colecionador] Error: Expected level=%d, found level=%d for %s", expectedLevel, pokeLevel, name))
            return false
        end
        
        -- Calcula o pre√ßo final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (pokeLevel - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        
        if finalPrice ~= expectedPrice then
            selfSay("Error in price calculation for "..name.."! Please try again.")
            print(string.format("[NPC Sam colecionador] Error: Expected price=%d, calculated price=%d for %s", expectedPrice, finalPrice, name))
            return false
        end
        
        -- Debug: Imprime informa√ß√µes sobre o c√°lculo
        print(string.format("[NPC Sam colecionador] Sale of %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, pokeLevel, tostring(isVip), bonus, levelBonus, finalPrice))
        
        selfSay("Wow! Thanks for this wonderful "..name.."! Take your "..finalPrice.." dollars. Would you like to sell another Pok√©mon?")
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        doRemoveItem(ball, 1)
        doPlayerAddMoney(cid, finalPrice)
        doPlayerSave(cid)
        return true
    end
    
<<<<<<< HEAD
=======
    -- Verifica o Pok√©mon no slot de pernas
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
    local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
    if pokeball.uid ~= 0 and processSale(pokeball.uid, name) then
        doTransformItem(pokeball.uid, 2395)
        return true
    end
    
<<<<<<< HEAD
=======
    -- Verifica o Pok√©mon na mochila
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
    for _, ballType in pairs(pokeballs) do
        local balls = getItemsInContainerById(bp.uid, ballType.on)
        for _, ball in pairs(balls) do
            if processSale(ball, name) then
                return true
            end
        end
    end
    
<<<<<<< HEAD
    selfSay("VocÍ n„o tem um "..name.." na mochila ou no slot de pernas, ou ele est· desmaiado!")
=======
    selfSay("You don't have a "..name.." level "..level.." in your backpack or legs slot, or it's fainted!")
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
    return false
end

function onCreatureSay(cid, type, msg)
    msg = string.lower(msg)
    
    if string.find(msg, "[!,]") then
        return true
    end
    
    if focus == cid then
        talk_start = os.clock()
    end
    
    if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 3 then
<<<<<<< HEAD
        selfSay('Bem-vindo ‡ minha loja!\nEu compro PokÈmon de todas as espÈcies a partir do nÌvel 1, exceto PokÈmon ˙nicos, bloqueados ou lend·rios.\nDiga o nome de um PokÈmon que deseja vender.')
=======
        selfSay('Welcome to my shop! I buy Pok√©mon of all species from level 10 onwards, except unique, locked, or legendary ones. Tell me the name of the Pok√©mon you want to sell.')
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
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
<<<<<<< HEAD
        selfSay('Diga o nome de um PokÈmon que deseja vender.')
=======
        selfSay('Tell me the name of the Pok√©mon you want to sell.')
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
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
                selfSay("I don't buy such a common Pok√©mon!")
                return true
            end
        end
    end
    
    if msgcontains(msg, 'no') and conv == 3 and focus == cid then
        selfSay('Tell me the name of another Pok√©mon you want to sell.')
        conv = 1
        return true
    end
    
    if (conv == 1 or conv == 4) and focus == cid then
        local name = doCorrectPokemonName(msg)
        
        -- Verifica se a tabela de pre√ßos existe
        if not prices or not next(prices) then
            selfSay("Sorry, my pricing system isn't working right now. Try again later!")
            return true
        end
        
<<<<<<< HEAD
=======
        local basePrice = prices[name]
        if not basePrice then
            selfSay("Sorry, I don't know what Pok√©mon you're talking about! Are you sure you wrote it correctly?")
            return true
        end
        if basePrice == 1 then
            selfSay("Sorry, I don't buy legendary Pok√©mon like "..name.."!")
            return true
        end
        
        -- Busca a pokebola no slot de pernas ou mochila para obter o n√≠vel
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        local level = 1
        local found = false
        local pokeballUid
        local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
        local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
        if pokeball.uid ~= 0 and getItemAttribute(pokeball.uid, "poke") and string.lower(getItemAttribute(pokeball.uid, "poke")) == string.lower(name) then
            level = getItemAttribute(pokeball.uid, "level") or getItemAttribute(pokeball.uid, "lvl") or 1
            pokeballUid = pokeball.uid
            found = true
        else
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
<<<<<<< HEAD
            selfSay("VocÍ n„o tem um "..name.." na mochila, ou ele est· em sua m„o, ou desmaiado!")
            return true
        end
        
=======
            selfSay("You don't have a "..name.." in your backpack or legs slot, or it's fainted!")
            return true
        end
        
        if level < 10 then
            selfSay("Sorry, I only buy Pok√©mon from level 10 onwards!")
            return true
        end
        
        -- Verifica se o Pok√©mon √© √∫nico ou bloqueado
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        if pokeballUid then
            if getItemAttribute(pokeballUid, "unico") then
                selfSay("Sorry, I don't buy unique Pok√©mon like "..name.."!")
                return true
            end
            local lock = getItemAttribute(pokeballUid, "lock")
            if lock and lock > os.time() then
                selfSay("Sorry, this "..name.." is locked until "..os.date("%d/%m/%y %X", lock).."!")
                return true
            end
        end
        
<<<<<<< HEAD
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local finalPrice = math.floor(basePrice * (1 + (level - 1) * bonus))
        local finalPriceFree = math.floor(basePrice * (1 + (level - 1) * LEVEL_BONUS_FREE))
        local finalPriceVip = math.floor(basePrice * (1 + (level - 1) * LEVEL_BONUS_VIP))
=======
        -- Calcula o pre√ßo final
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local levelBonus = (level - 10) * bonus
        local finalPrice = math.floor(basePrice + (basePrice * levelBonus))
        
        -- Debug: Imprime informa√ß√µes antes da confirma√ß√£o
        print(string.format("[NPC Sam colecionador] Confirmation of %s: basePrice=%d, level=%d, isVip=%s, bonus=%f, levelBonus=%f, finalPrice=%d",
            name, basePrice, level, tostring(isVip), bonus, levelBonus, finalPrice))
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        
        cost = finalPrice
        pname = name
        plevel = level
<<<<<<< HEAD
        selfSay("Compro, "..name.." nÌvel "..level.." por "..(isVip and finalPriceVip or finalPriceFree)..", vocÍ aceita?")
=======
        selfSay("Do you really want to sell the "..name.." level "..level.." for "..cost.." dollars?")
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        conv = 3
        return true
    end
    
    if isConfirmMsg(msg) and focus == cid and conv == 3 then
        if sellPokemon(cid, pname) then
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
<<<<<<< HEAD
    "Comprando alguns PokÈmon! Venha aqui para vendÍ-los!",
    "Quer vender PokÈmons? Aqui e o lugar certo!",
    "Compro PokÈmons! Com excelentes preÁos!",
    "Cansado de um ou mais PokÈmon? Por que n„o me vende ent„o?"
=======
    "Buying some Pok√©mon! Come here to sell them!",
    "Want to sell a Pok√©mon? Come to the right place!",
    "I buy Pok√©mon! With excellent offers!!",
    "Tired of a Pok√©mon? Why don't you sell it to me then?"
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
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
<<<<<<< HEAD
            selfSay("Tenho outros clientes tambÈm, fale comigo quando tiver vontade de vender um PokÈmon.")
            focus = 0
            return true
=======
            focus = 0
            selfSay("I have other customers too, talk to me when you want to sell a Pok√©mon.")
>>>>>>> b9cf883cdbd765c5a3c3b396820eed73127a8719
        end
        
        if getDistanceToCreature(focus) > 3 then
            selfSay("See you later and thank you!")
            focus = 0
            return true
        end
        
        selfTurn(doDirectPos(npcpos, focpos))
    end
    return true
end