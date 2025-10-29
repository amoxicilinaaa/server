local cfg = {
    failpos = {x = 727, y = 2405, z = 8}, -- Posição caso não tenha um dos requerimentos.
    pos = {x = 728, y = 2395, z = 8},     -- Posição caso tenha todos os requerimentos.
    vocations = {1, 4},                 -- ID's das vocations, separe por vírgulas!
    item = {2160, 100},                  -- ID/count.
    level = 250                          -- Level necessário.
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if isInArray(cfg.vocations, getPlayerVocation(cid)) then
        if getPlayerLevel(cid) >= cfg.level then
            if doPlayerRemoveItem(cid, cfg.item[1], cfg.item[2]) then
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                doTeleportThing(cid, cfg.pos)
            else
                doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Dinheiro insuficiente! Você necessita de  '.. cfg.item[2] ..' '.. getItemNameById(cfg.item[1]) ..' para passar.')
                doTeleportThing(cid, cfg.failpos)
            end
        else
            doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você precisa ser nível '.. cfg.level ..' para passar.')
            doTeleportThing(cid, cfg.failpos)
        end
    else
        doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Apenas verdadeiros treinadores podem passar por essa porta.')
        doTeleportThing(cid, cfg.failpos)
    end
   return true
end