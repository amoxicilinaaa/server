local cfg = {
    failpos = {x = 692, y = 2744, z = 8}, -- Posição caso não tenha um dos requerimentos.
    pos = {x = 852, y = 2734, z = 7},     -- Posição caso tenha todos os requerimentos.
    item = {12171, 85},                  -- ID/count.
    level = 80                          -- Level necessário.
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerLevel(cid) >= cfg.level then
            if doPlayerRemoveItem(cid, cfg.item[1], cfg.item[2]) then
                doSendMagicEffect(getPlayerPosition(cid), CONST_ME_TELEPORT)
                doTeleportThing(cid, cfg.pos)
            else
                doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'É necessário '.. cfg.item[2] ..' '.. getItemNameById(cfg.item[1]) ..' para passar.')
                doTeleportThing(cid, cfg.failpos)
            end
        else
            doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_RED)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você precisa ser nível '.. cfg.level ..' para passar.')
            doTeleportThing(cid, cfg.failpos)
        end
end