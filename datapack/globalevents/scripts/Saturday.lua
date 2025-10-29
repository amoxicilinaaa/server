local config =
{
        day = "Monday",
        pos = {x=1032, y=1033, z=7},
        topos = {x=254, y=3789, z =7},
        time = 2000, -- tempo que o teleport ira sumir em minutos
        msg_open = "[NATAL QUEST ] BOA SORTE MAUHAUAHAUA! Ira se fechar em 20Horas.", 
        msg_close = "O Portal se fechou."
}


local function DelTp()
        local t = getTileItemById(config.pos, 1387)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(config.pos, CONST_ME_POFF)
        end
end


function onTimer()
       
        if (os.date("%A") == config.day) then
                doCreateTeleport(1387, config.topos, config.pos)
                doBroadcastMessage(config.msg_open)
                addEvent(DelTp, config.time*60*1000)
                addEvent(doBroadcastMessage, config.time*60*1000, config.msg_close)
        end


        return true
end