local messages = {
	"Dica: Nunca digite sua senha em sites não oficiais do jogo, antes de digitar sua senha em algum site é recomendado que consulte o administrador.",
	"Diversão garantida: Está gostando do servidor? Que tal chamar seus amigos para jogar junto com você?",
	"Dica: Tá com algum bug que não permite que chame seu pokémon? Seu order não funciona? Vá até o CP de Saffron e clique no Computador ao lado do NPC de Cura Nurse Joy.",
	"Dica: Se quer protestar, reclamar ou conversar use o game-chat, o help só deve ser usado para tirar duvidas sobre o jogo (mas não pra spoilers).",
	"Conheca nossa pagina do face:https://www.facebook.com/",
	"Dica: Enquanto estiver montado(a) na bike evite utilizar o comando correr, pois ao desmontar da bike seu personagem recebe um grande slow até que relogue.",
}

local i = 0
function onThink(interval, lastExecution)
local message = messages[(i % #messages) + 1]
    doBroadcastMessage("" .. message,22)
    i = i + 1
    return TRUE
end
