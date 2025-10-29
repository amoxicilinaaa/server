local cfg = {
    failpos = {x = 795, y = 2694, z = 7}, -- Posição caso não tenha um dos requerimentos.
    pos = {x = 807, y = 2686, z = 5},     -- Posição caso tenha todos os requerimentos.
    vocations = {1, 4},                 -- ID's das vocations, separe por vírgulas!
    item = {2086, 1},                  -- ID/count.
    level = 100                          -- Level necessário.
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if isInArray(cfg.vocations, getPlayerVocation(cid)) then
        if getPlayerLevel(cid) >= cfg.level then
            if doPlayerRemoveItem(cid, cfg.item[1], cfg.item[2]) then
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                doTeleportThing(cid, cfg.pos)
            else
                doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Chave incorreta! Consiga '.. cfg.item[2] ..' '.. getItemNameById(cfg.item[1]) ..' para passar.')
                doTeleportThing(cid, cfg.failpos)
            end
        else
            doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você precisa ser nível '.. cfg.level ..' para passar.')
            doTeleportThing(cid, cfg.failpos)
        end
    else
        doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você não tem a verdadeira chave.')
        doTeleportThing(cid, cfg.failpos)
    end
   return true
end