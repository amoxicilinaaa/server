local i = {

["00:00"] = {nome = "", pos = {x=2253, y=886, z=6}, monster = {"1 Dragonite Milenar"}},
}

function onThink(interval, lastExecution)
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
-- doBroadcastMessage(hours .. " - " .. tb.nome .. " .")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end