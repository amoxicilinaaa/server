local i = {

["08:00"] = {nome = "Equipe Rocket: Foram avistados perto de Veridian, Prepare seus Pokemons para lutar e explorar!", pos = {x=651, y=1053, z=7}, monster = {"1 Rocket Machine Combat"}},
["15:30"] = {nome = "Equipe Rocket: Foram avistados perto de Pallet, Prepare seus Pokemons para lutar e explorar!", pos = {x=723, y=1139, z=7}, monster = {"1 Rocket Machine Combat"}},
["21:00"] = {nome = "Equipe Rocket: Foram avistados perto de Pewter, Prepare seus Pokemons para lutar e explorar!", pos = {x=699, y=851, z=7}, monster = {"1 Rocket Machine Combat"}},
["01:00"] = {nome = "Equipe Rocket: Foram avistados perto da entrada de Cerulean, Prepare seus Pokemons para lutar e explorar!", pos = {x=991, y=905, z=7}, monster = {"1 Rocket Machine Combat"}},
}

function onThink(interval, lastExecution)
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " .")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end