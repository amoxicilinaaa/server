local i = {
["08:45"] = {nome = "O torneio de Kanto vai começar em 15 minutos, fale com o npc Nick em algum centro de Pokémon de Kanto."},
["08:55"] = {nome = "Faltam 5 minutos para fechar as inscrições do torneio!"},
["09:00"] = {nome = "As inscrições do Torneio de Kanto fecharam!"},

["12:15"] = {nome = "O torneio de Kanto vai começar em 15 minutos, fale com o npc Nick em algum centro de Pokémon de Kanto."},
["12:25"] = {nome = "Faltam 5 minutos para fechar as inscrições do torneio!"},
["12:30"] = {nome = "As inscrições do Torneio de Kanto fecharam!"},


["18:45"] = {nome = "O torneio de Kanto vai começar em 15 minutos, fale com o npc Nick em algum centro de Pokémon de Kanto."},
["18:55"] = {nome = "Faltam 5 minutos para fechar as inscrições do torneio!"},
["19:00"] = {nome = "As inscrições do Torneio de Kanto fecharam!"},


["22:45"] = {nome = "O torneio de Kanto vai começar em 15 minutos, fale com o npc Nick em algum centro de Pokémon de Kanto."},
["22:55"] = {nome = "Faltam 5 minutos para fechar as incrições do torneio!"},
["23:00"] = {nome = "As inscrições do Torneio de Kanto fecharam!"},

}

function onThink(interval, lastExecution)
        hours = tostring(os.date("%X")):sub(1, 5)
        tb = i[hours]
        if tb then
                doBroadcastMessage(tb.nome)
                        end
        return true
end