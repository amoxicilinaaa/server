local i = {
["02:00"] = {nome = "[Egg Luck System]", pos = {x=1205, y=1089, z=5}, pos2 = {x=1206, y=1090, z=5}, monster = {"Casal Pinsir Female"}},
}
function onTimer()
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " Dois pokemons acabam de procriar, va em busca deles!")
doSummonCreature("Father Infernape", tb.pos)
doSummonCreature("Mother Infernape", tb.pos2)
end
end