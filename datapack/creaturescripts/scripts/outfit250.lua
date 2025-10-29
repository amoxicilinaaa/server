local level = 250   --lvl minimo pra ganhar
local sto = 181647 --storage da outfit
function onAdvance(cid, skill, oldLevel, newLevel)

if newLevel >= level then
   if getPlayerStorageValue(cid, sto) < 1 then
          setPlayerStorageValue(cid, sto, 1)
          doPlayerSendTextMessage(cid, 27, "Parabéns! Você avançou para o nível 250 e recebeu uma roupa exclusiva para esse nível. Veja em seu vestuário!")
   end
end
return true
end