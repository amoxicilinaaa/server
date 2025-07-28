local coins = {
    [12416] = {to = 2148, effect = TEXTCOLOR_GREEN},
    [2148] = {to = 2152, from = 12416, effect = TEXTCOLOR_YELLOW}, 
    [2152] = {to = 2160, from = 2148, effect = TEXTCOLOR_BLUE}, 
    [2160] = {from = 2152, effect = TEXTCOLOR_WHITE},
    [15128] = {from = 2160, effect = TEXTCOLOR_RED}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerFlagValue(cid, PLAYERFLAG_CANNOTPICKUPITEM) then
        return false
    end
    local coin = coins[item.itemid]
    if not coin then
        return false
    end
    if getItemAttribute(item.uid, "unico") then
        return true
    end
    -- Define o limite máximo de agrupamento (10.000 no seu caso)
    local MAX_STACK = 10000
    -- Conversão para item superior (agrupar)
    if coin.to ~= nil and item.type >= 100 then
        local stacksToConvert = math.floor(item.type / 100) -- Quantos pacotes de 100 podem ser convertidos
        local remaining = item.type % 100 -- Quantidade restante após conversão
        doChangeTypeItem(item.uid, remaining) -- Ajusta a quantidade do item original
        doPlayerAddItem(cid, coin.to, stacksToConvert) -- Adiciona o item superior
        doSendAnimatedText(fromPosition, "$$$", coin.effect or coins[coin.to].effect)
    -- Conversão para item inferior (desagrupar)
    elseif coin.from ~= nil and item.type > 0 then
        local maxStacks = math.floor(MAX_STACK / 100) -- Máximo de pacotes de 100 que cabem
        local stacksToCreate = math.min(item.type, maxStacks) -- Quantidade a desagrupar
        doChangeTypeItem(item.uid, item.type - stacksToCreate) -- Reduz a quantidade do item atual
        doPlayerAddItem(cid, coin.from, stacksToCreate * 100) -- Adiciona o item inferior
        doSendAnimatedText(fromPosition, "$$$", coin.effect or coins[coin.from].effect)
    end
    return true
end