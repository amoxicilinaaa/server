local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
 
 
local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE1'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE1 por 210 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 210, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Eu posso te levar para {NOMEDACIDADE1}, {NOMEDACIDADE2}, {NOMEDACIDADE3}, {NOMEDACIDADE4}, {NOMEDACIDADE5} {NOMEDACIDADE6} {NOMEDACIDADE7} {NOMEDACIDADE8} {NOMEDACIDADE9} por um pequeno custo.'})

local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE2'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE2 por 110 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 110, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'dorion\' for just a small fee.'})

local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE3}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE3 por 115 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 115, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'Alfon\' for just a small fee.'})

local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE4'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE4 por 100 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 100, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'venohn\' for just a small fee.'})

local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE6'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE6 por 175 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 175, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'Anknor\' for just a small fee.'})
local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE7}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE7 por 100 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 100, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
 
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'anknor\' for just a small fee.'})
local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE8'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE8 por 190 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 190, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
 
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'smallville\' for just a small fee.'})
local travelNode = keywordHandler:addKeyword({'NOMEDACIDADE9}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer viajar para NOMEDACIDADE9 por 55 gold coins?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 55, destination = {x=XXX, y=XXX, z=X} })
    travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to \'goroma\' for just a small fee.'})

npcHandler:addModule(FocusModule:new())