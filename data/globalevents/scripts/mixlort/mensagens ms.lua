    MENSAGEM = {
        "[AVISO]:\nN�o se esque�a de baixar o nosso client atualizado em nosso site:",
        "[AVISO]:\nSiga o Pokemon Hp nas redes sociais para ficar por dentro das atualiza��es e novidades! Todas no site:",
    }

    MENSAGEM1 = {
        "[AVISO]:\nUse '!money' para juntar seu dinheiro!",
        "[AVISO]:\nUse '!comandos' para ver alguns comandos dispon�veis no servidor.",
        "[AVISO]:\nTire suas d�vidas no Canal Help, acessado via CTRL + O.",
        "[AVISO]:\nSe quer protestar, reclamar ou conversar use o game-chat, o help s� deve ser usado para tirar d�vidas sobre o jogo.",
        "[AVISO]:\nA nossa equipe n�o se responsabiliza por roubos entre jogadores. Ent�o sempre tome cuidado!",
        "[AVISO]:\nPara ativar o AutoLoot � simples, digite !autoloot on.",
        --"[AVISO]:\nUse !house para ver os comandos de house!",
        "[AVISO]:\nUse '!partyexp' para ver sua exp em party!",
        "[AVISO]:\nLembrando que isso � uma vers�o beta para testarmos o game, achar bug e corrigi-los. Haver� um reset no lan�amento da Oficial!",
    }

    MENSAGEM2 = {
        "Divers�o garantida: Est�o gostando do servidor? Que tal chamar seus amigos para jogar junto com voc�?",
        "Jogar o PokeMS com amigos � bem mais legal! Que tal chamar todos seus amigos para conhecer esse novo MMORPG de Pokemon?!",
    }

    MENSAGEM3 = {
        "Fa�a uma doa��o e nos ajude a continuar trazendo divers�o para voc�s. Site:",
        "Incrivel n�o? Essa sensa��o de jogar o Pokemon HP MMORPG n�o tem igual, que tal doar uma quantia para o jogo se manter online por muito tempo?",
    }

    MENSAGEM4 = {
        "[AVISO]:\nSistema de pontos online em desenvolvimento.",
    }

    MENSAGEM5 = {
        "Curta nossa p�gina do facebook:",
    }

    MENSAGEM6 = {
        "[AJUDA]:\nPara mudar a dire��o de seu pok�mon durante a batalha utilize o Order ou digite os seguintes comandos, 't1, t2, t3, t4'!",
    }

function onThink(interval, lastExecution)
    Mixlort = math.random(1,6)
        local i = 0
        local q = 0
        local w = 0
        local e = 0
        local r = 0
        local t = 0
        local m = 0

if Mixlort == 1 then
    local message = MENSAGEM[(i % #MENSAGEM) + 1]
        doBroadcastMessageMs(message)
        i = i + 1
    return true

        elseif Mixlort == 2 then
            local message = MENSAGEM2[(q % #MENSAGEM2) + 1]
                doBroadcastMessageWorld(message)
                q = q + 1
        return true

            elseif Mixlort == 3 then
                local message = MENSAGEM3[(w % #MENSAGEM3) + 1]
                    doBroadcastMessageXp(message)
                    w = w + 1
                return true

-- elseif Mixlort == 4 then
-- local message = MENSAGEM4[(e % #MENSAGEM4) + 1]
-- doBroadcastMessageDeltaball(message)
-- e = e + 1
-- return true

                elseif Mixlort == 4 then
                    local message = MENSAGEM5[(r % #MENSAGEM5) + 1]
                        doBroadcastMessageFacebook(message)
                        r = r + 1
                    return true

                    elseif Mixlort == 5 then
                        local message = MENSAGEM6[(t % #MENSAGEM6) + 1]
                            doBroadcastMessageMewtwo(message)
                            t = t + 1
                        return true

                    elseif Mixlort == 6 then
                        local message = MENSAGEM1[(m % #MENSAGEM1) + 1]
                            doBroadcastMessageMegaphone(message)
                            m = m + 1
                        return true

        end
    return true
end