effect = {15, 20, 30, 40} -- effects que podem sair(send effect)

-- // [SYSTEM-ELO]  versão:0.0.1, by:Luiz Machado
-- // [SYSTEM-ELO]  pontos_necessarios para subir de divisão.

elo = {
      -- PRIMEIRA DIVISÃO
      ["Bronze IV"] = {pontos_necessarios = 100},
      ["Bronze V"] = {pontos_necessarios = 100},
      ["Bronze III"] = {pontos_necessarios = 100},
      ["Bronze II"] = {pontos_necessarios = 100},
      ["Bronze I"] = {pontos_necessarios = 100}
}

function ExpInicial(cid, exp) -- By Luiz Machado
     local storage = 55555
        if getPlayerStorageValue(cid, storage) <= 0 then
           setPlayerStorageValue(cid, storage, 1)
           doPlayerAddExperience(cid, 200)                
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "voce ganhou xp extra por usar seu pokemon pela primeira vez")
           return true
     end
end

function SendEffect(cid)  
    doSendMagicEffect(getCreaturePosition(cid), effect)
    addEvent(SendEffect, tempo*1000, cid)
 return true
end