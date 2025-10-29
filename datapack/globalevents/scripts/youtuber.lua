function onThink(cid, interval, lastExecution)

for _, pid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(pid, 1321323) >= 1 then
		doSendMagicEffect(getCreaturePosition(pid), 174)
		end
		
		end
return true
end