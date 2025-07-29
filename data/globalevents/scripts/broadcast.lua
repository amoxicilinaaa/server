
CONFIG = {
    [1] = {message = "Atenção: Qualquer problema ou erro reporte imediatamente dentro do jogo, apertando CTRL + R, ou no discord seção reporte-bug.\n[DISCORD]: ", color = 21},
    [2] = {message = "Duvidas? Retire as suas duvidas no Help Channel", color = 21},
    --[3] = {message = "Cada conquista que tiverem reloguem, para que seus personagens sejam salvos, pois a equipe não se responsabiliza pelos itens perdidos.", color = 21}, 
    [3] = {message = "Fique por dentro das noticias acesse nossa pagina no [FACEBOOK]: ", color = 21},
    [4] = {message = "Lembre-se, nunca forneça sua senha para nimguém, nem crie a mesma senha e conta em outros sites, a staff não solicita nenhum desses dados e não se responsabiliza por pokémons e itens perdidos!", color = 21},
    [5] = {message = "Está rolando promoção de Pontos na nossa loja!", color = 21},
    --[7] = {message = "Evento double xp e catch apenas nesse final de semana, APROVEITE!", color = 19},
	[6] = {message = "Discord do servidor, acesse:\n ", color = 21},
    [7] = {message = "Porfavor para evitar futuros bugs no client mantenha-o sempre atualizado.", color = 21},  
    [8] = {message = "Guarde sempre o SERIAL de seus pokemons, é de EXTREMA importancia.", color = 21},  
} 

function onThink()
    getRandom = math.random(1, #CONFIG)
    return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end