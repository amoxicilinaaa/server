local i = {
["22:00"] = {nome = "[Egg Luck System]", pos = {x=1069, y=714, z=7}, pos2 = {x=1070, y=715, z=7}, monster = {"Casal Pinsir Female"}},
}
function onTimer()
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " Dois pokemons acabam de procriar, va em busca deles!")
doSummonCreature("Father Dragonite", tb.pos)
doSummonCreature("Mother Dragonite", tb.pos2)
end
end