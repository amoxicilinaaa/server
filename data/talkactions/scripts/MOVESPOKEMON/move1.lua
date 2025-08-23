local msgs = {"use ", ""}

function doAlertReady(cid, id, movename, n, cd)
    if movename == "Mega Evolution" then return true end
    if not isCreature(cid) then return true end
    local myball = getPlayerSlotItem(cid, 8)
    if myball.itemid > 0 and getItemAttribute(myball.uid, cd) == "cd:"..id.."" then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPokeballName(myball.uid).." - "..movename.." (m"..n..") is ready!")
        return true
    end
    local p = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
    if not p or #p <= 0 then return true end
    for a = 1, #p do
        if getItemAttribute(p[a], cd) == "cd:"..id.."" then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPokeballName(p[a]).." - "..movename.." (m"..n..") is ready!")
            return true
        end
    end
end

function onSay(cid, words, param, channel)
    if param ~= "" then return true end
    if string.len(words) > 3 then return true end

    if #getCreatureSummons(cid) == 0 then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You need a pokemon to use moves.")
        return 0
    end

    local mypoke = getCreatureSummons(cid)[1]

    if getCreatureCondition(cid, CONDITION_EXHAUST) then return true end
    if getCreatureName(mypoke) == "Evolution" then return true end

    if getCreatureName(mypoke) == "Ditto" or getCreatureName(mypoke) == "Shiny Ditto" then
        name = getPlayerStorageValue(mypoke, 1010)
    else
        name = getCreatureName(mypoke)
    end

    local it = string.sub(words, 2, 3)
    local idd = getPlayerSlotItem(cid, 8).uid
    local move = getCreatureName(mypoke) == "Smeargle" and getItemAttribute(idd, "skt1") and movestable[getItemAttribute(idd, "skt1")].move1 or movestable[name].move1
    if getPlayerStorageValue(mypoke, 212123) >= 1 then
        cdzin = "cm_move"..it..""
    else
        cdzin = "move"..it..""
    end

    if it == "2" then
        move = getItemAttribute(idd, "skt2") and movestable[getItemAttribute(idd, "skt2")].move2 or movestable[name].move2
    elseif it == "3" then
        move = getItemAttribute(idd, "skt3") and movestable[getItemAttribute(idd, "skt3")].move3 or movestable[name].move3
    elseif it == "4" then
        move = getItemAttribute(idd, "skt4") and movestable[getItemAttribute(idd, "skt4")].move4 or movestable[name].move4
    elseif it == "5" then
        move = getItemAttribute(idd, "skt5") and movestable[getItemAttribute(idd, "skt5")].move5 or movestable[name].move5
    elseif it == "6" then
        move = getItemAttribute(idd, "skt6") and movestable[getItemAttribute(idd, "skt6")].move6 or movestable[name].move6
    elseif it == "7" then
        move = getItemAttribute(idd, "skt7") and movestable[getItemAttribute(idd, "skt7")].move7 or movestable[name].move7
    elseif it == "8" then
        move = getItemAttribute(idd, "skt8") and movestable[getItemAttribute(idd, "skt8")].move8 or movestable[name].move8
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
        local isMega = false
        local isMegaAttr = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldy")
        if not isMegaAttr or isMegaAttr and not megaEvolutions[isMegaAttr] then
            isMegaAttr = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldx")
        end
        if isMegaAttr and megaEvolutions[isMegaAttr] then
            isMega = true
        end
        if not isMega or name:find("Mega") then
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your pokemon doesn't recognize this move.")
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
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your pokemon doesn't recognize this move.")
            return true
        end
        local needCds = true
        if needCds then
            for i = 1, 12 do
                if getCD(getPlayerSlotItem(cid, 8).uid, "move"..i) > 0 then
                    return doPlayerSendCancel(cid, "All spells must be ready to mega evolve.")
                end
            end
        end
        local megaEvoClans = {[14643] = {"Volcanic", "Gardestrike"}, [14654] = {"Seavell", "Orebound"}, [14640] = {"Volcanic"}, [14639] = {"Seavell"}, [14647] = {"Naturia"}, [14642] = {"Malefic"}, [14638] = {"Psycraft"}, [14648] = {"Orebound"}, [4000] = {"Volcanic", "Gardestrike"}}
        move = {name = "Mega Evolution", level = 0, cd = 0, dist = 1, target = 0, f = 0, t = "?"}
    end

    if getPlayerLevel(cid) < move.level then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Level "..move.level.." required to use this move.")
        return true
    end

    if getCD(getPlayerSlotItem(cid, 8).uid, cdzin) > 0 and getCD(getPlayerSlotItem(cid, 8).uid, cdzin) < (move.cd + 2) then
        return true
    end

    if getTileInfo(getThingPos(mypoke)).protection then
        doPlayerSendCancel(cid, "No moves in protection zone.")
        return true
    end

    if getPlayerStorageValue(mypoke, 3894) >= 1 then
        return doPlayerSendCancel(cid, "Cannot attack due to fear.")
    end

    if (move.name == "Team Slice" or move.name == "Team Claw") and #getCreatureSummons(cid) < 2 then
        doPlayerSendCancel(cid, "Team move requires 2+ pokemon!")
        return true
    end

    if isCreature(getCreatureTarget(cid)) and isInArray(specialabilities["evasion"], getCreatureName(getCreatureTarget(cid))) then
        local target = getCreatureTarget(cid)
        if math.random(1, 100) <= passivesChances["Evasion"][getCreatureName(target)] then
            if isCreature(getMasterTarget(target)) then
                doSendMagicEffect(getThingPos(target), 211)
                doSendAnimatedText(getThingPos(target), "TOO BAD", 215)
                doTeleportThing(target, getClosestFreeTile(target, getThingPos(mypoke)), false)
                doSendMagicEffect(getThingPos(target), 211)
                doFaceCreature(target, getThingPos(mypoke))
                return true
            end
        end
    end

    if move.target == 1 then
        if not isCreature(getCreatureTarget(cid)) then
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "No target selected.")
            return 0
        end
        if getCreatureCondition(getCreatureTarget(cid), CONDITION_INVISIBLE) then
            return 0
        end
        if getCreatureHealth(getCreatureTarget(cid)) <= 0 then
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Target already defeated.")
            return 0
        end
        if not isCreature(getCreatureSummons(cid)[1]) then
            return true
        end
        if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid))) > move.dist then
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Get closer to target.")
            return 0
        end
        if not isSightClear(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), false) then
            return 0
        end
    end

    local Tier = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldx")
    local cdzao = Tier and Tier > 112 and Tier < 116 and math.ceil(move.cd - (move.cd * Tiers[Tier].bonus)) or move.cd
    newid = setCD(getPlayerSlotItem(cid, 8).uid, cdzin, math.floor(cdzao*0.5))

    if getPlayerStorageValue(mypoke, 93828) > os.time() then
        return doPlayerSendCancel(cid, "Pokemon can't use moves now.")
    end

    if isSleeping(mypoke) or isSilence(mypoke) then
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Action not possible now.")
        return 0
    end

    local spellMessage = msgs[math.random(#msgs)]..move.name.."!"
    if move.name == "Mega Evolution" then spellMessage = "Mega Evolve!" end
    doCreatureSay(cid, getPokeName(mypoke)..", "..spellMessage, TALKTYPE_MONSTER)
    doCreatureSay(mypoke, move.name, TALKTYPE_MONSTER)

    local summons = getCreatureSummons(cid)
    for i = 2, #summons do
        if isCreature(summons[i]) and getPlayerStorageValue(cid, 637501) >= 1 then
            if doAttackPokemon(summons[i], move.name) == false then
                print("Missing move ("..move.name..") in spells.")
                local test = io.open("data/moves.txt", "a+")
                local read = test and test:read("*all") or ""
                test:close()
                read = read.." - Missing move ("..move.name..") in spells.\n"
                local reopen = io.open("data/moves.txt", "w")
                reopen:write(read)
                reopen:close()
            end
        end
    end

    if isMega and not name:find("Mega") and move.name == "Mega Evolution" then
        local effect = 170
        if isSummon(mypoke) then
            local pid = getCreatureMaster(mypoke)
            if isPlayer(pid) then
                local ball = getPlayerSlotItem(pid, 8).uid
                if ball > 0 then
                    local attr = getItemAttribute(ball, "heldy")
                    if not attr or attr and not megaEvolutions[attr] then
                        attr = getItemAttribute(ball, "heldx")
                    end
                    if attr and megaEvolutions[attr] then
                        local oldPosition, oldLookdir = getThingPos(mypoke), getCreatureLookDir(mypoke)
                        doItemSetAttribute(ball, "poke", megaEvolutions[attr][2])
                        doSendMagicEffect(getThingPos(mypoke), effect)
                        doRemoveCreature(mypoke)
                        doSummonMonster(pid, megaEvolutions[attr][2])
                        local newPoke = getCreatureSummons(pid)[1]
                        doTeleportThing(newPoke, oldPosition, false)
                        doCreatureSetLookDir(newPoke, oldLookdir)
                        adjustStatus(newPoke, ball, true, false)
                        if useKpdoDlls then
                            addEvent(doUpdateMoves, 5, pid)
                        end
                    end
                end
            end
        end
    end

    if doAttackPokemon(mypoke, move.name) == false then
        print("Missing move ("..move.name..") in spells.")
        local test = io.open("data/moves.txt", "a+")
        local read = test and test:read("*all") or ""
        test:close()
        read = read.." - Missing move ("..move.name..") in spells.\n"
        local reopen = io.open("data/moves.txt", "w")
        reopen:write(read)
        reopen:close()
    end

    doCreatureAddCondition(cid, playerexhaust)

    if useKpdoDlls then
        doUpdateCooldowns(cid)
        doUpdateCooldownsZ(cid, tonumber(it))
    end
    return 0
end