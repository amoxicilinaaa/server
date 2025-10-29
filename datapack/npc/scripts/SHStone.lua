local focus = 0
local talk_start = 0
local conv = 0
local target = 0
local following = false
local attacking = false
local talkState = {}
local finalname = "Julios.xml"
function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
function onCreatureSay(cid, type, msge)
local msg = string.lower(msge)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

------ CONFIGURE AQUI TUDO DO NPC --------------
local config = {
PrimeiraFala = 'hi',
historiaInicial = "Ola "..getCreatureName(cid).." Voce Quer Trocar Comigo?", -- Mensagem quando o player dizer hi.
wordsToNextHistory = 'yes', -- qual palavra o player tem que falar para ele continuar a história
segundaHistoria = "Bom Eu quero uma Crystal Stone Em troca de uma Chave Voce Aceita?", -- História que o npc vai contar após o player dizer as palavras acima
wordsToForge = 'sim', -- palavra que o player tem que dizer para forjar os items
item1 = {11449, 1}, -- id do item 1 que vai precisar, quantidade
itemFinal = {2086, 1}, -- id do item que vai ganhar, se o player tiver os itens acima
finalHistory = "Obirgado Pela troca Bom uso Dessa Chave!", -- Oque o npc vai falar depois que trocar
notHave = "Desculpe, Voce não tem oque eu preciso", -- Oque o npc vai falar se o player não tiver os itens necessários
talkType = TALKTYPE_ORANGE_1, -- tipo de fala do npc
}

--------------------------------------------------------------

if (msgcontains(msg, config.PrimeiraFala )) then
-- doCreatureSay(getNpcId(), config.historialInicial, config.talkType)
selfSay('Ola '..getCreatureName(cid)..' Voce Quer Trocar Comigo?',config.talkType)
end

if (msgcontains(msg, config.wordsToNextHistory )) then
doCreatureSay(getNpcId(), config.segundaHistoria, config.talkType)
end

if (msgcontains(msg, config.wordsToForge)) then
if doPlayerRemoveItem(cid, config.item1[1], config.item1[2]) then
selfSay('Obirgado Pela troca Bom uso Dessa Chave!')
doPlayerAddItem(cid, config.itemFinal[1], config.itemFinal[2])
else
doCreatureSay(getNpcId(), config.notHave, config.talkType)
return true
end
return true
end

return true
end