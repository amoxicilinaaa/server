function onUse(cid)
local pssxxx = {x = 1089, y = 2420, z = 8} 

if getPlayerPremiumDays(cid) <= 0 then
doPlayerSendTextMessage(cid,22, "Você é um jogador grátis, necessita de conta premium para passar por essa porta.")
return TRUE
end
doSendMagicEffect(getPlayerPosition(cid), 21)
doTeleportThing(cid, pssxxx)
return TRUE
end