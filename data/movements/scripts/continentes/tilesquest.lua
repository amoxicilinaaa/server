function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end

    local rewardTiles = {
        [8889] = {
            exp = 5000,
            prem = 3,
            item = {id = 23418, count = 1},
            outfit = {female = 1055, male = 1054},
            achievement = "Explorador das Ruínas",
            requirestorage = {key = 0, value = 0},
            storage = {key = 0, value = 1, time = 0},
            setstorage = {key = 181648, value = 1, time = 0},
            topposs = {poss = {x = 1551, y = 1066, z = 7}},
            message = "Você descobriu as Ruínas Antigas!",
            pokemons = {
                {name = "Rattata", level = 100, gender = "Male", ball = "ultra"},
                {name = "Pidgey", level = 80, gender = "Female", ball = "great"}
            },
            summon = "shiny charizard 1, Charizard 2, Golem 3, onix 4, lapas 2,dragonite 1", --Charizard 2, Golem 3
            summonRadius = 4,
            globalmessage = "[ALERTA]\nO jogador {name} encontrou a entrada secreta da Hunt: Ruínas Antigas!"
        },
        [8890] = {
            exp = 5000,
            prem = 3,
            item = {id = 23418, count = 1},
            outfit = {female = 1055, male = 1054},
            achievement = "Explorador das Ruínas",
            requirestorage = {key = 88999, value = 1},
            storage = {key = 89999, value = 1, time = 60},
            setstorage = {key = 0, value = 0, time = 0},
            topposs = {poss = {x = 1551, y = 1064, z = 7}},
            message = "Você descobriu as Ruínas Antigas!",
            pokemons = {
                {name = "Rattata", level = 5, gender = "Male", ball = "ultra"},
                {name = "Pidgey", level = 3, gender = "Female", ball = "great"}
            },
            summon = "",
            summonRadius = 10,
            globalmessage = "[ALERTA]\nO jogador {name} encontrou a entrada secreta da Hunt: Ruínas Antigas!"
        }
    }

    local config = rewardTiles[item.actionid]
    if not config then return true end

    if config.requirestorage and config.requirestorage.key > 0 then
        local required = getPlayerStorageValue(cid, config.requirestorage.key)
        if required < config.requirestorage.value then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
                "Você ainda não tem acesso a essa recompensa. Complete a tarefa anterior primeiro.")
            return true
        end
    end

    if config.storage and config.storage.key > 0 then
        local current = getPlayerStorageValue(cid, config.storage.key)
        if config.storage.time and config.storage.time > 0 then
            if current ~= -1 and os.time() < current then
                local remaining = current - os.time()
                local days = math.floor(remaining / 86400)
                local hours = math.floor((remaining % 86400) / 3600)
                local minutes = math.floor((remaining % 3600) / 60)
                local seconds = remaining % 60

                local msg = "Você já recebeu essa recompensa. Tempo restante: "
                local parts = {}

                if days > 0 then table.insert(parts, days.." dia"..(days > 1 and "s" or "")) end
                if hours > 0 then table.insert(parts, hours.." hora"..(hours > 1 and "s" or "")) end
                if minutes > 0 then table.insert(parts, minutes.." minuto"..(minutes > 1 and "s" or "")) end
                if seconds > 0 or #parts == 0 then table.insert(parts, seconds.." segundo"..(seconds > 1 and "s" or "")) end

                msg = msg .. table.concat(parts, ", ")
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg..".")
                return true
            end
        elseif current >= config.storage.value then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
                "Você já passou por aqui e recebeu essa recompensa anteriormente.")
            return true
        end
    end

    if config.topposs and config.topposs.poss then
        doTeleportThing(cid, config.topposs.poss, true)
        doSendMagicEffect(config.topposs.poss, CONST_ME_TELEPORT)
    end

    local finalPos = getCreaturePosition(cid)

    if config.exp then
        doPlayerAddExp(cid, config.exp)
        doSendAnimatedText(finalPos, "+EXP "..config.exp, TEXTCOLOR_GREEN)
        doSendMagicEffect(finalPos, CONST_ME_MAGIC_GREEN)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você ganhou "..config.exp.." pontos de experiência!")
    end

    if config.item then
        local reward = doCreateItemEx(config.item.id, config.item.count)
        doPlayerAddItemEx(cid, reward)
        doSendMagicEffect(finalPos, CONST_ME_MAGIC_BLUE)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você recebeu "..config.item.count.."x "..getItemNameById(config.item.id)..".")
    end

    if config.outfit then
        local sex = getPlayerSex(cid)
        local outfitId = sex == 0 and config.outfit.female or config.outfit.male
        doPlayerAddOutfit(cid, outfitId, 3)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Você desbloqueou um novo outfit!")
    end

    if config.achievement and doPlayerAddAchievement then
        doPlayerAddAchievement(cid, config.achievement)
    end

    if config.storage and config.storage.key > 0 then
        if config.storage.time and config.storage.time > 0 then
            setPlayerStorageValue(cid, config.storage.key, os.time() + config.storage.time)
        else
            setPlayerStorageValue(cid, config.storage.key, config.storage.value)
        end
    end

    if config.setstorage and config.setstorage.key > 0 then
        if config.setstorage.time and config.setstorage.time > 0 then
            setPlayerStorageValue(cid, config.setstorage.key, os.time() + config.setstorage.time)
        else
            setPlayerStorageValue(cid, config.setstorage.key, config.setstorage.value)
        end
    end

    if config.message then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.message)
    end

    if config.pokemons then
        for _, poke in ipairs(config.pokemons) do
            local pokeName = doCorrectString(poke.name)
            local pokeLevel = poke.level or 1
            local pokeGender = poke.gender or nil
            local pokeBallType = poke.ball or "normal"

            if pokes[pokeName] then
                addPokeToPlayer(cid, pokeName, pokeLevel, pokeGender, pokeBallType)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu o Pokémon: "..pokeName)
            else
                doPlayerSendCancel(cid, "O Pokémon '"..pokeName.."' não existe.")
            end
        end
    end

    if config.summon and config.summon ~= "" then
        local basePos = getCreaturePosition(cid)
        local radius = config.summonRadius or 0
        local summary = {}

        for name, count in config.summon:gmatch("(%a+)%s*(%d+)") do
            local total = tonumber(count)
            for i = 1, total do
                local offsetX = math.random(-radius, radius)
                local offsetY = math.random(-radius, radius)
                local newPos = {x = basePos.x + offsetX, y = basePos.y + offsetY, z = basePos.z}
                local ret = doCreateMonster(name, newPos, false)
                local effect = tonumber(ret) == nil and CONST_ME_POFF or CONST_ME_MAGIC_RED
                doSendMagicEffect(newPos, effect)
            end
            table.insert(summary, total.." "..name)
        end

        local msg = "Pareceu "..table.concat(summary, ", ").."."
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg)
    end

    if config.globalmessage then
        local playerName = getCreatureName(cid)
        local message = config.globalmessage:gsub("{name}", playerName)
        broadcastMessage(message, MESSAGE_EVENT_ADVANCE)
    end

    return true
end
