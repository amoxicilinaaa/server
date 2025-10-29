local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local config = {
                 
item1 = 2391,       -- ID DO Item que precisará para trocar
item2 = 2392,       -- ID DO Item que precisará para trocar
item3 = 2394,       -- ID DO Item que precisará para trocar
qt1 = 4,            -- Quantidade do item1 que precisa
qt2=  5,            -- Quantidade do item2 que precisa 
qt3=  7,            -- Quantidade do item3 que precisa   
sto   = 687235,       -- Storage
}
if(msgcontains(msg, 'yes' )) then
 if getPlayerStorageValue(cid, config.sto) == -1 then
  if getPlayerItemCount(cid, config.item1) >= config.qt1  then
   if getPlayerItemCount(cid, config.item2) >= config.qt2  then
    if getPlayerItemCount(cid, config.item3) >= config.qt3  then
      
      selfSay(' voce troco 3 itens por uma storage', cid)
      setPlayerStorageValue(cid, config.sto, 1)
      doPlayerRemoveItem(cid, config.item1, config.qnt1)
      doPlayerRemoveItem(cid, config.item2, config.qnt2)
      doPlayerRemoveItem(cid, config.item3, config.qnt3)
      
    else
    selfSay('voce n tem o item', cid)
    end
   else
   selfSay('voce n tem o item', cid)
   end 
  else
  selfSay('voce n tem o item', cid)
  end    
 else
 selfSay(' voce ja fez' , cid)
return true
end
end
end 
 
 
 
      
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())