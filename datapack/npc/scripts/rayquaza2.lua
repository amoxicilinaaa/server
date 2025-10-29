local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item1 = {11453, 2087}
          item2 = {11452, 2159}
}
local counts = {
          count1 = {5, 1}
          count2 = {2, 1}
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'yes') then
                    if getPlayerItemCount(cid, items.item1[1], item2[2]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1], item2[2], count2[2])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('Obrigado pelas pedras evolutivas. Pegue essa chave!', cid)
                    else
                              selfSay('Você não tem heart stones suficientes.', cid)
                    end

          elseif msgcontains(msg, 'no') then
                              selfSay('Ok então, até mais!', cid)

          end
          return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())