local msgs = {"use ", ""}

function doAlertReady(cid, id, movename, n, cd)
	if not isCreature(cid) then return true end
	local myball = getPlayerSlotItem(cid, 8)
	if myball.itemid > 0 and getItemAttribute(myball.uid, cd) == "cd:"..id.."" then
	return true
	end
	local p = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
	if not p or #p <= 0 then return true end
	for a = 1, #p do
		if getItemAttribute(p[a], cd) == "cd:"..id.."" then
		return true
		end
	end
end

function onSay(cid, words, param, channel)


	if param ~= "" then return true end
	if string.len(words) > 3 then return true end

	if #getCreatureSummons(cid) == 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa de um pokémon para usar moves.")
	return 0
	end
                      --alterado v1.5
local mypoke = getCreatureSummons(cid)[1]

	if getCreatureCondition(cid, CONDITION_EXHAUST) then return true end
	if getCreatureName(mypoke) == "Evolution" then return true end

    if getCreatureName(mypoke) == "Ditto" or getCreatureName(mypoke) == "Shiny Ditto" then
       name = getPlayerStorageValue(mypoke, 1010)   --edited
    else
       name = getCreatureName(mypoke)
    end  
	
    --local name = getCreatureName(mypoke) == "Ditto" and getPlayerStorageValue(mypoke, 1010) or getCreatureName(mypoke)

local it = string.sub(words, 2, 3)
local move = movestable[name].move1
if getPlayerStorageValue(mypoke, 212123) >= 1 then
   cdzin = "cm_move"..it..""
else
   cdzin = "move"..it..""       --alterado v1.5
end

	if it == "2" then
		move = movestable[name].move2
	elseif it == "3" then
		move = movestable[name].move3
	elseif it == "4" then
		move = movestable[name].move4
	elseif it == "5" then
		move = movestable[name].move5
	elseif it == "6" then
		move = movestable[name].move6
	elseif it == "7" then
		move = movestable[name].move7
	elseif it == "8" then
		move = movestable[name].move8
	elseif it == "9" then
		move = movestable[name].move9
	elseif it == "10" then
		move = movestable[name].move10
	elseif it == "11" then
		move = movestable[name].move11
	elseif it == "12" then
		move = movestable[name].move12
	elseif it == "13" then
		move = movestable[name].move13
	end

	if not move then
        local isMega = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "megaStone")
        if not isMega or name:find("Mega") then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu pokemon nao aprendeu esse move.")
            return true
        end
        local moveTable, index = getNewMoveTable(movestable[name]), 0
        for i = 1, 12 do
            if not moveTable[i] then
                index = i
                break
            end
        end
        if tonumber(it) ~= index then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Seu pokemon nao aprendeu esse move.")
            return true
        end
        local needCds = true                   --Coloque false se o pokémon puder mega evoluir mesmo com spells em cooldown.
        if needCds then
            for i = 1, 12 do
                if getCD(getPlayerSlotItem(cid, 8).uid, "move"..i) > 0 then
                    return doPlayerSendCancel(cid, "Para Mega Evoluir, seu pokemon precisa estar concentrado com todos moves sem cooldown.")
                end
            end
        end
        move = {name = "Mega Evolution", level = 0, cd = 0, dist = 1, target = 0, f = 0, t = "?"}
    end
	
	if getPlayerLevel(cid) < move.level then
	   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa ser level "..move.level.." para usar este move.")
	   return true
    end

	if getCD(getPlayerSlotItem(cid, 8).uid, cdzin) > 0 and getCD(getPlayerSlotItem(cid, 8).uid, cdzin) < (move.cd + 2) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você tem que esperar "..getCD(getPlayerSlotItem(cid, 8).uid, cdzin).." segundos para usar "..move.name.." novamente.")
	return true
	end

	if getTileInfo(getThingPos(mypoke)).protection then
		doPlayerSendCancel(cid, "Você não atacar em PZ.")
	return true
	end
		                              --alterado v1.6                  
	if (move.name == "Team Slice" or move.name == "Team Claw") and #getCreatureSummons(cid) < 2 then       
	    doPlayerSendCancel(cid, "Os seus pokemon precisa estar em uma equipe para usar este move!")
    return true
    end
                                                                     --alterado v1.7 \/\/\/
if isCreature(getCreatureTarget(cid)) and isInArray(specialabilities["evasion"], getCreatureName(getCreatureTarget(cid))) then 
   local target = getCreatureTarget(cid)                                                                                       
   if math.random(1, 100) <= passivesChances["Evasion"][getCreatureName(target)] then 
      if isCreature(getMasterTarget(target)) then   --alterado v1.6                                                                   
         doSendMagicEffect(getThingPos(target), 211)
         doSendAnimatedText(getThingPos(target), "TOO BAD", 215)                                
         doTeleportThing(target, getClosestFreeTile(target, getThingPos(mypoke)), false)
         doSendMagicEffect(getThingPos(target), 211)
         doFaceCreature(target, getThingPos(mypoke))    		
         return true       --alterado v1.6
      end
   end
end


if move.target == 1 then

	if not isCreature(getCreatureTarget(cid)) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não tem um alvo.")
	return 0
	end

	if getCreatureCondition(getCreatureTarget(cid), CONDITION_INVISIBLE) then
	return 0
	end

	if getCreatureHealth(getCreatureTarget(cid)) <= 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você já derrotou o seu alvo.")
	return 0
	end

	if not isCreature(getCreatureSummons(cid)[1]) then
	return true
	end

	if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid))) > move.dist then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Aproxime-se o alvo de usar este move.")
	return 0
	end

	if not isSightClear(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), false) then
	return 0
	end
end

	local newid = 0
	
	if isSleeping(mypoke) or isSilence(mypoke) then  --alterado v1.5
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry you can't do that right now.")
			return 0
		else
			newid = setCD(getPlayerSlotItem(cid, 8).uid, cdzin, move.cd)
		end
		
local spellMessage = msgs[math.random(#msgs)]..""..move.name.."!"
if move.name == "Mega Evolution" then
    spellMessage = "Mega Evolve!"
end
doCreatureSay(cid, getPokeName(mypoke)..", com toda emocao use "..spellMessage, TALKTYPE_SAY)	
    local summons = getCreatureSummons(cid) --alterado v1.6

	addEvent(doAlertReady, move.cd * 1000, cid, newid, move.name, it, cdzin)
	
	for i = 2, #summons do
       if isCreature(summons[i]) and getPlayerStorageValue(cid, 637501) >= 1 then
          docastspell(summons[i], move.name)        --alterado v1.6
       end
    end 

    docastspell(mypoke, move.name)
	doCreatureAddCondition(cid, playerexhaust)

	if useKpdoDlls then
		doUpdateCooldowns(cid)
	end

return 0
end