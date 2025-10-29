local channels = {
    [5] = {txt = "[BR] Permitido falar apenas em Português. [EN] Only Portuguese allowed. [ES] Solamente se permite Portugués."}, -- Game Chat BR
    [6] = {txt = "[BR] Permitido falar apenas em Espanhol. [EN] Only Spanish allowed. [ES] Solamiente se permite español."}, -- Game Chat ES
    [7] = {txt = "[BR] Permitido falar apenas em Inglês. [EN] Only English allowed. [ES] Solamiente se permite English."}, -- Game Chat EN
    [8] = {txt = "[BR] Canal destinado apenas para trocas e formação de times. [EN] Channel intended only for exchanges and team formation. [ES] Canal destinado sólo para intercambios y formación de equipos."}, -- Trade
    [4] = {txt = "Bem-vindo(a) ao canal de ajuda.\n Aqui você poderá tirar dúvidas relevantes sobre o jogo. Perguntas sobre localizações e respawns devem ser feitas no game-chat."}, -- Help
}

-- [ChannelID] = {txt = Texto que irá aparecer},

function onJoinChannel(cid, channelId, users)
    local t = channels[channelId]

    if t then

        addEvent(doPlayerSendChannelMessage, 150, cid, "", t.txt, TALKTYPE_CHANNEL_W, channelId)
    end
    return true
end