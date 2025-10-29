local i = {
["17:00"] = {nome = "[Egg Luck System]", pos = {x=1455, y=888, z=6}, pos2 = {x=1456, y=889, z=6}, monster = {"Casal Pinsir Female"}},
}
function onTimer()
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " Dois pokemons acabam de procriar, va em busca deles!")
doSummonCreature("Father Arcanine", tb.pos)
doSummonCreature("Mother Arcanine", tb.pos2)
end
end