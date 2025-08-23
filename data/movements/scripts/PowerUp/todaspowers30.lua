-- Constantes de Storage
local contagem_total = 14750
local bonuss_max = 32
local storageFinal = 14751
local premium_account_storage = 14752
local storageOrdemBonus = 14753

-- Tabela de Configuração da Recompensa Extra por Ordem
-- Você pode configurar esta tabela para definir a recompensa bônus.
local ordemBonusConfig = {
    exp = 1000000,
    item = {id = 23418, count = 1},
    outfit = {male = 128, female = 129},
    achievement = "PowerUp Master"
}

-- Itens de Recompensa
local items_facil = {2392, 2393, 2391, 2394, 12344, 12343, 12345, 12346, 12347}
local items_medio = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449, 11450}
local items_dificil = {23418, 12618, 23474, 23462}

-- Quantidade de Itens
local Facil = {
    [2392] = {count = 15}, [2393] = {count = 25}, [2391] = {count = 35}, [2394] = {count = 50},
    [12344] = {count = 25}, [12343] = {count = 25}, [12345] = {count = 30}, [12346] = {count = 35}, [12347] = {count = 50}
}
local Medio = {
    [11441] = {count = 2}, [11442] = {count = 2}, [11443] = {count = 2}, [11444] = {count = 2}, [11445] = {count = 2},
    [11446] = {count = 2}, [11447] = {count = 2}, [11448] = {count = 2}, [11449] = {count = 2}, [11450] = {count = 2}
}
local Dificil = {
    [23418] = {count = 3}, [12618] = {count = 1}, [23474] = {count = 1}, [23462] = {count = 1}
}

-- Nomes das Tiles
local tileNames = {
    [1803] = "Entrada da Caverna",
    [1804] = "Vale dos Pikachus",
    [1805] = "Ruínas Antigas",
    [1806] = "Lago Misterioso",
    [1807] = "Campo Elétrico",
    [1808] = "Floresta Sombria",
    [1809] = "Templo do Fogo",
    [1810] = "Caminho do Vento",
    [1811] = "Caverna Gelo",
    [1812] = "Arena Selvagem",
    [1813] = "Laboratório Abandonado",
    [1814] = "Pedra da Evolução",
    [1815] = "Caminho Subterrâneo",
    [1816] = "Montanha do Raio",
    [1817] = "Vale dos Fantasmas",
    [1818] = "Ruínas de Johto",
    [1819] = "Caminho do Dragão",
    [1820] = "Hunt Charizard",
    [1821] = "Caverna Cristalina",
    [1822] = "Templo Psíquico",
    [1823] = "Arena Aquática",
    [1824] = "Caminho do Despertar",
    [1825] = "Vale dos Eevees",
    [1826] = "Caminho do Mestre",
    [1827] = "Caverna do Tempo",
    [1828] = "Templo do Céu",
    [1829] = "Ruínas de Kanto",
    [1830] = "Arena Final",
    [1831] = "Caminho da Luz",
    [1832] = "Caminho da Escuridão",
    [1833] = "Portal Final"
}

-- Funções Auxiliares (Não usadas na lógica principal, mas mantidas por segurança)
function getAccountIdByPlayer(cid)
    local query = db.getResult("SELECT `account_id` FROM `players` WHERE `id` = ".. getPlayerGUID(cid) ..";")
    if query:getID() ~= -1 then
        local acc = query:getDataInt("account_id")
        query:free()
        return acc
    end
    return nil
end

function hasAccountPremium(accountId)
    local query = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = ".. accountId .." AND `key` = ".. premium_account_storage ..";")
    if query:getID() ~= -1 then
        local value = query:getDataInt("value")
        query:free()
        return value >= 1
    end
    return false
end

function setAccountPremium(accountId)
    db.executeQuery("INSERT INTO `account_storage` (`account_id`, `key`, `value`) VALUES (".. accountId ..", ".. premium_account_storage ..", 1) ON DUPLICATE KEY UPDATE `value` = 1;")
end

-- Função Principal do Evento
function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end

    local sto_pw = item.actionid
    local nomeTile = tileNames[sto_pw] or "PowerUp desconhecido"
    local playerName = getCreatureName(cid)

    -- Verifica se o jogador já coletou este PowerUp
    if getPlayerStorageValue(cid, sto_pw) >= 1 then
        local total = getPlayerStorageValue(cid, contagem_total)
        if total == -1 then total = 0 end
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, playerName.." você já coletou o PowerUp: "..nomeTile.."\nVocê está com "..total.."/"..bonuss_max.." PowerUps.")
        doSendMagicEffect(position, CONST_ME_POFF)
        return true
    end

    local total = getPlayerStorageValue(cid, contagem_total)
    if total == -1 then total = 0 end

    -- Lógica para verificar a ordem dos PowerUps
    local esperado = 1803 + total
    if sto_pw ~= esperado then
        setPlayerStorageValue(cid, storageOrdemBonus, -1) -- Define a storage para -1 se a ordem for quebrada
    end

    -- Sorteio de prêmios
    local quantidadePremios = math.random(1, 3)
    for i = 1, quantidadePremios do
        local chance = math.random(1, 100)
        local pool = items_facil
        local quantidade = 1

        if chance > 75 and chance <= 94 then
            pool = items_medio
        elseif chance > 94 then
            pool = items_dificil
        end

        local itemid = pool[math.random(#pool)]
        if Facil[itemid] then
            quantidade = Facil[itemid].count
        elseif Medio[itemid] then
            quantidade = Medio[itemid].count
        elseif Dificil[itemid] then
            quantidade = Dificil[itemid].count
        end

        local item_name = getItemNameById(itemid)
        local reward = doCreateItemEx(itemid, quantidade)
        doPlayerAddItemEx(cid, reward)
        doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
        doPlayerSendTextMessage(cid, 25, playerName.." ganhou "..quantidade.." "..item_name.."! Parabéns!")
    end

    -- Atualiza progresso e armazena os valores
    setPlayerStorageValue(cid, sto_pw, 1)
    setPlayerStorageValue(cid, contagem_total, total + 1)

    doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, playerName.." coletou o PowerUp: "..nomeTile.."\nVocê está com "..(total + 1).."/"..bonuss_max.." PowerUps.")

    -- Lógica para o final da missão (bônus)
    if total + 1 >= bonuss_max then
        setPlayerStorageValue(cid, storageFinal, 1)
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, playerName.." coletou todos os PowerUps! Acesso especial desbloqueado.")

        if getPlayerStorageValue(cid, storageOrdemBonus) == 1 then
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, playerName.." completou todos os PowerUps em ordem! Recompensa extra desbloqueada.")
            doPlayerAddExp(cid, ordemBonusConfig.exp)

            local bonusItem = doCreateItemEx(ordemBonusConfig.item.id, ordemBonusConfig.item.count)
            doPlayerAddItemEx(cid, bonusItem)

            local sex = getPlayerSex(cid)
            local outfitId = sex == 0 and ordemBonusConfig.outfit.female or ordemBonusConfig.outfit.male
            doPlayerAddOutfit(cid, outfitId, 3)

            if doPlayerAddAchievement then
                doPlayerAddAchievement(cid, ordemBonusConfig.achievement)
            end
        end
    end

    return true
end
