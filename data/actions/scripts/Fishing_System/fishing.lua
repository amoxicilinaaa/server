local fishing = {
[-1] = { segs = 8, pokes = {{"Magikarp", 4}} },

[3976] = { segs = 8, pokes = {{"Horsea", 4}, {"Remoraid", 4}, {"Goldeen", 4}, {"Poliwag", 4}} },  -- pega no client da pxg

[12855] = { segs = 8, pokes = {{"Tentacool", 4}, {"Staryu", 4}, {"Krabby", 4}, {"Shellder", 4}} },

[12854] = { segs = 8, pokes = {{"Seel", 4},  {"chinchou", 4}, {"Psyduck", 4}} },

[12858] = { segs = 8, pokes = {{"Seaking", 4}, {"Seadra", 4}, {"Poliwhirl", 4}} },

[12857] = { segs = 9, pokes = {{"Starmie", 4}, {"Corsola", 4}, {"Qwilfish", 4}, {"Kingler", 4}} },  -- pega no client da pxg

[12860] = { segs = 10, pokes = {{"Dewgong", 4},  {"Lanturn", 4}} },

[12859] = { segs = 11, pokes = {{"Dewgong", 4}} },

[12856] = { segs = 12, pokes = {{"Cloyster", 4},  {"Poliwrath", 4}, {"Politoed", 4}, {"Octillery", 4} } },

[12853] = { segs = 13, pokes = {{"Gyarados", 1},  {"Tentacruel", 1}, {"Mantine", 1}, {"Kingdra", 1} } },
}

local storageP = 154585
local storagePNow = 154586
local storageE = 154587
local sto_iscas = 5648454 --muda aki pra sto q ta no script da isca
local bonus = 1
local limite = 100

local function doFishNow(cid, pos, ppos)

local function findEmptyTile(pos, radius)
    local positions = {}

    for x = pos.x - radius, pos.x + radius do
        for y = pos.y - radius, pos.y + radius do
            local tilePos = {x = x, y = y, z = pos.z}
            if isWalkable(tilePos) then
                table.insert(positions, tilePos)
            end
        end
    end

    if #positions > 0 then
        return positions[math.random(1, #positions)]
    else
        return nil
    end
end


    if not isCreature(cid) then return false end
    local posR = {x = ppos.x, y = ppos.y, z = ppos.z}
    if getDistanceBetween(getThingPos(cid), posR) >= 4 then
        setPlayerStorageValue(cid, storageP, -1)
        doRemoveCondition(cid, CONDITION_OUTFIT)
        return false
    end

    doSendMagicEffect(pos, CONST_ME_LOSEENERGY)

    local peixe = 0
    local pk = getPlayerPokemons(cid)[1]
    local playerpos = pk and getClosestFreeTile(pk, getThingPos(pk)) or getThingPos(cid) -- Correção aqui

    local fishes = fishing[getPlayerStorageValue(cid, sto_iscas)]
    local random = {}   

    if getPlayerSkillLevel(cid, 6) < 20 then 
        doPlayerAddSkillTry(cid, 6, bonus * 1)--5)
    elseif getPlayerSkillLevel(cid, 6) >= 20 and getPlayerSkillLevel(cid, 6) <= 50 then 
        doPlayerAddSkillTry(cid, 6, bonus * 1)--10)
    elseif getPlayerSkillLevel(cid, 6) > 50 then 
        doPlayerAddSkillTry(cid, 6, bonus * 1)--20)  
    end
      
         --[[if math.random(1, 100) <= chance then
        if getPlayerSkillLevel(cid, 6) < limite then
        doPlayerAddSkillTry(cid, 6, bonus * 5)
        end]]
      
		random = fishes.pokes[math.random(#fishes.pokes)]
		for i = 1, math.random(random[2]) do
		local offsetX = math.random(-1, 1) -- Deslocamento aleatório no eixo X
		local offsetY = math.random(-1, 1) -- Deslocamento aleatório no eixo Y
		local newPos = {x = playerpos.x + offsetX, y = playerpos.y + offsetY, z = playerpos.z}
		peixe = doSummonCreature(random[1], newPos)
		if not isWalkable(newPos) then
			-- A posição não é válida, encontrar uma nova posição
			newPos = findEmptyTile(playerpos, 1, 5) -- Tente encontrar uma posição vazia nas proximidades
			if newPos == nil then
				-- Não foi possível encontrar uma posição válida, encerrar a pesca
				setPlayerStorageValue(cid, storageP, -1)
				doRemoveCondition(cid, CONDITION_OUTFIT)
				return true
			end
		end
		if not isCreature(peixe) then
            setPlayerStorageValue(cid, storageP, -1)
            doRemoveCondition(cid, CONDITION_OUTFIT)
            return true
        end
--        doSetMonsterPassive(peixe)
--        doWildAttackPlayer(peixe, cid)
        doCreatureSetLookDir(cid, getDirectionTo(getThingPos(cid), getThingPos(peixe)))  --alterado ver depois
        setPlayerStorageValue(peixe, 637501, 1)
        if #getPlayerPokemons(cid) >= 1 then
            doSendMagicEffect(getThingPos(getPlayerPokemons(cid)[1]), 0)
            doChallengeCreature(getPlayerPokemons(cid)[1], peixe)
        else    
            doSendMagicEffect(getThingPos(cid), 0)
            doChallengeCreature(cid, peixe)
        end
    end
    setPlayerStorageValue(cid, storageP, -1)
    doRemoveCondition(cid, CONDITION_OUTFIT)
    return true
end




local function doFish(cid, pos, ppos, interval, n)
    if not isCreature(cid) then return false end
    if not n and getPlayerStorageValue(cid, storageP) == -1 then return false end
    if n == true and getPlayerStorageValue(cid, storagePNow) == -1 then return false end
    local posR = {x = ppos.x, y = ppos.y, z = ppos.z}
    if getDistanceBetween(getThingPos(cid), posR) >= 4 then
        setPlayerStorageValue(cid, storageP, -1)  
        doRemoveCondition(cid, CONDITION_OUTFIT)
        return false
    end
    
    if not n then 
        doSendMagicEffect(pos, 1033)
    else
        doSendMagicEffect(pos, 1034)
    end
    if interval > 0 then
        local stopEvent = addEvent(doFish, 1000, cid, pos, ppos, interval-1, n)
        setPlayerStorageValue(cid, storageE, stopEvent) 
        return true
    end
    
    if not n then
        --doFishNow(cid, pos, ppos)
        setPlayerStorageValue(cid, storageP, -1)
        setPlayerStorageValue(cid, storagePNow, 1) 
        local stopEvent = addEvent(doFish, 1000, cid, pos, ppos, 3, true)
        setPlayerStorageValue(cid, storageE, stopEvent) 

        -- addEvent(setPlayerStorageValue, 5000, cid, storageP, -1)
        addEvent(setPlayerStorageValue, 4000, cid, storagePNow, 0)
    else
        setPlayerStorageValue(cid, storageP, -1)  
        doRemoveCondition(cid, CONDITION_OUTFIT)
    end
    return true
end
local waters = {23766, 4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}
 
function onUse(cid, item, fromPos, itemEx, toPos)

    -- if not (getCreatureName(cid) == "Fallcon") then
    --     doPlayerSendCancel(cid, "Desativado temporariamente.")
    --     return true
    -- end

    local checkPos = toPos
    checkPos.stackpos = 0

    if getTileThingByPos(checkPos).itemid <= 0 then
       doPlayerSendCancel(cid, '!')
       return true
    end

    if not isInArray(waters, getTileInfo(toPos).itemid) then
        return true
    end

    if (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) and not canFishWhileSurfingOrFlying then
        doPlayerSendCancel(cid, "You can't fish while surfing/flying.")
        return true
    end

    if (getPlayerStorageValue(cid, storageBike) >= 1) then
        doPlayerSendCancel(cid, "You can't fish while bike/boots.")
        return true
    end

    if isInArray(waters, getTileInfo(getThingPos(cid)).itemid) then
        doPlayerSendCancel(cid, "You can\'t fish while surfing neither flying above water.")
        return true
    end

    if getTileInfo(getThingPos(getPlayerPokemons(cid)[1] or cid)).protection then
        doPlayerSendCancel(cid, "You can't fish pokémons if you or your pokémon is in protection zone.")
        return true
    end

    if getPlayerStorageValue(cid, storageP) == 1 then
        setPlayerStorageValue(cid, storageP, -1)
        doRemoveCondition(cid, CONDITION_OUTFIT)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "cancelou.")
        stopEvent(getPlayerStorageValue(cid, storageE))
        return false
    end
    
    if getPlayerStorageValue(cid, storagePNow) == 1 then
        if getPlayerStorageValue(cid, sto_iscas) ~= -1 then
            if getPlayerItemCount(cid, getPlayerStorageValue(cid, sto_iscas)) >= 1 then
                doPlayerRemoveItem(cid, getPlayerStorageValue(cid, sto_iscas), 1)
            else
                setPlayerStorageValue(cid, sto_iscas, -1)
            end
        end
        doFishNow(cid, toPos, getThingPos(cid))
        setPlayerStorageValue(cid, storagePNow, -1) 
        setPlayerStorageValue(cid, storageE, -1) 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "pescou.")
        return false
    end
        
    -- if not isInArray({520, 521}, getCreatureOutfit(cid).lookType) then
    -- --if not isInArray({1467, 1468}, getCreatureOutfit(cid).lookType) then
    --     return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa de roupa de pescador para pescar.")
    -- end

    local delay = fishing[getPlayerStorageValue(cid, sto_iscas)].segs

    local outfit = getCreatureOutfit(cid)
    local out = getPlayerSex(cid) == 0 and 1467 or 1468

    doSetCreatureOutfit(cid, {lookType = out, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
    setPlayerStorageValue(cid, storageP, 1)     --alterei looktype
    doCreatureSetNoMove(cid, false)

    doFish(cid, toPos, getThingPos(cid), math.random(2, delay))
    --exhaustion.set(cid, 23585, 30)

    return true
end