function onSay(cid, words, param)
    if not param or tonumber(param) == nil or tonumber(param) < 0 or tonumber(param) > 31 then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Uso correto: /setiv <valor> (0 a 31).")
        return true
    end

    local iv_value = tonumber(param)
    local found = false
    local player = Player(cid)

    -- Tenta iterar pelo inventário manualmente
    for slot = 0, 10 do -- 0 a 10 cobre todos os slots padrão (inventário + equipamento)
        local item = getPlayerSlotItem(cid, slot)
        if item and item.uid > 0 then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Checando slot " .. slot .. ", itemid: " .. item.itemid .. ", uid: " .. item.uid)
            local isPokeball = false
            for _, pokeball in pairs(pokeballsOLD) do
                if isInArray(pokeball.all, item.itemid) then
                    isPokeball = true
                    doSetItemAttribute(item.uid, "iv", iv_value)
                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "IV da " .. _ .. " ball no slot " .. slot .. " definido como: " .. iv_value .. ".")
                    found = true
                    break
                end
            end
            if not isPokeball then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Item no slot " .. slot .. " (ID " .. item.itemid .. ") não é uma pokeball válida.")
            end
            if found then break end
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Slot " .. slot .. " vazio ou inválido.")
        end
    end

    if not found then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nenhuma pokeball encontrada no inventário. Verifique se você tem uma pokeball válida.")
    end
    return true
end