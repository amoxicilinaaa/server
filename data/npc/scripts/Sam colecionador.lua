local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local plevel = 1
local STORAGE_VIP = 1000
local LEVEL_BONUS_FREE = 0.015
local LEVEL_BONUS_VIP = 0.02
local commonPokemons = {"rattata", "caterpie", "weedle", "magikarp"}

function sellPokemon(cid, name)
    local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    
    if #getCreatureSummons(cid) >= 1 then
        selfSay("Chame seu Pokémon de volta para vendê-lo!")
        focus = 0
        return true
    end
    
    local storages = {17000, 63215, 17001, 13008}
    for _, storage in ipairs(storages) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            selfSay("Você não pode vender um Pokémon enquanto está em fly, ride ou surf!")
            focus = 0
            return true
        end
    end
    
    local basePrice = prices and prices[name]
    if not basePrice then
        selfSay("Desculpe, eu não compro "..name.."!")
        return false
    end
    if basePrice == 1 then
        selfSay("Desculpe, eu não compro Pokémon lendários como "..name.."!")
        return false
    end
    
    local function processSale(ball, name)
        local pokename = getItemAttribute(ball, "poke")
        if not pokename or string.lower(pokename) ~= string.lower(name) then
            return false
        end
        if getItemAttribute(ball, "unico") then
            selfSay("Desculpe, eu não compro Pokémon únicos como "..name.."!")
            return false
        end
        local lock = getItemAttribute(ball, "lock")
        if lock and lock > os.time() then
            selfSay("Desculpe, este "..name.." está bloqueado até "..os.date("%d/%m/%y %X", lock).."!")
            return false
        end
        local level = getItemAttribute(ball, "level") or getItemAttribute(ball, "lvl") or 1
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local finalPrice = math.floor(basePrice * (1 + (level - 1) * (isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE)))
        selfSay("Uau! Obrigado por este maravilhoso "..name.." nível "..level.."! Pegue seus "..finalPrice.." dólares. Você gostaria de vender outro Pokémon, diga-me o nome!")
        doRemoveItem(ball, 1)
        doPlayerAddMoney(cid, finalPrice)
        doPlayerSave(cid)
        return true
    end
    
    local pokeball = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
    if pokeball.uid ~= 0 and processSale(pokeball.uid, name) then
        doTransformItem(pokeball.uid, 2395)
        return true
    end
    
    for _, ballType in pairs(pokeballs) do
        local balls = getItemsInContainerById(bp.uid, ballType.on)
        for _, ball in pairs(balls) do
            if processSale(ball, name) then
                return true
            end
        end
    end
    
    selfSay("Você não tem um "..name.." na mochila ou no slot de pernas, ou ele está desmaiado!")
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
        selfSay('Bem-vindo à minha loja!\nEu compro Pokémon de todas as espécies a partir do nível 1, exceto Pokémon únicos, bloqueados ou lendários.\nDiga o nome de um Pokémon que deseja vender.')
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
        selfSay('Diga o nome de um Pokémon que deseja vender.')
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
            selfSay("Você não tem um "..name.." na mochila, ou ele está em sua mão, ou desmaiado!")
            return true
        end
        
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
        
        local isVip = getPlayerStorageValue(cid, STORAGE_VIP) == 1
        local bonus = isVip and LEVEL_BONUS_VIP or LEVEL_BONUS_FREE
        local finalPrice = math.floor(basePrice * (1 + (level - 1) * bonus))
        local finalPriceFree = math.floor(basePrice * (1 + (level - 1) * LEVEL_BONUS_FREE))
        local finalPriceVip = math.floor(basePrice * (1 + (level - 1) * LEVEL_BONUS_VIP))
        
        cost = finalPrice
        pname = name
        plevel = level
        selfSay("Compro, "..name.." nível "..level.." por "..(isVip and finalPriceVip or finalPriceFree)..", você aceita?")
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
    "Comprando alguns Pokémon! Venha aqui para vendê-los!",
    "Quer vender Pokémons? Aqui e o lugar certo!",
    "Compro Pokémons! Com excelentes preços!",
    "Cansado de um ou mais Pokémon? Por que não me vende então?"
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
            selfSay("Tenho outros clientes também, fale comigo quando tiver vontade de vender um Pokémon.")
            focus = 0
            return true
        end
        
        if getDistanceToCreature(focus) > 3 then
            selfSay("Até logo e obrigado!")
            focus = 0
            return true
        end
        
        selfTurn(doDirectPos(npcpos, focpos))
    end
    return true
end