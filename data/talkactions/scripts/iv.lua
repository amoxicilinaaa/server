function onSay(cid, words, param)
    local found = false
    for slot = CONST_SLOT_FIRST, CONST_SLOT_LAST do
        local item = getPlayerSlotItem(cid, slot)
        if item then
            for _, pokeball in pairs(pokeballsOLD) do
                if isInArray(pokeball.all, item.itemid) then
                    local iv = getItemAttribute(item.uid, "iv")
                    if iv then
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "IV " .. _ .. " é: " .. iv .. ".")
                        found = true
                        break
                    else
                        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "IV " .. _ .. " não definido.")
                        found = true
                        break
                    end
                end
            end
            if found then break end
        end
    end
    if not found then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa estar com o pokemon no inventário de uso para verificar o IV.")
    end
    return true
end