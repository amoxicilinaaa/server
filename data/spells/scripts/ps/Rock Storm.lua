function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local pos     = getThingPosWithDebug(cid)
    local pos1, pos2, pos3, pos4 = {}, {}, {}, {}
    for i = 1, 4 do
        pos1[i] = {}
        pos2[i] = {}
        pos3[i] = {}
        pos4[i] = {}
        for j = 1, 6 do
            pos1[i][j] = {x = pos.x + j - 1, y = pos.y + 5 - i, z = pos.z}
            pos2[i][j] = {x = pos.x - j + 1, y = pos.y - 5 + i, z = pos.z}
            pos3[i][j] = {x = pos.x + 5 - i, y = pos.y - j + 1, z = pos.z}
            pos4[i][j] = {x = pos.x - 5 + i, y = pos.y + j - 1, z = pos.z}
        end
    end

    local atk = {
        ["Electro Field"]   = {41, 207, ELECTRICDAMAGE},
        ["Petal Tornado"]   = {4, 728, GRASSDAMAGE},
        ["Rock Storm"]      = {11, 234, ROCKDAMAGE},
        ["Flame Circle"]    = {98, 6, FIREDAMAGE},
        ["Flare Blitz"]     = {3, 257, FIREDAMAGE},
        ["Waterfall"]       = {98, 155, WATERDAMAGE},
        ["Venomous Gale"]   = {98, 995, POISONDAMAGE},
    }

    local atk2 = {
        ["Electro Field"]   = {90, 751, ELECTRICDAMAGE},
        ["Petal Tornado"]   = {4, 728, GRASSDAMAGE},
        ["Rock Storm"]      = {11, 234, ROCKDAMAGE},
        ["Flame Circle"]    = {98, 6, FIREDAMAGE},
        ["Flare Blitz"]     = {57, 722, FIREDAMAGE},
        ["Waterfall"]       = {98, 155, WATERDAMAGE},
        ["Venomous Gale"]   = {98, 995, POISONDAMAGE},
    }

    local ret = {
        id = 0,
        cd = 5,
        check = 0,
        spell = spell,
        cond = "Fear"
    }

    local function sendDist(cid, pos1, pos2, eff, delay)
        if pos1 and pos2 and isCreature(cid) then
            addEvent(sendDistanceShootWithProtect, delay, cid, pos1, pos2, eff)
        end
    end

    local function sendDano(cid, pos, eff, delay, min, max)
        if pos and isCreature(cid) then
            local name = getSubName(cid, target)
            local useAlt = isInArray({"Shiny Electabuzz", "Shiny Electivire"}, name) or getPlayerStorageValue(cid, 90177) >= 1
            local data = useAlt and atk2[spell] or atk[spell]
            addEvent(doDanoWithProtect, delay, cid, data[3], pos, 0, -min, -max, eff)
        end
    end

    local function doTornado(cid)
        if not isCreature(cid) then return end
        local name = getSubName(cid, target)
        local useAlt = isInArray({"Shiny Electabuzz", "Shiny Electivire"}, name) or getPlayerStorageValue(cid, 90177) >= 1
        local data = useAlt and atk2[spell] or atk[spell]

        for j = 1, 4 do
            for i = 1, 6 do
                local delay = i * 300
                local distDelay = i * 330

                for _, posSet in ipairs({pos1, pos2}) do
                    sendDist(cid, posSet[j][i], posSet[j][i + 1], data[1], distDelay)
                    sendDano(cid, posSet[j][i], data[2], delay, min, max)
                    sendDano(cid, posSet[j][i], data[2], delay + 10, 0, 0)
                end

                for _, posSet in ipairs({pos3, pos4}) do
                    sendDist(cid, posSet[j][i], posSet[j][i + 1], data[1], distDelay + 450)
                    sendDano(cid, posSet[j][i], data[2], delay + 450, min, max)
                    sendDano(cid, posSet[j][i], data[2], delay + 460, 0, 0)
                end
            end
        end
    end

    -- Execuções específicas por spell
    if spell == "Electro Field" then
        addEvent(doMoveInArea2, 1000, cid, 0, electro, ELECTRICDAMAGE, 0, 0, spell, ret)
    elseif spell == "Rock Storm" then
        addEvent(doMoveInArea2, 1000, cid, 0, electro, ROCKDAMAGE, 0, 0, spell, ret)
    elseif spell == "Waterfall" then
        addEvent(doMoveInArea2, 800, cid, 0, electro, WATERDAMAGE, 0, 0, spell, ret)
    elseif spell == "Venomous Gale" then
        if isSummon(cid) then
            local pid = getSpectators(getThingPos(cid), 6, 6)
            for i = 1, #pid do
                if pid[i] ~= cid and ehMonstro(pid[i]) and not isInArray({"Abporygon", "Aporygon"}, getCreatureName(pid[i])) then
                    doTeleportThing(pid[i], getClosestFreeTile(cid, getThingPos(cid)))
                end
            end
        end
        addEvent(doMoveInArea2, 50, cid, 0, dazeDano, POISONDAMAGE, 0, 0, spell, ret)
        doSendMagicEffect(getThingPos(cid), 990)
        stopNow(cid, 3000)
        doDisapear(cid)
        addEvent(doAppear, 3000, cid)
        addEvent(function()
            if isCreature(cid) then
                if isSummon(cid) then
                    local master = getCreatureMaster(cid)
                    local pk = getCreatureSummons(master)[1]
                    local oldpos = getThingPos(cid)
                    local olddir = getCreatureLookDir(cid)
                    doTeleportThing(pk, oldpos, false)
                    doCreatureSetLookDir(pk, olddir)
                else
                    doAppear(cid)
                end
            end
        end, 4000)
    end

    -- Execução do tornado em múltiplas ondas
    if spell == "Flame Circlel" then
        doTornado(cid)
    else
        for b = 0, 2 do
            local delay = spell == "Waterfall" and b * 1200 or (spell == "Venomous Gale" and b * 400 or b * 1500)
            addEvent(doTornado, delay, cid)
        end
    end

    return true
end