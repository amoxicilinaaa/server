function addOnlineBonus(cid, horas, bonus_contador, bonus_max)

   if not isPlayer(cid) then
   return false
   end  
   setPlayerStorageValue(cid, bonus_contador, getPlayerStorageValue(cid, bonus_contador) + 1)
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Por completar uma hora online sem deslogar, você ganhou 1 Online Bônus. Total: ".. getPlayerStorageValue(cid,bonus_contador) .. ".")   
   if getPlayerStorageValue(cid, bonus_contador) >= bonus_max then
   doPlayerSendTextMessage(cid, 19, "Seus ".. bonus_max .." Online Bônus foram convertidos em 1 dia de Premium Account!") 
   doPlayerAddPremiumDays(cid, 1)
   setPlayerStorageValue(cid, bonus_contador, 0)
   end	  
   addEvent(addOnlineBonus, horas * 3600 * 1000, cid, horas, bonus_contador, bonus_max)   
   
end

function onLogin(cid)

   local bonus_contador = 72702 -- Storage que vai guardar quantos online bonus o char possui.
   local horas = 1 -- Quantidade de horas o char precisa ficar logado pra receber cada online bonus. 
   local bonus_max = 15 -- Quantidade de bonus que o char precisa atingir para ganhar 1 dia de premium account, zerando o contador.
   if getPlayerStorageValue(cid, bonus_contador) > 0 then
   doPlayerSendTextMessage(cid,22,"Você está com: " .. getPlayerStorageValue(cid,bonus_contador) .. " Online Bônus.")
   else
   setPlayerStorageValue(cid, bonus_contador, 0)
   doPlayerSendTextMessage(cid,22,"Você está com: 0 Online Bônus.")
   end
   addEvent(addOnlineBonus, horas * 3600 * 1000, cid, horas, bonus_contador, bonus_max) 

return true   
end