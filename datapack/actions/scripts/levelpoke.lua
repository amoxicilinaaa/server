-- Desenvolvido por Marsh
-- Alteracoes no exp e nicksystem Gabriel

function onUse(cid, item, frompos, item2, topos)

if getCreatureCondition(cid, CONDITION_INFIGHT) then
doPlayerSendCancel(cid, "Voce esta em batalha.")
return TRUE
end

if isPlayer(item2.uid) then
return doPlayerSendCancel(cid, "Use apenas em Pokemons!")
end

 local expPlayer = 450
 local quantasrarecandy = 1
 local pokemonfora = 1
 local levellimite = 100
 local msgaviso = "Seu pokemon ja esta com o level máximo [100]"
 local msgavisopk = "Solte seu Pokemon Primeiro"
 local ballpwo = getPlayerSlotItem(cid, CONST_SLOT_FEET)
 local subirlevel = getItemAttribute(ballpwo.uid, "level")
 
 if #getCreatureSummons(cid) == pokemonfora then
 if getItemAttribute(ballpwo.uid, "level") < levellimite then
 doRemoveItem(item.uid, quantasrarecandy)
 doItemSetAttribute(ballpwo.uid, "level", subirlevel +1)  
 doSendAnimatedText(getCreaturePosition(getCreatureSummons(cid)[pokemonfora]), "LEVEL UP!", 215)
 doItemSetAttribute(ballpwo.uid, "exp", 0) 
  doPlayerAddExperience(cid, math.random(450,1500))
doSendAnimatedText(getThingPos(cid), ""..expPlayer.." +XP", COLOR_WHITE)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parabens voce recebeu um Bonus de "..expPlayer.." XP, por usar Rare Candy em um pokemon")


 local nicksystem = ""..getCreatureName(getCreatureSummons(cid)[pokemonfora]).." ["..subirlevel + 1 .."]"  
 
 doCreatureSetNick(getCreatureSummons(cid)[pokemonfora], nicksystem)
 else
 doPlayerSendTextMessage(cid, 23, msgaviso)
 end 
 end

 return true
 end


 
 
 
 