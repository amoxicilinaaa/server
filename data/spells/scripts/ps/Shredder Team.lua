function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local teamMap = {
        ["Scyther"]         = "ScytherTeam",
        ["Tribal Scyther"]  = "Tribal ScytherTeam",
        ["Shiny Scyther"]   = "Shiny ScytherTeam",
        ["Furious Scyther"] = "Furious ScytherTeam",
        ["Scizor"]          = "ScizorTeam",
        ["Metal Scizor"]    = "ScizorTeam"
    }

    local function RemoveTeam(cid)
        if isCreature(cid) then
            doSendMagicEffect(getThingPosWithDebug(cid), 211)
            doRemoveCreature(cid)
        end
    end

    local function sendEffLoop(cid, master, t)
        if isCreature(cid) and isCreature(master) and t > 0 and #getCreatureSummons(master) >= 2 then
            doSendMagicEffect(getThingPosWithDebug(cid), 86, master)
            addEvent(sendEffLoop, 1000, cid, master, t - 1)
        end
    end

    local function adjustLife(cid, health)
        if isCreature(cid) then
            setCreatureMaxHealth(cid, getVitality(cid) * HPperVITwild)
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddHealth(cid, -math.abs(health))
        end
    end

    local function setStorage(cid, storage)
        if isCreature(cid) and getPlayerStorageValue(cid, storage) >= 1 then
            setPlayerStorageValue(cid, storage, 0)
        end
    end

    local function summonTeam(cid, target, isSummoned)
        if getPlayerStorageValue(cid, 637500) >= 1 or getPlayerStorageValue(cid, 637501) >= 1 then return true end

        local name = isSummoned and getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "poke") or getCreatureName(cid)
        local teamName = teamMap[name]
        if not teamName then return true end

        local pos     = getThingPosWithDebug(cid)
        local life    = getCreatureHealth(cid)
        local maxLife = getCreatureMaxHealth(cid)
        local gender  = getPokemonGender(cid)
        local time    = isSummoned and 21 or 15
        local num     = getSubName(cid, target) == "Scizor" and 4 or 3
        local pk      = {}

        pk[1] = cid
        doSendMagicEffect(pos, 211)
        doTeleportThing(pk[1], {x = 4, y = 3, z = 10}, false)
        addEvent(doTeleportThing, math.random(0, 5), pk[1], getClosestFreeTile(pk[1], pos), false)

        for i = 2, num do
            pk[i] = doSummonCreature(teamName, pos)
            if isCreature(pk[i]) then
                local master = isSummoned and getCreatureMaster(cid) or pk[1]
                doConvinceCreature(master, pk[i])
                doTeleportThing(pk[i], getClosestFreeTile(pk[i], pos), false)
                addEvent(setPokemonGender, 150, pk[i], gender)
                addEvent(adjustLife, 150, pk[i], life - maxLife)
                addEvent(doAdjustWithDelay, 5, master, pk[i], true, true, true)
                doSendMagicEffect(getThingPosWithDebug(pk[i]), 211)
            end
        end

        setPlayerStorageValue(pk[1], 637501, 1)
        addEvent(setStorage, time * 1000, pk[1], 637501)

        for i = 2, num do
            setPlayerStorageValue(pk[i], 637500, 1)
            addEvent(RemoveTeam, time * 1000, pk[i])
        end

        if isSummoned then
            sendEffLoop(cid, getCreatureMaster(cid), time)
            doItemSetAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "hp", life / maxLife)
        else
            doCreatureSay(cid, "Shredder Team!", TALKTYPE_MONSTER)
        end

        return true
    end

    -- Executa spell com base no tipo de criatura
    if isSummon(cid) then
        return summonTeam(cid, target, true)
    else
        return summonTeam(cid, target, false)
    end
end
