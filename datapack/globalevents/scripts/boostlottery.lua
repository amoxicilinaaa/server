local premio = {
[1] = {item = 12331, count = 1},
}

local configs = {
        hours = 5, -- quantas em quantas horas, vai acontecer.
        winners = 1, -- qntos players podem ganhar.
}

function onThink(interval, lastExecution)

local p = getPlayersOnline()
local winners = configs.winners

if #p < winners then
        winners = #p
end


for i = 1, winners do
        local p = getPlayersOnline()
        local c, w = #p, #premio
        local d, e = math.random(c), math.random(w)
        local playerwin = p[d]
        doPlayerAddItem(playerwin, premio[e].item, premio[e].count)
        doBroadcastMessage("[LOTERIA] Sortudo(a): " .. getCreatureName(playerwin) .. ", Premiação: " .. premio[e].count .. " " .. getItemNameById(premio[e].item) .. ", Parabéns!")
        if i == winners then
                doBroadcastMessage("(Próxima loteria em 5 horas.)")
        end
        doSendMagicEffect(getThingPos(playerwin), 12)
end

return true
end