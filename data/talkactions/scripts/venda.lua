function onSay(cid, words, param)
    local player = Player(cid)
    if not player then return false end

    -- Enviar opcode para abrir janela no OTC
    local protocol = player:getClient().protocol
    if protocol then
        protocol:sendExtendedOpcode(100, { action = "open_sale_window" })
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Janela de venda aberta!")
    return false
end

--CREATE TABLE market_offers (
    --id INT AUTO_INCREMENT PRIMARY KEY,
    --player_id INT NOT NULL,
    --sale_type ENUM('pokemon', 'item') NOT NULL,
    --item_id INT NOT NULL,
    --item_count INT NOT NULL,
    --pokemon_nature VARCHAR(50) DEFAULT NULL,
    --pokemon_level INT DEFAULT NULL,
    --pokemon_boost INT DEFAULT NULL,
    --price INT NOT NULL,
    --description VARCHAR(255) DEFAULT NULL,
    --created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    --expires_at TIMESTAMP NOT NULL
--);