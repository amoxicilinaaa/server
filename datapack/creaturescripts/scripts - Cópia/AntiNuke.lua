-- Anti Mage Bomb System otimizado por Killua - XTibia.com

local config = {
    max = 3, -- Quantos acc manager o mesmo ip pode logar de uma vez
    acc_name = "Account Manager", -- Nome do account manager
    ip_banishment = "false", -- Se logar mais acc manager do que o permitido, leva ban? "true" ou "false"
    banishment_length = 20 -- Quantos dias o ip fica banido?
}

local accepted_ip_list = {""} -- lista dos ips permitidos a logar varios acc manager, exemplo: {"200.85.3.60", "201.36.5.222"}
 
local function antiMC(cid)
    if (#getPlayersByIp(getPlayerIp(cid)) >= config.max) then
        if config.ip_banishment == "true" then
            doAddIpBanishment(getPlayerIp(cid), banishment_length * 24 * 60 * 60)
        end
        doRemoveCreature(cid)
    end
    return true
end
 
function onLogin(cid)
    if getPlayerName(cid) == config.acc_name then
        if isInArray(accepted_ip_list,doConvertIntegerToIp(getPlayerIp(cid))) then
            return true
        else
            addEvent(antiMC, 1000, cid)
        end
    end
    return true
end