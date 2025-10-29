local i = {
["08:32"] = {nome = "Evento Premio Maluko", pos = {x=1328, y=441, z=7}, monster = {"1 Premio Maluko", "15 Rookador"}},
["08:27"] = {nome = "The Massive Dragon Invasion", pos = {x=159, y=58, z=7}, monster = {"1 Demon"}},
}
function onTime()
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " iníciou ! Todos na Arena !.")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end