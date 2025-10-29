function sendSpellsForBarSpell(cid)
local dir = "data/spells/spells.xml"
str = "ShowJutsu/"
print("oi")
local monster = io.open(dir, "r")
for i in monster:read("*a"):gmatch('<instant(.-)</instant>') do
local name = i:match('name="(.-)"')
if string.find(i, '<vocation id="'..getPlayerVocation(cid)..'"/>') or string.find(i, 'needlearn="0"') and not string.find(i, '<vocation id') or getPlayerLearnedInstantSpell(cid, name)  then
local level = i:match('lvl="(.-)"')
local word = i:match('words="(.-)"')
if getPlayerLevel(cid) >= tonumber(level) then
str = str..name.."-"..word.."/"
end
end
end
doPlayerSendCancel(cid, str)
doPlayerSendCancel(cid, "Barra de moves atulizada")
end