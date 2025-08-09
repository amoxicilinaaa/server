-- Adicione no final do arquivo
function onExtendedOpcode(player, opcode, buffer)
    if opcode == 100 then
        local data = json.decode(buffer)
        if data.action == "submit_sale" then
            local sale_type = data.sale_type
            local item_id = tonumber(data.item_id)
            local item_count = tonumber(data.item_count) or 1
            local price = tonumber(data.price)
            local description = data.description
            local pokemon_nature = data.pokemon_nature or nil
            local pokemon_level = tonumber(data.pokemon_level) or nil
            local pokemon_boost = tonumber(data.pokemon_boost) or nil

            if not item_id or not price then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Item ID e preço são obrigatórios!")
                return
            end

            -- Validação básica
            if sale_type == "pokemon" and (not pokemon_level or pokemon_level < 1) then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Nível do Pokémon é obrigatório!")
                return
            end

            -- Inserir no banco
            db.query(string.format(
                "INSERT INTO market_offers (player_id, sale_type, item_id, item_count, pokemon_nature, pokemon_level, pokemon_boost, price, description, expires_at) " ..
                "VALUES (%d, '%s', %d, %d, %s, %s, %s, %d, '%s', NOW() + INTERVAL 24 HOUR)",
                player:getGuid(), sale_type, item_id, item_count,
                pokemon_nature and "'" .. pokemon_nature .. "'" or "NULL",
                pokemon_level and pokemon_level or "NULL",
                pokemon_boost and pokemon_boost or "NULL",
                price, db.escapeString(description)
            ))

            -- Enviar para o Discord
            local item_name = ItemType(item_id):getName()
            local message = string.format(
                "**%s** está vendendo **%s** (%s, ID: %d, Qtd: %d) por **%d gold**! Descrição: %s",
                player:getName(), item_name, sale_type, item_id, item_count, price, description
            )
            if sale_type == "pokemon" then
                message = message .. string.format(" | Nature: %s | Level: %d | Boost: %d", pokemon_nature or "N/A", pokemon_level or 0, pokemon_boost or 0)
            end
            sendToDiscord(message)

            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Anúncio criado com sucesso!")
        end
    end
end

function sendToDiscord(message)
    local webhook = "SUA_URL_DO_WEBHOOK_DO_DISCORD"
    os.execute('curl -H "Content-Type: application/json" -X POST -d \'{"content":"' .. message .. '"}\' ' .. webhook)
end